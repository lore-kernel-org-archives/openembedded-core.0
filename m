Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A70BC2D0CF
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.64029.1718936233782481070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kxNPuIMd;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936238; x=1750472238;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ao/tF1feu22scIJNjfsCAYvspkLSSZBAiUyoERfZFeY=;
  b=kxNPuIMdF+KC46TR/5ezuUnEmXUYFbAVJLRB9xGMyZq98MoACosVrkIh
   N5p4q9banlsd+mkFw63+WaQKQWFlletbJFFwZcv1fZr2z6Vs6YqENN+UF
   xGa/LQHObh7bJVPnnRrpDmXoycRsneBX/sJ6ixZr87pqb454C3LLYtNV6
   lk+6wqtYNLYtJ7F5fznVT35OtON3T2zeLXck4gB4hZiY2zRnbr1Tj0lEm
   zF8JDuEPROZdkY1QXn2mn+/xTMLzazosZD+yd2FJEG0uobqdRKThtJljD
   rWrWbUGZbNVxcy4VUfxekUhWOnHQ11fCR49g8JriCopQ7E2TQTkBCUjUj
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="143508280"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="143508280"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:16 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A52D7D9231
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6F80D8B72
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7042020086E86
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 227ED1A0002;
	Fri, 21 Jun 2024 10:17:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/22] gstreamer: upgrade 1.24.3 -> 1.24.4
Date: Fri, 21 Jun 2024 10:16:36 +0800
Message-Id: <1718936206-8080-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--9.452300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDtnf
	JrUSEbFDP46Tp/2BSUWK8WnR386CVm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21MH
	E1ZBVFp8J2N6lvoKB0nXIgk8p/5aKYseW/o6DgKQyByMiwk6+3u9Bi8r8zoNMjCcYoCggokuaSd
	nmo1YceSCXC32XlLoP0u1S+8bZ2UF60j/UbRmWKJ4CIKY/Hg3Am4n49vyf9XFn6ODAQe+T/Sq2r
	l3dzGQ1XnC9tO7i0zjgQCuOM8OCci9LHaMu3rFCXkyFzBvRRV/z6L8tdFCt5w==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200975

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://gstreamer.freedesktop.org/releases/1.24

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gst-devtools_1.24.3.bb => gst-devtools_1.24.4.bb}          | 2 +-
 ...streamer1.0-libav_1.24.3.bb => gstreamer1.0-libav_1.24.4.bb} | 2 +-
 ...plugins-bad_1.24.3.bb => gstreamer1.0-plugins-bad_1.24.4.bb} | 2 +-
 ...ugins-base_1.24.3.bb => gstreamer1.0-plugins-base_1.24.4.bb} | 2 +-
 ...ugins-good_1.24.3.bb => gstreamer1.0-plugins-good_1.24.4.bb} | 2 +-
 ...ugins-ugly_1.24.3.bb => gstreamer1.0-plugins-ugly_1.24.4.bb} | 2 +-
 ...reamer1.0-python_1.24.3.bb => gstreamer1.0-python_1.24.4.bb} | 2 +-
 ...rtsp-server_1.24.3.bb => gstreamer1.0-rtsp-server_1.24.4.bb} | 2 +-
 ...streamer1.0-vaapi_1.24.3.bb => gstreamer1.0-vaapi_1.24.4.bb} | 2 +-
 .../{gstreamer1.0_1.24.3.bb => gstreamer1.0_1.24.4.bb}          | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.3.bb => gst-devtools_1.24.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.3.bb => gstreamer1.0-libav_1.24.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.3.bb => gstreamer1.0-plugins-bad_1.24.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.3.bb => gstreamer1.0-plugins-base_1.24.4.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.3.bb => gstreamer1.0-plugins-good_1.24.4.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.3.bb => gstreamer1.0-plugins-ugly_1.24.4.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.3.bb => gstreamer1.0-python_1.24.4.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.3.bb => gstreamer1.0-rtsp-server_1.24.4.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.3.bb => gstreamer1.0-vaapi_1.24.4.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.3.bb => gstreamer1.0_1.24.4.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
index 9df802afe9..eca0753cf2 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "b91114a2fd958f42acf441186e87e2bec93538ef35a9f8248111197360ffb237"
+SRC_URI[sha256sum] = "8bff1b388522e03d761786e61fe9aff1f9867b8f7cc230043cbb2622dcf6f0fe"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
index d468f2983c..dfd26f7df7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9c5b152468a45c1fa8351410422090a7192707ad74d2e1a4367f5254e188d91"
+SRC_URI[sha256sum] = "4d3803f36008e847fc4842c8dd366162baf8359526cc46c1851bf68bb638da73"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb
index ccb1a54456..c7fb9dc91a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch \
            "
-SRC_URI[sha256sum] = "e90f26c7dc9c76f4aa599b758cfd6d8c10d6a0b9cb265ba2c3c9bdf3888558f8"
+SRC_URI[sha256sum] = "260bd0a463b4faff9a42f41e5e028f787f10a92b779af8959aec64586f546bd3"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb
index 8a967cf6eb..bda9f3e737 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "f1094397eaa7932f06e57ebbb075aa33aa2c76e4b75630a16b02c8d4af46832e"
+SRC_URI[sha256sum] = "09f4ddf246eeb819da1494ce336316edbbcb28fdff3ee2f9804891e84df39b2a"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
index 41a93e85a4..48d5f9ce86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "150f914e61dc05600b68b88ca103c7cc227130158e389ea9ea159f4050a2ebb0"
+SRC_URI[sha256sum] = "023096d661cf58cde3e0dcdbf56897bf588830232358c305f3e15fd63e116626"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.4.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.4.bb
index 533de0234f..37f870be59 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.4.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "4c951341c4c648630b6fe1234ec113d81dd2d248529bf2b5478e0ad077c80ed3"
+SRC_URI[sha256sum] = "4604f8709c0bc4d6960ef6ae6fd91e0b20af011bfe22e103f5b85377cf3f1ef4"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
index 5fbf860741..6f05863486 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ecdb3e2ba94ea2c82b93a8c715d5a7e04f9726a8838c0a6b17694928fd1e8595"
+SRC_URI[sha256sum] = "5510358316eb5c965829a393714b4d88306033cd64db3eae8cc62b41ae80a392"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
index f63d61b2c9..13431ed788 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "62628ecca78b8f5b51c59a4d602c65e9205ffc50c3c83cd61fab1f6348b63565"
+SRC_URI[sha256sum] = "eeca811cef6312fa21433294ae216b3c6fa0a389d8980727102516bdcf973eae"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
index 8ddfe15de9..b4ace68129 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "845f2efe0dca8dab234dde8fb091da2cd06a9d2a683422b56dcb688954f9070e"
+SRC_URI[sha256sum] = "2dfb322e37370b6671b62ff60dc1da81f87dac5a17c1c7ef15a783d2355900b8"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb
index cd04ade602..0625accb7b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "1225ef4a329fae1cadc5ec727dab249ad567e8072879493561ceb91ed34aa414"
+SRC_URI[sha256sum] = "52c93bc48e03533aa676fd8c15eb6b5fc326c68db311c50bcc0a865f31a6c653"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


