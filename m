Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeAqP-0007lu-GP
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 22:04:09 +0200
Received: by eekd49 with SMTP id d49so2147216eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=fDd+JS7Y4ynd/ex+Mjl5yyLtevqxtDuLkpwse5/2i7E=;
	b=eQzlH+TDnZPHW1OkLn9hopuKSF2YpZcut9d95bf+Thu5DhUhYfyD82f3uQwgXgrLcD
	Ln2+Dy2iCuvFPkzc8GhBUx6xn8XbhQ+MC/P+DjNWllPT/EFLVtt+KOYhE9C+JAC0+TeA
	pmLqPD3EP9TrXC95wdSe3Jqw63l5clOaYizBTvqtwi5mElCpFeDCW73lINas1wWukB0a
	2pk+CIpwe63SxjV0/GNG2lxwRTfXbfgVUoZEVmsDH+Q36WWnkB2uKUq/f8wv/rmgbS3C
	sHDLPZ1vh+MBi6v11OaeZs6qLvaN9M5eMB8upeuGzuDcP9vaznJs4OB8H1JZ1gwENW4H
	DqsQ==
MIME-Version: 1.0
Received: by 10.14.97.70 with SMTP id s46mr6636153eef.118.1339444415462; Mon,
	11 Jun 2012 12:53:35 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Mon, 11 Jun 2012 12:53:35 -0700 (PDT)
In-Reply-To: <64585c9d2312340f6244d296dd123cf872315b1d.1339438568.git.mark.hatle@windriver.com>
References: <cover.1339438568.git.mark.hatle@windriver.com>
	<64585c9d2312340f6244d296dd123cf872315b1d.1339438568.git.mark.hatle@windriver.com>
Date: Mon, 11 Jun 2012 12:53:35 -0700
Message-ID: <CAMKF1sp8erxmW3qOLBGU=GBpQebNSCTj2fzy8BfLaFNY9sdk2g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] rpm: Upgrade RPM to 5.4.9
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
X-List-Received-Date: Mon, 11 Jun 2012 20:04:09 -0000
Content-Type: multipart/alternative; boundary=bcaec52c6a87947caa04c237b48a

--bcaec52c6a87947caa04c237b48a
Content-Type: text/plain; charset=UTF-8

On Monday, June 11, 2012, Mark Hatle <mark.hatle@windriver.com> wrote:
> Beside upreving RPM, add necessary integration pathces to libzypp.

Typo there I guess you wanted "patches" there


>
> Also change the configuration of RPM to support PACKAGECONFIG flags.
> RPM is highly configurable, the default configuration is good for
> minimal OE-Core use.
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |   29 +++++
>  .../rpm/rpm/rpm-scriptletexechelper.patch          |   33 +++---
>  meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch |   26 ++---
>  .../rpm/{rpm_5.4.8.bb => rpm_5.4.9.bb}             |  122
+++++++++-----------
>  .../libzypp/libzypp/libzypp-rpm549.patch           |   28 +++++
>  meta/recipes-extended/libzypp/libzypp_git.bb       |    3 +-
>  6 files changed, 141 insertions(+), 100 deletions(-)
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch
>  rename meta/recipes-devtools/rpm/{rpm_5.4.8.bb => rpm_5.4.9.bb} (82%)
>  create mode 100644
meta/recipes-extended/libzypp/libzypp/libzypp-rpm549.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
b/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
> new file mode 100644
> index 0000000..980e1b1
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-lua.patch
> @@ -0,0 +1,29 @@
> +Add support for cross compiling lua
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +diff -ur rpm-5.4.9.orig/configure.ac rpm-5.4.9/configure.ac
> +--- rpm-5.4.9.orig/configure.ac        2012-05-16 12:16:36.589813548
-0500
> ++++ rpm-5.4.9/configure.ac     2012-05-16 12:26:01.070813518 -0500
> +@@ -120,6 +120,9 @@
> +
> + AC_PATH_PROG(AS, as, as)
> +
> ++CC_FOR_BUILD=${CC_FOR_BUILD-\$(CC)}
> ++AC_SUBST(CC_FOR_BUILD)
> ++
> + dnl # GCC specifics
> + AC_PROG_GCC_TRADITIONAL
> + AC_ARG_ENABLE(build-pic,
> +diff -ur rpm-5.4.9.orig/lua/Makefile.am rpm-5.4.9/lua/Makefile.am
> +--- rpm-5.4.9.orig/lua/Makefile.am     2012-04-07 19:15:25.000000000
-0500
> ++++ rpm-5.4.9/lua/Makefile.am  2012-05-16 12:26:19.556856688 -0500
> +@@ -40,7 +40,7 @@
> +
> + # --- bin2c doesn't need anything but a compiler
> + bin2c$(EXEEXT):  bin2c.c
> +-      $(CC) -o $@ $<
> ++      $(CC_FOR_BUILD) -o $@ $<
> +
> + liblua_la_SOURCES =
> + liblua_la_CFLAGS = @WITH_LUA_SUBDIR_DEF@
> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
> index e4db0e4..8a9e712 100644
> --- a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
> +++ b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
> @@ -12,10 +12,11 @@ Upstream-Status: Pending
>
>  Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>
> -diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
> ---- rpm-5.4.0.orig/lib/psm.c   2010-12-29 07:42:11.000000000 -0600
> -+++ rpm-5.4.0/lib/psm.c        2011-11-08 13:38:48.132791154 -0600
> -@@ -792,6 +792,10 @@
> +Index: rpm-5.4.9/lib/psm.c
> +===================================================================
> +--- rpm-5.4.9.orig/lib/psm.c
> ++++ rpm-5.4.9/lib/psm.c
> +@@ -801,6 +801,10 @@ static rpmRC runScript(rpmpsm psm, Heade
>      int xx;
>      int i;
>
> @@ -26,23 +27,23 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
>      if (psm->sstates != NULL && ix >= 0 && ix < RPMSCRIPT_MAX)
>        ssp = psm->sstates + ix;
>      if (ssp != NULL)
> -@@ -858,14 +862,29 @@
> +@@ -867,14 +871,29 @@ assert(he->p.str != NULL);
>                (F_ISSET(psm, UNORDERED) ? "a" : ""));
>
>      if (Phe->p.argv == NULL) {
> --      argv = alloca(5 * sizeof(*argv));
> +-      argv = (const char **) alloca(5 * sizeof(*argv));
>  -      argv[0] = "/bin/sh";
>  -      argc = 1;
> -+      argv = alloca(7 * sizeof(*argv));
> ++      argv = (const char **) alloca(7 * sizeof(*argv));
>  +      argc = 0;
>  +    } else {
> -+      argv = alloca((Phe->c + 6) * sizeof(*argv));
> ++      argv = (const char **) alloca((Phe->c + 6) * sizeof(*argv));
>  +      argc = 0;
>  +    }
>  +
>  +#ifdef RPM_VENDOR_POKY
>  +    if (scriptletWrapper && *scriptletWrapper) {
> -+        argv[argc++] = scriptletWrapper;
> ++      argv[argc++] = scriptletWrapper;
>  +      argv[argc] = rpmtsRootDir(ts);
>  +      if (!argv[argc] || !*argv[argc])
>  +         argv[argc] = "/";
> @@ -51,10 +52,10 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
>  +#endif
>  +
>  +    if (Phe->p.argv == NULL) {
> -+        argv[argc++] = "/bin/sh";
> ++      argv[argc++] = "/bin/sh";
>        ldconfig_done = 0;
>      } else {
> --      argv = alloca((Phe->c + 4) * sizeof(*argv));
> +-      argv = (const char **) alloca((Phe->c + 4) * sizeof(*argv));
>  -      memcpy(argv, Phe->p.argv, Phe->c * sizeof(*argv));
>  -      argc = Phe->c;
>  +      memcpy((argv + argc), Phe->p.argv, Phe->c * sizeof(*argv));
> @@ -62,7 +63,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
>        ldconfig_done = (ldconfig_path && !strcmp(argv[0], ldconfig_path)
>                ? 1 : 0);
>      }
> -@@ -916,7 +935,12 @@
> +@@ -925,7 +944,12 @@ assert(he->p.str != NULL);
>            goto exit;
>
>        if (rpmIsDebug() &&
> @@ -76,7 +77,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
>        {
>            static const char set_x[] = "set -x\n";
>            nw = Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
> -@@ -1051,12 +1075,22 @@
> +@@ -1060,12 +1084,22 @@ assert(he->p.str != NULL);
>
>        {   const char * rootDir = rpmtsRootDir(ts);
>            if (!rpmtsChrootDone(ts) && rootDir != NULL &&
> @@ -99,7 +100,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
>            xx = Chdir("/");
>            rpmlog(RPMLOG_DEBUG, D_("%s: %s(%s)\texecv(%s) pid %d\n"),
>                        psm->stepName, sln, NVRA,
> -@@ -2961,6 +2995,13 @@
> +@@ -2977,6 +3011,13 @@ assert(psm->te != NULL);
>      case PSM_SCRIPT:  /* Run current package scriptlets. */
>        /* XXX running %verifyscript/%sanitycheck doesn't have psm->te */
>      { rpmtxn _parent = (psm && psm->te ? psm->te->txn : NULL);
> @@ -113,7 +114,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
>        xx = rpmtxnBegin(rpmtsGetRdb(ts), _parent, NULL);
>        rc = runInstScript(psm);
>        if (rc)
> -@@ -2968,11 +3009,24 @@
> +@@ -2984,11 +3025,24 @@ assert(psm->te != NULL);
>        else
>             xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
>        rpmtsGetRdb(ts)->db_txn = NULL;
> @@ -138,7 +139,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
>        break;
>      case PSM_IMMED_TRIGGERS:
>        /* Run triggers in this package other package(s) set off. */
> -@@ -2982,7 +3036,18 @@
> +@@ -2998,7 +3052,18 @@ assert(psm->te != NULL);
>            F_SET(psm, GOTTRIGGERS);
>        }
>        if (psm->triggers != NULL)
> diff --git a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
> index 1667901..f29866b 100644
> --- a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
> +++ b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch
> @@ -16,20 +16,20 @@ RP 2012/2/7
>  2 files changed, 152 insertions(+), 1 deletions(-)
>  create mode 100644 tools/rpmdeps-oecore.c
>
> -diff --git a/tools/Makefile.am b/tools/Makefile.am
> -index f520843..2eba9bf 100644
> ---- a/tools/Makefile.am
> -+++ b/tools/Makefile.am
> +Index: rpm-5.4.9/tools/Makefile.am
> +===================================================================
> +--- rpm-5.4.9.orig/tools/Makefile.am
> ++++ rpm-5.4.9/tools/Makefile.am
>  @@ -58,7 +58,7 @@ pkgbin_PROGRAMS =    \
>        @WITH_AUGEAS_AUGTOOL@ chroot cp @WITH_CUDF_CUDFTOOL@ find mtree \
>        @WITH_SEMANAGE_SEMODULE@ wget \
>        rpmcache rpmdigest rpmrepo rpmspecdump \
>  -      rpmcmp rpmdeps sqlite3 @WITH_KEYUTILS_RPMKEY@@WITH_LIBELF_DEBUGEDIT@
>  +      rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WITH_KEYUTILS_RPMKEY@@WITH_LIBELF_DEBUGEDIT@
> - dist_man_MANS =               rpmgrep.1
> -
> - augtool_SOURCES =     augtool.c
> -@@ -155,6 +155,10 @@ rpmdeps_SOURCES = rpmdeps.c
> + if WITH_DB
> + pkgbin_PROGRAMS +=    dbconvert
> + endif
> +@@ -168,6 +168,10 @@ rpmdeps_SOURCES = rpmdeps.c
>  rpmdeps_LDFLAGS =     @LDFLAGS_STATIC@ $(LDFLAGS)
>  rpmdeps_LDADD =               $(RPM_LDADD_COMMON)
>
> @@ -40,11 +40,10 @@ index f520843..2eba9bf 100644
>  rpmdigest_SOURCES =   rpmdigest.c
>  rpmdigest_LDFLAGS =   @LDFLAGS_STATIC@ $(LDFLAGS)
>  rpmdigest_LDADD =     $(RPMIO_LDADD_COMMON)
> -diff --git a/tools/rpmdeps-oecore.c b/tools/rpmdeps-oecore.c
> -new file mode 100644
> -index 0000000..e646da9
> +Index: rpm-5.4.9/tools/rpmdeps-oecore.c
> +===================================================================
>  --- /dev/null
> -+++ b/tools/rpmdeps-oecore.c
> ++++ rpm-5.4.9/tools/rpmdeps-oecore.c
>  @@ -0,0 +1,147 @@
>  +#include "system.h"
>  +const char *__progname;
> @@ -193,6 +192,3 @@ index 0000000..e646da9
>  +    optCon = rpmcliFini(optCon);
>  +    return ec;
>  +}
> ---
> -1.7.4.1
> -
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.8.bbb/meta/recipes-devtools/rpm/
rpm_5.4.9.bb
> similarity index 82%
> rename from meta/recipes-devtools/rpm/rpm_5.4.8.bb
> rename to meta/recipes-devtools/rpm/rpm_5.4.9.bb
> index ac86ff3..6eba802 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.8.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
> @@ -42,14 +42,12 @@ HOMEPAGE = "http://rpm5.org/"
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM =
"file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
> -DEPENDS = "beecrypt bzip2 zlib db openssl elfutils expat libpcre attr
acl popt ${extrarpmdeps}"
> -extrarpmdeps = "python perl file"
> -extrarpmdeps_virtclass-native = "python-native file-native"
> -PR = "r39"
> +DEPENDS = "libpcre attr acl popt file"
> +PR = "r40"
>
>  # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is
needed
>  # in order to extract the distribution SRPM into a format we can
extract...
> -SRC_URI = "
http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.8-0.20120401.src.rpm;extract=rpm-5.4.8.tar.gz\
> +SRC_URI = "
http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;extract=rpm-5.4.9.tar.gz\
>           file://rpm-log-auto-rm.patch \
>           file://rpm-db-reduce.patch \
>           file://perfile_rpmdeps.sh \
> @@ -70,10 +68,11 @@ SRC_URI = "
http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.8-0.20120401.src.rpm;ex
>           file://rpm-respect-arch.patch \
>           file://rpm-no-perl-urpm.patch \
>           file://rpm-macros.patch \
> +          file://rpm-lua.patch \
>          "
>
> -SRC_URI[md5sum] = "424b60bf2e0a624a218440d943861644"
> -SRC_URI[sha256sum] =
"56eb5033d4de98c217475fb34d466d551f8912959389e7854a806e2bd9e13380"
> +SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
> +SRC_URI[sha256sum] =
"bac7cc5bd9d0e8262fdc0099349924608da8f680f5cb243751f696552239dde8"
>
>  inherit autotools gettext
>
> @@ -83,63 +82,74 @@ acpaths = "-I ${S}/db/dist/aclocal -I
${S}/db/dist/aclocal_java"
>  rpm_macros =
"%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros"
>  rpm_macros_virtclass-native =
"%{_usrlibrpm}/macros:%{_usrlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros"
>
> -# Configure values taken from rpm.spec
> -WITH_BZIP2 = "--with-bzip2"
> +# sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux
>
> -WITH_XZ = "--with-xz=none"
> +# Note: perl and sqlite w/o db specified does not currently work.
> +#       tcl, augeas, nss, gcrypt, xar and keyutils support is untested.
> +PACKAGECONFIG_virtclass-native ??= "db bzip2 zlib beecrypt openssl
libelf python"
> +PACKAGECONFIG ??= "db bzip2 zlib beecrypt openssl libelf python"
>
> -WITH_Z = "--with-zlib $WITH_BZIP2 $WITH_XZ"
> +PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2,"
> +PACKAGECONFIG[xz] = "--with-xz,--without-xz,xz,"
> +PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib,"
> +PACKAGECONFIG[xar] = "--with-xar,--without-xar,xar,"
>
> -WITH_PYTHON = "        --with-python=${PYTHON_BASEVERSION} \
> +WITH_PYTHON = " --with-python=${PYTHON_BASEVERSION} \
>
 --with-python-inc-dir=${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \
>
 --with-python-lib-dir=${libdir}/python${PYTHON_BASEVERSION} \
> -               --without-pythonembed \
> -             "
> +               --without-pythonembed"
> +PACKAGECONFIG[python] = "${WITH_PYTHON},--without-python,python,"
>
>  # Perl modules are not built, but they could be enabled fairly easily
>  # the perl module creation and installation would need to be patched.
>  # (currently has host perl contamination issues)
> -#WITH_PERL = " --with-perl --without-perlembed"
> -WITH_PERL = "  --without-perl --without-perl-urpm"
> +WITH_PERL = "--with-perl --without-perlembed --without-perl-urpm"
> +WITHOUT_PERL = "--without-perl --without-perl-urpm"
> +PACKAGECONFIG[perl] = "${WITH_PERL},${WITHOUT_PERL},perl,"
>
> -WITH_PERL_virtclass-native = " --without-perl --without-perl-urpm"
> +# The --with-dbsql will only tell RPM to check for support, db
> +# may or may not be built w/ the dbsql support.
> +WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated"
> +PACKAGECONFIG[db] = "${WITH_DB},--without-db,db,"
>
> -WITH_DB = "--with-db --with-dbsql --without-db-tools-integrated
--without-sqlite"
> +PACKAGECONFIG[sqlite] = "--with-sqlite,--without-sqlite,sqlite3,"
>
> -WITH_CRYPTO = "--with-beecrypt --with-openssl --without-nss
--without-gcrypt"
> +PACKAGECONFIG[beecrypt] = "--with-beecrypt,--without-beecrypt,beecrypt,"
> +PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,"
> +PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss,"
> +PACKAGECONFIG[gcrypt] = "--with-gcrypt,--without-gcrypt,gcrypt,"
> +PACKAGECONFIG[keyutils] = "--with-keyutils,--without-keyutils,keyutils,"
> +PACKAGECONFIG[libelf] = "--with-libelf,--without-libelf,elfutils,"
>
> -WITH_KEYUTILS = "--without-keyutils"
> -WITH_LIBELF = "--with-libelf"
> -WITH_SELINUX =--
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec52c6a87947caa04c237b48a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Monday, June 11, 2012, Mark Hatle &lt;<a href=3D"mailto:mark.hat=
le@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>&gt; Beside up=
reving RPM, add necessary integration pathces to libzypp.<br><br>Typo there=
 I guess you wanted &quot;patches&quot; there<br>
<br><br>&gt;<br>&gt; Also change the configuration of RPM to support PACKAG=
ECONFIG flags.<br>&gt; RPM is highly configurable, the default configuratio=
n is good for<br>&gt; minimal OE-Core use.<br>&gt;<br>&gt; Signed-off-by: M=
ark Hatle &lt;<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle@windri=
ver.com</a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/recipes-devtools/rpm/rpm/rpm-lua.patch =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 29 +++++<br>&gt; =C2=A0.../rpm/rpm/rpm-scriptl=
etexechelper.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 33 +++---<br>=
&gt; =C2=A0meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch | =C2=A0 26 +=
+---<br>
&gt; =C2=A0.../rpm/{<a href=3D"http://rpm_5.4.8.bb">rpm_5.4.8.bb</a> =3D&gt=
; <a href=3D"http://rpm_5.4.9.bb">rpm_5.4.9.bb</a>} =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0122 +++++++++-----------<br>&gt; =C2=A0.../lib=
zypp/libzypp/libzypp-rpm549.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 28 +++++<br>
&gt; =C2=A0meta/recipes-extended/libzypp/<a href=3D"http://libzypp_git.bb">=
libzypp_git.bb</a> =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-<br>&gt; =C2=A06=
 files changed, 141 insertions(+), 100 deletions(-)<br>&gt; =C2=A0create mo=
de 100644 meta/recipes-devtools/rpm/rpm/rpm-lua.patch<br>
&gt; =C2=A0rename meta/recipes-devtools/rpm/{<a href=3D"http://rpm_5.4.8.bb=
">rpm_5.4.8.bb</a> =3D&gt; <a href=3D"http://rpm_5.4.9.bb">rpm_5.4.9.bb</a>=
} (82%)<br>&gt; =C2=A0create mode 100644 meta/recipes-extended/libzypp/libz=
ypp/libzypp-rpm549.patch<br>
&gt;<br>&gt; diff --git a/meta/recipes-devtools/rpm/rpm/rpm-lua.patch b/met=
a/recipes-devtools/rpm/rpm/rpm-lua.patch<br>&gt; new file mode 100644<br>&g=
t; index 0000000..980e1b1<br>&gt; --- /dev/null<br>&gt; +++ b/meta/recipes-=
devtools/rpm/rpm/rpm-lua.patch<br>
&gt; @@ -0,0 +1,29 @@<br>&gt; +Add support for cross compiling lua<br>&gt; =
+<br>&gt; +Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@windr=
iver.com">mark.hatle@windriver.com</a>&gt;<br>&gt; +<br>&gt; +diff -ur rpm-=
5.4.9.orig/<a href=3D"http://configure.ac">configure.ac</a> rpm-5.4.9/<a hr=
ef=3D"http://configure.ac">configure.ac</a><br>
&gt; +--- rpm-5.4.9.orig/<a href=3D"http://configure.ac">configure.ac</a> =
=C2=A0 =C2=A0 =C2=A0 =C2=A02012-05-16 12:16:36.589813548 -0500<br>&gt; ++++=
 rpm-5.4.9/<a href=3D"http://configure.ac">configure.ac</a> =C2=A0 =C2=A0 2=
012-05-16 12:26:01.070813518 -0500<br>
&gt; +@@ -120,6 +120,9 @@<br>&gt; +<br>&gt; + AC_PATH_PROG(AS, as, as)<br>&=
gt; +<br>&gt; ++CC_FOR_BUILD=3D${CC_FOR_BUILD-\$(CC)}<br>&gt; ++AC_SUBST(CC=
_FOR_BUILD)<br>&gt; ++<br>&gt; + dnl # GCC specifics<br>&gt; + AC_PROG_GCC_=
TRADITIONAL<br>
&gt; + AC_ARG_ENABLE(build-pic,<br>&gt; +diff -ur rpm-5.4.9.orig/lua/Makefi=
le.am rpm-5.4.9/lua/Makefile.am<br>&gt; +--- rpm-5.4.9.orig/lua/Makefile.am=
 =C2=A0 =C2=A0 2012-04-07 19:15:25.000000000 -0500<br>&gt; ++++ rpm-5.4.9/l=
ua/Makefile.am =C2=A02012-05-16 12:26:19.556856688 -0500<br>
&gt; +@@ -40,7 +40,7 @@<br>&gt; +<br>&gt; + # --- bin2c doesn&#39;t need an=
ything but a compiler<br>&gt; + bin2c$(EXEEXT): =C2=A0bin2c.c<br>&gt; +- =
=C2=A0 =C2=A0 =C2=A0$(CC) -o $@ $&lt;<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0$(CC_F=
OR_BUILD) -o $@ $&lt;<br>&gt; +<br>
&gt; + liblua_la_SOURCES =3D<br>&gt; + liblua_la_CFLAGS =3D @WITH_LUA_SUBDI=
R_DEF@<br>&gt; diff --git a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexec=
helper.patch b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch<=
br>
&gt; index e4db0e4..8a9e712 100644<br>&gt; --- a/meta/recipes-devtools/rpm/=
rpm/rpm-scriptletexechelper.patch<br>&gt; +++ b/meta/recipes-devtools/rpm/r=
pm/rpm-scriptletexechelper.patch<br>&gt; @@ -12,10 +12,11 @@ Upstream-Statu=
s: Pending<br>
&gt;<br>&gt; =C2=A0Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hat=
le@windriver.com">mark.hatle@windriver.com</a>&gt;<br>&gt;<br>&gt; -diff -u=
r rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c<br>&gt; ---- rpm-5.4.0.orig/=
lib/psm.c =C2=A0 2010-12-29 07:42:11.000000000 -0600<br>
&gt; -+++ rpm-5.4.0/lib/psm.c =C2=A0 =C2=A0 =C2=A0 =C2=A02011-11-08 13:38:4=
8.132791154 -0600<br>&gt; -@@ -792,6 +792,10 @@<br>&gt; +Index: rpm-5.4.9/l=
ib/psm.c<br>&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&g=
t; +--- rpm-5.4.9.orig/lib/psm.c<br>
&gt; ++++ rpm-5.4.9/lib/psm.c<br>&gt; +@@ -801,6 +801,10 @@ static rpmRC ru=
nScript(rpmpsm psm, Heade<br>&gt; =C2=A0 =C2=A0 =C2=A0int xx;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0int i;<br>&gt;<br>&gt; @@ -26,23 +27,23 @@ diff -ur rpm-5.=
4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c<br>
&gt; =C2=A0 =C2=A0 =C2=A0if (psm-&gt;sstates !=3D NULL &amp;&amp; ix &gt;=
=3D 0 &amp;&amp; ix &lt; RPMSCRIPT_MAX)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ssp =3D psm-&gt;sstates + ix;<br>&gt; =C2=A0 =C2=A0 =C2=A0if (ssp !=3D NULL=
)<br>&gt; -@@ -858,14 +862,29 @@<br>&gt; +@@ -867,14 +871,29 @@ assert(he-&=
gt;p.str !=3D NULL);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(F_ISSET(psm, U=
NORDERED) ? &quot;a&quot; : &quot;&quot;));<br>&gt;<br>&gt; =C2=A0 =C2=A0 =
=C2=A0if (Phe-&gt;p.argv =3D=3D NULL) {<br>&gt; -- =C2=A0 =C2=A0 =C2=A0argv=
 =3D alloca(5 * sizeof(*argv));<br>&gt; +- =C2=A0 =C2=A0 =C2=A0argv =3D (co=
nst char **) alloca(5 * sizeof(*argv));<br>
&gt; =C2=A0- =C2=A0 =C2=A0 =C2=A0argv[0] =3D &quot;/bin/sh&quot;;<br>&gt; =
=C2=A0- =C2=A0 =C2=A0 =C2=A0argc =3D 1;<br>&gt; -+ =C2=A0 =C2=A0 =C2=A0argv=
 =3D alloca(7 * sizeof(*argv));<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0argv =3D (co=
nst char **) alloca(7 * sizeof(*argv));<br>&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=
=A0argc =3D 0;<br>&gt; =C2=A0+ =C2=A0 =C2=A0} else {<br>
&gt; -+ =C2=A0 =C2=A0 =C2=A0argv =3D alloca((Phe-&gt;c + 6) * sizeof(*argv)=
);<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0argv =3D (const char **) alloca((Phe-&gt;=
c + 6) * sizeof(*argv));<br>&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0argc =3D 0;<br=
>&gt; =C2=A0+ =C2=A0 =C2=A0}<br>&gt; =C2=A0+<br>&gt; =C2=A0+#ifdef RPM_VEND=
OR_POKY<br>
&gt; =C2=A0+ =C2=A0 =C2=A0if (scriptletWrapper &amp;&amp; *scriptletWrapper=
) {<br>&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[argc++] =3D scriptletWrapper=
;<br>&gt; ++ =C2=A0 =C2=A0 =C2=A0argv[argc++] =3D scriptletWrapper;<br>&gt;=
 =C2=A0+ =C2=A0 =C2=A0 =C2=A0argv[argc] =3D rpmtsRootDir(ts);<br>&gt; =C2=
=A0+ =C2=A0 =C2=A0 =C2=A0if (!argv[argc] || !*argv[argc])<br>
&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 argv[argc] =3D &quot;/&quot;;<br>&=
gt; @@ -51,10 +52,10 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm=
.c<br>&gt; =C2=A0+#endif<br>&gt; =C2=A0+<br>&gt; =C2=A0+ =C2=A0 =C2=A0if (P=
he-&gt;p.argv =3D=3D NULL) {<br>&gt; -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0argv[arg=
c++] =3D &quot;/bin/sh&quot;;<br>
&gt; ++ =C2=A0 =C2=A0 =C2=A0argv[argc++] =3D &quot;/bin/sh&quot;;<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0ldconfig_done =3D 0;<br>&gt; =C2=A0 =C2=A0 =C2=
=A0} else {<br>&gt; -- =C2=A0 =C2=A0 =C2=A0argv =3D alloca((Phe-&gt;c + 4) =
* sizeof(*argv));<br>&gt; +- =C2=A0 =C2=A0 =C2=A0argv =3D (const char **) a=
lloca((Phe-&gt;c + 4) * sizeof(*argv));<br>
&gt; =C2=A0- =C2=A0 =C2=A0 =C2=A0memcpy(argv, Phe-&gt;p.argv, Phe-&gt;c * s=
izeof(*argv));<br>&gt; =C2=A0- =C2=A0 =C2=A0 =C2=A0argc =3D Phe-&gt;c;<br>&=
gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0memcpy((argv + argc), Phe-&gt;p.argv, Phe-&=
gt;c * sizeof(*argv));<br>&gt; @@ -62,7 +63,7 @@ diff -ur rpm-5.4.0.orig/li=
b/psm.c rpm-5.4.0/lib/psm.c<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0ldconfig_done =3D (ldconfig_path &amp;&amp;=
 !strcmp(argv[0], ldconfig_path)<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0? 1 : 0);<br>&gt; =C2=A0 =C2=A0 =C2=A0}<br>&gt; -@@ -9=
16,7 +935,12 @@<br>&gt; +@@ -925,7 +944,12 @@ assert(he-&gt;p.str !=3D NULL=
);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto exit;<br>&gt;<br>&gt; =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rpmIsDebug() &amp;&amp;<br>&gt; @@ -76,7 +77=
,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0{<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stat=
ic const char set_x[] =3D &quot;set -x\n&quot;;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nw =3D Fwrite(set_x, sizeof(s=
et_x[0]), sizeof(set_x)-1, fd);<br>&gt; -@@ -1051,12 +1075,22 @@<br>&gt; +@=
@ -1060,12 +1084,22 @@ assert(he-&gt;p.str !=3D NULL);<br>&gt;<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0{ =C2=A0 const char * rootDir =3D rpmtsRootDir(ts);=
<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rpmtsChrootDone(ts) &amp=
;&amp; rootDir !=3D NULL &amp;&amp;<br>&gt; @@ -99,7 +100,7 @@ diff -ur rpm=
-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0xx =3D Chdir(&quot;/&quot;);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0rpmlog(RPMLOG_DEBUG, D_(&quot;%s: %s(%s)\texecv(%s) pid=
 %d\n&quot;),<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0psm-&gt;stepName, sln, NVRA,<br>&gt; -@@ -2961,6 +2995,13 @@<b=
r>&gt; +@@ -2977,6 +3011,13 @@ assert(psm-&gt;te !=3D NULL);<br>&gt; =C2=A0=
 =C2=A0 =C2=A0case PSM_SCRIPT: =C2=A0/* Run current package scriptlets. */<=
br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* XXX running %verifyscript/%sanitycheck d=
oesn&#39;t have psm-&gt;te */<br>&gt; =C2=A0 =C2=A0 =C2=A0{ rpmtxn _parent =
=3D (psm &amp;&amp; psm-&gt;te ? psm-&gt;te-&gt;txn : NULL);<br>&gt; @@ -11=
3,7 +114,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0xx =3D rpmtxnBegin(rpmtsGetRdb(ts), _parent=
, NULL);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0rc =3D runInstScript(psm);<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rc)<br>&gt; -@@ -2968,11 +3009,24 @@<br>=
&gt; +@@ -2984,11 +3025,24 @@ assert(psm-&gt;te !=3D NULL);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 xx =3D rpmtxnCommit(rpmtsGetRdb(ts)-&gt;db_txn);<br>&gt; =C2=
=A0 =C2=A0 =C2=A0 =C2=A0rpmtsGetRdb(ts)-&gt;db_txn =3D NULL;<br>&gt; @@ -13=
8,7 +139,7 @@ diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; =C2=A0 =C2=A0 =C2=A0case PSM_IMMED_TRIGGERS:<br>&gt; =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Run triggers in this package other package(s) set off. */<br>&=
gt; -@@ -2982,7 +3036,18 @@<br>&gt; +@@ -2998,7 +3052,18 @@ assert(psm-&gt;=
te !=3D NULL);<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0F_SET(psm, =
GOTTRIGGERS);<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ps=
m-&gt;triggers !=3D NULL)<br>&gt; diff --git a/meta/recipes-devtools/rpm/rp=
m/rpmdeps-oecore.patch b/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch=
<br>&gt; index 1667901..f29866b 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch<br>&gt; +++ b=
/meta/recipes-devtools/rpm/rpm/rpmdeps-oecore.patch<br>&gt; @@ -16,20 +16,2=
0 @@ RP 2012/2/7<br>&gt; =C2=A02 files changed, 152 insertions(+), 1 deleti=
ons(-)<br>
&gt; =C2=A0create mode 100644 tools/rpmdeps-oecore.c<br>&gt;<br>&gt; -diff =
--git a/tools/Makefile.am b/tools/Makefile.am<br>&gt; -index f520843..2eba9=
bf 100644<br>&gt; ---- a/tools/Makefile.am<br>&gt; -+++ b/tools/Makefile.am=
<br>
&gt; +Index: rpm-5.4.9/tools/Makefile.am<br>&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>&gt; +--- rpm-5.4.9.orig/tools/Makefile.am<b=
r>&gt; ++++ rpm-5.4.9/tools/Makefile.am<br>&gt; =C2=A0@@ -58,7 +58,7 @@ pkg=
bin_PROGRAMS =3D =C2=A0 =C2=A0\<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0@WITH_AUGEAS_AUGTOOL@ chroot cp @WITH_CUDF_=
CUDFTOOL@ find mtree \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0@WITH_SEMANAGE_SE=
MODULE@ wget \<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0rpmcache rpmdigest rpmrep=
o rpmspecdump \<br>&gt; =C2=A0- =C2=A0 =C2=A0 =C2=A0rpmcmp rpmdeps sqlite3 =
@WITH_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@<br>
&gt; =C2=A0+ =C2=A0 =C2=A0 =C2=A0rpmcmp rpmdeps rpmdeps-oecore sqlite3 @WIT=
H_KEYUTILS_RPMKEY@ @WITH_LIBELF_DEBUGEDIT@<br>&gt; - dist_man_MANS =3D =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmgrep.1<br>&gt; -<br>&gt; -=
 augtool_SOURCES =3D =C2=A0 =C2=A0 augtool.c<br>&gt; -@@ -155,6 +155,10 @@ =
rpmdeps_SOURCES =3D rpmdeps.c<br>
&gt; + if WITH_DB<br>&gt; + pkgbin_PROGRAMS +=3D =C2=A0 =C2=A0dbconvert<br>=
&gt; + endif<br>&gt; +@@ -168,6 +168,10 @@ rpmdeps_SOURCES =3D rpmdeps.c<br=
>&gt; =C2=A0rpmdeps_LDFLAGS =3D =C2=A0 =C2=A0 @LDFLAGS_STATIC@ $(LDFLAGS)<b=
r>&gt; =C2=A0rpmdeps_LDADD =3D =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 $(RPM_LDADD_COMMON)<br>
&gt;<br>&gt; @@ -40,11 +40,10 @@ index f520843..2eba9bf 100644<br>&gt; =C2=
=A0rpmdigest_SOURCES =3D =C2=A0 rpmdigest.c<br>&gt; =C2=A0rpmdigest_LDFLAGS=
 =3D =C2=A0 @LDFLAGS_STATIC@ $(LDFLAGS)<br>&gt; =C2=A0rpmdigest_LDADD =3D =
=C2=A0 =C2=A0 $(RPMIO_LDADD_COMMON)<br>
&gt; -diff --git a/tools/rpmdeps-oecore.c b/tools/rpmdeps-oecore.c<br>&gt; =
-new file mode 100644<br>&gt; -index 0000000..e646da9<br>&gt; +Index: rpm-5=
.4.9/tools/rpmdeps-oecore.c<br>&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>
&gt; =C2=A0--- /dev/null<br>&gt; -+++ b/tools/rpmdeps-oecore.c<br>&gt; ++++=
 rpm-5.4.9/tools/rpmdeps-oecore.c<br>&gt; =C2=A0@@ -0,0 +1,147 @@<br>&gt; =
=C2=A0+#include &quot;system.h&quot;<br>&gt; =C2=A0+const char *__progname;=
<br>&gt; @@ -193,6 +192,3 @@ index 0000000..e646da9<br>
&gt; =C2=A0+ =C2=A0 =C2=A0optCon =3D rpmcliFini(optCon);<br>&gt; =C2=A0+ =
=C2=A0 =C2=A0return ec;<br>&gt; =C2=A0+}<br>&gt; ---<br>&gt; -1.7.4.1<br>&g=
t; -<br>&gt; diff --git a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5=
.4.8.bb">rpm_5.4.8.bb</a> b/meta/recipes-devtools/rpm/<a href=3D"http://rpm=
_5.4.9.bb">rpm_5.4.9.bb</a><br>
&gt; similarity index 82%<br>&gt; rename from meta/recipes-devtools/rpm/<a =
href=3D"http://rpm_5.4.8.bb">rpm_5.4.8.bb</a><br>&gt; rename to meta/recipe=
s-devtools/rpm/<a href=3D"http://rpm_5.4.9.bb">rpm_5.4.9.bb</a><br>&gt; ind=
ex ac86ff3..6eba802 100644<br>
&gt; --- a/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.4.8.bb">rpm_5.=
4.8.bb</a><br>&gt; +++ b/meta/recipes-devtools/rpm/<a href=3D"http://rpm_5.=
4.9.bb">rpm_5.4.9.bb</a><br>&gt; @@ -42,14 +42,12 @@ HOMEPAGE =3D &quot;<a =
href=3D"http://rpm5.org/">http://rpm5.org/</a>&quot;<br>
&gt; =C2=A0LICENSE =3D &quot;LGPLv2.1&quot;<br>&gt; =C2=A0LIC_FILES_CHKSUM =
=3D &quot;file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1&quot;<b=
r>&gt;<br>&gt; -DEPENDS =3D &quot;beecrypt bzip2 zlib db openssl elfutils e=
xpat libpcre attr acl popt ${extrarpmdeps}&quot;<br>
&gt; -extrarpmdeps =3D &quot;python perl file&quot;<br>&gt; -extrarpmdeps_v=
irtclass-native =3D &quot;python-native file-native&quot;<br>&gt; -PR =3D &=
quot;r39&quot;<br>&gt; +DEPENDS =3D &quot;libpcre attr acl popt file&quot;<=
br>&gt; +PR =3D &quot;r40&quot;<br>
&gt;<br>&gt; =C2=A0# rpm2cpio is a shell script, which is part of the rpm s=
rc.rpm. =C2=A0It is needed<br>&gt; =C2=A0# in order to extract the distribu=
tion SRPM into a format we can extract...<br>&gt; -SRC_URI =3D &quot;<a hre=
f=3D"http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.8-0.20120401.src.rpm;ext=
ract=3Drpm-5.4.8.tar.gz">http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.8-0.=
20120401.src.rpm;extract=3Drpm-5.4.8.tar.gz</a> \<br>
&gt; +SRC_URI =3D &quot;<a href=3D"http://www.rpm5.org/files/rpm/rpm-5.4/rp=
m-5.4.9-0.20120508.src.rpm;extract=3Drpm-5.4.9.tar.gz">http://www.rpm5.org/=
files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;extract=3Drpm-5.4.9.tar.gz</=
a> \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rpm-log-auto-rm.patch \<br>&=
gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rpm-db-reduce.patch \<br>&gt;=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://perfile_rpmdeps.sh \<br>&gt; @@ =
-70,10 +68,11 @@ SRC_URI =3D &quot;<a href=3D"http://www.rpm5.org/files/rpm=
/rpm-5.4/rpm-5.4.8-0.20120401.src.rpm;ex">http://www.rpm5.org/files/rpm/rpm=
-5.4/rpm-5.4.8-0.20120401.src.rpm;ex</a><br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rpm-respect-arch.patch \<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rpm-no-perl-urpm.patch \<br>=
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rpm-macros.patch \<br>&gt; +=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://rpm-lua.patch \<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>&gt;<br>&gt; -SRC_URI[md5sum] =3D &quo=
t;424b60bf2e0a624a218440d943861644&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;56eb5033d4de98c217475fb34d466d551f891295=
9389e7854a806e2bd9e13380&quot;<br>&gt; +SRC_URI[md5sum] =3D &quot;60d56ace8=
84340c1b3fcac6a1d58e768&quot;<br>&gt; +SRC_URI[sha256sum] =3D &quot;bac7cc5=
bd9d0e8262fdc0099349924608da8f680f5cb243751f696552239dde8&quot;<br>
&gt;<br>&gt; =C2=A0inherit autotools gettext<br>&gt;<br>&gt; @@ -83,63 +82,=
74 @@ acpaths =3D &quot;-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_jav=
a&quot;<br>&gt; =C2=A0rpm_macros =3D &quot;%{_usrlibrpm}/macros:%{_usrlibrp=
m}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:%{_etcrpm}/macros.*:%{_=
etcrpm}/macros:%{_etcrpm}/%{_target}/macros:~/.oerpmmacros&quot;<br>
&gt; =C2=A0rpm_macros_virtclass-native =3D &quot;%{_usrlibrpm}/macros:%{_us=
rlibrpm}/poky/macros:%{_usrlibrpm}/poky/%{_target}/macros:~/.oerpmmacros&qu=
ot;<br>&gt;<br>&gt; -# Configure values taken from rpm.spec<br>&gt; -WITH_B=
ZIP2 =3D &quot;--with-bzip2&quot;<br>
&gt; +# sqlite lua tcl augeas nss gcrypt neon xz xar keyutils perl selinux<=
br>&gt;<br>&gt; -WITH_XZ =3D &quot;--with-xz=3Dnone&quot;<br>&gt; +# Note: =
perl and sqlite w/o db specified does not currently work.<br>&gt; +# =C2=A0=
 =C2=A0 =C2=A0 tcl, augeas, nss, gcrypt, xar and keyutils support is untest=
ed.<br>
&gt; +PACKAGECONFIG_virtclass-native ??=3D &quot;db bzip2 zlib beecrypt ope=
nssl libelf python&quot;<br>&gt; +PACKAGECONFIG ??=3D &quot;db bzip2 zlib b=
eecrypt openssl libelf python&quot;<br>&gt;<br>&gt; -WITH_Z =3D &quot;--wit=
h-zlib $WITH_BZIP2 $WITH_XZ&quot;<br>
&gt; +PACKAGECONFIG[bzip2] =3D &quot;--with-bzip2,--without-bzip2,bzip2,&qu=
ot;<br>&gt; +PACKAGECONFIG[xz] =3D &quot;--with-xz,--without-xz,xz,&quot;<b=
r>&gt; +PACKAGECONFIG[zlib] =3D &quot;--with-zlib,--without-zlib,zlib,&quot=
;<br>
&gt; +PACKAGECONFIG[xar] =3D &quot;--with-xar,--without-xar,xar,&quot;<br>&=
gt;<br>&gt; -WITH_PYTHON =3D &quot; =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-pytho=
n=3D${PYTHON_BASEVERSION} \<br>&gt; +WITH_PYTHON =3D &quot; --with-python=
=3D${PYTHON_BASEVERSION} \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-python-i=
nc-dir=3D${STAGING_INCDIR}/python${PYTHON_BASEVERSION} \<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-python-lib-dir=3D${libd=
ir}/python${PYTHON_BASEVERSION} \<br>&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 --without-pythonembed \<br>
&gt; - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>&gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-pythonembed&quot;<br>&g=
t; +PACKAGECONFIG[python] =3D &quot;${WITH_PYTHON},--without-python,python,=
&quot;<br>&gt;<br>&gt; =C2=A0# Perl modules are not built, but they could b=
e enabled fairly easily<br>
&gt; =C2=A0# the perl module creation and installation would need to be pat=
ched.<br>&gt; =C2=A0# (currently has host perl contamination issues)<br>&gt=
; -#WITH_PERL =3D &quot; --with-perl --without-perlembed&quot;<br>&gt; -WIT=
H_PERL =3D &quot; =C2=A0--without-perl --without-perl-urpm&quot;<br>
&gt; +WITH_PERL =3D &quot;--with-perl --without-perlembed --without-perl-ur=
pm&quot;<br>&gt; +WITHOUT_PERL =3D &quot;--without-perl --without-perl-urpm=
&quot;<br>&gt; +PACKAGECONFIG[perl] =3D &quot;${WITH_PERL},${WITHOUT_PERL},=
perl,&quot;<br>
&gt;<br>&gt; -WITH_PERL_virtclass-native =3D &quot; --without-perl --withou=
t-perl-urpm&quot;<br>&gt; +# The --with-dbsql will only tell RPM to check f=
or support, db<br>&gt; +# may or may not be built w/ the dbsql support.<br>
&gt; +WITH_DB =3D &quot;--with-db --with-dbsql --without-db-tools-integrate=
d&quot;<br>&gt; +PACKAGECONFIG[db] =3D &quot;${WITH_DB},--without-db,db,&qu=
ot;<br>&gt;<br>&gt; -WITH_DB =3D &quot;--with-db --with-dbsql --without-db-=
tools-integrated --without-sqlite&quot;<br>
&gt; +PACKAGECONFIG[sqlite] =3D &quot;--with-sqlite,--without-sqlite,sqlite=
3,&quot;<br>&gt;<br>&gt; -WITH_CRYPTO =3D &quot;--with-beecrypt --with-open=
ssl --without-nss --without-gcrypt&quot;<br>&gt; +PACKAGECONFIG[beecrypt] =
=3D &quot;--with-beecrypt,--without-beecrypt,beecrypt,&quot;<br>
&gt; +PACKAGECONFIG[openssl] =3D &quot;--with-openssl,--without-openssl,ope=
nssl,&quot;<br>&gt; +PACKAGECONFIG[nss] =3D &quot;--with-nss,--without-nss,=
nss,&quot;<br>&gt; +PACKAGECONFIG[gcrypt] =3D &quot;--with-gcrypt,--without=
-gcrypt,gcrypt,&quot;<br>
&gt; +PACKAGECONFIG[keyutils] =3D &quot;--with-keyutils,--without-keyutils,=
keyutils,&quot;<br>&gt; +PACKAGECONFIG[libelf] =3D &quot;--with-libelf,--wi=
thout-libelf,elfutils,&quot;<br>&gt;<br>&gt; -WITH_KEYUTILS =3D &quot;--wit=
hout-keyutils&quot;<br>
&gt; -WITH_LIBELF =3D &quot;--with-libelf&quot;<br>&gt; -WITH_SELINUX =3D--=
<br>&gt; 1.7.3.4<br>&gt;<br>&gt;<br>&gt; __________________________________=
_____________<br>&gt; Openembedded-core mailing list<br>&gt; <a href=3D"mai=
lto:Openembedded-core@lists.openembedded.org">Openembedded-core@lists.opene=
mbedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--bcaec52c6a87947caa04c237b48a--
