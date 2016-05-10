Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6F10760797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 00:55:23 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2016 17:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,602,1455004800"; d="scan'208";a="100182327"
Received: from smogharr-mobl.amr.corp.intel.com ([10.254.181.95])
	by fmsmga004.fm.intel.com with ESMTP; 09 May 2016 17:55:24 -0700
Date: Mon, 9 May 2016 17:55:23 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160510005523.GB31614@smogharr-mobl.amr.corp.intel.com>
References: <1462837346-27095-1-git-send-email-stephano.cetola@linux.intel.com>
	<1462837346-27095-3-git-send-email-stephano.cetola@linux.intel.com>
	<0C224579-B9F0-4EB4-9F25-29CE9C3AD631@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0C224579-B9F0-4EB4-9F25-29CE9C3AD631@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/2] systemd: add users/groups at build rather than runtime
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2016 00:55:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 05/09, Khem Raj wrote:
> 
> > On May 9, 2016, at 4:42 PM, Stephano Cetola <stephano.cetola@linux.intel.com> wrote:
> > 
> > This fix ensures that systemd users are created at build and that any
> > staticids for the users or groups are preserved. This functionality only
> > existed for readonly filesystems, however it seems wise to be sure these
> > users are added rather than relying on systemd to create them.
> 
> We need to cover the case where online package management is used. If you were to fix
> it in systemd recipe itself which takes care of creating these users in post installs
> that will fix it for this case too.
I'm not sure I follow you. I can see how this could be done in a post
install script, but I'm missing how this would help online package
management. Could you please point me in the right direction?
> 
> > 
> > [ YOCTO #9497 ]
> > 
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> > meta/classes/rootfs-postcommands.bbclass | 66 +++++++++++++++++++++-----------
> > meta/classes/useradd-staticids.bbclass   | 56 +--------------------------
> > useradd-staticids-list.bbclass           | 56 +++++++++++++++++++++++++++
> > 3 files changed, 100 insertions(+), 78 deletions(-)
> > create mode 100644 useradd-staticids-list.bbclass
> > 
> > diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> > index 95d28af..db4cc75 100644
> > --- a/meta/classes/rootfs-postcommands.bbclass
> > +++ b/meta/classes/rootfs-postcommands.bbclass
> > @@ -1,4 +1,4 @@
> > -
> > +inherit useradd-staticids-list
> > # Zap the root password if debug-tweaks feature is not enabled
> > ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
> > 
> > @@ -23,6 +23,9 @@ POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
> > SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
> > ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
> > 
> > +# Create systemd users at build rather than at runtime
> > +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "create_systemd_sysusers; ", "", d)}'
> > +
> > ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
> > 
> > # Disable DNS lookups, the SSH_DISABLE_DNS_LOOKUP can be overridden to allow
> > @@ -30,7 +33,45 @@ ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
> > SSH_DISABLE_DNS_LOOKUP ?= " ssh_disable_dns_lookup ; "
> > ROOTFS_POSTPROCESS_COMMAND_append_qemuall = "${SSH_DISABLE_DNS_LOOKUP}"
> > 
> > -
> > +# Add systemd users checking for any staticids
> > +python create_systemd_sysusers () {
> > +    import shlex
> > +    import subprocess
> > +    s_users = merge_files(get_passwd_list(d), 7)
> > +    s_groups = merge_files(get_group_list(d), 4)
> > +    confs = ['%s/usr/lib/sysusers.d/systemd.conf' % d.getVar('IMAGE_ROOTFS', d), '%s/usr/lib/sysusers.d/systemd-remote.conf' % d.getVar('IMAGE_ROOTFS', d)]
> > +    for conf in confs:
> > +        if os.path.isfile(conf):
> > +            with open(conf, 'r') as f:
> > +                for line in f:
> > +                    if line.startswith('#'):
> > +                        continue
> > +                    fields = shlex.split(line.rstrip())
> > +                    if not fields:
> > +                        continue
> > +                    if fields[0] == 'u':
> > +                        useradd_params = ''
> > +                        if fields[1] in s_users:
> > +                            useradd_params += '--uid %s' % s_users[fields[1]][2]
> > +                            bb.warn("Changing user %s's uid to (%s), verify configuration files!" % (fields[1], s_users[fields[1]][2]))
> > +                        elif fields[2] != '-':
> > +                            useradd_params += '--uid %s' % fields[2]
> > +                        if fields[3] != '-':
> > +                            useradd_params += ' --comment "%s"' % fields[3]
> > +                        useradd_params += ' --root "%s" --shell /sbin/nologin  --system %s' % (d.getVar("IMAGE_ROOTFS", d), fields[1])
> > +                        code = subprocess.call('useradd %s' % useradd_params, shell=True)
> > +                    elif fields[0] == 'g':
> > +                        groupadd_params = ""
> > +                        if fields[1] in s_groups:
> > +                            groupadd_params += '--gid %s' % s_groups[fields[1]][2]
> > +                            bb.warn("Changing group %s's gid to (%s), verify configuration files!" % (fields[1], s_groups[fields[1]][2]))
> > +                        elif fields[2] != '-':
> > +                            groupadd_params += '--gid %s' % fields[2]
> > +                        if fields[3] != '-':
> > +                            groupadd_params += ' --comment "%s"' % (d.getVar("IMAGE_ROOTFS", d), fields[3])
> > +                        groupadd_params += ' --root "%s" --system %s' % (d.getVar("IMAGE_ROOTFS", d), fields[1])
> > +                        code = subprocess.call('groupadd %s' % groupadd_params, shell=True)
> > +}
> > 
> > #
> > # A hook function to support read-only-rootfs IMAGE_FEATURES
> > @@ -73,27 +114,6 @@ read_only_rootfs_hook () {
> > 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
> > 		fi
> > 	fi
> > -
> > -	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
> > -	    # Update user database files so that services don't fail for a read-only systemd system
> > -	    for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
> > -		[ -e $conffile ] || continue
> > -		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id comment; do
> > -		    if [ "$type" = "u" ]; then
> > -			useradd_params=""
> > -			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
> > -			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment $comment"
> > -			useradd_params="$useradd_params --system $name"
> > -			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
> > -		    elif [ "$type" = "g" ]; then
> > -			groupadd_params=""
> > -			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
> > -			groupadd_params="$groupadd_params --system $name"
> > -			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
> > -		    fi
> > -		done
> > -	    done
> > -	fi
> > }
> > 
> > #
> > diff --git a/meta/classes/useradd-staticids.bbclass b/meta/classes/useradd-staticids.bbclass
> > index a9b506d..e9dfe69 100644
> > --- a/meta/classes/useradd-staticids.bbclass
> > +++ b/meta/classes/useradd-staticids.bbclass
> > @@ -1,3 +1,4 @@
> > +inherit useradd-staticids-list
> > # In order to support a deterministic set of 'dynamic' users/groups,
> > # we need a function to reformat the params based on a static file
> > def update_useradd_static_config(d):
> > @@ -17,35 +18,6 @@ def update_useradd_static_config(d):
> >         def error(self, message):
> >             raise bb.build.FuncFailed(message)
> > 
> > -    def list_extend(iterable, length, obj = None):
> > -        """Ensure that iterable is the specified length by extending with obj
> > -        and return it as a list"""
> > -        return list(itertools.islice(itertools.chain(iterable, itertools.repeat(obj)), length))
> > -
> > -    def merge_files(file_list, exp_fields):
> > -        """Read each passwd/group file in file_list, split each line and create
> > -        a dictionary with the user/group names as keys and the split lines as
> > -        values. If the user/group name already exists in the dictionary, then
> > -        update any fields in the list with the values from the new list (if they
> > -        are set)."""
> > -        id_table = dict()
> > -        for conf in file_list.split():
> > -            if os.path.exists(conf):
> > -                f = open(conf, "r")
> > -                for line in f:
> > -                    if line.startswith('#'):
> > -                        continue
> > -                    # Make sure there always are at least exp_fields elements in
> > -                    # the field list. This allows for leaving out trailing
> > -                    # colons in the files.
> > -                    fields = list_extend(line.rstrip().split(":"), exp_fields)
> > -                    if fields[0] not in id_table:
> > -                        id_table[fields[0]] = fields
> > -                    else:
> > -                        id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
> > -
> > -        return id_table
> > -
> >     # We parse and rewrite the useradd components
> >     def rewrite_useradd(params):
> >         # The following comes from --help on useradd from shadow
> > @@ -73,19 +45,6 @@ def update_useradd_static_config(d):
> >         parser.add_argument("-U", "--user-group", help="create a group with the same name as the user", action="store_const", const=True)
> >         parser.add_argument("LOGIN", help="Login name of the new user")
> > 
> > -        # Return a list of configuration files based on either the default
> > -        # files/passwd or the contents of USERADD_UID_TABLES
> > -        # paths are resolved via BBPATH
> > -        def get_passwd_list(d):
> > -            str = ""
> > -            bbpath = d.getVar('BBPATH', True)
> > -            passwd_tables = d.getVar('USERADD_UID_TABLES', True)
> > -            if not passwd_tables:
> > -                passwd_tables = 'files/passwd'
> > -            for conf_file in passwd_tables.split():
> > -                str += " %s" % bb.utils.which(bbpath, conf_file)
> > -            return str
> > -
> >         newparams = []
> >         users = None
> >         for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
> > @@ -206,19 +165,6 @@ def update_useradd_static_config(d):
> >         parser.add_argument("-r", "--system", help="create a system account", action="store_true")
> >         parser.add_argument("GROUP", help="Group name of the new group")
> > 
> > -        # Return a list of configuration files based on either the default
> > -        # files/group or the contents of USERADD_GID_TABLES
> > -        # paths are resolved via BBPATH
> > -        def get_group_list(d):
> > -            str = ""
> > -            bbpath = d.getVar('BBPATH', True)
> > -            group_tables = d.getVar('USERADD_GID_TABLES', True)
> > -            if not group_tables:
> > -                group_tables = 'files/group'
> > -            for conf_file in group_tables.split():
> > -                str += " %s" % bb.utils.which(bbpath, conf_file)
> > -            return str
> > -
> >         newparams = []
> >         groups = None
> >         for param in re.split('''[ \t]*;[ \t]*(?=(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
> > diff --git a/useradd-staticids-list.bbclass b/useradd-staticids-list.bbclass
> > new file mode 100644
> > index 0000000..377f748
> > --- /dev/null
> > +++ b/useradd-staticids-list.bbclass
> > @@ -0,0 +1,56 @@
> > +# Return a list of configuration files based on either the default
> > +# files/group or the contents of USERADD_GID_TABLES
> > +# paths are resolved via BBPATH
> > +def get_group_list(d):
> > +    str = ""
> > +    bbpath = d.getVar('BBPATH', True)
> > +    group_tables = d.getVar('USERADD_GID_TABLES', True)
> > +    if not group_tables:
> > +        group_tables = 'files/group'
> > +    for conf_file in group_tables.split():
> > +        str += " %s" % bb.utils.which(bbpath, conf_file)
> > +    return str
> > +
> > +def list_extend(iterable, length, obj = None):
> > +    import itertools
> > +    """Ensure that iterable is the specified length by extending with obj
> > +    and return it as a list"""
> > +    return list(itertools.islice(itertools.chain(iterable, itertools.repeat(obj)), length))
> > +
> > +def merge_files(file_list, exp_fields):
> > +    import itertools
> > +    """Read each passwd/group file in file_list, split each line and create
> > +    a dictionary with the user/group names as keys and the split lines as
> > +    values. If the user/group name already exists in the dictionary, then
> > +    update any fields in the list with the values from the new list (if they
> > +    are set)."""
> > +    id_table = dict()
> > +    for conf in file_list.split():
> > +        if os.path.exists(conf):
> > +            f = open(conf, "r")
> > +            for line in f:
> > +                if line.startswith('#'):
> > +                    continue
> > +                # Make sure there always are at least exp_fields elements in
> > +                # the field list. This allows for leaving out trailing
> > +                # colons in the files.
> > +                fields = list_extend(line.rstrip().split(":"), exp_fields)
> > +                if fields[0] not in id_table:
> > +                    id_table[fields[0]] = fields
> > +                else:
> > +                    id_table[fields[0]] = list(itertools.imap(lambda x, y: x or y, fields, id_table[fields[0]]))
> > +
> > +    return id_table
> > +
> > +# Return a list of configuration files based on either the default
> > +# files/passwd or the contents of USERADD_UID_TABLES
> > +# paths are resolved via BBPATH
> > +def get_passwd_list(d):
> > +    str = ""
> > +    bbpath = d.getVar('BBPATH', True)
> > +    passwd_tables = d.getVar('USERADD_UID_TABLES', True)
> > +    if not passwd_tables:
> > +        passwd_tables = 'files/passwd'
> > +    for conf_file in passwd_tables.split():
> > +        str += " %s" % bb.utils.which(bbpath, conf_file)
> > +    return str
> > --
> > 2.8.0
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 



