Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB874D12D66
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.82723.1731403506148927034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TRMGn83t;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403506; x=1762939506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ue6A3Vw3rgyXbVfXZyvJM2bIXjyJ11XJpjNzdDXtDzw=;
  b=TRMGn83tfIT4gA8XsOQnHzxTa50edjLN2YjEwtpPVNuH4ap3txFv8/b8
   FyuUZI7MV/+NVkqt/cGAl3uo0gtrMG5J/dPkJGF5on11VYUwTDZbAvhwe
   /2Cb0YI9dcaccPYiUGDDJfZBLhbPP7tNe+iFU1Yly2V3Lrake1mGIkgX0
   lNV+Xgz/8R952uqIRHJqT5IXUhGzSinjS60vg61EVQOv2u/ZIDylnz5/O
   CHWpmBqzaZgCu4FXtH9jCoiP9yuAWCmmtEbZFOl6MzqWjrrje+9eRMhai
   zRLG7ORCfERBQmmwDCd2aFJX330cy5MPx3E/iC+S9ni1sPmzDxDR3TMR0
   g==;
X-CSE-ConnectionGUID: N4FhiDbNTtS0ayjPtXbCFg==
X-CSE-MsgGUID: VoOPOrZdRwOVt3NWge6RnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="179257923"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="179257923"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:04 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 21C01D6473
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:02 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id A43CDE498B
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 35A836B830
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D7CAC1A000A;
	Tue, 12 Nov 2024 17:25:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/47] gstreamer1.0: upgrade 1.24.6 -> 1.24.9
Date: Tue, 12 Nov 2024 17:24:05 +0800
Message-Id: <1731403483-21399-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--10.594300-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDtnf
	JrUSEbFDP46Tp/2BSUWK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21MH
	E1ZBVFp8J2N6lvoKB0nXIgk8p/5aKMd4NQY217Mj4vYawCsCC2lrhZu06i+Hh3ymqV5Ai0QURlz
	Zw9jZp3Rzvql+7qIAxi6S94dv5Qu/Not95wtWvJkhwlOfYeSqxfS0Ip2eEHnyFh/DzryTTliKS9
	1Lk9yYojoczmuoPCq2h4Oxlnm0jOSWG1IYh9y84m/EzZhuUnnP86H0P9/H5y6L1IXEy67uB
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206996

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://gstreamer.freedesktop.org/releases/1.24/#1.24.9

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.24.6.bb => gst-devtools_1.24.9.bb}          | 2 +-
 ...streamer1.0-libav_1.24.6.bb => gstreamer1.0-libav_1.24.9.bb} | 2 +-
 ...plugins-bad_1.24.6.bb => gstreamer1.0-plugins-bad_1.24.9.bb} | 2 +-
 ...ugins-base_1.24.6.bb => gstreamer1.0-plugins-base_1.24.9.bb} | 2 +-
 ...ugins-good_1.24.6.bb => gstreamer1.0-plugins-good_1.24.9.bb} | 2 +-
 ...ugins-ugly_1.24.6.bb => gstreamer1.0-plugins-ugly_1.24.9.bb} | 2 +-
 ...reamer1.0-python_1.24.6.bb => gstreamer1.0-python_1.24.9.bb} | 2 +-
 ...rtsp-server_1.24.6.bb => gstreamer1.0-rtsp-server_1.24.9.bb} | 2 +-
 ...streamer1.0-vaapi_1.24.6.bb => gstreamer1.0-vaapi_1.24.9.bb} | 2 +-
 .../{gstreamer1.0_1.24.6.bb => gstreamer1.0_1.24.9.bb}          | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.6.bb => gst-devtools_1.24.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.6.bb => gstreamer1.0-libav_1.24.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.6.bb => gstreamer1.0-plugins-bad_1.24.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.6.bb => gstreamer1.0-plugins-base_1.24.9.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.6.bb => gstreamer1.0-plugins-good_1.24.9.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.6.bb => gstreamer1.0-plugins-ugly_1.24.9.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.6.bb => gstreamer1.0-python_1.24.9.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.6.bb => gstreamer1.0-rtsp-server_1.24.9.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.6.bb => gstreamer1.0-vaapi_1.24.9.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.6.bb => gstreamer1.0_1.24.9.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
index 1b448f7c55..63779b5aff 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8beb9e98ed136c29f4ec10396dd6c8708a5645cdacda90af1b7196057de17672"
+SRC_URI[sha256sum] = "cf1de1aafa6eb4fd0365932b251528e2340b88697541e021628c5f7259970fb8"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
index 4036006551..a5cfc8632a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4bbd08481a390f907e342aa3f25ab885c80ec0a53f3b14244cf733cc8622f2bf"
+SRC_URI[sha256sum] = "32682e9ae508ee01f4fb134b3a520081e2ac007220997577624b1d16171d456c"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
index 48e6955039..be2628d14a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "8f4d965513e7827c1f547c1e749e4ef2812b371974fe64857fe5029a19c5b64c"
+SRC_URI[sha256sum] = "36fcf7a9af0a753b43bb03b9835246f74d72f7124369e66a1e2dc7b04f5a5cab"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
index 7c3390d52d..996a06500e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "cf52b535a0ce7ec974756891818f34f06317c2e136abb24149e18c23ecc229b5"
+SRC_URI[sha256sum] = "5bb3b946907d3ce04dd842b610c8111c2b0611351b25a1fa22af5efa897857cb"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
index 9d93ca0967..95f03b1da2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "996b9c8d1d246ed43be304718b6086e5a17d4ae8114d1920aed9ea75b920ba2d"
+SRC_URI[sha256sum] = "897de50bff337e3ca2f86f1eaa28e0828d83024156162a50c4ea0af86e29799f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
index 7b7de75dac..45abe68659 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "5dfdbb2978ab282e637255cd875cf5b7b93fc83db62f8a0b1af02c85c84a75c4"
+SRC_URI[sha256sum] = "4b6b30110f38cd05eb67422297142b75a55fe00003105f48b13603e6761cc3b6"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
index cf38c2b876..25c9179bfd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "692e88820e097b30e5f92d37d0955c709a0a17b27f874a1907405244825bd700"
+SRC_URI[sha256sum] = "80e61d587c34cbac79e46c927b71cf32c4bf9bb0868ce5aa4b7444bdad83f42e"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
index cdb74afbfc..776e177b9f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b0bdda26173f13f5521c829367963824a74fd0ce8f52bcab674d7e727f74e93c"
+SRC_URI[sha256sum] = "299c9aafac3c91bbebe4cd481ed4e4ade8cb2b0677097bc4a8dcf6d4364c9804"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
index 015eb86316..bdcf3fb707 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b5caa057e7efc51cd70504a59e5d9c7a5406d8268723c8283dd61be27fd8cacc"
+SRC_URI[sha256sum] = "c2373e9b4d6655535d355207f60084b0fb3b28566fe9bb4ca1da714439da4ae1"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
index 71ff327675..a756f9e3a2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.6.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "64342060d7c6f9e36a35e3be38a4f5ac3b41ed93b0853619be45141ef3cc1b9d"
+SRC_URI[sha256sum] = "ebf47b6beef508a00c8557d4c1f1713e5c7ef9ba70dac45deed80e182bcf260f"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


