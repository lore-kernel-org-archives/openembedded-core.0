Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D384CE77188
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 23:57:15 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.116562.1733788628697995558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 15:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ERmbC8pk;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733788628; x=1765324628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=06RuZh3t0hbtn4vCoVQcPsvavsFIQqec+RNA9T9H1+0=;
  b=ERmbC8pk8KYYEA+jK5lHuCRdMepiV6bEKTvPdaRcBjyEg5fxmmLre5TM
   EJDDQe89yhjXleaBwRa1N9ajfv/IgIQ9V8A8FMCExYlkvSgpm/GKNVx8E
   vVqHoz+mQyUsbiU566oXXeEAptQB0t+JnDsVWpIoD+0k4YYjn1lQT1ZTS
   aBfRW1e54EXwPwUnkiEPfVPtJtF+pLCKYQiIwIqrD1S6J0+5M4zdkBTaL
   5zFWelmM9mTSPtes/rRFXvt9TUs0ojV4o+WcBhpoOug5+Kq6xduvAqS/3
   TaAsMCXgTWCPqX2d9hlBp9RCjcOhJSQdWPHOt6QoA4KsfRdYXWryleqnF
   Q==;
X-CSE-ConnectionGUID: mQiejvtNT1iWeRHwnRjeCg==
X-CSE-MsgGUID: F8NJf3TpSy+eW0Dc8ywQug==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="162089693"
X-IronPort-AV: E=Sophos;i="6.12,220,1728918000"; 
   d="scan'208";a="162089693"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 08:57:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED8E9E428A
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BE8F6F740
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5018620076D0F
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 08:57:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ECF5A1A006C;
	Tue, 10 Dec 2024 07:57:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 07/20] gstreamer1.0: upgrade 1.24.9 -> 1.24.10
Date: Tue, 10 Dec 2024 07:56:39 +0800
Message-Id: <1733788612-20933-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28848.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28848.003
X-TMASE-Result: 10--6.770700-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yQPZZctd3P4BArRmBtM54pSau9pmElq57db2
	e7N2CFQy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIJQ7jSode7x9ub0
	8zdX1CvJaewE2WewJc5UX5H+y+yVY8m0l4hl+oyIyByMiwk6+3u9Bi8r8zoNMrSFAmmHOf1RvKp
	xZPgVlF3kJ92g99ApMnyxmiJJOamv78JjBSyJroSeaCBMY8cEn4SkIdSwphgabKItl61J/yUGDD
	kbg1gJkKZDgIQINiWYnRE+fI6etkn6IfEFxCcLbrOEJk2wcFUmX13TK8+yzulCVLdRmc/6b36p6
	JogEDDwn61vOD6tsW3Tk6mqOxAYdpF4AsqrFW/Ti+Iz+vURUSUu/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 23:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208505

From: Wang Mingyu <wangmy@cn.fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../{gst-devtools_1.24.9.bb => gst-devtools_1.24.10.bb}         | 2 +-
 ...treamer1.0-libav_1.24.9.bb => gstreamer1.0-libav_1.24.10.bb} | 2 +-
 ...lugins-bad_1.24.9.bb => gstreamer1.0-plugins-bad_1.24.10.bb} | 2 +-
 ...gins-base_1.24.9.bb => gstreamer1.0-plugins-base_1.24.10.bb} | 2 +-
 ...gins-good_1.24.9.bb => gstreamer1.0-plugins-good_1.24.10.bb} | 2 +-
 ...gins-ugly_1.24.9.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} | 2 +-
 ...eamer1.0-python_1.24.9.bb => gstreamer1.0-python_1.24.10.bb} | 2 +-
 ...tsp-server_1.24.9.bb => gstreamer1.0-rtsp-server_1.24.10.bb} | 2 +-
 ...treamer1.0-vaapi_1.24.9.bb => gstreamer1.0-vaapi_1.24.10.bb} | 2 +-
 .../{gstreamer1.0_1.24.9.bb => gstreamer1.0_1.24.10.bb}         | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.9.bb => gst-devtools_1.24.10.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.9.bb => gstreamer1.0-libav_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.9.bb => gstreamer1.0-plugins-bad_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.9.bb => gstreamer1.0-plugins-base_1.24.10.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.9.bb => gstreamer1.0-plugins-good_1.24.10.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.9.bb => gstreamer1.0-plugins-ugly_1.24.10.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.9.bb => gstreamer1.0-python_1.24.10.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.9.bb => gstreamer1.0-rtsp-server_1.24.10.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.9.bb => gstreamer1.0-vaapi_1.24.10.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.9.bb => gstreamer1.0_1.24.10.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
index 63779b5aff..7e46634ed0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.10.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "cf1de1aafa6eb4fd0365932b251528e2340b88697541e021628c5f7259970fb8"
+SRC_URI[sha256sum] = "2983537148b0a8d52bad2a3f4c9dcca808fd5aa12fccee25acc4a4277f0780ec"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
index a5cfc8632a..629e9516c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.10.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "32682e9ae508ee01f4fb134b3a520081e2ac007220997577624b1d16171d456c"
+SRC_URI[sha256sum] = "4cf2e2d8204e54ba8af9519a8b9b7ffa6e951a7087afa0dfe83c125d49bbb5fb"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
index be2628d14a..789e1aef8e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.10.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "36fcf7a9af0a753b43bb03b9835246f74d72f7124369e66a1e2dc7b04f5a5cab"
+SRC_URI[sha256sum] = "1707e3103950c9baed364a8af2ba0495d6b113fcd36e1062dda5f582b8f8904d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
index 996a06500e..452685d2ea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "5bb3b946907d3ce04dd842b610c8111c2b0611351b25a1fa22af5efa897857cb"
+SRC_URI[sha256sum] = "ebd57b1be924c6e24f327dd55bab9d8fbaaebe5e1dc8fca784182ab2b12d23eb"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
index 95f03b1da2..653aa1cfc4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.10.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "897de50bff337e3ca2f86f1eaa28e0828d83024156162a50c4ea0af86e29799f"
+SRC_URI[sha256sum] = "fce748fa66d7a8ee1fb261489e59d01e3fa787623d6d5c35068416fe7cd0acb3"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
index 45abe68659..607dc71971 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.10.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "4b6b30110f38cd05eb67422297142b75a55fe00003105f48b13603e6761cc3b6"
+SRC_URI[sha256sum] = "9df6fd85a7256241efbb25f84b337575e3b345266f5dab3849371e4694779f18"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
index 25c9179bfd..f682f093eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.10.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "80e61d587c34cbac79e46c927b71cf32c4bf9bb0868ce5aa4b7444bdad83f42e"
+SRC_URI[sha256sum] = "135bcf8b6f1468bc31e5660409fe8ed38109f01dec44743514aa2fa6b3863309"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
index 776e177b9f..a33c8c0027 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.10.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "299c9aafac3c91bbebe4cd481ed4e4ade8cb2b0677097bc4a8dcf6d4364c9804"
+SRC_URI[sha256sum] = "db21dfdd7bf2e718564d557378ada5358b411efe2a3e89e9f0f87a74537e2adc"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
index 0cc62e345e..31b4aa27e3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.10.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-meson-Re-added-required-lines-accidentally-removed.patch \
            "
 
-SRC_URI[sha256sum] = "c2373e9b4d6655535d355207f60084b0fb3b28566fe9bb4ca1da714439da4ae1"
+SRC_URI[sha256sum] = "21593dbde5c6bcdcfe99195defbe3c3f4da01cb85f8ec10aae943887d39d8a4c"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
index a756f9e3a2..326a2f26a9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.10.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "ebf47b6beef508a00c8557d4c1f1713e5c7ef9ba70dac45deed80e182bcf260f"
+SRC_URI[sha256sum] = "9fc45b1a332e8f812f09e95c281cd75969f6d1682d062a815db0e7bc047518fd"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


