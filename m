Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5BD76FF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 18:25:31 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id EC1E238F76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 20:25:31 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 20:25:13 +0200
Message-Id: <1461867918-2638-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
References: <1461867918-2638-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-oe][PATCH v2 3/8] gstreamer1.0-plugins-base: upgrade to version 1.8.1
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
X-List-Received-Date: Thu, 28 Apr 2016 18:25:32 -0000

Patches still apply and only needed their line numbers updated, with the
exception of one backport from 1.7.1, which is no longer needed.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   1 +
 ...-don-t-hardcode-libtool-name-when-running.patch |  20 +--
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch |  38 +++---
 ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |   2 +-
 ...t-need_segment-after-sink-pad-received-GS.patch |   2 +-
 ...ame-Support-video-crop-when-convert-frame.patch | 143 ---------------------
 ...eed-more-buffers-in-output-queue-for-bett.patch |   2 +-
 .../get-caps-from-src-pad-when-query-caps.patch    |   2 +-
 ...make-gio_unix_2_0-dependency-configurable.patch |   4 +-
 ...1.6.3.bb => gstreamer1.0-plugins-base_1.8.1.bb} |  12 +-
 10 files changed, 39 insertions(+), 187 deletions(-)
 delete mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.6.3.bb => gstreamer1.0-plugins-base_1.8.1.bb} (58%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index 7381458..a04f155 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -31,6 +31,7 @@ PACKAGECONFIG[cdparanoia]   = "--enable-cdparanoia,--disable-cdparanoia,cdparano
 PACKAGECONFIG[gio-unix-2.0] = "--enable-gio_unix_2_0,--disable-gio_unix_2_0,glib-2.0"
 PACKAGECONFIG[ivorbis]      = "--enable-ivorbis,--disable-ivorbis,tremor"
 PACKAGECONFIG[ogg]          = "--enable-ogg,--disable-ogg,libogg"
+PACKAGECONFIG[opus]         = "--enable-opus,--disable-opus,libopus"
 PACKAGECONFIG[pango]        = "--enable-pango,--disable-pango,pango"
 PACKAGECONFIG[theora]       = "--enable-theora,--disable-theora,libtheora"
 PACKAGECONFIG[visual]       = "--enable-libvisual,--disable-libvisual,libvisual"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
index 781e4d8..094bdac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
@@ -24,7 +24,7 @@ diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makef
 index 9361bf9..bc7f53a 100644
 --- a/gst-libs/gst/allocators/Makefile.am
 +++ b/gst-libs/gst/allocators/Makefile.am
-@@ -37,7 +37,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
+@@ -38,7 +38,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
  		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
  		--library=libgstallocators-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
@@ -37,7 +37,7 @@ diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
 index 6d6de8d..dcc2fe0 100644
 --- a/gst-libs/gst/app/Makefile.am
 +++ b/gst-libs/gst/app/Makefile.am
-@@ -52,7 +52,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
+@@ -53,7 +53,7 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
  		--library=libgstapp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
@@ -50,7 +50,7 @@ diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
 index 275d222..2374196 100644
 --- a/gst-libs/gst/audio/Makefile.am
 +++ b/gst-libs/gst/audio/Makefile.am
-@@ -106,7 +106,7 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
+@@ -116,7 +116,7 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
  		--include=GstTag-@GST_API_VERSION@ \
@@ -63,7 +63,7 @@ diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
 index 09b3d68..f545354 100644
 --- a/gst-libs/gst/fft/Makefile.am
 +++ b/gst-libs/gst/fft/Makefile.am
-@@ -64,7 +64,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
+@@ -65,7 +65,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
  		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
  		--library=libgstfft-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
@@ -76,7 +76,7 @@ diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
 index 64d5eb0..91dc214 100644
 --- a/gst-libs/gst/pbutils/Makefile.am
 +++ b/gst-libs/gst/pbutils/Makefile.am
-@@ -94,7 +94,7 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
+@@ -99,7 +99,7 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
  		--include=GstTag-@GST_API_VERSION@ \
  		--include=GstVideo-@GST_API_VERSION@ \
  		--include=GstAudio-@GST_API_VERSION@ \
@@ -102,7 +102,7 @@ diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
 index fdd01c1..f5445c1 100644
 --- a/gst-libs/gst/rtp/Makefile.am
 +++ b/gst-libs/gst/rtp/Makefile.am
-@@ -64,7 +64,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+@@ -65,7 +65,7 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
  		--library=libgstrtp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
@@ -115,7 +115,7 @@ diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
 index ede5706..9b0b258 100644
 --- a/gst-libs/gst/rtsp/Makefile.am
 +++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -71,7 +71,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+@@ -72,7 +72,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
  		--include=Gio-2.0 \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstSdp-@GST_API_VERSION@ \
@@ -128,7 +128,7 @@ diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
 index a90f30b..0e149b8 100644
 --- a/gst-libs/gst/sdp/Makefile.am
 +++ b/gst-libs/gst/sdp/Makefile.am
-@@ -31,7 +31,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
+@@ -32,7 +32,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
  		--add-include-path=`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-@GST_API_VERSION@` \
  		--library=libgstsdp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
@@ -141,7 +141,7 @@ diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
 index c534a4d..cafafd3 100644
 --- a/gst-libs/gst/tag/Makefile.am
 +++ b/gst-libs/gst/tag/Makefile.am
-@@ -44,7 +44,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
+@@ -45,7 +45,7 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
  		--library=libgsttag-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
@@ -154,7 +154,7 @@ diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
 index 5d31fa1..ac64eb3 100644
 --- a/gst-libs/gst/video/Makefile.am
 +++ b/gst-libs/gst/video/Makefile.am
-@@ -113,7 +113,7 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
+@@ -116,7 +116,7 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
  		--library=libgstvideo-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
index 85fcacb..0a8bc9b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
@@ -24,7 +24,7 @@ diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makef
 index bc7f53a..0ef5f86 100644
 --- a/gst-libs/gst/allocators/Makefile.am
 +++ b/gst-libs/gst/allocators/Makefile.am
-@@ -34,7 +34,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
+@@ -35,7 +35,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
  		--c-include "gst/allocators/allocators.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -33,7 +33,7 @@ index bc7f53a..0ef5f86 100644
  		--library=libgstallocators-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--libtool="$(LIBTOOL)" \
-@@ -58,7 +58,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -59,7 +59,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -46,7 +46,7 @@ diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
 index dcc2fe0..dc076cb 100644
 --- a/gst-libs/gst/app/Makefile.am
 +++ b/gst-libs/gst/app/Makefile.am
-@@ -47,8 +47,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
+@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
  		--c-include "gst/app/app.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -61,7 +61,7 @@ diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
 index 2374196..295eb42 100644
 --- a/gst-libs/gst/audio/Makefile.am
 +++ b/gst-libs/gst/audio/Makefile.am
-@@ -96,12 +96,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
+@@ -106,12 +106,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
  		--c-include "gst/audio/audio.h" \
@@ -78,7 +78,7 @@ index 2374196..295eb42 100644
  		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -130,8 +130,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -140,8 +140,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
  		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
@@ -93,7 +93,7 @@ diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
 index f545354..1bb6243 100644
 --- a/gst-libs/gst/fft/Makefile.am
 +++ b/gst-libs/gst/fft/Makefile.am
-@@ -61,7 +61,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
+@@ -62,7 +62,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
  		--c-include "gst/fft/fft.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -102,7 +102,7 @@ index f545354..1bb6243 100644
  		--library=libgstfft-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--libtool="$(LIBTOOL)" \
-@@ -85,7 +85,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -86,7 +86,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -115,7 +115,7 @@ diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
 index 91dc214..dc8e1d3 100644
 --- a/gst-libs/gst/pbutils/Makefile.am
 +++ b/gst-libs/gst/pbutils/Makefile.am
-@@ -79,14 +79,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
+@@ -84,14 +84,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
  		--c-include "gst/pbutils/pbutils.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -134,7 +134,7 @@ index 91dc214..dc8e1d3 100644
  		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
  		--library-path="$(top_builddir)/gst-libs/gst/video/" \
  		--library-path="$(top_builddir)/gst-libs/gst/audio/" \
-@@ -119,8 +119,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -124,8 +124,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -175,7 +175,7 @@ diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
 index f5445c1..527c0b4 100644
 --- a/gst-libs/gst/rtp/Makefile.am
 +++ b/gst-libs/gst/rtp/Makefile.am
-@@ -59,8 +59,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+@@ -60,8 +60,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
  		--c-include "gst/rtp/rtp.h" \
  		-I$(top_builddir)/gst-libs \
  		-I$(top_srcdir)/gst-libs \
@@ -186,7 +186,7 @@ index f5445c1..527c0b4 100644
  		--library=libgstrtp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -87,8 +87,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -88,8 +88,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -201,7 +201,7 @@ diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
 index 9b0b258..4f6d9f8 100644
 --- a/gst-libs/gst/rtsp/Makefile.am
 +++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -66,7 +66,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+@@ -67,7 +67,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
  		-I$(top_builddir)/gst-libs \
  		-I$(top_srcdir)/gst-libs \
  		--add-include-path=$(builddir)/../sdp \
@@ -210,7 +210,7 @@ index 9b0b258..4f6d9f8 100644
  		--library=libgstrtsp-@GST_API_VERSION@.la \
  		--include=Gio-2.0 \
  		--include=Gst-@GST_API_VERSION@ \
-@@ -96,7 +96,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -97,7 +97,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
  		--includedir=$(builddir)/../sdp \
@@ -223,7 +223,7 @@ diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
 index 0e149b8..9aa0512 100644
 --- a/gst-libs/gst/sdp/Makefile.am
 +++ b/gst-libs/gst/sdp/Makefile.am
-@@ -28,7 +28,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
+@@ -29,7 +29,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
  		--warn-all \
  		--c-include "gst/sdp/sdp.h" \
  		-I$(top_srcdir)/gst-libs \
@@ -232,7 +232,7 @@ index 0e149b8..9aa0512 100644
  		--library=libgstsdp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--libtool="$(LIBTOOL)" \
-@@ -52,7 +52,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -53,7 +53,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -245,7 +245,7 @@ diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
 index cafafd3..ba99279 100644
 --- a/gst-libs/gst/tag/Makefile.am
 +++ b/gst-libs/gst/tag/Makefile.am
-@@ -39,8 +39,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
+@@ -40,8 +40,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
  		--c-include "gst/tag/tag.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -256,7 +256,7 @@ index cafafd3..ba99279 100644
  		--library=libgsttag-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -67,8 +67,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -68,8 +68,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -271,7 +271,7 @@ diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
 index ac64eb3..342c8c6 100644
 --- a/gst-libs/gst/video/Makefile.am
 +++ b/gst-libs/gst/video/Makefile.am
-@@ -108,8 +108,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
+@@ -111,8 +111,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
  		--c-include "gst/video/video.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -282,7 +282,7 @@ index ac64eb3..342c8c6 100644
  		--library=libgstvideo-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -136,8 +136,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -139,8 +139,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
index 42d99c1..4adf605 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
@@ -14,7 +14,7 @@ diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
 index 4f6d9f8..0afa370 100644
 --- a/gst-libs/gst/rtsp/Makefile.am
 +++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -74,7 +74,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+@@ -75,7 +75,6 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
  		--libtool="$(LIBTOOL)" \
  		--pkg gio-2.0 \
  		--pkg gstreamer-@GST_API_VERSION@ \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
index 7813915..b924e38 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-subparse-set-need_segment-after-sink-pad-received-GS.patch
@@ -51,7 +51,7 @@ index b565e93..7741ccc
          GST_WARNING_OBJECT (self, "seek to 0 bytes failed");
        }
  
-@@ -1632,8 +1630,10 @@ gst_sub_parse_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
+@@ -1641,8 +1639,10 @@ gst_sub_parse_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
        gst_event_parse_segment (event, &s);
        if (s->format == GST_FORMAT_TIME)
          gst_event_copy_segment (event, &self->segment);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch
deleted file mode 100755
index 096a6f4..0000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-convertframe-Support-video-crop-when-convert-frame.patch
+++ /dev/null
@@ -1,143 +0,0 @@
-From 5be6ed00aad028d9cbb4e0c63af0be69d335c71e Mon Sep 17 00:00:00 2001
-From: Song Bing <b06498@freescale.com>
-Date: Fri, 11 Dec 2015 21:42:00 +0800
-Subject: [PATCH] convertframe: Support video crop when convert frame
-
-Get thumbnail will user convertframe to convert video frame to
-desired video format and size. But haven't process crop meta on
-the video buffer. Add support video crop.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=759329
-
-Upstream-Status: Backport [1.7.1]
-
----
- gst-libs/gst/video/convertframe.c | 65 +++++++++++++++++++++++++++++++++------
- 1 file changed, 56 insertions(+), 9 deletions(-)
-
-diff --git a/gst-libs/gst/video/convertframe.c b/gst-libs/gst/video/convertframe.c
-index aa9c3d3..942a51e 100644
---- a/gst-libs/gst/video/convertframe.c
-+++ b/gst-libs/gst/video/convertframe.c
-@@ -110,12 +110,23 @@ fail:
- static GstElement *
- build_convert_frame_pipeline (GstElement ** src_element,
-     GstElement ** sink_element, const GstCaps * from_caps,
--    const GstCaps * to_caps, GError ** err)
-+    GstVideoCropMeta * cmeta, const GstCaps * to_caps, GError ** err)
- {
--  GstElement *src = NULL, *csp = NULL, *vscale = NULL;
--  GstElement *sink = NULL, *encoder = NULL, *pipeline;
-+  GstElement *vcrop = NULL, *csp = NULL, *csp2 = NULL, *vscale = NULL;
-+  GstElement *src = NULL, *sink = NULL, *encoder = NULL, *pipeline;
-+  GstVideoInfo info;
-   GError *error = NULL;
- 
-+  if (cmeta) {
-+    if (!create_element ("videocrop", &vcrop, &error)) {
-+      g_warning
-+          ("build_convert_frame_pipeline: Buffer has crop metadata but videocrop element is not found. Cropping will be disabled");
-+    } else {
-+      if (!create_element ("videoconvert", &csp2, &error))
-+        goto no_elements;
-+    }
-+  }
-+
-   /* videoscale is here to correct for the pixel-aspect-ratio for us */
-   GST_DEBUG ("creating elements");
-   if (!create_element ("appsrc", &src, &error) ||
-@@ -133,15 +144,42 @@ build_convert_frame_pipeline (GstElement ** src_element,
- 
-   GST_DEBUG ("adding elements");
-   gst_bin_add_many (GST_BIN (pipeline), src, csp, vscale, sink, NULL);
-+  if (vcrop)
-+    gst_bin_add_many (GST_BIN (pipeline), vcrop, csp2, NULL);
- 
-   /* set caps */
-   g_object_set (src, "caps", from_caps, NULL);
-+  if (vcrop) {
-+    gst_video_info_from_caps (&info, from_caps);
-+    g_object_set (vcrop, "left", cmeta->x, NULL);
-+    g_object_set (vcrop, "top", cmeta->y, NULL);
-+    g_object_set (vcrop, "right", GST_VIDEO_INFO_WIDTH (&info) - cmeta->width,
-+        NULL);
-+    g_object_set (vcrop, "bottom",
-+        GST_VIDEO_INFO_HEIGHT (&info) - cmeta->height, NULL);
-+    GST_DEBUG ("crop meta [x,y,width,height]: %d %d %d %d", cmeta->x, cmeta->y,
-+        cmeta->width, cmeta->height);
-+  }
-   g_object_set (sink, "caps", to_caps, NULL);
- 
-   /* FIXME: linking is still way too expensive, profile this properly */
--  GST_DEBUG ("linking src->csp");
--  if (!gst_element_link_pads (src, "src", csp, "sink"))
--    goto link_failed;
-+  if (vcrop) {
-+    GST_DEBUG ("linking src->csp2");
-+    if (!gst_element_link_pads (src, "src", csp2, "sink"))
-+      goto link_failed;
-+
-+    GST_DEBUG ("linking csp2->vcrop");
-+    if (!gst_element_link_pads (csp2, "src", vcrop, "sink"))
-+      goto link_failed;
-+
-+    GST_DEBUG ("linking vcrop->csp");
-+    if (!gst_element_link_pads (vcrop, "src", csp, "sink"))
-+      goto link_failed;
-+  } else {
-+    GST_DEBUG ("linking src->csp");
-+    if (!gst_element_link_pads (src, "src", csp, "sink"))
-+      goto link_failed;
-+  }
- 
-   GST_DEBUG ("linking csp->vscale");
-   if (!gst_element_link_pads_full (csp, "src", vscale, "sink",
-@@ -193,8 +231,12 @@ no_elements:
-   {
-     if (src)
-       gst_object_unref (src);
-+    if (vcrop)
-+      gst_object_unref (vcrop);
-     if (csp)
-       gst_object_unref (csp);
-+    if (csp2)
-+      gst_object_unref (csp2);
-     if (vscale)
-       gst_object_unref (vscale);
-     if (sink)
-@@ -209,7 +251,11 @@ no_elements:
- no_pipeline:
-   {
-     gst_object_unref (src);
-+    if (vcrop)
-+      gst_object_unref (vcrop);
-     gst_object_unref (csp);
-+    if (csp2)
-+      gst_object_unref (csp2);
-     gst_object_unref (vscale);
-     gst_object_unref (sink);
- 
-@@ -282,7 +328,8 @@ gst_video_convert_sample (GstSample * sample, const GstCaps * to_caps,
-   }
- 
-   pipeline =
--      build_convert_frame_pipeline (&src, &sink, from_caps, to_caps_copy, &err);
-+      build_convert_frame_pipeline (&src, &sink, from_caps,
-+      gst_buffer_get_video_crop_meta (buf), to_caps_copy, &err);
-   if (!pipeline)
-     goto no_pipeline;
- 
-@@ -646,8 +693,8 @@ gst_video_convert_sample_async (GstSample * sample,
-   }
- 
-   pipeline =
--      build_convert_frame_pipeline (&src, &sink, from_caps, to_caps_copy,
--      &error);
-+      build_convert_frame_pipeline (&src, &sink, from_caps,
-+      gst_buffer_get_video_crop_meta (buf), to_caps_copy, &error);
-   if (!pipeline)
-     goto no_pipeline;
- 
--- 
-2.5.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
index 3256717..5341e3c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
@@ -17,7 +17,7 @@ diff --git a/gst/encoding/gstencodebin.c b/gst/encoding/gstencodebin.c
 index 6728e58..32daae4 100644
 --- a/gst/encoding/gstencodebin.c
 +++ b/gst/encoding/gstencodebin.c
-@@ -1138,8 +1138,7 @@ _create_stream_group (GstEncodeBin * ebin, GstEncodingProfile * sprof,
+@@ -1228,8 +1228,7 @@ _create_stream_group (GstEncodeBin * ebin, GstEncodingProfile * sprof,
     * We only use a 1buffer long queue here, the actual queueing will be done
     * in the input queue */
    last = sgroup->outqueue = gst_element_factory_make ("queue", NULL);
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
index 284abbe..c8e6287 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/get-caps-from-src-pad-when-query-caps.patch
@@ -19,7 +19,7 @@ new mode 100755
 index 9b6c478..ae2294a
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
-@@ -1708,6 +1708,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
+@@ -1769,6 +1769,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
        }
        break;
      }
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
index 01e944d..413eff0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
@@ -25,8 +25,8 @@ diff --git a/configure.ac b/configure.ac
 index 9c52aeb..26cacd6 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -747,9 +747,16 @@ AC_SUBST(FT2_CFLAGS)
- AC_SUBST(FT2_LIBS)
+@@ -752,9 +752,16 @@ AC_SUBST(FT2_CFLAGS)
+ fi dnl of EXT plugins
  
  dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
 +AC_ARG_ENABLE([gio_unix_2_0],
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.1.bb
similarity index 58%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.1.bb
index 429dc93..c3bf2b1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.6.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.8.1.bb
@@ -4,22 +4,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
-# Note: The dependency on freetype was dropped shortly after the 1.7.1 release
-# so these lines should be removed during the update to 1.8.x
-# http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031
-DEPENDS += "freetype"
-EXTRA_OECONF += "--disable-freetypetest"
-
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${PV}.tar.xz \
     file://get-caps-from-src-pad-when-query-caps.patch \
     file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
     file://0004-subparse-set-need_segment-after-sink-pad-received-GS.patch \
     file://encodebin-Need-more-buffers-in-output-queue-for-bett.patch \
-    file://0005-convertframe-Support-video-crop-when-convert-frame.patch \
+    file://make-gio_unix_2_0-dependency-configurable.patch \
 "
 
-SRC_URI[md5sum] = "3ddde0ad598ef69f58d6a2e87f8b460f"
-SRC_URI[sha256sum] = "b6154f8fdba4877e95efd94610ef0ada4f0171cd12eb829a3c3c97345d9c7a75"
+SRC_URI[md5sum] = "5421edfeb7479d5f5776e917ba30e24e"
+SRC_URI[sha256sum] = "15a9de985cd265c344e359f5b19347df4021b7611ed2c2d91917cb900f2fad6f"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
2.5.0


