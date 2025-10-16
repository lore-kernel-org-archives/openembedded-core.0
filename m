Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40932CCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 16:01:58 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.1175.1760630516397431002
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 09:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UiAYKNDS;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b4539dddd99so161975566b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 09:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760630515; x=1761235315; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J7bmaLqhK4qKYH11EzeoViBRjwto9+EBr1qfUsPgxhk=;
        b=UiAYKNDS4o+qmtt+CCDIj+cSn0UScLazuc6rVT9v4Mb0u8AfAU+nrhrgjVm2rknxsc
         eyRcu9rirfRfpi1JX/TG+Cb5X+BFhZu6VKbeWW7uhUgkRLq5o67gwk3Qm4YJtfYly8YZ
         kg/M7etH+6bTs9ygFfTfQy6n0sDFs5VkaP0KfRDpZFcaTjfBgjnVR03xeseW8pTeeh+S
         OwR6fFE+csvAgriXXdrlFK2Q3pT2b7cB03nIL3rw2l6YuTER4BU6nqnP8oh+AeS+LKdq
         8c2RT2/yitpdyxHydpfG+3xgoY5x/dr86HriFE1OCOeJSTwSFSfPOl3fNma/n3InJSyi
         Ywjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630515; x=1761235315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J7bmaLqhK4qKYH11EzeoViBRjwto9+EBr1qfUsPgxhk=;
        b=v7Y2DUpmGneukkohsXMTLZteZoQaXUfFwCZowKCuefaCdoFuYTjTaR+N6xJ4DMXfxN
         5u8rj8zFRyhqcefWkq8hEZv3qRUBvkwEvSS9GhHMeNjCTVn/tQqwQSv9u2d9ERr80Ana
         pcXxf/N2P8oSNWRxbZtTZApH8zqwVY9gLQ5KRTDU2PgmDllZAIj3jSam/6JzXX0Y1+R4
         fEJNi2qP5pXpkIxnIre7aCIK/pjwMyGYyMuThdFTmz4j/YE6uykHa4z5Bem+KyKSLHpC
         KFaoCJ9SxOXENPBDgjm25Llye1vip51WGmJOiDXqTyF/232KIbLepHeBd95jXdo53uHJ
         Ec8g==
X-Gm-Message-State: AOJu0Yz9DdBVUskZj2WF3O+UltVFSpK8yZ6mSZ7iofWKUqP853D4NZ9A
	L+ydFfys9MzH8QewFGk3sqCQ8cZ+t2IQqkZieriqYa6gz5fL1J+zbPGdmoMyE0WEUNLy3gxwRQ+
	DRuoKGtcYAyBdFmgGA8EPQLaMSs9IW2g=
X-Gm-Gg: ASbGncuG1SigaUn1bt9GrlNsUroJw5QYUDSzfWi+1Oa3mBo54dnMNmUpFCzdfli3PWC
	LSXz2mF4kL6NtYRL9Nc64Y3fRoAHz/MCM9N6IzLCDNkG+hhQjN0vMyrHEMz0NevHm6PERQUtLZd
	5y5O2lUk0oaY+VYY+ZcyAm9KS3cGasV3Eyfv6ypzgCptv7ye9Vt/QyPoRfdUDpf1W/aYmnx6FEN
	bmuL1mkmKnETSHgavKXd5DvPZlM4HSmuzdHoiL9Q1vruXPcDWlAJGyA0xQnTh7C8r/MUi689CYn
	sdBGy0c=
X-Google-Smtp-Source: AGHT+IEa4EH9btgyf1b6QvJzIXli0jl0eXMmClmzmfL58FgfvnrjSjohCA59YLADG1+pZ0EIBb7HDKCjEQx8nLGXbm0=
X-Received: by 2002:a17:907:940d:b0:b41:873d:e21f with SMTP id
 a640c23a62f3a-b647304ae7emr56344066b.18.1760630513717; Thu, 16 Oct 2025
 09:01:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251016111628.3050999-1-ecordonnier@snap.com>
In-Reply-To: <20251016111628.3050999-1-ecordonnier@snap.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 16 Oct 2025 17:01:42 +0100
X-Gm-Features: AS18NWBrnbSqYI9Mf1yv-oJOP-8Oe9XDZodvRGuwdLwBpgjeB9Uc-jgBPXRmrL0
Message-ID: <CANPvuRkBq+qZD+U588QWFHG60Pg24OvULjaaJJvfSCDx=RZYfw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] opkg: upgrade 0.7.0 -> 0.9.0
To: ecordonnier@snap.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000059d5ce064148bc83"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 16:01:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224975

--00000000000059d5ce064148bc83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Etienne

Can you split the patch in two commits for each version.

Etienne Cordonnier via lists.openembedded.org <ecordonnier=3D
snap.com@lists.openembedded.org> escreveu (quinta, 16/10/2025 =C3=A0(s) 12:=
18):

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> See release notes at
> - http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.release-note=
s
> - http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.release-note=
s
>
> [0.9.0] - 2025-06-27
>
> Semiannual opkg release.
> Bumping the minor version as a result of the project build tooling
> changing from autotools to cmake.
>
> - Added a Dockerfile container definition (`:docker/`) for a valid
> developer build environment for opkg.
>   - It's recommended that project contributors use this container to buil=
d
> and test their changes.
> - The AutoTools-based build framework has [been replaced](
> https://git.yoctoproject.org/opkg/commit/?id=3D3f6040e321634471ec442fb0e8=
0f140f1437e90b)
> with a more modern, CMake framework.
>   - Refer to the `docs/CONTRIBUTING.md` documentation for updated build
> instructions.
>
> [0.8.0] - 2025-01-10
>
> The minor version bump in this release is due to the changes to cURL erro=
r
> output line format.
>
> - [Changed](
> https://git.yoctoproject.org/opkg/commit/?id=3Dab03377868256427279b36c4b2=
a298edae4260b8)
> the error output for the curl download backend, to now report the HTTP
> error code for failed requests.
>   - e.g. `error: log_curl_download_error: Failed to download headers of
> https://foo.bar/all/Packages.gz: The requested URL returned error: 401`
> - Enabling debug-verbosity, while using the cURL backend, [will now](
> https://git.yoctoproject.org/opkg/commit/?id=3Dce6fede3db931bb0da70d1334c=
dc4101d0aec702)
> print cURL's verbose error log to stderr when there is a download failure=
.
>   - The verbose output may contain confidential information about your
> cURL transactions. So this is your reminder that debug-verbosity should n=
ot
> be enabled in production systems or sensitive security environments.
> - The commandline configuration file option (`-f`) [can now](
> https://git.yoctoproject.org/opkg/commit/?id=3D36d08b93d2859992b624a4ba2f=
412cfa5c766050)
> be specified multiple times, and each configuration file will be loaded a=
nd
> their settings merged.
> - [Fixed](
> https://git.yoctoproject.org/opkg/commit/?id=3Dc87188d7535684fddb8cf80993=
c147b215602b63)
> a bug in control field parsing where custom fields whose keys are similar
> to other fields could be confused by the parser.
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta/recipes-devtools/opkg/opkg/run-ptest     |  3 +--
>  .../opkg/{opkg_0.7.0.bb =3D> opkg_0.9.0.bb}     | 21 +++++++++++--------
>  2 files changed, 13 insertions(+), 11 deletions(-)
>  rename meta/recipes-devtools/opkg/{opkg_0.7.0.bb =3D> opkg_0.9.0.bb} (77=
%)
>
> diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest
> b/meta/recipes-devtools/opkg/opkg/run-ptest
> index 5fb7077eec9..8cf09adba57 100644
> --- a/meta/recipes-devtools/opkg/opkg/run-ptest
> +++ b/meta/recipes-devtools/opkg/opkg/run-ptest
> @@ -1,5 +1,4 @@
>  #!/bin/sh
>
>  OPKG_PATH=3D$(which opkg)
> -
> -make OPKG_PATH=3D$OPKG_PATH run-tests
> +make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var
> OPKG_PATH=3D$OPKG_PATH
> diff --git a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> similarity index 77%
> rename from meta/recipes-devtools/opkg/opkg_0.7.0.bb
> rename to meta/recipes-devtools/opkg/opkg_0.9.0.bb
> index 95480b47164..9fa32268541 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.7.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> @@ -18,31 +18,31 @@ SRC_URI =3D "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
>             file://run-ptest \
>             "
>
> -SRC_URI[sha256sum] =3D
> "d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee26704bf8fe757c54567"
> +SRC_URI[sha256sum] =3D
> "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
>
>  # This needs to be before ptest inherit, otherwise all ptest files end
> packaged
>  # in libopkg package if OPKGLIBDIR =3D=3D libdir, because default
>  # PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
>  PACKAGES =3D+ "libopkg"
>
> -inherit autotools pkgconfig ptest
> +inherit cmake pkgconfig ptest
>
>  target_localstatedir :=3D "${localstatedir}"
>  OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>
>  PACKAGECONFIG ??=3D "libsolv"
>
> -PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
> +PACKAGECONFIG[gpg] =3D "-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\
>      gnupg gpgme libgpg-error,\
>      ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
>      "
> -PACKAGECONFIG[curl] =3D "--enable-curl,--disable-curl,curl"
> -PACKAGECONFIG[ssl-curl] =3D "--enable-ssl-curl,--disable-ssl-curl,curl
> openssl"
> -PACKAGECONFIG[sha256] =3D "--enable-sha256,--disable-sha256"
> -PACKAGECONFIG[libsolv] =3D "--with-libsolv,--without-libsolv,libsolv"
> +PACKAGECONFIG[curl] =3D "-DWITH_CURL=3D0N,-DWITH_CURL=3DOFF,curl"
> +PACKAGECONFIG[ssl-curl] =3D "-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF,cu=
rl
> openssl"
> +PACKAGECONFIG[sha256] =3D "-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF"
> +PACKAGECONFIG[libsolv] =3D
> "-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LIBSOLV=3DOFF,libsolv"
>
> -EXTRA_OECONF =3D "--enable-zstd"

-EXTRA_OECONF:append:class-native =3D "
> --localstatedir=3D/${@os.path.relpath('${localstatedir}',
> '${STAGING_DIR_NATIVE}')} --sysconfdir=3D/${@os.path.relpath('${sysconfdi=
r}',
> '${STAGING_DIR_NATIVE}')}"
> +EXTRA_OECMAKE =3D "-DWITH_ZSTD=3DON"
>

I wonder if we shouldn't also disable the XZ which is enabled by default
and we don't use it.

Jose


> +EXTRA_OECMAKE:append:class-native =3D "
> -DVARDIR=3D/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}=
')}
> -DSYSCONFDIR=3D/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE=
}')}"
>
>  do_install:append () {
>         install -d ${D}${sysconfdir}/opkg
> @@ -56,6 +56,9 @@ do_install:append () {
>  }
>
>  do_install_ptest () {
> +       # the ptest class uses a Makefile for installation, but cmake use=
s
> Ninja per default so we need to install ptests manually:
> +       cp -r ${S}/tests ${D}${PTEST_PATH}
> +
>         sed -i -e '/@echo $^/d' ${D}${PTEST_PATH}/tests/Makefile
>         sed -i -e '/@PYTHONPATH=3D. $(PYTHON) $^/a\\t@if [ "$$?" !=3D "0"
> ];then echo "FAIL:"$^;else echo "PASS:"$^;fi'
> ${D}${PTEST_PATH}/tests/Makefile
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224962):
> https://lists.openembedded.org/g/openembedded-core/message/224962
> Mute This Topic: https://lists.openembedded.org/mt/115787032/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000059d5ce064148bc83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span style=3D"color:rgb=
(0,0,0)">Hi Etienne</span></div><div><br></div>Can you split the patch in t=
wo commits for each version.<div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Etienne Cordonnier via <a href=3D"http://lists.o=
penembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;ecordonni=
er=3D<a href=3D"mailto:snap.com@lists.openembedded.org" target=3D"_blank">s=
nap.com@lists.openembedded.org</a>&gt; escreveu (quinta, 16/10/2025 =C3=A0(=
s) 12:18):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:=
 Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" target=3D"_=
blank">ecordonnier@snap.com</a>&gt;<br>
<br>
See release notes at<br>
- <a href=3D"http://downloads.yoctoproject.org/releases/opkg/opkg-0.9.0.rel=
ease-notes" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproj=
ect.org/releases/opkg/opkg-0.9.0.release-notes</a><br>
- <a href=3D"http://downloads.yoctoproject.org/releases/opkg/opkg-0.8.0.rel=
ease-notes" rel=3D"noreferrer" target=3D"_blank">http://downloads.yoctoproj=
ect.org/releases/opkg/opkg-0.8.0.release-notes</a><br>
<br>
[0.9.0] - 2025-06-27<br>
<br>
Semiannual opkg release.<br>
Bumping the minor version as a result of the project build tooling changing=
 from autotools to cmake.<br>
<br>
- Added a Dockerfile container definition (`:docker/`) for a valid develope=
r build environment for opkg.<br>
=C2=A0 - It&#39;s recommended that project contributors use this container =
to build and test their changes.<br>
- The AutoTools-based build framework has [been replaced](<a href=3D"https:=
//git.yoctoproject.org/opkg/commit/?id=3D3f6040e321634471ec442fb0e80f140f14=
37e90b" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/o=
pkg/commit/?id=3D3f6040e321634471ec442fb0e80f140f1437e90b</a>) with a more =
modern, CMake framework.<br>
=C2=A0 - Refer to the `docs/CONTRIBUTING.md` documentation for updated buil=
d instructions.<br>
<br>
[0.8.0] - 2025-01-10<br>
<br>
The minor version bump in this release is due to the changes to cURL error =
output line format.<br>
<br>
- [Changed](<a href=3D"https://git.yoctoproject.org/opkg/commit/?id=3Dab033=
77868256427279b36c4b2a298edae4260b8" rel=3D"noreferrer" target=3D"_blank">h=
ttps://git.yoctoproject.org/opkg/commit/?id=3Dab03377868256427279b36c4b2a29=
8edae4260b8</a>) the error output for the curl download backend, to now rep=
ort the HTTP error code for failed requests.<br>
=C2=A0 - e.g. `error: log_curl_download_error: Failed to download headers o=
f <a href=3D"https://foo.bar/all/Packages.gz" rel=3D"noreferrer" target=3D"=
_blank">https://foo.bar/all/Packages.gz</a>: The requested URL returned err=
or: 401`<br>
- Enabling debug-verbosity, while using the cURL backend, [will now](<a hre=
f=3D"https://git.yoctoproject.org/opkg/commit/?id=3Dce6fede3db931bb0da70d13=
34cdc4101d0aec702" rel=3D"noreferrer" target=3D"_blank">https://git.yoctopr=
oject.org/opkg/commit/?id=3Dce6fede3db931bb0da70d1334cdc4101d0aec702</a>) p=
rint cURL&#39;s verbose error log to stderr when there is a download failur=
e.<br>
=C2=A0 - The verbose output may contain confidential information about your=
 cURL transactions. So this is your reminder that debug-verbosity should no=
t be enabled in production systems or sensitive security environments.<br>
- The commandline configuration file option (`-f`) [can now](<a href=3D"htt=
ps://git.yoctoproject.org/opkg/commit/?id=3D36d08b93d2859992b624a4ba2f412cf=
a5c766050" rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.or=
g/opkg/commit/?id=3D36d08b93d2859992b624a4ba2f412cfa5c766050</a>) be specif=
ied multiple times, and each configuration file will be loaded and their se=
ttings merged.<br>
- [Fixed](<a href=3D"https://git.yoctoproject.org/opkg/commit/?id=3Dc87188d=
7535684fddb8cf80993c147b215602b63" rel=3D"noreferrer" target=3D"_blank">htt=
ps://git.yoctoproject.org/opkg/commit/?id=3Dc87188d7535684fddb8cf80993c147b=
215602b63</a>) a bug in control field parsing where custom fields whose key=
s are similar to other fields could be confused by the parser.<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/opkg/run-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
3 +--<br>
=C2=A0.../opkg/{<a href=3D"http://opkg_0.7.0.bb" rel=3D"noreferrer" target=
=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"http://opkg_0.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=C2=A0 =C2=A0 =C2=A0| 2=
1 +++++++++++--------<br>
=C2=A02 files changed, 13 insertions(+), 11 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/opkg/{<a href=3D"http://opkg_0.7.0.bb" r=
el=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> =3D&gt; <a href=3D"ht=
tp://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a>}=
 (77%)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/run-ptest b/meta/recipes-devto=
ols/opkg/opkg/run-ptest<br>
index 5fb7077eec9..8cf09adba57 100644<br>
--- a/meta/recipes-devtools/opkg/opkg/run-ptest<br>
+++ b/meta/recipes-devtools/opkg/opkg/run-ptest<br>
@@ -1,5 +1,4 @@<br>
=C2=A0#!/bin/sh<br>
<br>
=C2=A0OPKG_PATH=3D$(which opkg)<br>
-<br>
-make OPKG_PATH=3D$OPKG_PATH run-tests<br>
+make -C tests DATADIR=3D/share SYSCONFDIR=3D/etc VARDIR=3D/var OPKG_PATH=
=3D$OPKG_PATH<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.9.0.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
rename to meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
index 95480b47164..9fa32268541 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.7.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.7.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
@@ -18,31 +18,31 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproj=
ect.org/releases/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer"=
 target=3D"_blank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}=
-${PV}.tar.gz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d973fd0f1568f58f87d6aecd9aa95e3e1f60214a45cee=
26704bf8fe757c54567&quot;<br>
+SRC_URI[sha256sum] =3D &quot;440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa=
81a6a85493f0c89d0f5&quot;<br>
<br>
=C2=A0# This needs to be before ptest inherit, otherwise all ptest files en=
d packaged<br>
=C2=A0# in libopkg package if OPKGLIBDIR =3D=3D libdir, because default<br>
=C2=A0# PTEST_PATH ?=3D &quot;${libdir}/${BPN}/ptest&quot;<br>
=C2=A0PACKAGES =3D+ &quot;libopkg&quot;<br>
<br>
-inherit autotools pkgconfig ptest<br>
+inherit cmake pkgconfig ptest<br>
<br>
=C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
=C2=A0OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
<br>
-PACKAGECONFIG[gpg] =3D &quot;--enable-gpg,--disable-gpg,\<br>
+PACKAGECONFIG[gpg] =3D &quot;-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\<br>
=C2=A0 =C2=A0 =C2=A0gnupg gpgme libgpg-error,\<br>
=C2=A0 =C2=A0 =C2=A0${@ &quot;gnupg&quot; if (&quot;native&quot; in d.getVa=
r(&quot;PN&quot;)) else &quot;gnupg-gpg&quot;}\<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-PACKAGECONFIG[curl] =3D &quot;--enable-curl,--disable-curl,curl&quot;<br>
-PACKAGECONFIG[ssl-curl] =3D &quot;--enable-ssl-curl,--disable-ssl-curl,cur=
l openssl&quot;<br>
-PACKAGECONFIG[sha256] =3D &quot;--enable-sha256,--disable-sha256&quot;<br>
-PACKAGECONFIG[libsolv] =3D &quot;--with-libsolv,--without-libsolv,libsolv&=
quot;<br>
+PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3D0N,-DWITH_CURL=3DOFF,curl&quot=
;<br>
+PACKAGECONFIG[ssl-curl] =3D &quot;-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF=
,curl openssl&quot;<br>
+PACKAGECONFIG[sha256] =3D &quot;-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF&quo=
t;<br>
+PACKAGECONFIG[libsolv] =3D &quot;-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LI=
BSOLV=3DOFF,libsolv&quot;<br>
<br>
-EXTRA_OECONF =3D &quot;--enable-zstd&quot;=C2=A0</blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
-EXTRA_OECONF:append:class-native =3D &quot; --localstatedir=3D/${@os.path.=
relpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} --sys=
confdir=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_N=
ATIVE}&#39;)}&quot;<br>
+EXTRA_OECMAKE =3D &quot;-DWITH_ZSTD=3DON&quot;<br></blockquote><div><br></=
div><div><div>I wonder if we shouldn&#39;t also disable the XZ which is ena=
bled by default and we don&#39;t use it.</div></div><div><br></div><div>Jos=
e</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+EXTRA_OECMAKE:append:class-native =3D &quot; -DVARDIR=3D/${@os.path.relpat=
h(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} -DSYSCONFDI=
R=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_NATIVE}=
&#39;)}&quot;<br>
<br>
=C2=A0do_install:append () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/opkg<br>
@@ -56,6 +56,9 @@ do_install:append () {<br>
=C2=A0}<br>
<br>
=C2=A0do_install_ptest () {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# the ptest class uses a Makefile for installat=
ion, but cmake uses Ninja per default so we need to install ptests manually=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -r ${S}/tests ${D}${PTEST_PATH}<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/@echo $^/d&#39; ${D}${PTEST_PAT=
H}/tests/Makefile<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/@PYTHONPATH=3D. $(PYTHON) $^/a\=
\t@if [ &quot;$$?&quot; !=3D &quot;0&quot; ];then echo &quot;FAIL:&quot;$^;=
else echo &quot;PASS:&quot;$^;fi&#39; ${D}${PTEST_PATH}/tests/Makefile<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224962): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224962" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/224962</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115787032/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/115787032/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div></div>
</div>

--00000000000059d5ce064148bc83--

