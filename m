Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 07D2978247
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 14:56:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Jun 2017 07:56:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,287,1496127600"; d="scan'208";a="873503058"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2017 07:56:09 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D0BF55800C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 07:56:08 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 17:56:10 +0300
Message-Id: <1498834581-12279-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 00/11] gstreamer: upgrade to 1.12.1
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
X-List-Received-Date: Fri, 30 Jun 2017 14:56:12 -0000

Upgrade gstreamer to 1.12.1

Also upgrade libva to 1.8.3. This upgrade helps us to remove
the workaround patch in gst-player - [YOCTO #11437]

We "should" move to the new home of gst-player and upgrade it:
https://cgit.freedesktop.org/gstreamer/gst-examples

However, the buildsystem of gst-player moved to meson.
Waiting for meson to be in oe-core for this transition.

Thanks to Carlos Rafael Giani for his gstreamer 1.12.0 upgrade
patches which were used as a base for this upgrade.

Maxin B. John (11):
  libva: upgrade to 1.8.3
  gst-player: remove workaround which disable visualizations
  gstreamer1.0: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-plugins-base: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-plugins-good: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-plugins-ugly: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-rtsp-server: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-omx: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-libav: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-vaapi: upgrade 1.10.4 -> 1.12.1
  gstreamer1.0-plugins-bad: upgrade 1.10.4 -> 1.12.1

 ...-configure.ac-Use-wayland-scanner-in-PATH.patch |  37 -
 ...and-Don-t-commit-and-ship-generated-files.patch | 339 --------
 .../libva/{libva_1.7.3.bb => libva_1.8.3.bb}       |   8 +-
 .../0001-gtk-play-Disable-visualizations.patch     |  59 --
 ...error-signal-emission-for-missing-plugins.patch | 252 ------
 .../gstreamer/gst-player/Fix-pause-play.patch      | 107 ---
 .../gstreamer/gst-player/filechooser.patch         |  54 --
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   4 -
 ...ideobufferpool-create-allocator-if-needed.patch |  61 --
 ...ibav_1.10.4.bb => gstreamer1.0-libav_1.12.1.bb} |   4 +-
 ....0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.1.bb} |   4 +-
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |  24 +-
 ...-don-t-hardcode-libtool-name-when-running.patch |  60 +-
 ...G_CONFIG_SYSROOT_DIR-to-pkg-config-output.patch |  42 +-
 ...gl.pc.in-don-t-append-GL_CFLAGS-to-CFLAGS.patch |  21 +-
 ...1-mssdemux-improved-live-playback-support.patch | 929 ---------------------
 ...ming-implement-adaptivedemux-s-get_live_s.patch | 183 ----
 ...ming-use-the-duration-from-the-list-of-fr.patch |  62 --
 ....10.4.bb => gstreamer1.0-plugins-bad_1.12.1.bb} |  11 +-
 ...eed-more-buffers-in-output-queue-for-bett.patch |  32 -
 ...10.4.bb => gstreamer1.0-plugins-base_1.12.1.bb} |   5 +-
 ...Also-add-videometa-if-there-is-padding-to.patch |  35 -
 ...10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} |   5 +-
 .../gstreamer/gstreamer1.0-plugins-ugly.inc        |   1 -
 ...10.4.bb => gstreamer1.0-plugins-ugly_1.12.1.bb} |   4 +-
 .../gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb   |   6 -
 .../gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb   |   6 +
 .../gstreamer/gstreamer1.0-vaapi_1.10.4.bb         |   7 -
 .../gstreamer/gstreamer1.0-vaapi_1.12.1.bb         |   5 +
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 -
 .../gstreamer1.0/deterministic-unwind.patch        |  29 +-
 ...treamer1.0_1.10.4.bb => gstreamer1.0_1.12.1.bb} |   4 +-
 32 files changed, 135 insertions(+), 2266 deletions(-)
 delete mode 100644 meta/recipes-graphics/libva/files/0001-configure.ac-Use-wayland-scanner-in-PATH.patch
 delete mode 100644 meta/recipes-graphics/libva/files/0001-wayland-Don-t-commit-and-ship-generated-files.patch
 rename meta/recipes-graphics/libva/{libva_1.7.3.bb => libva_1.8.3.bb} (88%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/0001-gtk-play-Disable-visualizations.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Add-error-signal-emission-for-missing-plugins.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/Fix-pause-play.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/filechooser.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer-vaapi/vaapivideobufferpool-create-allocator-if-needed.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.10.4.bb => gstreamer1.0-libav_1.12.1.bb} (88%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.10.4.bb => gstreamer1.0-omx_1.12.1.bb} (69%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-mssdemux-improved-live-playback-support.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.10.4.bb => gstreamer1.0-plugins-bad_1.12.1.bb} (61%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/encodebin-Need-more-buffers-in-output-queue-for-bett.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.10.4.bb => gstreamer1.0-plugins-base_1.12.1.bb} (78%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2object-Also-add-videometa-if-there-is-padding-to.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.10.4.bb => gstreamer1.0-plugins-good_1.12.1.bb} (78%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.10.4.bb => gstreamer1.0-plugins-ugly_1.12.1.bb} (76%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.12.1.bb
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.10.4.bb
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.12.1.bb
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.10.4.bb => gstreamer1.0_1.12.1.bb} (72%)

-- 
2.4.0


