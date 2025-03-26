Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C0AC36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 03:57:45 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.14547.1742961463796483593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 20:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b9bp1y66;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742961464; x=1774497464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S0e9pDv/yQTVlZoGXbPfvtKccfwBfJ1p2mlooiGHvl4=;
  b=b9bp1y66Rck5fTDw7ZMbsU7mehE/0sNf1vtyBlcK/FoAEjQzX83A7wkW
   NXDguwrZmJR5uOJvGGK/AzpiY0yRhGKGBq5i23YIR/GPGcTDrXmrCkOQI
   ssgaaFD0AK3g/8hk/m3holDN7Izhs2Whi5rNvPH/IQmKtEK1KWwg9igkZ
   snYF+5hb825FSV3VW2nW5aGZpNhgJsBJ1VfoVpPcvFbqs/JWVnH5joK+O
   TCaUrg94Bzvtis+RD7ULQEzwNatwxu5bKv+gSK4WEOv7kN0WJk/TUgrCM
   /6G6y6aUKUgqZHkf6VRc0RlCtXoDw/xY4H7Y0oQMI3MDKaVWCkUwh8EBu
   Q==;
X-CSE-ConnectionGUID: u/cwtPlMRBOADsNRddpekA==
X-CSE-MsgGUID: hdztG0a/SpCdiD63qG+zyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="194297643"
X-IronPort-AV: E=Sophos;i="6.14,276,1736780400"; 
   d="scan'208";a="194297643"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:57:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 31670D4807
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EB47CD6FE3
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:38 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8F3C61A0078;
	Wed, 26 Mar 2025 11:57:38 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 7/7] gstreamer1.0-{plugins-bad, python}: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 11:56:39 +0800
Message-Id: <20250326035639.1919-7-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326035639.1919-1-leimaohui@fujitsu.com>
References: <20250326035639.1919-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 03:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213631

Couple these two together since 1.26.0 version of gstpython add depends on "analytics" plugin of gstbad

When build 1.26.0 gstreamer1.0-python, issue occurs:
  |../../../../../../workspace/sources/gstreamer1.0-python/meson.build:23:13: ERROR: Dependency "gstreamer-analytics-1.0" not found, tried pkgconfig

Source code:
  | $ vi  workspace/sources/gstreamer1.0-python/meson.build
  | 23 gstbad_dep = dependency('gstreamer-analytics-1.0', version :gst_req,
  | 24   fallback : [])

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...ns-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.26.0.bb} | 6 +++---
 ...r1.0-python_1.24.12.bb => gstreamer1.0-python_1.26.0.bb} | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.26.0.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.26.0.bb} (88%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
index 91d9150359..53947efa15 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.0.bb
@@ -8,9 +8,8 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad/-/issues"
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
-           file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3d386af3d1dbd1a06c74a6251250c269b481e703f0e3255ba89ef6c1e063afea"
+SRC_URI[sha256sum] = "f8287a84c5f66368a5a50da5f969994a02c47f20220ffe1ca3154193e65af216"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
@@ -28,10 +27,11 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gl', '', d)} \
     bz2 closedcaption curl dash dtls hls openssl sbc smoothstreaming \
-    sndfile ttml uvch264 webp \
+    sndfile ttml uvch264 webp analytics \
     ${@bb.utils.contains('TUNE_FEATURES', 'mx32', '', 'rsvg', d)} \
 "
 
+PACKAGECONFIG[analytics]       = "-Danalyticsoverlay=enabled,-Danalyticsoverlay=disabled,"
 PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
 PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
 PACKAGECONFIG[avtp]            = "-Davtp=enabled,-Davtp=disabled,libavtp"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
similarity index 88%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
index f62cb159c2..04c96a879f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.0.bb
@@ -8,9 +8,9 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d679e2ca3e655a7328627c4670c324fc22f588d2cb8ecd2fa7a6a42df51132cc"
+SRC_URI[sha256sum] = "e5046a05d77abb15671ad01cd1908d17d62e5a06f5d7841be4342ade2a3fb8db"
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 
 PNREAL = "gst-python"
-- 
2.43.0


