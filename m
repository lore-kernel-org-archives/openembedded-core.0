Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 109B378973
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053734"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:00 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:34 +0200
Message-Id: <20180308181804.31261-12-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/42] gstreamer: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:00 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../configure-allow-to-disable-libssh2.patch       |  17 ++-
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 135 ++++++++++-----------
 2 files changed, 73 insertions(+), 79 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
index d52afd5d57b..ad863298938 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
@@ -18,11 +18,11 @@ Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
  configure.ac |   23 +++++++++++++++++------
  1 file changed, 17 insertions(+), 6 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 0e95c5c..12153b4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1901,6 +1901,15 @@ AG_GST_CHECK_FEATURE(CHROMAPRINT, [chromaprint], chromaprint, [
+Index: gst-plugins-bad-1.12.3/configure.ac
+===================================================================
+--- gst-plugins-bad-1.12.3.orig/configure.ac
++++ gst-plugins-bad-1.12.3/configure.ac
+@@ -2139,6 +2139,15 @@ AG_GST_CHECK_FEATURE(CHROMAPRINT, [chrom
  ])
  
  dnl *** Curl ***
@@ -37,8 +37,8 @@ index 0e95c5c..12153b4 100644
 +
  translit(dnm, m, l) AM_CONDITIONAL(USE_CURL, true)
  AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
-   PKG_CHECK_MODULES(CURL, libcurl >= 7.21.0, [
-@@ -1915,12 +1924,14 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
+   PKG_CHECK_MODULES(CURL, libcurl >= 7.35.0, [
+@@ -2161,12 +2170,14 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin]
    ])
    AC_SUBST(CURL_CFLAGS)
    AC_SUBST(CURL_LIBS)
@@ -59,6 +59,3 @@ index 0e95c5c..12153b4 100644
    AM_CONDITIONAL(USE_SSH2, test "x$HAVE_SSH2" = "xyes")
    AC_SUBST(SSH2_CFLAGS)
    AC_SUBST(SSH2_LIBS)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
index 0a8bc9b076d..6616e2cf0d7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
@@ -20,11 +20,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  gst-libs/gst/video/Makefile.am      |  8 ++++----
  11 files changed, 38 insertions(+), 38 deletions(-)
 
-diff --git a/gst-libs/gst/allocators/Makefile.am b/gst-libs/gst/allocators/Makefile.am
-index bc7f53a..0ef5f86 100644
---- a/gst-libs/gst/allocators/Makefile.am
-+++ b/gst-libs/gst/allocators/Makefile.am
-@@ -35,7 +35,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstallocators-@
+Index: gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/allocators/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/allocators/Makefile.am
+@@ -36,7 +36,7 @@ GstAllocators-@GST_API_VERSION@.gir: $(I
  		--c-include "gst/allocators/allocators.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -33,7 +33,7 @@ index bc7f53a..0ef5f86 100644
  		--library=libgstallocators-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--libtool="$(LIBTOOL)" \
-@@ -59,7 +59,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -60,7 +60,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -42,11 +42,11 @@ index bc7f53a..0ef5f86 100644
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/app/Makefile.am b/gst-libs/gst/app/Makefile.am
-index dcc2fe0..dc076cb 100644
---- a/gst-libs/gst/app/Makefile.am
-+++ b/gst-libs/gst/app/Makefile.am
-@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstapp-@GST_API_VERSIO
+Index: gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/app/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/app/Makefile.am
+@@ -48,8 +48,8 @@ GstApp-@GST_API_VERSION@.gir: $(INTROSPE
  		--c-include "gst/app/app.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -57,11 +57,11 @@ index dcc2fe0..dc076cb 100644
  		--library=libgstapp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-diff --git a/gst-libs/gst/audio/Makefile.am b/gst-libs/gst/audio/Makefile.am
-index 2374196..295eb42 100644
---- a/gst-libs/gst/audio/Makefile.am
-+++ b/gst-libs/gst/audio/Makefile.am
-@@ -106,12 +106,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstaudio-@GST_API_VE
+Index: gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/audio/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/audio/Makefile.am
+@@ -167,12 +167,12 @@ GstAudio-@GST_API_VERSION@.gir: $(INTROS
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
  		--c-include "gst/audio/audio.h" \
@@ -78,7 +78,7 @@ index 2374196..295eb42 100644
  		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -140,8 +140,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -201,8 +201,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
  		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
@@ -89,11 +89,11 @@ index 2374196..295eb42 100644
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/fft/Makefile.am b/gst-libs/gst/fft/Makefile.am
-index f545354..1bb6243 100644
---- a/gst-libs/gst/fft/Makefile.am
-+++ b/gst-libs/gst/fft/Makefile.am
-@@ -62,7 +62,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstfft-@GST_API_VERSIO
+Index: gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/fft/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/fft/Makefile.am
+@@ -63,7 +63,7 @@ GstFft-@GST_API_VERSION@.gir: $(INTROSPE
  		--c-include "gst/fft/fft.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -102,7 +102,7 @@ index f545354..1bb6243 100644
  		--library=libgstfft-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--libtool="$(LIBTOOL)" \
-@@ -86,7 +86,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -87,7 +87,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -111,11 +111,11 @@ index f545354..1bb6243 100644
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/pbutils/Makefile.am b/gst-libs/gst/pbutils/Makefile.am
-index 91dc214..dc8e1d3 100644
---- a/gst-libs/gst/pbutils/Makefile.am
-+++ b/gst-libs/gst/pbutils/Makefile.am
-@@ -84,14 +84,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstpbutils-@GST_AP
+Index: gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/pbutils/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/pbutils/Makefile.am
+@@ -85,14 +85,14 @@ GstPbutils-@GST_API_VERSION@.gir: $(INTR
  		--c-include "gst/pbutils/pbutils.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -134,7 +134,7 @@ index 91dc214..dc8e1d3 100644
  		--library-path="$(top_builddir)/gst-libs/gst/tag/" \
  		--library-path="$(top_builddir)/gst-libs/gst/video/" \
  		--library-path="$(top_builddir)/gst-libs/gst/audio/" \
-@@ -124,8 +124,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -125,8 +125,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -145,11 +145,11 @@ index 91dc214..dc8e1d3 100644
  		--includedir="$(top_builddir)/gst-libs/gst/tag/" \
  		--includedir="$(top_builddir)/gst-libs/gst/video/" \
  		--includedir="$(top_builddir)/gst-libs/gst/audio/" \
-diff --git a/gst-libs/gst/riff/Makefile.am b/gst-libs/gst/riff/Makefile.am
-index 3bd8fc0..0a115cc 100644
---- a/gst-libs/gst/riff/Makefile.am
-+++ b/gst-libs/gst/riff/Makefile.am
-@@ -41,8 +41,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
+Index: gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/riff/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/riff/Makefile.am
+@@ -42,8 +42,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
  #		--c-include "gst/riff/riff.h" \
  #		--add-include-path=$(builddir)/../tag \
  #		--add-include-path=$(builddir)/../audio \
@@ -160,7 +160,7 @@ index 3bd8fc0..0a115cc 100644
  #		--library=libgstriff-@GST_API_VERSION@.la \
  #		--include=GstAudio-@GST_API_VERSION@ \
  #		--include=GstTag-@GST_API_VERSION@ \
-@@ -73,8 +73,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS = $(GST_LIB_LDFLAGS) $(GST_ALL_LDFLAGS)
+@@ -74,8 +74,8 @@ libgstriff_@GST_API_VERSION@_la_LDFLAGS
  #		--includedir=$(builddir) \
  #		--includedir=$(builddir)/../tag \
  #		--includedir=$(builddir)/../audio \
@@ -171,11 +171,11 @@ index 3bd8fc0..0a115cc 100644
  #		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  #
  #CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/rtp/Makefile.am b/gst-libs/gst/rtp/Makefile.am
-index f5445c1..527c0b4 100644
---- a/gst-libs/gst/rtp/Makefile.am
-+++ b/gst-libs/gst/rtp/Makefile.am
-@@ -60,8 +60,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtp-@GST_API_VERSIO
+Index: gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtp/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/rtp/Makefile.am
+@@ -61,8 +61,8 @@ GstRtp-@GST_API_VERSION@.gir: $(INTROSPE
  		--c-include "gst/rtp/rtp.h" \
  		-I$(top_builddir)/gst-libs \
  		-I$(top_srcdir)/gst-libs \
@@ -186,7 +186,7 @@ index f5445c1..527c0b4 100644
  		--library=libgstrtp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -88,8 +88,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -89,8 +89,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -197,11 +197,11 @@ index f5445c1..527c0b4 100644
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/rtsp/Makefile.am b/gst-libs/gst/rtsp/Makefile.am
-index 9b0b258..4f6d9f8 100644
---- a/gst-libs/gst/rtsp/Makefile.am
-+++ b/gst-libs/gst/rtsp/Makefile.am
-@@ -67,7 +67,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstrtsp-@GST_API_VERS
+Index: gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/rtsp/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/rtsp/Makefile.am
+@@ -68,7 +68,7 @@ GstRtsp-@GST_API_VERSION@.gir: $(INTROSP
  		-I$(top_builddir)/gst-libs \
  		-I$(top_srcdir)/gst-libs \
  		--add-include-path=$(builddir)/../sdp \
@@ -210,7 +210,7 @@ index 9b0b258..4f6d9f8 100644
  		--library=libgstrtsp-@GST_API_VERSION@.la \
  		--include=Gio-2.0 \
  		--include=Gst-@GST_API_VERSION@ \
-@@ -97,7 +97,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -98,7 +98,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
  		--includedir=$(builddir)/../sdp \
@@ -219,11 +219,11 @@ index 9b0b258..4f6d9f8 100644
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/sdp/Makefile.am b/gst-libs/gst/sdp/Makefile.am
-index 0e149b8..9aa0512 100644
---- a/gst-libs/gst/sdp/Makefile.am
-+++ b/gst-libs/gst/sdp/Makefile.am
-@@ -29,7 +29,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstsdp-@GST_API_VERSIO
+Index: gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/sdp/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/sdp/Makefile.am
+@@ -30,7 +30,7 @@ GstSdp-@GST_API_VERSION@.gir: $(INTROSPE
  		--warn-all \
  		--c-include "gst/sdp/sdp.h" \
  		-I$(top_srcdir)/gst-libs \
@@ -232,7 +232,7 @@ index 0e149b8..9aa0512 100644
  		--library=libgstsdp-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--libtool="$(LIBTOOL)" \
-@@ -53,7 +53,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -54,7 +54,7 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -241,11 +241,11 @@ index 0e149b8..9aa0512 100644
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/tag/Makefile.am b/gst-libs/gst/tag/Makefile.am
-index cafafd3..ba99279 100644
---- a/gst-libs/gst/tag/Makefile.am
-+++ b/gst-libs/gst/tag/Makefile.am
-@@ -40,8 +40,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgsttag-@GST_API_VERSIO
+Index: gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/tag/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/tag/Makefile.am
+@@ -59,8 +59,8 @@ GstTag-@GST_API_VERSION@.gir: $(INTROSPE
  		--c-include "gst/tag/tag.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -256,7 +256,7 @@ index cafafd3..ba99279 100644
  		--library=libgsttag-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -68,8 +68,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -87,8 +87,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -266,12 +266,12 @@ index cafafd3..ba99279 100644
 +		--includedir=$(PKG_CONFIG_SYSROOT_DIR)`PKG_CONFIG_PATH="$(GST_PKG_CONFIG_PATH)" $(PKG_CONFIG) --variable=girdir gstreamer-base-@GST_API_VERSION@` \
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
- CLEANFILES = $(BUILT_GIRSOURCES) $(typelibs_DATA)
-diff --git a/gst-libs/gst/video/Makefile.am b/gst-libs/gst/video/Makefile.am
-index ac64eb3..342c8c6 100644
---- a/gst-libs/gst/video/Makefile.am
-+++ b/gst-libs/gst/video/Makefile.am
-@@ -111,8 +111,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROSPECTION_SCANNER) libgstvideo-@GST_API_VE
+ CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
+Index: gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
+===================================================================
+--- gst-plugins-base-1.12.3.orig/gst-libs/gst/video/Makefile.am
++++ gst-plugins-base-1.12.3/gst-libs/gst/video/Makefile.am
+@@ -116,8 +116,8 @@ GstVideo-@GST_API_VERSION@.gir: $(INTROS
  		--c-include "gst/video/video.h" \
  		-I$(top_srcdir)/gst-libs \
  		-I$(top_builddir)/gst-libs \
@@ -282,7 +282,7 @@ index ac64eb3..342c8c6 100644
  		--library=libgstvideo-@GST_API_VERSION@.la \
  		--include=Gst-@GST_API_VERSION@ \
  		--include=GstBase-@GST_API_VERSION@ \
-@@ -139,8 +139,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=.typelib)
+@@ -144,8 +144,8 @@ typelibs_DATA = $(BUILT_GIRSOURCES:.gir=
  		$(INTROSPECTION_COMPILER) \
  		--includedir=$(srcdir) \
  		--includedir=$(builddir) \
@@ -293,6 +293,3 @@ index ac64eb3..342c8c6 100644
  		$(INTROSPECTION_COMPILER_OPTS) $< -o $(@F)
  
  CLEANFILES += $(BUILT_GIRSOURCES) $(typelibs_DATA)
--- 
-2.6.2
-
-- 
2.16.1


