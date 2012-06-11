Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8bh-0008MI-Ab
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:40:49 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:29:57 -0700
Received: by lbbgh12 with SMTP id gh12so2560889lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=p03ayvgzh7qwvwvFOO8986Qp2BotgEBiWrFSS+41B1U=;
	b=IygubM7ab5PUNrRTXVnjnMn1eDKA2/eqvgxBN4JFB/8muT4msZFv2fDoiS5QrDPZ1T
	0Pfpg/NZUtvFzJI4I6iVZ1eEW+uO18Xyp9mde8qFpkfrrB+qhq9B3icPHuJmtROXM7/H
	kU17RkyHYlHH0hEwhmGEuI/J27+z3vz0XqJmRsC8eN9U5/0pFpalBymaSb/QT5ZygCuI
	rjEmltI/1V3j7NPWMsgw8OznZ+xNSoX9sWiObXXENG/QcwcLIY/cb56cW1V6BPhbGlRv
	nOMm1nMMYy7l/YD5oPKaOA3ZMAPK1rVHQDRNir6s1BgbR+EfEou1+ZhwuzXmpEKuMMqy
	KcRw==
MIME-Version: 1.0
Received: by 10.112.100.234 with SMTP id fb10mr3585859lbb.12.1339435795901;
	Mon, 11 Jun 2012 10:29:55 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:29:55 -0700 (PDT)
In-Reply-To: <1338886574-19330-1-git-send-email-schnitzeltony@googlemail.com>
References: <1338886574-19330-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 11 Jun 2012 10:29:55 -0700
Message-ID: <CAPhnLPAiJO3WTvKKGG0TmgLkPEf8TNvLRPPrm+69C_P6=j1NpQ@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnDi9U0Hq2P877+ocsrkcqSPIyA8LiTKWXv1y6M9TViZe005vDvN5JOluZGoXu+tbiB7f2W
Subject: Re: [PATCH] systemtap: Unbreak build for systems with nss headers installed
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
X-List-Received-Date: Mon, 11 Jun 2012 17:40:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 5, 2012 at 1:56 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> * discussed on [1]
> * patch sent to systemtap [2]
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-June/0233=
77.html
> [2] http://sourceware.org/ml/systemtap/2012-q2/msg00202.html
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
> =A0...prun-configure.ac-support-without-nss-for.patch | =A0 50 ++++++++++=
++++++++++
> =A0meta/recipes-kernel/systemtap/systemtap_git.bb =A0 =A0 | =A0 10 +---
> =A0meta/recipes-kernel/systemtap/systemtap_git.inc =A0 =A0| =A0 =A01 +
> =A03 files changed, 54 insertions(+), 7 deletions(-)
> =A0create mode 100644 meta/recipes-kernel/systemtap/systemtap/runtime-sta=
prun-configure.ac-support-without-nss-for.patch
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-conf=
igure.ac-support-without-nss-for.patch b/meta/recipes-kernel/systemtap/syst=
emtap/runtime-staprun-configure.ac-support-without-nss-for.patch
> new file mode 100644
> index 0000000..fbe7b70
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.a=
c-support-without-nss-for.patch
> @@ -0,0 +1,50 @@
> +From fa81ccd4f92e5cb15a11a81a7e656bfe01745afb Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Tue, 5 Jun 2012 10:22:23 +0200
> +Subject: [PATCH] runtime/staprun/configure.ac: support --without-nss for
> + staprun
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream status: pending
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + runtime/staprun/configure.ac | =A0 20 +++++++++++++++-----
> + 1 files changed, 15 insertions(+), 5 deletions(-)
> +
> +diff --git a/runtime/staprun/configure.ac b/runtime/staprun/configure.ac
> +index 8fd1b42..7b05f73 100644
> +--- a/runtime/staprun/configure.ac
> ++++ b/runtime/staprun/configure.ac
> +@@ -67,11 +67,21 @@ AS_IF([test "x$enable_sdt_probes" !=3D xno], [
> + =A0 =A0 =A0 =A0 =A0 =A0 [Define to 1 to enable process.mark probes in s=
taprun, stapio.])
> + ])
> +
> +-PKG_CHECK_MODULES([nss], [nss >=3D 3], [have_nss=3Dyes], [have_nss=3Dno=
])
> +-AM_CONDITIONAL([HAVE_NSS], [test $have_nss =3D yes])
> +-AS_IF([test $have_nss =3D yes], [
> +- =A0AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss librari=
es.])
> +-])
> ++dnl See if we have the nss/nspr headers and libraries
> ++AC_ARG_WITH([nss],
> ++ =A0AS_HELP_STRING([--without-nss],
> ++ =A0 =A0[Do not use NSS even if present]))
> ++
> ++AS_IF([test "x$with_nss" !=3D "xno"], [
> ++ =A0PKG_CHECK_MODULES([nss], [nss >=3D 3],
> ++ =A0 =A0[have_nss=3Dyes
> ++ =A0 =A0 AC_DEFINE([HAVE_NSS], [1], [Define to 1 if you have the nss li=
braries.])
> ++ =A0 =A0], [have_nss=3Dno])
> ++], [have_nss=3Dno])
> ++
> ++AM_CONDITIONAL([HAVE_NSS], [test "${have_nss}" =3D "yes"])
> ++
> ++
> + AC_ARG_ENABLE([nls], [AS_HELP_STRING([--enable-nls], [enable translatin=
g program messages])])
> + AS_IF([test "x$enable_nls" !=3D xno], [
> + AC_DEFINE([ENABLE_NLS], [1], [Define to 1 if program messages should be=
 translated.])
> +--
> +1.7.6.5
> +
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_git.bb
> index 4d340fc..7ed5fcd 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -6,19 +6,15 @@ DEPENDS =3D "elfutils sqlite3 systemtap-native"
> =A0DEPENDS_virtclass-native =3D "elfutils-native sqlite3-native gettext-n=
ative"
> =A0DEPENDS_virtclass-nativesdk =3D "elfutils-nativesdk sqlite3-nativesdk =
gettext-nativesdk"
>
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0export CC_FOR_BUILD =3D "${BUILD_CC}"
> =A0export CFLAGS_FOR_BUILD =3D "${BUILD_CFLAGS}"
> =A0export LDFLAGS_FOR_BUILD =3D "${BUILD_LDFLAGS}"
>
> =A0EXTRA_OECONF +=3D "--with-libelf=3D${STAGING_DIR_TARGET} --without-rpm=
 \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nss=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nss3=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nspr=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_nspr4=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_avahi_client=3Dno \
> - =A0 =A0 =A0 =A0 =A0 =A0ac_cv_file__usr_include_avahi_common=3Dno "
> + =A0 =A0 =A0 =A0 =A0 =A0--without-nss --without-avahi \
> + =A0 =A0 =A0 =A0 =A0 =A0--disable-server --disable-grapher "
>
> =A0STAP_DOCS ?=3D "--disable-docs --disable-publican --disable-refdocs"
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recip=
es-kernel/systemtap/systemtap_git.inc
> index 9f4feee..5f2987b 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.inc
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
> @@ -7,6 +7,7 @@ PV =3D "1.7+git${SRCPV}"
> =A0SRC_URI =3D "git://sources.redhat.com/git/systemtap.git;protocol=3Dgit=
 \
> =A0 =A0 =A0 =A0 =A0 =A0file://docproc-build-fix.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://systemtap_fix_for_automake_1.12.patch \
> + =A0 =A0 =A0 =A0 =A0 file://runtime-staprun-configure.ac-support-without=
-nss-for.patch \
> =A0 =A0 =A0 =A0 =A0 "
>
> =A0FILESPATH =3D "${FILE_DIRNAME}/systemtap"
> --
> 1.7.6.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Merged into OE-Core

Thanks

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


