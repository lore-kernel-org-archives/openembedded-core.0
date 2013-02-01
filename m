Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U1Bq1-0004F1-5Y
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 09:19:12 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Feb 2013 00:03:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,579,1355126400"; d="scan'208";a="197560669"
Received: from unknown (HELO [10.255.12.100]) ([10.255.12.100])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Feb 2013 00:03:23 -0800
Message-ID: <510B76CB.1080501@linux.intel.com>
Date: Fri, 01 Feb 2013 00:03:23 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <1359462686-13304-1-git-send-email-marcin.juszkiewicz@linaro.org>
In-Reply-To: <1359462686-13304-1-git-send-email-marcin.juszkiewicz@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Flex: use proper m4 binary on target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 08:19:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/29/2013 04:31 AM, Marcin Juszkiewicz wrote:
> flex tries to execute:
>
> /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/m4
>
> As workaround you can:
>
> mkdir -p /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
> ln -s /usr/bin/m4 /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
>
> So this is a bug how OE builds flex.
>
> flex tries to execute:
>
> /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/m4
>
> As workaround you can:
>
> mkdir -p /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
> ln -s /usr/bin/m4 /data/oe/build/tmp-eglibc/sysroots/x86_64-linux/usr/bin/
>
> So this is a bug how OE builds flex.
>
> https://bugs.launchpad.net/linaro-aarch64/+bug/1106865
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>   meta/recipes-devtools/flex/flex.inc | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/flex/flex.inc b/meta/recipes-devtools/flex/flex.inc
> index 472813b..517db16 100644
> --- a/meta/recipes-devtools/flex/flex.inc
> +++ b/meta/recipes-devtools/flex/flex.inc
> @@ -10,6 +10,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 "
>
>   inherit autotools gettext
>
> -do_install_append_class-native() {
> -	create_wrapper ${D}/${bindir}/flex M4=${STAGING_BINDIR_NATIVE}/m4
> +M4 = "${bindir}/m4"
> +M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
> +
> +do_install_append() {
> +	create_wrapper ${D}/${bindir}/flex M4=${M4}
>   }
>

I think this patch is causing the following issue, I am not sure why 
it's showing up now, and it seems to be related to creating docs for the 
-native.

Sau!

> ERROR: Function failed: do_install (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/temp/log.do_install.3109 for further information)
> ERROR: Logfile of failure stored in: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/temp/log.do_install.3109
> Log data follows:
> | DEBUG: Executing shell function do_install
> | NOTE: make -j 16 DESTDIR=/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image install
> | make  install-recursive
> | make[1]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> | Making install in lib
> | make[2]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/lib'
> | make[3]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/lib'
> | make[3]: Nothing to be done for `install-exec-am'.
> | make[3]: Nothing to be done for `install-data-am'.
> | make[3]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/lib'
> | make[2]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/lib'
> | Making install in .
> | make[2]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> | make[3]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> |  /bin/mkdir -p '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/bin'
> |  /bin/mkdir -p '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib'
> |  /bin/mkdir -p '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/share/doc/flex'
> |  /bin/mkdir -p '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/include'
> |  /usr/bin/install -c -m 644  libfl.a libfl_pic.a '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib'
> |  /usr/bin/install -c -m 644 AUTHORS COPYING NEWS ONEWS README README.cvs TODO '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/share/doc/flex'
> |  /usr/bin/install -c -m 644 FlexLexer.h '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/include'
> |   /usr/bin/install -c flex '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/bin'
> |  ( cd '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib' && ranlib libfl.a )
> |  ( cd '/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/lib' && ranlib libfl_pic.a )
> | make  install-exec-hook
> | make[4]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> | cd /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/image//srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/x86_64-linux/usr/bin && \
> | 	ln -s -f flex flex++
> | make[4]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> | make[3]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> | make[2]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> | Making install in doc
> | make[2]: Entering directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/doc'
> | restore=: && backupdir=".am$$" && \
> | am__cwd=`pwd` && CDPATH="${ZSH_VERSION+.}:" && cd . && \
> | rm -rf $backupdir && mkdir $backupdir && \
> | if (/bin/sh /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/missing --run makeinfo --version) >/dev/null 2>&1; then \
> |   for f in flex.info flex.info-[0-9] flex.info-[0-9][0-9] flex.i[0-9] flex.i[0-9][0-9]; do \
> |     if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
> |   done; \
> | else :; fi && \
> | cd "$am__cwd"; \
> | if /bin/sh /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/missing --run makeinfo   -I . \
> |  -o flex.info flex.texi; \
> | then \
> |   rc=0; \
> |   CDPATH="${ZSH_VERSION+.}:" && cd .; \
> | else \
> |   rc=$?; \
> |   CDPATH="${ZSH_VERSION+.}:" && cd . && \
> |   $restore $backupdir/* `echo "./flex.info" | sed 's|[^/]*$||'`; \
> | fi; \
> | rm -rf $backupdir; exit $rc
> | TEXINPUTS=".:$TEXINPUTS" \
> | MAKEINFO='/bin/sh /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/missing --run makeinfo   -I .' \
> | texi2dvi --pdf --batch  --clean flex.texi
> | You don't have a working TeX binary (tex) installed anywhere in
> | your PATH, and texi2dvi cannot proceed without one.  If you want to use
> | this script, you'll need to install TeX (if you don't have it) or change
> | your PATH or TEX environment variable (if you do).  See the --help
> | output for more details.
> |
> | For information about obtaining TeX, please see http://www.tug.org.  If
> | you happen to be using Debian, you can get it with this command:
> |   apt-get install tetex-bin
> | make[2]: *** [flex.pdf] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37/doc'
> | make[1]: *** [install-recursive] Error 1
> | make[1]: Leaving directory `/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/flex-2.5.37'
> | make: *** [install] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_install (see /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-linux/flex-native/2.5.37-r0/temp/log.do_install.3109 for further information)
> NOTE: recipe flex-native-2.5.37-r0: task do_install: Failed





