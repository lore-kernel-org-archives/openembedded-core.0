Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F5DC369CA
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:54:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.5034.1744883651743337605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 02:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EzmCAzZC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744883651; x=1776419651;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uclr4i0lEFj3d+PRlh4TOuwB+357Y9SGczB8Ux3HBpM=;
  b=EzmCAzZCdUHBYVlZgQsBnl4ANZ9NtC8sCC9/s/hGSDOOeHRfBBd3hDvI
   bw58HUQme+nJe4NCfiDINYZUEQBrQVTlwX0hZP+LFrX9vH9eRUCAjW7TQ
   j3cS4YcIrEsTbXleyHz56ftaR5tQJ5yvGnG6DjJq4iNHTV07X5gqzz4OI
   U9eMC1WIxWR3Pk6iTrbzwbjNdB5H2XrHIPabHcSy1cicCXraCY1YsexPs
   Vja+6WBbnA+MdWd5XioabPhDqIofxSnji4t9SpMjCnhKTdXz7OxLzITUy
   Dn5EkXZjWbqd98fikoosJhe9napyecCfnSTxMlQ47LbjEndCuvB8dftZU
   A==;
X-CSE-ConnectionGUID: 7kkQtRnaR16Ow2PHNmD8DA==
X-CSE-MsgGUID: 2Wy2FPAlSlSV0Ny5MAknDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="175638776"
X-IronPort-AV: E=Sophos;i="6.15,218,1739804400"; 
   d="scan'208";a="175638776"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 18:54:09 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C476C2269
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:54:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 55624D8BD2
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:54:07 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EE181A0078;
	Thu, 17 Apr 2025 17:54:06 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2] gstreamer1.0-dev: Fix install conflict when enable multilib
Date: Thu, 17 Apr 2025 17:54:01 +0800
Message-Id: <20250417095402.762-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 09:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215049

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
 
+MULTILIB_SCRIPTS:append = " ${PN}-dev:${datadir}/gir-1.0/Gst-1.0.gir"
+
 RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-gconv-iso8859-5"
 
 CVE_PRODUCT = "gstreamer"
-- 
2.43.0


