Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOrqg-0007q8-CS
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 16:45:10 +0200
Received: by lbbgo4 with SMTP id go4so1852494lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 07:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=uM3iWanfUt1qbJp6OiDbFKHOHB+/ZXZVFXlB0pt9Hco=;
	b=cCLn3WyBbHpb7nio21IIQSlHTRiA/Hnr9HSYSf9FjpYFcg8sLdO/cJ5zz0wrVer6Ix
	qdOMnlwFKuX+OMZcewtaPSHehkJqmqptG6m0SAfQgS+V3N01tWZR05Z/PGHCCECpncDR
	3767CzTOgbGLJObob9XXTxhuaeB0vP4Pbo+Nzo4B7gTW9fYH/mv9raUwnGc4gNSSR0oF
	M071rCWb0ai08I9E23r7JVR7R9n9A/KaBvUnVoBx92bJv9QUqnPSWtKYl/AMsuFfc3lI
	8KSXp5ljM8GjGqALCbx2Mm626bTujltmCZS1IEevmnxB/4ryBlFa5hNbrccgLUItu9mv
	ZDrQ==
Received: by 10.112.32.72 with SMTP id g8mr4059131lbi.43.1335796528409; Mon,
	30 Apr 2012 07:35:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 07:34:58 -0700 (PDT)
In-Reply-To: <1335782052.7415.1.camel@ted>
References: <1335782052.7415.1.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 07:34:58 -0700
Message-ID: <CAMKF1spqp12AKBB1FLESE+WbzFb4sBf=J18aDNhYKRbYZoQECQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt-4.8.1: Fix compile failures on qemux86
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
X-List-Received-Date: Mon, 30 Apr 2012 14:45:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2012 at 3:34 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-4.=
8.1.inc
> index b42ca01..8c38cae 100644
> --- a/meta/recipes-qt/qt4/qt-4.8.1.inc
> +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
> @@ -21,6 +21,7 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-every=
where-opensource-src-${PV}.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://g++.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linux.conf \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://gcc47-fix.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc47-fix2.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://disable-fuse-gold-flag.pa=
tch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>
> diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch b/meta/recipes=
-qt/qt4/qt-4.8.1/gcc47-fix2.patch
> new file mode 100644
> index 0000000..09513b6
> --- a/dev/null
> +++ b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch
> @@ -0,0 +1,50 @@
> +Fixes for gcc 4.7.0, particularly on qemux86
> +
> +Origin: upstream, http://trac.webkit.org/changeset/93631
> +Origin: upstream, http://trac.webkit.org/changeset/113848
> +
> +Bug: https://bugs.webkit.org/show_bug.cgi?id=3D62168
> +Bug: https://bugs.webkit.org/show_bug.cgi?id=3D83584
> +
> +RP 2012/04/30
> +
> +Upstream-Status: Backport
> +

looks good. Are we able to build QT 4.8.x now

> +Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/Web=
Core/dom/Element.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/W=
ebCore/dom/Element.cpp 2012-04-30 09:15:17.000000000 +0000
> ++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCor=
e/dom/Element.cpp =C2=A0 =C2=A0 =C2=A02012-04-30 09:22:04.586008994 +0000
> +@@ -1080,7 +1080,7 @@
> + {
> + =C2=A0 =C2=A0 // Ref currentStyle in case it would otherwise be deleted=
 when setRenderStyle() is called.
> + =C2=A0 =C2=A0 RefPtr<RenderStyle> currentStyle(renderStyle());
> +- =C2=A0 =C2=A0bool hasParentStyle =3D parentNodeForRenderingAndStyle() =
? parentNodeForRenderingAndStyle()->renderStyle() : false;
> ++ =C2=A0 =C2=A0bool hasParentStyle =3D parentNodeForRenderingAndStyle() =
? static_cast<bool>(parentNodeForRenderingAndStyle()->renderStyle()) : fals=
e;
> + =C2=A0 =C2=A0 bool hasDirectAdjacentRules =3D currentStyle && currentSt=
yle->childrenAffectedByDirectAdjacentRules();
> + =C2=A0 =C2=A0 bool hasIndirectAdjacentRules =3D currentStyle && current=
Style->childrenAffectedByForwardPositionalRules();
> +
> +Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/Web=
Core/html/HTMLImageElement.cpp
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/W=
ebCore/html/HTMLImageElement.cpp =C2=A0 =C2=A0 =C2=A0 2012-03-14 14:01:19.0=
00000000 +0000
> ++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCor=
e/html/HTMLImageElement.cpp =C2=A0 =C2=A02012-04-30 09:22:04.586008994 +000=
0
> +@@ -74,7 +74,7 @@
> + =C2=A0 =C2=A0 RefPtr<HTMLImageElement> image =3D adoptRef(new HTMLImage=
Element(imgTag, document));
> + =C2=A0 =C2=A0 if (optionalWidth)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 image->setWidth(*optionalWidth);
> +- =C2=A0 =C2=A0if (optionalHeight > 0)
> ++ =C2=A0 =C2=A0if (optionalHeight)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 image->setHeight(*optionalHeight);
> + =C2=A0 =C2=A0 return image.release();
> + }
> +Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/Web=
Core/platform/graphics/TiledBackingStoreClient.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source/W=
ebCore/platform/graphics/TiledBackingStoreClient.h =C2=A0 =C2=A0 2012-03-14=
 14:01:24.000000000 +0000
> ++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebCor=
e/platform/graphics/TiledBackingStoreClient.h =C2=A02012-04-30 09:22:04.590=
008963 +0000
> +@@ -25,6 +25,7 @@
> + #if ENABLE(TILED_BACKING_STORE)
> + class TiledBackingStoreClient {
> + public:
> ++ =C2=A0 =C2=A0virtual ~TiledBackingStoreClient() { }
> + =C2=A0 =C2=A0 virtual void tiledBackingStorePaintBegin() =3D 0;
> + =C2=A0 =C2=A0 virtual void tiledBackingStorePaint(GraphicsContext*, con=
st IntRect&) =3D 0;
> + =C2=A0 =C2=A0 virtual void tiledBackingStorePaintEnd(const Vector<IntRe=
ct>& paintedArea) =3D 0;
> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb b/meta/recipes-qt/=
qt4/qt4-embedded_4.8.1.bb
> index e16264c..668565e 100644
> --- a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
> +++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
> @@ -1,7 +1,7 @@
> =C2=A0require qt-${PV}.inc
> =C2=A0require qt4-embedded.inc
>
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
>
> diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb b/meta/recipes-qt/qt=
4/qt4-native_4.8.1.bb
> index 533b5d6..a2a1dbd 100644
> --- a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> +++ b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> @@ -1,6 +1,6 @@
> =C2=A0require qt4-native.inc
>
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0# Find the g++.conf/linux.conf in the right directory.
> =C2=A0FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qt-${PV}:"
> diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb b/meta/reci=
pes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> index c4bd3cf..e17a8ad 100644
> --- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> +++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> @@ -1,6 +1,6 @@
> =C2=A0require qt4-tools-nativesdk.inc
>
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0SRC_URI +=3D "file://qmake_pri_fixes.patch"
>
> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb b/meta/recipes-qt/=
qt4/qt4-x11-free_4.8.1.bb
> index 7afb51f..6978053 100644
> --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
> +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
> @@ -1,7 +1,7 @@
> =C2=A0require qt4-x11-free.inc
> =C2=A0require qt-${PV}.inc
>
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


