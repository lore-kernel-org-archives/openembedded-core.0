Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DB8C369D5
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 02:51:51 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.31499.1745290301773005936
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 19:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HyVHiRqP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745290302; x=1776826302;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=96x2MG7kEwqYvTu32Xuq6/c79N8zMEZBWMJZf72/yBY=;
  b=HyVHiRqPtg2y8REBPEDVqwAH4RryrD8D8kFPqEmbH8du45zoyBCHbYTC
   bwnuttMWxgm2jtpVt6XocqynCDp1dpW2itpMfjjI/s25flQohWy/VSM7c
   UiDt1WSQ5Ye5RCCfQa2csucxYraQY5TYZkD419M02Ay3gzYkAhtl/LXNp
   Z6qEH58pslVqrv6GsCt2OMR+EbkYOEAsz3VSAGrsC6D3nhPIykCJOXuRZ
   SONZ3+cLUhb1l6aRnVkW5pJCh1UrngFeVfnFnKnBaE859WcpI903+fALI
   m7Nw5LcTfhh83bcNx5uUy9aUK0kotVRkZ3HG5ABoMT66VeMhTAP7DjyhP
   w==;
X-CSE-ConnectionGUID: DViMX8/uQba34PsDTf7JpA==
X-CSE-MsgGUID: JPVkByQZSiKYyMksTXItlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="176713748"
X-IronPort-AV: E=Sophos;i="6.15,229,1739804400"; 
   d="scan'208";a="176713748"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 11:51:39 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B00DE8525
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 11:51:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DEEC5D3F1A
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 11:51:36 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 07ABC1A0071;
	Tue, 22 Apr 2025 10:51:35 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] gstreamer1.0-dev: Fix install conflict when enable multilib
Date: Tue, 22 Apr 2025 10:51:27 +0800
Message-Id: <20250422025127.605-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 02:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215191

Error: Transaction test error:
  file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted installs of lib32-gstreamer1.0-dev-1.26.0-r0.core2_32 and gstreamer1.0-dev-1.26.0-r0.core2_64

fixed-size differs between 32 bit and 64 bit system

$ diff /mnt/test/build_auh/tmp/work/core2-64-poky-linux/gstreamer1.0/1.26.0/image/usr/share/gir-1.0/Gst-1.0.gir /mnt/test/build_auh/tmp/work/core2-32-pokymllib32-linux/lib32-gstreamer1.0/1.26.0/image/usr/share/gir-1.0/Gst-1.0.gir
31864c31864
<         <array zero-terminated="0" fixed-size="8">
---
>         <array zero-terminated="0" fixed-size="12">

The issue that "/usr/share is a architecture-independent location but contains architecture-dependent file", is
a "long-known problem with gobject-introspection. You'll probably find an issue or three from 10 years ago about that"
according to https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/4377

We can found issue reported years ago, gstreamer community will not handle this issue for now
https://gitlab.gnome.org/GNOME/gobject-introspection/-/issues?search=multiarch

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
 
+MULTILIB_SCRIPTS:append = " ${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"
+
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
-- 
2.43.0


