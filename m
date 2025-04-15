Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C999CC369B2
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 03:08:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.11847.1744686509431332396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 20:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rVcIL0nm;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744686509; x=1776222509;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=d12uWD94TODYgKjpWXTFfumNOHBa5sCCikp129m4PUk=;
  b=rVcIL0nmEuQEtwn5kTxoPQnX6fjN6Ub4zDio+ptQbxee4ZlNN1SpYVfC
   MzNq9mXxxiZhROB4ziUL/yaBa1sEExa4bXU0OD81Ihpo4wcsTS1ZimlId
   dnnGgBO42fmXLlPQgW1mcmsMYGVceG9w7oaQzybl8YC8CrmPdpvlEtvfX
   9p3eYwMlWMGjW/CgdYOvZFWa9wtN1UFOcGeW9+zxEXDysTFnDcQ2qVYnV
   VeGjm3GGLB6zgGWAcPZvu2VMsk0vgWQlcb5EKxczz6fZlW6tldWqUR8D5
   dG4Nh4yMuu+EOaZlLwmNvyXgdoCHGymHPqZN/kM3EDGs6apqBMOfRkD0o
   A==;
X-CSE-ConnectionGUID: zM87GkuZTfa8lN1dvmzAvQ==
X-CSE-MsgGUID: Wyx81deoTquw0xwTn4DmzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="183791512"
X-IronPort-AV: E=Sophos;i="6.15,213,1739804400"; 
   d="scan'208";a="183791512"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 12:08:27 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DA268D500F
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:08:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A39CCF7C6
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 12:08:24 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D1FAF1A0078;
	Tue, 15 Apr 2025 11:08:23 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when enable multilib
Date: Tue, 15 Apr 2025 11:08:20 +0800
Message-Id: <20250415030820.673-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 03:08:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214816

Error: Transaction test error:
  file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted installs of lib32-gstreamer1.0-dev-1.26.0-r0.core2_32 and gstreamer1.0-dev-1.26.0-r0.core2_64

fixed-size differs between 32 bit and 64 bit system

$ diff /mnt/test/build_auh/tmp/work/core2-64-poky-linux/gstreamer1.0/1.26.0/image/usr/share/gir-1.0/Gst-1.0.gir /mnt/test/build_auh/tmp/work/core2-32-pokymllib32-linux/lib32-gstreamer1.0/1.26.0/image/usr/share/gir-1.0/Gst-1.0.gir
31864c31864
<         <array zero-terminated="0" fixed-size="8">
---
>         <array zero-terminated="0" fixed-size="12">

source code:
$ less gstreamer1.0-dev/usr/include/gstreamer-1.0/gst/gstidstr.h
typedef struct {
  /* < private > */
  gpointer pointer;
  guint8 padding[8];
  guint8 padding[12];
  #error "Only 32 bit and 64 bit pointers supported currently"
} GstIdStr;

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
index a908ecd166..5c795ad676 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 
 DEPENDS = "glib-2.0 glib-2.0-native libxml2 bison-native flex-native"
 
-inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection ptest-gnome
+inherit meson pkgconfig gettext upstream-version-is-even gobject-introspection ptest-gnome multilib_script
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
@@ -68,6 +68,8 @@ FILES:${PN}-dev += "${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES:${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
 FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
+MULTILIB_SCRIPTS:append = "${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"
+
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
-- 
2.43.0


