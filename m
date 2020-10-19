Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.web10.8547.1603091109771257940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2020 00:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=UK0uk5dI;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: crg7475@mailbox.org)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4CF7771hsxzQjYX
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2020 09:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1603091101; bh=HEa+RTTnsh8P
	K2JTWjqcdeCw1iG+7Ao0OjX+l+pHoQo=; b=UK0uk5dICYDPq6RBdLedJDeTgUEN
	e2Ak/fx4UEuyjq3Clzh8E4a6DMH36p7RQJDZzH31A0Eqp0QKlEBCuktXry4lYMHd
	mfffYb6zAPY6ZzCWe+2xsdJfrQp+CbJvqsVUyJrSXEowog/h5GXR4AIyuxC/P3jm
	9M8tDH6uprxmbQzkSDmtWDzuW4UnT+M4CAPPdzXmC16Q+9H/4apebSh65zQEhjfb
	iNU/FL3K6DzQNnzMHQglMj0dLJrBtxECVxvmO+cdsCV83B8B0bUVHc7U7EC040ze
	u07bcjL1FqL+yWi260l//LmDjYDeANUPqlgEaMkRoLaOUi8DOI0mBFvG0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1603091103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lG5LDMFm4KCzJF6ydBwW/3RdM4pqU7TCzoPsNTksR/o=;
	b=Gkomxy5fv8HhCGjIjc+DjN67rxfDlMszJEP//DG6NnSRfdK0x4y0pwPoGSmec+hkv82Z0U
	eRm8ITJp9Nqdv/o2RMi+ad8awXUMDUaxPtbZvUxsty4tW9rXhdZUYnh6muWuF6yEwOzWre
	KniapjS7/7cTMP7CS9rkT+GhEOpWU5knKzdS0RjFHY/A0dptwxYns8mspsNc8Yavq7rbFZ
	QTcFHjZ5aNaudJ6T9S85dexF8v4fZgbAHXIf+L6yLOGDvMydoMrIl5k/wtZ3EJ8WZvsbZ2
	+wSAgRJB/3R1GlZxdWWArxxYHNo15SV65rOXnvvfuZy4lO8CbsLlwMWC0FFigg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
	with ESMTP id tVGB4z9k1SLK
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2020 09:05:01 +0200 (CEST)
Subject: Re: [OE-core] [PATCH v3 12/20] gstreamer1.0-python: upgrade to version 1.18.0
To: openembedded-core@lists.openembedded.org
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
 <20201018121002.1417335-13-quaresma.jose@gmail.com>
From: "Carlos Rafael Giani" <crg7475@mailbox.org>
Message-ID: <0cee3989-5bb3-2705-39ce-2a729418cdba@mailbox.org>
Date: Mon, 19 Oct 2020 09:05:00 +0200
MIME-Version: 1.0
In-Reply-To: <20201018121002.1417335-13-quaresma.jose@gmail.com>
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -1.56 / 15.00 / 15.00
X-Rspamd-Queue-Id: 43CBF182A
X-Rspamd-UID: 6b16ab
Content-Type: multipart/alternative;
 boundary="------------E68D309C166B5DC951FAB97D"
Content-Language: en-US

--------------E68D309C166B5DC951FAB97D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

I got this build error:

| Run-time dependency gstreamer-plugins-base-1.0 found: NO (tried=20
pkgconfig and cmake)
|
| ../gst-python-1.18.0/testsuite/meson.build:32:2: ERROR: 'not-found' is=
=20
not a pkgconfig dependency


This fixed it:

--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
@@ -9,7 +9,7 @@ SRC_URI =3D=20
"https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x
 =C2=A0SRC_URI[md5sum] =3D "2d55c22fcd57cae4fad55a07019aa334"
 =C2=A0SRC_URI[sha256sum] =3D=20
"76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0b175213218516dd45"

-DEPENDS =3D "gstreamer1.0 python3-pygobject"
+DEPENDS =3D "gstreamer1.0 python3-pygobject gstreamer1.0-plugins-base"
 =C2=A0RDEPENDS_${PN} +=3D "gstreamer1.0 python3-pygobject"

 =C2=A0PNREAL =3D "gst-python"


On 18.10.20 14:09, Jose Quaresma wrote:
>      * 0001-meson.build-fix-builds-with-python-3.8.patch
>        Removed since these are included in 1.18.0
>
> DEPENDS:
> RDEPENDS:
>   - Upstream now depends gstreamer1.0-plugins-base
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>   ...son.build-fix-builds-with-python-3.8.patch | 24 -------------------
>   ....16.2.bb =3D> gstreamer1.0-python_1.18.0.bb} | 14 +++++------
>   2 files changed, 6 insertions(+), 32 deletions(-)
>   delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-pyth=
on/0001-meson.build-fix-builds-with-python-3.8.patch
>   rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.b=
b =3D> gstreamer1.0-python_1.18.0.bb} (72%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-=
meson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gstr=
eamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
> deleted file mode 100644
> index 053108ad50..0000000000
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.b=
uild-fix-builds-with-python-3.8.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Mon, 2 Dec 2019 18:16:41 +0100
> -Subject: [PATCH] meson.build: fix builds with python 3.8
> -
> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gs=
t-python/merge_requests/14]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - meson.build | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/meson.build b/meson.build
> -index 1da81d5..3e0db38 100644
> ---- a/meson.build
> -+++ b/meson.build
> -@@ -24,7 +24,7 @@ pygobject_dep =3D dependency('pygobject-3.0', fallbac=
k: ['pygobject', 'pygobject_d
> -
> - pymod =3D import('python')
> - python =3D pymod.find_installation(get_option('python'))
> --python_dep =3D python.dependency(required : true)
> -+python_dep =3D dependency('python3-embed', required : true)
> -
> - python_abi_flags =3D python.get_variable('ABIFLAGS', '')
> - pylib_loc =3D get_option('libpython-dir')
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.=
2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
> similarity index 72%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2=
.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.b=
b
> index 9e024eb9f3..f13f9c5a44 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
> @@ -5,14 +5,12 @@ SECTION =3D "multimedia"
>   LICENSE =3D "LGPLv2.1"
>   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a=
5f740"
>  =20
> -SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-=
${PV}.tar.xz \
> -           file://0001-meson.build-fix-builds-with-python-3.8.patch \
> -           "
> -SRC_URI[md5sum] =3D "6ac709767334d8d0a71cb4e016f6abeb"
> -SRC_URI[sha256sum] =3D "208df3148d73d9f416d016564737585d8ea763d91201732=
d44b5fe688c6288a8"
> -
> -DEPENDS =3D "gstreamer1.0 python3-pygobject"
> -RDEPENDS_${PN} +=3D "gstreamer1.0 python3-pygobject"
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-=
${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "2d55c22fcd57cae4fad55a07019aa334"
> +SRC_URI[sha256sum] =3D "76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0=
b175213218516dd45"
> +
> +DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
> +RDEPENDS_${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pyg=
object"
>  =20
>   PNREAL =3D "gst-python"
>  =20
>
>=20
>

--------------E68D309C166B5DC951FAB97D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>I got this build error:</p>
    <p>| Run-time dependency gstreamer-plugins-base-1.0 found: NO (tried
      pkgconfig and cmake)<br>
      | <br>
      | ../gst-python-1.18.0/testsuite/meson.build:32:2: ERROR:
      'not-found' is not a pkgconfig dependency<br>
    </p>
    <p><br>
    </p>
    <p>This fixed it:</p>
    <p>---
      a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb<br=
>
      +++
      b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb<br=
>
      @@ -9,7 +9,7 @@ SRC_URI =3D
      "<a class=3D"moz-txt-link-freetext" href=3D"https://gstreamer.freede=
sktop.org/src/$">https://gstreamer.freedesktop.org/src/$</a>{PNREAL}/${PNRE=
AL}-${PV}.tar.x<br>
      =C2=A0SRC_URI[md5sum] =3D "2d55c22fcd57cae4fad55a07019aa334"<br>
      =C2=A0SRC_URI[sha256sum] =3D
      "76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0b175213218516dd45"<b=
r>
      =C2=A0<br>
      -DEPENDS =3D "gstreamer1.0 python3-pygobject"<br>
      +DEPENDS =3D "gstreamer1.0 python3-pygobject
      gstreamer1.0-plugins-base"<br>
      =C2=A0RDEPENDS_${PN} +=3D "gstreamer1.0 python3-pygobject"<br>
      =C2=A0<br>
      =C2=A0PNREAL =3D "gst-python"<br>
    </p>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 18.10.20 14:09, Jose Quaresma wrote:=
<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:20201018121002.1417335-13-quaresma.jose@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">    * 0001-meson.build-fix-bu=
ilds-with-python-3.8.patch
      Removed since these are included in 1.18.0

DEPENDS:
RDEPENDS:
 - Upstream now depends gstreamer1.0-plugins-base

Signed-off-by: Jose Quaresma <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:quaresma.jose@gmail.com">&lt;quaresma.jose@gmail.com&gt;</a>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 -------------------
 ....16.2.bb =3D&gt; gstreamer1.0-python_1.18.0.bb} | 14 +++++------
 2 files changed, 6 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/=
0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb =
=3D&gt; gstreamer1.0-python_1.18.0.bb} (72%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-me=
son.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gstrea=
mer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
deleted file mode 100644
index 053108ad50..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.bui=
ld-fix-builds-with-python-3.8.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
-Date: Mon, 2 Dec 2019 18:16:41 +0100
-Subject: [PATCH] meson.build: fix builds with python 3.8
-
-Upstream-Status: Submitted [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14">https:=
//gitlab.freedesktop.org/gstreamer/gst-python/merge_requests/14</a>]
-Signed-off-by: Alexander Kanavin <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 1da81d5..3e0db38 100644
---- a/meson.build
-+++ b/meson.build
-@@ -24,7 +24,7 @@ pygobject_dep =3D dependency('pygobject-3.0', fallback:=
 ['pygobject', 'pygobject_d
-=20
- pymod =3D import('python')
- python =3D pymod.find_installation(get_option('python'))
--python_dep =3D python.dependency(required : true)
-+python_dep =3D dependency('python3-embed', required : true)
-=20
- python_abi_flags =3D python.get_variable('ABIFLAGS', '')
- pylib_loc =3D get_option('libpython-dir')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
similarity index 72%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.b=
b
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
index 9e024eb9f3..f13f9c5a44 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.0.bb
@@ -5,14 +5,12 @@ SECTION =3D "multimedia"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://CO=
PYING;md5=3Dc34deae4e395ca07e725ab0076a5f740">"file://COPYING;md5=3Dc34deae=
4e395ca07e725ab0076a5f740"</a>
=20
-SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://gstreamer.=
freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz\-file://0001-meson.bui=
ld-fix-builds-with-python-3.8.patch\-">"https://gstreamer.freedesktop.org/s=
rc/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-meson.build-fix-builds-with-python-3.8.patch \
-           "</a>
-SRC_URI[md5sum] =3D "6ac709767334d8d0a71cb4e016f6abeb"
-SRC_URI[sha256sum] =3D "208df3148d73d9f416d016564737585d8ea763d91201732d4=
4b5fe688c6288a8"
-
-DEPENDS =3D "gstreamer1.0 python3-pygobject"
-RDEPENDS_${PN} +=3D "gstreamer1.0 python3-pygobject"
+SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"https://gstreamer.=
freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz">"https://gstreamer.fr=
eedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"</a>
+SRC_URI[md5sum] =3D "2d55c22fcd57cae4fad55a07019aa334"
+SRC_URI[sha256sum] =3D "76bfe8b85a9c4a6ddfb81874f2635fd0da38c3f39d9d2a0b1=
75213218516dd45"
+
+DEPENDS =3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
+RDEPENDS_${PN} +=3D "gstreamer1.0 gstreamer1.0-plugins-base python3-pygob=
ject"
=20
 PNREAL =3D "gst-python"
=20
</pre>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------E68D309C166B5DC951FAB97D--
