Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 45CF1785DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 21:37:10 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 143E74A412
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 23:37:10 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Aug 2017 23:36:51 +0200
Message-Id: <1502487421-18235-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 00/10] gstreamer 1.x: upgrade to 1.12.2
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
X-List-Received-Date: Fri, 11 Aug 2017 21:37:10 -0000

This set of patches upgrades the GStreamer 1.x recipes to
version 1.12.2. It is bsed on Maxin B. John's 1.12.1
upgrades, which in turn were based on the original
proposed patches for an upgrade to 1.12.0.

GStreamer is moving towards meson as the primary build
system. However, OE's support for meson is not ready yet,
so we stick with autoconf for now.

These patches do not touch gst-player, since this one
requires updates to libva, which needs to be updated.
This update is beyond the scope of this patchset. Once
libva is updated, the workaround patch [YOCTO #11437]
could be removed.

 ...ideobufferpool-create-allocator-if-needed.patch |  61 --
 ...ibav_1.10.4.bb => gstreamer1.0-libav_1.12.2.bb} |   4 +-
 .../gstreamer/gstreamer1.0-meta-base.bb            |   2 +-
 ....0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.2.bb} |   4 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  30 +-
 ...-don-t-hardcode-libtool-name-when-running.patch |  60 +-
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  42 +-
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  21 +-
 ...1-mssdemux-improved-live-playback-support.patch | 929 ---------------------
 ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ----
 ...ming-use-the-duration-from-the-list-of-fr.patch |  62 --
 ....10.4.bb => gstreamer1.0-plugins-bad_1.12.2.bb} |  11 +-
 ...eed-more-buffers-in-output-queue-for-bett.patch |  32 -
 ...10.4.bb => gstreamer1.0-plugins-base_1.12.2.bb} |   5 +-
 ...Also-add-videometa-if-there-is-padding-to.patch |  35 -
 ...10.4.bb => gstreamer1.0-plugins-good_1.12.2.bb} |   8 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |   1 -
 ...10.4.bb => gstreamer1.0-plugins-ugly_1.12.2.bb} |   4 +-
 ...hon_1.10.4.bb => gstreamer1.0-python_1.12.2.bb} |   4 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb   |   6 -
 .../gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb   |   6 +
 .../gstreamer/gstreamer1.0-vaapi.inc               |  13 +-
 .../gstreamer/gstreamer1.0-vaapi_1.10.4.bb         |   7 -
 .../gstreamer/gstreamer1.0-vaapi_1.12.2.bb         |   5 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   2 +-
 ...dd-switches-for-enabling-disabling-libdw-.patch |  70 ++
 .../gstreamer1.0/deterministic-unwind.patch        |  24 -
 ...treamer1.0_1.10.4.bb => gstreamer1.0_1.12.2.bb} |   6 +-
 28 files changed, 201 insertions(+), 1436 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.2.bb} (88%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.2.bb} (69%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.4.bb => gstreamer1.0-plugins-bad_1.12.2.bb} (65%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.4.bb => gstreamer1.0-plugins-base_1.12.2.bb} (78%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.2.bb} (77%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.2.bb} (76%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.10.4.bb => gstreamer1.0-python_1.12.2.bb} (57%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.2.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.2.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-configure-Add-switches-for-enabling-disabling-libdw-.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/deterministic-unwind.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.4.bb => gstreamer1.0_1.12.2.bb} (59%)

-- 
2.7.4


