Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA2A7708E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 13:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35Dx0HG031453; Tue, 5 Apr 2016 14:59:00 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jdg4unBsh5mS; Tue,  5 Apr 2016 14:59:00 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35DwvbW031449
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 5 Apr 2016 14:58:58 +0100
Message-ID: <1459864737.7348.166.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Apr 2016 14:58:57 +0100
In-Reply-To: <1459841115-15996-1-git-send-email-maxin.john@intel.com>
References: <1459841115-15996-1-git-send-email-maxin.john@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] useradd.bbclass: remove user/group created by the package in clean* task
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
X-List-Received-Date: Tue, 05 Apr 2016 13:59:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-04-05 at 10:25 +0300, Maxin B. John wrote:
> At present, if a recipe is built which creates users/groups via
> useradd.bbclass,
> those users/groups are not removed (at least from sysroot) when the
> recipe/package is cleaned using clean/cleansstate/cleanall.

need to add "or when a recipe is rebuild and 'unstaged' from the the
sysroot".

> The "userdel_sysroot_sstate()" provides that functionality.
> 
> [YOCTO #9262]
> 
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  meta/classes/sstate.bbclass  |  6 ++++++
>  meta/classes/useradd.bbclass | 26 ++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/meta/classes/sstate.bbclass
> b/meta/classes/sstate.bbclass
> index 6f285da..96b6265 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -51,6 +51,7 @@ SSTATEPREINSTFUNCS = ""
>  SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
>  SSTATEPOSTINSTFUNCS = ""
>  EXTRA_STAGING_FIXMES ?= ""
> +SSTATECLEANFUNCS = ""
>  
>  SIGGEN_LOCKEDSIGS_CHECK_LEVEL ?= 'error'
>  
> @@ -444,6 +445,11 @@ def sstate_clean(ss, d):
>                  stfile.endswith(rm_nohash):
>              oe.path.remove(stfile)
>  
> +    # Remove the users/groups created by the package
> +    for cleanfunc in (d.getVar('SSTATECLEANFUNCS', True) or
> '').split():
> +        if d.getVar('BB_CURRENTTASK', True) in ['configure',
> 'clean']:
> +            bb.build.exec_func(cleanfunc, d)
> +

The hook needs to be generic so the BB_CURRENTTASK check needs to move
to userdel_sysroot_sstate itself.

Otherwise looks good though, thanks.

Cheers,

Richard

>  sstate_clean[vardepsexclude] = "SSTATE_MANFILEPREFIX"
>  
>  CLEANFUNCS += "sstate_cleanall"
> diff --git a/meta/classes/useradd.bbclass
> b/meta/classes/useradd.bbclass
> index 0a6f2be..2b2bb96 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -127,6 +127,32 @@ useradd_sysroot_sstate () {
>  	fi
>  }
>  
> +userdel_sysroot_sstate () {
> +if test "x${STAGING_DIR_TARGET}" != "x"; then
> +    export PSEUDO="${FAKEROOTENV}
> PSEUDO_LOCALSTATEDIR=${STAGING_DIR_TARGET}${localstatedir}/pseudo
> ${STAGING_DIR_NATIVE}${bindir}/pseudo"
> +    OPT="--root ${STAGING_DIR_TARGET}"
> +
> +    # Remove groups and users defined for package
> +    GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
> +    USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
> +
> +    if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x";
> then
> +        user=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | awk '{ print
> $NF }'`
> +        perform_userdel "${STAGING_DIR_TARGET}" "$OPT $user"
> +    fi
> +
> +    if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x";
> then
> +        group=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | awk '{
> print $NF }'`
> +        perform_groupdel "${STAGING_DIR_TARGET}" "$OPT $group"
> +    fi
> +fi
> +}
> +
> +SSTATECLEANFUNCS = "userdel_sysroot_sstate"
> +SSTATECLEANFUNCS_class-cross = ""
> +SSTATECLEANFUNCS_class-native = ""
> +SSTATECLEANFUNCS_class-nativesdk = ""
> +
>  do_install[prefuncs] += "${SYSROOTFUNC}"
>  SYSROOTFUNC = "useradd_sysroot"
>  SYSROOTFUNC_class-cross = ""
> -- 
> 2.4.0
> 

