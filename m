Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D52C28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:19 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.3868.1743584888767551163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mMTlbaKf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584889; x=1775120889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5dSFmmptL21KGzEgjWP2mgqztfM/yfjPFQDPkgij128=;
  b=mMTlbaKfS49dddSOF9uDDOOilqhTcon7dQHzPiqjJVaIO1Hh96oYszFS
   qDbxPqz7zhHhK5G7+BkORMB6ZW9kt83Ip8ynGAAu33SBNy/xI+qMISlp9
   UWVX2kJIu07qf82bnMOd5R8ePzcfJnMNMxFfMnxVRpBYYJyrQA9eHbpvL
   e8u3AcFje0V8UTZr1m1f6aQYCHaZ6g4jcZ0RTKknHbNnm14JLESV7gzPr
   Fw2Q6Q/fOXXFDpnxSRMHgRIQqilZTG7qbTMBinscGu5Yn+9zsUse3+v5x
   P2grOvqUHEh21ruqKCDGa91qre/kXN3Ghf9UYz+syq0WF2X3YC3CuK6wS
   A==;
X-CSE-ConnectionGUID: Qeq0HBgsT4uhj3XBMV6W7g==
X-CSE-MsgGUID: l+60LhuSQry9wp3VLyKekA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="195233141"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="195233141"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:07 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70725E8529
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3140BD0619
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:04 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EF191A009A;
	Wed,  2 Apr 2025 17:08:03 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4 09/10] gstreamer1.0-python: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 17:07:48 +0800
Message-Id: <20250402090749.2119-10-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402090749.2119-1-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214243

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


