Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A41DD32D65
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.82432.1731403535222004954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X00eB4lD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403535; x=1762939535;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gccrbgJrcRIhsfj8cLYSDATfqc785FMsskUJAPlvK+E=;
  b=X00eB4lDnjOMiSWP52GytA/6/Hwg6q+5gXM2Uwdc17jIFyeR+RdeTLT8
   EvTqwZ07IXL/JX2jJxTQGqVvfrNrUBIkXm9lrF0DNtWWm+3u2mVYmiSO6
   zeEyWWeG7YmoOI0ZJ/uVRyR1K4FM7gwSxNodJDghnQ4LSwJgyFVPd5/hB
   jkcORXctBEkRj3GSAm84erG9WEC8E6ZLaiqroX8MR50ALUtlD3VCoJqGg
   OedFDRLIU5LrShYHFtxAYLEjsNBIqZdEZgRxJB6RKNNej3R4+CPvnHqHS
   cQ3o55b8eLftbN3XRCrmonq0X0Bu1N5JAE16Yb/ZzUqC+7uohsJf2LUJO
   w==;
X-CSE-ConnectionGUID: wi2ZQGBsRdmLOwFGkVQRBg==
X-CSE-MsgGUID: aoEw+hsrR5qJiVVpFWhVeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="182315543"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="182315543"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7EDE2D9C11
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B26BD5062
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E7206BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4C8471A000A;
	Tue, 12 Nov 2024 17:25:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/47] ofono: upgrade 2.11 -> 2.12
Date: Tue, 12 Nov 2024 17:24:24 +0800
Message-Id: <1731403483-21399-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--2.219800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svL8ul
	iDSdYQvbjf84k1uW53jqXvXKPBg5Bm0Xr+fj3ww/TuctSpiuWyU2ZWOmuJUS2ZQOYBrXJCKARHq
	kd+AWCOni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFOi9cXBdj3zmHsBY950b35z/oD
	mX8mBMcRrjuYH8oh36Mfiw6ypnqzyQ9IB1POUOqN+CNK2LrISNEvdeO/Fmh+YCd7ewtl7LGOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207016

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix issue with access technology reporting.
- Fix issue with detecting Phonet devices.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/ofono/{ofono_2.11.bb => ofono_2.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.11.bb => ofono_2.12.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.11.bb b/meta/recipes-connectivity/ofono/ofono_2.12.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.11.bb
rename to meta/recipes-connectivity/ofono/ofono_2.12.bb
index 85119c73d4..cb1f4742c9 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.11.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.12.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://ofono \
 "
-SRC_URI[sha256sum] = "fa908ac79e2ffaa52391b6c6737cd451275ef788284e46d3f05a7a409bc52cfc"
+SRC_URI[sha256sum] = "0de08f969c063bc0ca2a6f7fc346c09bab9ef057d26f32eaf6aac2a2a4eac9eb"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.34.1


