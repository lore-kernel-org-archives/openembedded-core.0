Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Sbha1-0007yt-CC
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 02:25:01 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 04 Jun 2012 17:14:34 -0700
Received: by lahj13 with SMTP id j13so3006921lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 17:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=NkIBwZEoSuws01xW3zGGS6pcKhVHPR0r90DHKyrdtxo=;
	b=lVxxWYxdvCxBgwHh/ENr2GdDseOp9zKL5cI25VrTaElRlrHl4mcf8pjBikw/Vp4ceg
	UMfT/fqmKYJq6d1mqJg2tSKcTkf/zrYkATW46hiAoJEyczuGlLbFl5tGKCkdkQyxZi3W
	/5wtQSxCPVy+PyMtVToB0nRGmrLEGkI7QzkeNwEf72izPgstGVURbJRuLdgdXjIs4hfu
	qJLSyMp90YXjAFx+8WNK94HjuCFrZg8DP7p5bxhni6zyuFj0kyrxt/a4P71z9w0LifwZ
	tFkGDzw0wP94M4GSw7quiArnha5hUJ3dKIHBmFU5V+izLIvhn7ULzj3opB7kE2IiOknp
	ot4g==
MIME-Version: 1.0
Received: by 10.152.125.236 with SMTP id mt12mr14613166lab.12.1338855272202;
	Mon, 04 Jun 2012 17:14:32 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 4 Jun 2012 17:14:32 -0700 (PDT)
In-Reply-To: <07f0f1b217f7a2c160665f029398669e8dcd5cdc.1338848379.git.raj.khem@gmail.com>
References: <cover.1338848379.git.raj.khem@gmail.com>
	<07f0f1b217f7a2c160665f029398669e8dcd5cdc.1338848379.git.raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 17:14:32 -0700
Message-ID: <CAPhnLPDWg5wuj7a_wcGdfHNtu24VpM+Bk-3Kxeiqk+f2q_-PUA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnTNNbfs89Q2/IePgVwRMuPgyAC8W9YZrsne7MBuyjtVIpVJh29IdaIncTIZUxDHmz8KVEB
Subject: Re: [PATCH 2/7] rpm: Fix compilation on uclibc
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
X-List-Received-Date: Tue, 05 Jun 2012 00:25:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 4, 2012 at 3:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> rpmatch is not there in uclibc therefore add logic to configure
> to detect it.
>
> x* wrappers need to be defined for uclibc as well.

Khem,

This patch set (07f0f1b217f7a2c1) will fail when Mark's recent rpm
upgrades are pulled. You may want to pull in Mark's upgrades here and
base your patch on that.
http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dmhatle/rpm

-b

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0meta/recipes-devtools/rpm/rpm/rpmatch.patch =A0 =A0 =A0 =A0| =A0 42 ++=
++++++++++
> =A0meta/recipes-devtools/rpm/rpm/uclibc-support.patch | =A0 69 ++++++++++=
++++++++++
> =A0meta/recipes-devtools/rpm/rpm_5.4.0.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A04 +-
> =A03 files changed, 114 insertions(+), 1 deletions(-)
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpmatch.patch
> =A0create mode 100644 meta/recipes-devtools/rpm/rpm/uclibc-support.patch
>
> diff --git a/meta/recipes-devtools/rpm/rpm/rpmatch.patch b/meta/recipes-d=
evtools/rpm/rpm/rpmatch.patch
> new file mode 100644
> index 0000000..8ea3490
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/rpmatch.patch
> @@ -0,0 +1,42 @@
> +Add configure check for rpmatch() and
> +creates a compatable macro if it is not provided by the C library.
> +
> +This is needed for uclibc since it does not have the above function
> +implemented.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: rpm-5.4.0/configure.ac
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rpm-5.4.0.orig/configure.ac =A0 =A0 =A0 =A02012-05-31 15:40:05.98599=
0822 -0700
> ++++ rpm-5.4.0/configure.ac =A0 =A0 2012-05-31 15:41:15.601995311 -0700
> +@@ -800,7 +800,7 @@
> + =A0 =A0 ftok getaddrinfo getattrlist getcwd getdelim getline getmode ge=
tnameinfo dnl
> + =A0 =A0 getpassphrase getxattr getwd iconv inet_aton lchflags lchmod lc=
hown dnl
> + =A0 =A0 lgetxattr lsetxattr lutimes madvise mempcpy mkdtemp mkstemp mtr=
ace dnl
> +- =A0 =A0posix_fadvise posix_fallocate putenv realpath regcomp __secure_=
getenv dnl
> ++ =A0 =A0posix_fadvise posix_fallocate putenv realpath regcomp rpmatch _=
_secure_getenv dnl
> + =A0 =A0 setattrlist setenv setlocale setmode setxattr dnl
> + =A0 =A0 sigaddset sigdelset sigemptyset sighold sigrelse sigpause dnl
> + =A0 =A0 sigprocmask sigsuspend sigaction dnl
> +Index: rpm-5.4.0/system.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rpm-5.4.0.orig/system.h =A0 =A02012-05-31 15:40:05.997991504 -0700
> ++++ rpm-5.4.0/system.h 2012-05-31 15:42:04.941997731 -0700
> +@@ -410,6 +410,14 @@
> + #endif /* defined(__GNUC__) */
> + #endif =A0 =A0 =A0 =A0/* HAVE_MCHECK_H */
> +
> ++#ifndef HAVE_RPMATCH
> ++#define rpmatch(line) \
> ++ =A0 =A0 =A0( (line =3D=3D NULL)? -1 : \
> ++ =A0 =A0 =A0 =A0(*line =3D=3D 'y' || *line =3D=3D 'Y')? 1 : \
> ++ =A0 =A0 =A0 =A0(*line =3D=3D 'n' || *line =3D=3D 'N')? 0 : \
> ++ =A0 =A0 =A0 =A0-1 )
> ++#endif
> ++
> + /* Retrofit glibc __progname */
> + #if defined __GLIBC__ && __GLIBC__ >=3D 2
> + #if __GLIBC_MINOR__ >=3D 1
> diff --git a/meta/recipes-devtools/rpm/rpm/uclibc-support.patch b/meta/re=
cipes-devtools/rpm/rpm/uclibc-support.patch
> new file mode 100644
> index 0000000..f863669
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/rpm/uclibc-support.patch
> @@ -0,0 +1,69 @@
> +Define the x* wrappers for uclibc as well
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Index: rpm-5.4.0/rpmio/rpmio.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rpm-5.4.0.orig/rpmio/rpmio.h =A0 =A0 =A0 2010-09-29 07:54:30.0000000=
00 -0700
> ++++ rpm-5.4.0/rpmio/rpmio.h =A0 =A02012-05-31 16:05:26.042065540 -0700
> +@@ -23,7 +23,8 @@
> + =A0*/
> + /*@{*/
> + #if !defined(__LCLINT__) && !defined(__UCLIBC__) && defined(__GLIBC__) =
&& \
> +- =A0 =A0 =A0(__GLIBC__ > 2 || (__GLIBC__ =3D=3D 2 && __GLIBC_MINOR__ >=
=3D 2))
> ++ =A0 =A0 =A0(__GLIBC__ > 2 || (__GLIBC__ =3D=3D 2 && __GLIBC_MINOR__ >=
=3D 2)) && \
> ++ =A0 =A0 =A0!defined(__UCLIBC__)
> + #define USE_COOKIE_SEEK_POINTER 1
> + typedef _IO_off64_t =A0 _libio_off_t;
> + typedef _libio_off_t * =A0 =A0 =A0 =A0_libio_pos_t;
> +Index: rpm-5.4.0/system.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rpm-5.4.0.orig/system.h =A0 =A02010-09-27 14:24:39.000000000 -0700
> ++++ rpm-5.4.0/system.h 2012-05-31 16:08:07.334073348 -0700
> +@@ -402,12 +402,12 @@
> + #endif /* defined(__LCLINT__) */
> +
> + /* Memory allocation via macro defs to get meaningful locations from mt=
race() */
> +-#if defined(__GNUC__)
> ++#if defined(__GNUC__) || defined(__UCLIBC__)
> + #define =A0 =A0 =A0 xmalloc(_size) =A0 =A0 =A0 =A0 =A0(malloc(_size) ? =
: vmefail(_size))
> + #define =A0 =A0 =A0 xcalloc(_nmemb, _size) =A0(calloc((_nmemb), (_size)=
) ? : vmefail(_size))
> + #define =A0 =A0 =A0 xrealloc(_ptr, _size) =A0 (realloc((_ptr), (_size))=
 ? : vmefail(_size))
> + #define =A0 =A0 =A0 xstrdup(_str) =A0 (strcpy((malloc(strlen(_str)+1) ?=
 : vmefail(strlen(_str)+1)), (_str)))
> +-#endif =A0 =A0 =A0 =A0/* defined(__GNUC__) */
> ++#endif /* defined(__GNUC__) */
> + #endif =A0 =A0 =A0 =A0/* HAVE_MCHECK_H */
> +
> + /* Retrofit glibc __progname */
> +Index: rpm-5.4.0/lib/librpm.vers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rpm-5.4.0.orig/lib/librpm.vers =A0 =A0 2010-09-27 16:12:48.000000000=
 -0700
> ++++ rpm-5.4.0/lib/librpm.vers =A02012-05-31 16:05:26.042065540 -0700
> +@@ -405,6 +405,10 @@
> + =A0 =A0 specedit;
> + =A0 =A0 strict_erasures;
> + =A0 =A0 XrpmtsiInit;
> ++ =A0 =A0xmalloc;
> ++ =A0 =A0xrealloc;
> ++ =A0 =A0xcalloc;
> ++ =A0 =A0xstrdup;
> + =A0 local:
> + =A0 =A0 *;
> + };
> +Index: rpm-5.4.0/rpmio/librpmio.vers
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rpm-5.4.0.orig/rpmio/librpmio.vers 2012-05-31 16:13:34.034089141 -07=
00
> ++++ rpm-5.4.0/rpmio/librpmio.vers =A0 =A0 =A02012-05-31 16:13:56.5420902=
45 -0700
> +@@ -881,6 +881,10 @@
> + =A0 =A0 mongo_simple_int_command;
> + =A0 =A0 mongo_simple_str_command;
> + =A0 =A0 mongo_update;
> ++ =A0 =A0xmalloc;
> ++ =A0 =A0xrealloc;
> ++ =A0 =A0xcalloc;
> ++ =A0 =A0xstrdup;
> + =A0 local:
> + =A0 =A0 *;
> + };
> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtoo=
ls/rpm/rpm_5.4.0.bb
> index 43999e5..f4938fd 100644
> --- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> +++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
> @@ -45,7 +45,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2d5025d4=
aa3495befef8f17206a5b0a1"
> =A0DEPENDS =3D "bzip2 zlib db openssl elfutils expat libpcre attr acl pop=
t ${extrarpmdeps}"
> =A0extrarpmdeps =3D "python perl file"
> =A0extrarpmdeps_virtclass-native =3D "python-native file-native"
> -PR =3D "r38"
> +PR =3D "r39"
>
> =A0# rpm2cpio is a shell script, which is part of the rpm src.rpm. =A0It =
is needed
> =A0# in order to extract the distribution SRPM into a format we can extra=
ct...
> @@ -72,6 +72,8 @@ SRC_URI =3D "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-=
5.4.0-0.20101229.src.rpm;ex
> =A0 =A0 =A0 =A0 =A0 file://rpm-resolvedep.patch \
> =A0 =A0 =A0 =A0 =A0 file://rpm-respect-arch.patch \
> =A0 =A0 =A0 =A0 =A0 file://rpm_fix_for_automake-1.12.patch \
> + =A0 =A0 =A0 =A0 =A0file://uclibc-support.patch \
> + =A0 =A0 =A0 =A0 =A0file://rpmatch.patch \
> =A0 =A0 =A0 =A0 =A0"
>
> =A0# =A0 =A0 =A0 =A0 file://rpm-autoconf.patch \
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


