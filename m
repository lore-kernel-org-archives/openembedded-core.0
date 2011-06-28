Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbY2B-0005pR-Hn for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 15:08:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SD5EJB024502
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:05:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24463-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:05:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SD58LT024493
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 14:05:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9591788655a4de97cc5f6a0fd98e742e3ebcab23.1307058256.git.scott.a.garman@intel.com>
References: <cover.1307058256.git.scott.a.garman@intel.com>
	<9591788655a4de97cc5f6a0fd98e742e3ebcab23.1307058256.git.scott.a.garman@intel.com>
Date: Tue, 28 Jun 2011 14:04:55 +0100
Message-ID: <1309266295.20015.287.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 4/7] useradd.bbclass: new class for managing user/group permissions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 13:08:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Scott,

Sorry its taken me a while to get to this. Some comments below.

On Thu, 2011-06-02 at 16:50 -0700, Scott Garman wrote:
> This class is to be used by recipes that need to set up specific
> user/group accounts and set custom file/directory permissions.
> 
> Signed-off-by: Scott Garman <scott.a.garman@intel.com>
> ---
>  meta/classes/useradd.bbclass |  163 ++++++++++++++++++++++++++++++++++++++++++
>  1 files changed, 163 insertions(+), 0 deletions(-)
>  create mode 100644 meta/classes/useradd.bbclass
> 
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> new file mode 100644
> index 0000000..3f07e5e
> --- /dev/null
> +++ b/meta/classes/useradd.bbclass
> @@ -0,0 +1,163 @@
> +USERADDPN ?= "${PN}"
> +
> +# base-passwd-cross provides the default passwd and group files in the
> +# target sysroot, and shadow-native provides the utilities needed to
> +# add and modify user and group accounts
> +DEPENDS_append = " base-passwd shadow-native"
> +RDEPENDS_${USERADDPN}_append = " base-passwd shadow"
> +
> +PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
> +export PSEUDO

For reference this can be done with:

export PSEUDO = "${STAGING_DIR_NATIVE}/usr/bin/pseudo"

> +PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
> +export PSEUDO_LOCALSTATEDIR

I'm a little bit puzzled at this point. This is changing the default
PSEUDO state directory to be one shared by many other users rather than
the default of the one in workdir. Is that really what you intend here?

I guess the question is whether we need to preserve these users in the
sysroot or whether preserving them for the install/package/package_write
cycle is enough.

Since tasks don't share the same pseudo context by default, I suspect
we're not preserving users for the sysroot anyhow?

> +PSEUDO_PASSWD = "${STAGING_DIR_TARGET}"
> +export PSEUDO_PASSWD

Should we set this by default as part of the pseudo options in
bitbake.conf?

> +useradd_preinst () {
> +OPT=""
> +SYSROOT=""
> +
> +if test "x$D" != "x"; then
> +	# Installing into a sysroot
> +	SYSROOT="${STAGING_DIR_TARGET}"
> +	OPT="--root ${STAGING_DIR_TARGET}"
> +
> +	# Add groups and users defined for all recipe packages
> +	GROUPADD_PARAM="${@get_all_cmd_params(d, 'group')}"
> +	USERADD_PARAM="${@get_all_cmd_params(d, 'user')}"
> +else
> +	# Installing onto a target
> +	PSEUDO=""
> +
> +	# Add groups and users defined only for this package
> +	GROUPADD_PARAM="${GROUPADD_PARAM}"
> +	USERADD_PARAM="${USERADD_PARAM}"
> +fi
> +
> +# Perform group additions first, since user additions may depend
> +# on these groups existing
> +if test "x$GROUPADD_PARAM" != "x"; then
> +	echo "Running groupadd commands..."
> +	# Invoke multiple instances of groupadd for parameter lists
> +	# separated by ';'
> +	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
> +	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
> +	while test "x$opts" != "x"; do
> +		eval $PSEUDO groupadd -f $OPT $opts

If this task is already running under pseudo, do we specifically need to
run under pseudo here? Is it not already running under pseudo when
needed?

> +		if test "x$opts" = "x$remaining"; then
> +			break
> +		fi
> +		opts=`echo "$remaining" | cut -d ';' -f 1`
> +		remaining=`echo "$remaining" | cut -d ';' -f 2-`
> +	done
> +fi 
> +
> +if test "x$USERADD_PARAM" != "x"; then
> +	echo "Running useradd commands..."
> +	# Invoke multiple instances of useradd for parameter lists
> +	# separated by ';'
> +	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1`
> +	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
> +	while test "x$opts" != "x"; do
> +		# useradd does not have a -f option, so we have to check if the
> +		# username already exists manually
> +		username=`echo "$opts" | awk '{ print $NF }'`
> +		user_exists=`grep "^$username:" $SYSROOT/etc/passwd || true`
> +		if test "x$user_exists" = "x"; then
> +			eval $PSEUDO useradd $OPT $opts
> +		else
> +			echo "Note: username $username already exists, not re-creating it"
> +		fi
> +
> +		if test "x$opts" = "x$remaining"; then
> +			break
> +		fi
> +		opts=`echo "$remaining" | cut -d ';' -f 1`
> +		remaining=`echo "$remaining" | cut -d ';' -f 2-`
> +	done
> +fi
> +}
> +
> +useradd_sysroot () {
> +	# Explicitly set $D since it isn't set to anything
> +	# before do_install
> +	D=${D}
> +	useradd_preinst
> +}
> +
> +useradd_sysroot_sstate () {
> +	if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
> +	then
> +		useradd_sysroot
> +	fi
> +}
> +
> +do_install[prefuncs] += "useradd_sysroot"
> +SSTATEPOSTINSTFUNCS += "useradd_sysroot_sstate"
> +
> +# Recipe parse-time sanity checks
> +def update_useradd_after_parse(d):
> +	if bb.data.getVar('USERADD_PACKAGES', d) == None:
> +		if bb.data.getVar('USERADD_PARAM', d) == None and bb.data.getVar('GROUPADD_PARAM', d) == None:
> +			raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM" % bb.data.getVar('FILE', d)
> +
> +python __anonymous() {
> +	update_useradd_after_parse(d)
> +}
> +
> +# Return a single [GROUP|USER]ADD_PARAM formatted string which includes the
> +# [group|user]add parameters for all packages in this recipe
> +def get_all_cmd_params(d, cmd_type):
> +	import string
> +	
> +	localdata = bb.data.createCopy(d)
> +	param_type = cmd_type.upper() + "ADD_PARAM_%s"
> +	params = []
> +
> +	pkgs = bb.data.getVar('USERADD_PACKAGES', d, 1)

Please use True, not 1. Its also simpler to use:

d.getVar('USERADD_PACKAGES', True)

> +	if pkgs == None:

if not pkgs:

> +		pkgs = bb.data.getVar('USERADDPN', d, 1)
> +		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
> +		if not pkgs in packages and packages != []:

if packages and pkgs not in packages:

> +			pkgs = packages[0]
> +
> +	for pkg in pkgs.split():
> +		param = bb.data.getVar(param_type % pkg, localdata, 1)
> +		params.append(param)
> +
> +	return string.join(params, "; ")
> +
> +# Adds the preinst script into generated packages
> +fakeroot python populate_packages_prepend () {
> +	def update_useradd_package(pkg):
> +		bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
> +		localdata = bb.data.createCopy(d)
> +		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
> +		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
> +		bb.data.update_data(localdata)
> +
> +		"""
> +		useradd preinst is appended here because pkg_preinst may be
> +		required to execute on the target. Not doing so may cause
> +		useradd preinst to be invoked twice, causing unwanted warnings.
> +		"""
> +		preinst = bb.data.getVar('pkg_preinst', localdata, 1)
> +		if not preinst:
> +			preinst = '#!/bin/sh\n'
> +		preinst += bb.data.getVar('useradd_preinst', localdata, 1)
> +		bb.data.setVar('pkg_preinst_%s' % pkg, preinst, d)
> +
> +	# We add the user/group calls to all packages to allow any package
> +	# to contain files owned by the users/groups defined in the recipe.
> +	# The user/group addition code is careful not to create duplicate
> +	# entries, so this is safe.
> +	pkgs = bb.data.getVar('USERADD_PACKAGES', d, 1)
> +	if pkgs == None:
> +		pkgs = bb.data.getVar('USERADDPN', d, 1)
> +		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
> +		if not pkgs in packages and packages != []:
> +			pkgs = packages[0]
> +	for pkg in pkgs.split():
> +		update_useradd_package(pkg)
> +}

Cheers,

Richard



