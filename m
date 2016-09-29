Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D869C60268
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 09:22:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8T9Mkdq013434
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Sep 2016 02:22:46 -0700 (PDT)
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 29 Sep 2016 02:22:45 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1474536792-7645-1-git-send-email-zhe.he@windriver.com>
	<CAJTo0LbSCHE53q6HVTVscw9J+ck_qmarOpJirfzan-jH0jqYgA@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <0ed55200-cd72-ceca-d17a-ac7d174c15d6@windriver.com>
Date: Thu, 29 Sep 2016 17:22:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbSCHE53q6HVTVscw9J+ck_qmarOpJirfzan-jH0jqYgA@mail.gmail.com>
X-Originating-IP: [128.224.162.234]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Remove bashisms
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
X-List-Received-Date: Thu, 29 Sep 2016 09:22:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Sorry for slow reply.

This is probably caused by the correction of installation path(from ${STAGING_BINDIR_CROSS}/guile-config to ${SYSROOT_DESTDIR}${bindir_crossscripts}/guile-config). do_populate_sysroot helps us install things into ${STAGING_BINDIR_CROSS}/guile-config, we shouldn't do that ourselves. But if we do that and then apply this patch and then rebuild, the system will find they have existed and also find no one installed them(Matched in b''). So this should be a wrong report. This error will not appear if I manually delete guile-config and rebuild or rebuild in a brand new project.

I sent a new one([oe] [meta-oe] [PATCH] Remove bashisms) in 09/27/2016 02:19 PM. Please apply that one if it's OK.

Thanks,
Zhe


On 09/27/2016 09:43 PM, Burton, Ross wrote:
> If I apply this and then re-build guile I get this error:
>
> ERROR: guile-2.0.12-r0 do_populate_sysroot: The recipe guile is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>    /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/bin/crossscripts/guile-config
>  Matched in b''
>
> Ross
>
> On 22 September 2016 at 10:33, <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>wrote:
>
>     From: "Tim K. Chan" <nirvanatk@gmail.com <mailto:nirvanatk@gmail.com>>
>
>     Signed-off-by: Tim K. Chan <nirvanatk@gmail.com <mailto:nirvanatk@gmail.com>>
>     [
>     Adjust context
>     Use Peter Kjellerstedt's simpler guile_cross_config
>     ]
>     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>     ---
>      meta/classes/systemd.bbclass                       |  4 +--
>      meta/classes/update-rc.d.bbclass                   |  6 ++--
>      .../resolvconf/resolvconf_1.79.bb <http://resolvconf_1.79.bb>                  |  2 +-
>      meta/recipes-core/glibc/glibc-package.inc          |  2 +-
>      meta/recipes-devtools/guile/guile_2.0.12.bb <http://guile_2.0.12.bb>        | 37 ++++++++++++----------
>      meta/recipes-devtools/rpm/rpm_5.4.16.bb <http://rpm_5.4.16.bb>            | 13 ++++++--
>      6 files changed, 39 insertions(+), 25 deletions(-)
>
>     diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
>     index db7873f..7370489 100644
>     --- a/meta/classes/systemd.bbclass
>     +++ b/meta/classes/systemd.bbclass
>     @@ -28,7 +28,7 @@ if [ -n "$D" ]; then
>          OPTS="--root=$D"
>      fi
>
>     -if type systemctl >/dev/null 2>/dev/null; then
>     +if command -p systemctl >/dev/null 2>/dev/null; then
>             systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>
>             if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
>     @@ -44,7 +44,7 @@ if [ -n "$D" ]; then
>          OPTS="--root=$D"
>      fi
>
>     -if type systemctl >/dev/null 2>/dev/null; then
>     +if command -p systemctl >/dev/null 2>/dev/null; then
>             if [ -z "$D" ]; then
>                     systemctl stop ${SYSTEMD_SERVICE}
>             fi
>     diff --git a/meta/classes/update-rc.d.bbclass b/meta/classes/update-rc.d.bbclass
>     index 82b8024..dee80c8 100644
>     --- a/meta/classes/update-rc.d.bbclass
>     +++ b/meta/classes/update-rc.d.bbclass
>     @@ -15,7 +15,7 @@ updatercd_preinst() {
>      if [ -z "$D" -a -f "${INIT_D_DIR}/${INITSCRIPT_NAME}" ]; then
>             ${INIT_D_DIR}/${INITSCRIPT_NAME} stop
>      fi
>     -if type update-rc.d >/dev/null 2>/dev/null; then
>     +if command -p update-rc.d >/dev/null 2>/dev/null; then
>             if [ -n "$D" ]; then
>                     OPT="-f -r $D"
>             else
>     @@ -26,7 +26,7 @@ fi
>      }
>
>      updatercd_postinst() {
>     -if type update-rc.d >/dev/null 2>/dev/null; then
>     +if command -p update-rc.d >/dev/null 2>/dev/null; then
>             if [ -n "$D" ]; then
>                     OPT="-r $D"
>             else
>     @@ -43,7 +43,7 @@ fi
>      }
>
>      updatercd_postrm() {
>     -if type update-rc.d >/dev/null 2>/dev/null; then
>     +if command -p update-rc.d >/dev/null 2>/dev/null; then
>             if [ -n "$D" ]; then
>                     OPT="-f -r $D"
>             else
>     diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb <http://resolvconf_1.79.bb>b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb <http://resolvconf_1.79.bb>
>     index 8550177..e415445 100644
>     --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb <http://resolvconf_1.79.bb>
>     +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb <http://resolvconf_1.79.bb>
>     @@ -56,7 +56,7 @@ do_install () {
>
>      pkg_postinst_${PN} () {
>             if [ -z "$D" ]; then
>     -               if command -v systemd-tmpfiles >/dev/null; then
>     +               if command -p systemd-tmpfiles >/dev/null; then
>                             systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/resolvconf.conf
>                     elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
>                             ${sysconfdir}/init.d/populate-volatile.sh update
>     diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
>     index 6df8b9e..557f32a 100644
>     --- a/meta/recipes-core/glibc/glibc-package.inc
>     +++ b/meta/recipes-core/glibc/glibc-package.inc
>     @@ -206,7 +206,7 @@ glibc_package_preprocess () {
>
>      pkg_postinst_nscd () {
>             if [ -z "$D" ]; then
>     -               if command -v systemd-tmpfiles >/dev/null; then
>     +               if command -p systemd-tmpfiles >/dev/null; then
>                             systemd-tmpfiles --create ${sysconfdir}/tmpfiles.d/nscd.conf
>                     elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
>                             ${sysconfdir}/init.d/populate-volatile.sh update
>     diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb <http://guile_2.0.12.bb>b/meta/recipes-devtools/guile/guile_2.0.12.bb <http://guile_2.0.12.bb>
>     index d2fe511..a466d65 100644
>     --- a/meta/recipes-devtools/guile/guile_2.0.12.bb <http://guile_2.0.12.bb>
>     +++ b/meta/recipes-devtools/guile/guile_2.0.12.bb <http://guile_2.0.12.bb>
>     @@ -87,22 +87,27 @@ SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
>
>      guile_cross_config() {
>             # this is only for target recipe
>     -       if [ "${PN}" = "guile" ]
>     -       then
>     -               # Create guile-config returning target values instead of native values
>     -               install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
>     -               echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
>     -                       > ${B}/guile-config.cross
>     -               sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
>     -                       -e 's:",[ \t]*": . ":' \
>     -                       -e 's:" *}, *\\:"):' \
>     -                       -e 's:^.*cachedir.*$::' \
>     -                       -e '/^  (/p' \
>     -                       < ${B}/libguile/libpath.h >> ${B}/guile-config.cross
>     -               echo '))' >> ${B}/guile-config.cross
>     -               cat ${B}/meta/guile-config >> ${B}/guile-config.cross
>     -               install ${B}/guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
>     -       fi
>     +       [ "${PN}" = "${BPN}" ] || return 0
>     +
>     +       vars=$(sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
>     +                     -e 's:",[ \t]*": . ":' \
>     +                     -e 's:" *}, *\\:"):' \
>     +                     -e 's:^.*cachedir.*$::' \
>     +                     -e '/^  (/p' \
>     +              < ${B}/libguile/libpath.h)
>     +
>     +       # Create guile-config returning target values instead of native values
>     +       install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
>     +       cat <<EOF >${B}/guile-config.cross
>     +#!$(which ${BUILD_SYS}-guile) \\
>     +--no-auto-compile -e main -s
>     +!#
>     +(define %guile-build-info '(
>     +$vars
>     +))
>     +EOF
>     +       cat ${B}/meta/guile-config >> ${B}/guile-config.cross
>     +       install ${B}/guile-config.cross ${SYSROOT_DESTDIR}${bindir_crossscripts}/guile-config
>      }
>
>      # Guile needs the compiled files to be newer than the source, and it won't
>     diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb <http://rpm_5.4.16.bb>b/meta/recipes-devtools/rpm/rpm_5.4.16.bb <http://rpm_5.4.16.bb>
>     index 84adef6..be3b942 100644
>     --- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb <http://rpm_5.4.16.bb>
>     +++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb <http://rpm_5.4.16.bb>
>     @@ -554,13 +554,22 @@ do_install_append() {
>             install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh ${D}/${libdir}/rpm/perfile_rpmdeps.sh
>
>             # Remove unpackaged files (based on list in rpm.spec)
>     -       rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}
>     +       rm -f ${D}/${libdir}/rpm/Specfile.pm
>     +       rm -f ${D}/${libdir}/rpm/cpanflute
>     +       rm -f ${D}/${libdir}/rpm/cpanflute2
>     +       rm -f ${D}/${libdir}/rpm/rpmdiff
>     +       rm -f ${D}/${libdir}/rpm/rpmdiff.cgi
>     +       rm -f ${D}/${libdir}/rpm/sql.prov
>     +       rm -f ${D}/${libdir}/rpm/sql.req
>     +       rm -f ${D}/${libdir}/rpm/tcl.req
>     +       rm -f ${D}/${libdir}/rpm/trpm
>
>             rm -f ${D}/${mandir}/man8/rpmcache.8*
>             rm -f ${D}/${mandir}/man8/rpmgraph.8*
>             rm -f ${D}/${mandir}/*/man8/rpmcache.8*
>             rm -f ${D}/${mandir}/*/man8/rpmgraph.8*
>     -       rm -rf ${D}/${mandir}/{fr,ko}
>     +       rm -rf ${D}/${mandir}/fr
>     +       rm -rf ${D}/${mandir}/ko
>
>             rm -f ${D}/${includedir}/popt.h
>             rm -f ${D}/${libdir}/libpopt.*
>     --
>     2.8.1
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>


