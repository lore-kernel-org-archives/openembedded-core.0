Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC4C76AD79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 01:42:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5O1gp9F020160
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 18:42:51 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 23 Jun 2013 18:42:49 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2013 09:44:55 +0800
Message-ID: <c1332662cc65063768a11224a0b356c4a162413d.1372038244.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1372038244.git.sen.zhang@windriver.com>
References: <cover.1372038244.git.sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gst-ffmpeg: fix libav config error for ppc
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
X-List-Received-Date: Mon, 24 Jun 2013 01:42:48 -0000
Content-Type: text/plain

Pass --cpu to libav config when we're building ppc, or else there are
errors like:

    You need a compiler that supports {} in AltiVec vector declarations.

Also patch libav configure to have knowledge of more ppc CPUs.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 .../gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch    | 19 +++++++++++++++++++
 .../gstreamer/gst-ffmpeg_0.10.13.bb                   |  7 ++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch
new file mode 100644
index 0000000..d9ea2c2
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/libav_e5500.patch
@@ -0,0 +1,19 @@
+libav: Add configs for ppc e5500
+
+Upstream-Status: Pending
+
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
+
+--- gst-ffmpeg-0.10.13/gst-libs/ext/libav/configure	2013-06-20 05:18:36.073104964 -0400
++++ gst-ffmpeg-0.10.13/gst-libs/ext/libav/configure	2013-06-20 05:18:38.269104150 -0400
+@@ -2222,6 +2222,10 @@
+             cpuflags="-mcpu=8540 -mhard-float"
+             disable altivec
+         ;;
++        e5500)
++            cpuflags="-mcpu=e5500 -mhard-float"
++            disable altivec
++        ;;
+     esac
+ 
+ elif enabled x86; then
diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 2107704..8605ca4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://configure-fix.patch \
            file://h264_qpel_mmx.patch \
            file://libav_e500mc.patch \
+           file://libav_e5500.patch \
 "
 
 SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
@@ -31,7 +32,11 @@ PR = "r4"
 GSTREAMER_DEBUG ?= "--disable-debug"
 
 FFMPEG_EXTRA_CONFIGURE = "--with-ffmpeg-extra-configure"
-FFMPEG_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
+# pass --cpu for powerpc. get cpu name by stripping "ppc" or "ppc64"
+# from DEFAULTTUNE
+FFMPEG_CPU_powerpc = "--cpu=${@d.getVar('DEFAULTTUNE')[3:]}"
+FFMPEG_CPU_powerpc64 = "--cpu=${@d.getVar('DEFAULTTUNE')[5:]}"
+FFMPEG_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux ${FFMPEG_CPU} \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
   --ranlib='${RANLIB}' \
   ${GSTREAMER_DEBUG}"
-- 
1.7.11.7


