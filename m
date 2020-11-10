Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.30692.1605028269946244080
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 09:11:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 685B31396
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 09:11:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FE393F7BB
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 09:11:07 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] webkitgtk: fix build with ICU 68.1
Date: Tue, 10 Nov 2020 17:11:04 +0000
Message-Id: <20201110171104.4112095-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

ICU 68.1 doesn't expose TRUE/FALSE macros anymore, so backport a patch
to fix the build from upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...er-exposes-FALSE-and-TRUE-macros-by-.patch | 180 ++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.30.2.bb  |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-l=
onger-exposes-FALSE-and-TRUE-macros-by-.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-e=
xposes-FALSE-and-TRUE-macros-by-.patch b/meta/recipes-sato/webkit/webkitg=
tk/0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-by-.patch
new file mode 100644
index 00000000000..3a02253e5e2
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-ICU-68.1-no-longer-exposes-=
FALSE-and-TRUE-macros-by-.patch
@@ -0,0 +1,180 @@
+From 8d1c44a03c1870912991467f8d8cd8bb6f85efa5 Mon Sep 17 00:00:00 2001
+From: "stephan.szabo@sony.com" <stephan.szabo@sony.com>
+Date: Tue, 3 Nov 2020 20:06:15 +0000
+Subject: [PATCH] ICU 68.1 no longer exposes FALSE and TRUE macros by def=
ault
+ https://bugs.webkit.org/show_bug.cgi?id=3D218522
+
+Reviewed by Don Olmstead.
+
+Source/WebCore:
+
+* platform/text/TextCodecICU.cpp: Replace use of TRUE with true
+
+Source/WebKit:
+
+* UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordinatedGraphics.cpp:=
 Replace FALSE with false
+
+Source/WTF:
+
+Replace uses of FALSE and TRUE with false and true.
+
+* wtf/text/icu/UTextProvider.h:
+* wtf/text/icu/UTextProviderLatin1.cpp:
+* wtf/text/icu/UTextProviderUTF16.cpp:
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+git-svn-id: https://svn.webkit.org/repository/webkit/trunk@269325 268f45=
cc-cd09-0410-ab3c-d52691b4dbfc
+---
+ Source/WTF/wtf/text/icu/UTextProvider.h            |  8 ++++----
+ Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp    | 14 +++++++-------
+ Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp     |  4 ++--
+ Source/WebCore/platform/text/TextCodecICU.cpp      |  2 +-
+ .../DrawingAreaProxyCoordinatedGraphics.cpp        |  2 +-
+ 5 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/Source/WTF/wtf/text/icu/UTextProvider.h b/Source/WTF/wtf/te=
xt/icu/UTextProvider.h
+index c8f28d6e..3c6fbeab 100644
+--- a/Source/WTF/wtf/text/icu/UTextProvider.h
++++ b/Source/WTF/wtf/text/icu/UTextProvider.h
+@@ -79,12 +79,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* te=
xt, int64_t nativeIndex, int
+             // Ensure chunk offset is well formed if computed offset ex=
ceeds int32_t range.
+             ASSERT(offset < std::numeric_limits<int32_t>::max());
+             text->chunkOffset =3D offset < std::numeric_limits<int32_t>=
::max() ? static_cast<int32_t>(offset) : 0;
+-            isAccessible =3D TRUE;
++            isAccessible =3D true;
+             return true;
+         }
+         if (nativeIndex >=3D nativeLength && text->chunkNativeLimit =3D=
=3D nativeLength) {
+             text->chunkOffset =3D text->chunkLength;
+-            isAccessible =3D FALSE;
++            isAccessible =3D false;
+             return true;
+         }
+     } else {
+@@ -93,12 +93,12 @@ inline bool uTextAccessInChunkOrOutOfRange(UText* te=
xt, int64_t nativeIndex, int
+             // Ensure chunk offset is well formed if computed offset ex=
ceeds int32_t range.
+             ASSERT(offset < std::numeric_limits<int32_t>::max());
+             text->chunkOffset =3D offset < std::numeric_limits<int32_t>=
::max() ? static_cast<int32_t>(offset) : 0;
+-            isAccessible =3D TRUE;
++            isAccessible =3D true;
+             return true;
+         }
+         if (nativeIndex <=3D 0 && !text->chunkNativeStart) {
+             text->chunkOffset =3D 0;
+-            isAccessible =3D FALSE;
++            isAccessible =3D false;
+             return true;
+         }
+     }
+diff --git a/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp b/Source/WT=
F/wtf/text/icu/UTextProviderLatin1.cpp
+index 0a646b7f..49980f95 100644
+--- a/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
++++ b/Source/WTF/wtf/text/icu/UTextProviderLatin1.cpp
+@@ -100,23 +100,23 @@ static UBool uTextLatin1Access(UText* uText, int64=
_t index, UBool forward)
+         if (index < uText->chunkNativeLimit && index >=3D uText->chunkN=
ativeStart) {
+             // Already inside the buffer. Set the new offset.
+             uText->chunkOffset =3D static_cast<int32_t>(index - uText->=
chunkNativeStart);
+-            return TRUE;
++            return true;
+         }
+         if (index >=3D length && uText->chunkNativeLimit =3D=3D length)=
 {
+             // Off the end of the buffer, but we can't get it.
+             uText->chunkOffset =3D static_cast<int32_t>(index - uText->=
chunkNativeStart);
+-            return FALSE;
++            return false;
+         }
+     } else {
+         if (index <=3D uText->chunkNativeLimit && index > uText->chunkN=
ativeStart) {
+             // Already inside the buffer. Set the new offset.
+             uText->chunkOffset =3D static_cast<int32_t>(index - uText->=
chunkNativeStart);
+-            return TRUE;
++            return true;
+         }
+         if (!index && !uText->chunkNativeStart) {
+             // Already at the beginning; can't go any farther.
+             uText->chunkOffset =3D 0;
+-            return FALSE;
++            return false;
+         }
+     }
+    =20
+@@ -144,7 +144,7 @@ static UBool uTextLatin1Access(UText* uText, int64_t=
 index, UBool forward)
+=20
+     uText->nativeIndexingLimit =3D uText->chunkLength;
+=20
+-    return TRUE;
++    return true;
+ }
+=20
+ static int32_t uTextLatin1Extract(UText* uText, int64_t start, int64_t =
limit, UChar* dest, int32_t destCapacity, UErrorCode* status)
+@@ -337,7 +337,7 @@ static int64_t uTextLatin1ContextAwareNativeLength(U=
Text* text)
+ static UBool uTextLatin1ContextAwareAccess(UText* text, int64_t nativeI=
ndex, UBool forward)
+ {
+     if (!text->context)
+-        return FALSE;
++        return false;
+     int64_t nativeLength =3D uTextLatin1ContextAwareNativeLength(text);
+     UBool isAccessible;
+     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength,=
 forward, isAccessible))
+@@ -357,7 +357,7 @@ static UBool uTextLatin1ContextAwareAccess(UText* te=
xt, int64_t nativeIndex, UBo
+         ASSERT(newContext =3D=3D UTextProviderContext::PriorContext);
+         textLatin1ContextAwareSwitchToPriorContext(text, nativeIndex, n=
ativeLength, forward);
+     }
+-    return TRUE;
++    return true;
+ }
+=20
+ static int32_t uTextLatin1ContextAwareExtract(UText*, int64_t, int64_t,=
 UChar*, int32_t, UErrorCode* errorCode)
+diff --git a/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp b/Source/WTF=
/wtf/text/icu/UTextProviderUTF16.cpp
+index 69c8d091..9c3fa709 100644
+--- a/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
++++ b/Source/WTF/wtf/text/icu/UTextProviderUTF16.cpp
+@@ -126,7 +126,7 @@ static inline int64_t uTextUTF16ContextAwareNativeLe=
ngth(UText* text)
+ static UBool uTextUTF16ContextAwareAccess(UText* text, int64_t nativeIn=
dex, UBool forward)
+ {
+     if (!text->context)
+-        return FALSE;
++        return false;
+     int64_t nativeLength =3D uTextUTF16ContextAwareNativeLength(text);
+     UBool isAccessible;
+     if (uTextAccessInChunkOrOutOfRange(text, nativeIndex, nativeLength,=
 forward, isAccessible))
+@@ -146,7 +146,7 @@ static UBool uTextUTF16ContextAwareAccess(UText* tex=
t, int64_t nativeIndex, UBoo
+         ASSERT(newContext =3D=3D UTextProviderContext::PriorContext);
+         textUTF16ContextAwareSwitchToPriorContext(text, nativeIndex, na=
tiveLength, forward);
+     }
+-    return TRUE;
++    return true;
+ }
+=20
+ static int32_t uTextUTF16ContextAwareExtract(UText*, int64_t, int64_t, =
UChar*, int32_t, UErrorCode* errorCode)
+diff --git a/Source/WebCore/platform/text/TextCodecICU.cpp b/Source/WebC=
ore/platform/text/TextCodecICU.cpp
+index c2684939..e716a6fb 100644
+--- a/Source/WebCore/platform/text/TextCodecICU.cpp
++++ b/Source/WebCore/platform/text/TextCodecICU.cpp
+@@ -240,7 +240,7 @@ void TextCodecICU::createICUConverter() const
+     UErrorCode error =3D U_ZERO_ERROR;
+     m_converter =3D ICUConverterPtr { ucnv_open(m_canonicalConverterNam=
e, &error), ucnv_close };
+     if (m_converter)
+-        ucnv_setFallback(m_converter.get(), TRUE);
++        ucnv_setFallback(m_converter.get(), true);
+ }
+=20
+ int TextCodecICU::decodeToBuffer(UChar* target, UChar* targetLimit, con=
st char*& source, const char* sourceLimit, int32_t* offsets, bool flush, =
UErrorCode& error)
+diff --git a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProx=
yCoordinatedGraphics.cpp b/Source/WebKit/UIProcess/CoordinatedGraphics/Dr=
awingAreaProxyCoordinatedGraphics.cpp
+index 61e3f605..5a51b9ec 100644
+--- a/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordi=
natedGraphics.cpp
++++ b/Source/WebKit/UIProcess/CoordinatedGraphics/DrawingAreaProxyCoordi=
natedGraphics.cpp
+@@ -402,7 +402,7 @@ DrawingAreaProxyCoordinatedGraphics::DrawingMonitor:=
:~DrawingMonitor()
+ int DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::webViewDrawCal=
lback(DrawingAreaProxyCoordinatedGraphics::DrawingMonitor* monitor)
+ {
+     monitor->didDraw();
+-    return FALSE;
++    return false;
+ }
+=20
+ void DrawingAreaProxyCoordinatedGraphics::DrawingMonitor::start(WTF::Fu=
nction<void(CallbackBase::Error)>&& callback)
+--=20
+2.25.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.30.2.bb
index 94fcbd8abe5..58b66c0f667 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.30.2.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
            file://include_xutil.patch \
+           file://0001-ICU-68.1-no-longer-exposes-FALSE-and-TRUE-macros-=
by-.patch \
            "
 SRC_URI[sha256sum] =3D "c467e0bc2bc610c2570928e3fd63cedaadc4719cbf9b04aa=
99f79dd71ad5682a"
=20
--=20
2.25.1

