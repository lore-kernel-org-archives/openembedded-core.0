Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mpnorman@gmail.com>) id 1SLvPW-0002Qe-TC
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 13:56:58 +0200
Received: by wera1 with SMTP id a1so7023945wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GWnWnKvXrvLbaZg3k+dPlg4VqOcxe46HoaGeqcUJpPM=;
	b=TaRSDrJ53l5sdG/Nk+k+NnX7M+IGLgkGHhEhkocKpOBRZHzEb68p5i1d1WuRBtyAMB
	Xa17N3CokQEd4TsYA5TY5Z2Xhf6xZx6xzCmPYAKOuPL5ieilflu2lWK3SZ5os/jN6CYA
	yiz8IyAEMWh4Mb0iHWgSOGCRNiOnaP60t9UQthMwmi88Gv7dq/C5aiKT2rRSmkldZ2/Y
	MYf1Lge8IPwwJ7bDXTVsD6Ez0sFcuOtjXRPnU8nNicr8/zIAK0KVHbb5FsliZhl0+KCu
	KBuZql/n91jahCGCykreAlghmlknD1ufNKeqb0yU43DOCEr9PZOS8tJDynv7XSJ9ix4K
	DAMA==
MIME-Version: 1.0
Received: by 10.180.98.8 with SMTP id ee8mr12829433wib.14.1335095247064; Sun,
	22 Apr 2012 04:47:27 -0700 (PDT)
Received: by 10.216.193.82 with HTTP; Sun, 22 Apr 2012 04:47:27 -0700 (PDT)
In-Reply-To: <CAJtrzLNJgu-Joix2YMbeZEjm1=Ktap80i4N0OsjFZsCHDmmOSg@mail.gmail.com>
References: <CAJtrzLNJgu-Joix2YMbeZEjm1=Ktap80i4N0OsjFZsCHDmmOSg@mail.gmail.com>
Date: Sun, 22 Apr 2012 21:17:27 +0930
Message-ID: <CAJtrzLMRLjgiP82w-=bg4wmtiwiRpkv3Q+sh006YG-ZO4vND4w@mail.gmail.com>
From: Mark Norman <mpnorman@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: uclibc SDK not including libpthread_nonshared.a
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
X-List-Received-Date: Sun, 22 Apr 2012 11:56:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

I have experienced some issues building external code using an oe-core
built SDK. =A0I can get code to compile fine but when linking it
complains about missing libpthread_nonshared.a or uclibc_nonshared.a.
Neither library is included in the SDK directory. =A0I noticed that
uclibc.inc
attempts to include these two libraries into the -dev package (from
meta/recipes-core/uclibc/uclibc.inc):

FILES_${PN}-dev_append =3D "\
=A0 =A0 =A0 =A0${libdir}/lib*.so \
=A0 =A0 =A0 =A0${libdir}/*_nonshared.a \ =A0 =A0 =A0<---- Note
=A0 =A0 =A0 =A0${libdir}/[S]*crt[1in].o \
=A0 =A0 =A0 =A0${libdir}/crtreloc*.o \
=A0 =A0 =A0 =A0${includedir}/*.h ${includedir}/*/*.h \
=A0 =A0 =A0 "

However, the two _nonshared.a libraries end up getting packaged in the
-staticdev package. =A0I think this is because the -staticdev package
gets processed before the -dev package (as defined in
meta/conf/bitbake.conf). =A0The eglibc-package.inc also tries to package
the _nonshared.a libraries into the -dev package but I did notice that
the eglibc PACKAGES argument explicitly lists the -dev package before
-staticdev. =A0I tried the same thing in uclibc.inc eg:

--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -48,9 +48,7 @@ RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"

=A0INHIBIT_DEFAULT_DEPS =3D "1"

-PACKAGES =3D+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv
uclibc-thread-db uclibc-argp uclibc-backtrace"
-PACKAGES =3D+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl
uclibc-libresolv uclibc-libm"
-PACKAGES =3D+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt"
+PACKAGES =3D "${PN}-dbg ${PN} ldd ${PN}-utils ${PN}-utils-dbg
uclibc-thread-db uclibc-gconv ${PN}-dev ${PN}-staticdev ${PN}-doc
uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl
uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil
uclibc-libpthread uclibc-librt"


Doing this caused the _nonshared.a libraries to successfully get
packaged in the -dev package.

Is this the correct way to get this to work? =A0If so I am happy to
submit a proper patch, otherwise is there something else I am missing?

Kind Regards

Mark Norman


