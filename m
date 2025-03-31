Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E724C3601A
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:49:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46075.1743403761051891088
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jnv4lh4f;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743403762; x=1774939762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5dSFmmptL21KGzEgjWP2mgqztfM/yfjPFQDPkgij128=;
  b=jnv4lh4f4vbtKEYYDh2KelFcD5+xIwLe1VEwds6aHV/hfl7vQz3zbt7G
   L4ZoCwOrv5GgWPRUbQrHEo6o2nyQbu94JJlDwJ1ihlryQJaIXDAmMWhcR
   2921qAY9gKoHtCPw1yydTh46y2QdDVXs03HtyUuNsHwkroNGd/eV5xscJ
   dYW+jAc7wVKXhadHYPv1X9Pc14Irva/L6XvukjeJgoQ1bpsf8MAGTe6c+
   kiQGxkDz+a93rAnvUDbEGSdZdz6DN3J+po4k4831dVCl1kz2xAkHYzGQy
   G+qSGF4TwSfBNokrirZ3G4T+007ir2z2iQZV6/cgsoIFiRxGARzyxF8nR
   A==;
X-CSE-ConnectionGUID: eSsu8GewT9iqEtmH+eIwWQ==
X-CSE-MsgGUID: AvXYz76STymUr29ch94Cxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="174402780"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="174402780"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 15:49:21 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D02E7D4C2B
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9717CD4C3A
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 15:49:18 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 119281A0078;
	Mon, 31 Mar 2025 14:49:18 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [Patch v3 09/10] gstreamer1.0-python: upgrade 1.24.12 -> 1.26.0
Date: Mon, 31 Mar 2025 14:48:43 +0800
Message-Id: <20250331064844.2155-9-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250331064844.2155-1-leimaohui@fujitsu.com>
References: <20250331064844.2155-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 06:49:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213944

gstreamer1.0-python adds depend on gstreamer-analytics-1.0 in gstbad now:
  |../../../../../../workspace/sources/gstreamer1.0-python/meson.build:23:13: ERROR: Dependency "gstreamer-analytics-1.0" not found, tried pkgconfig

Source code:
  | $ vi  workspace/sources/gstreamer1.0-python/meson.build
  | 23 gstbad_dep = dependency('gstreamer-analytics-1.0', version :gst_req,
  | 24   fallback : [])

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...mer1.0-python_1.24.12.bb => gstreamer1.0-python_1.26.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.12.bb => gstreamer1.0-python_1.26.0.bb} (88%)

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


