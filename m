Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569B7D59D94
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 01:30:28 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.36004.1732584624571693170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 17:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ka3es7F5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732584625; x=1764120625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dJSt4U4kzHbYoe0oPPqAOmNcD5Wgtrjday6U0neX5K4=;
  b=Ka3es7F5sdAa5T2TZirH1UJ4HYvXlP+Tw3oX1nMejBGHXeJkKPU4tOwF
   LrezdeP/QItG8CWkmdZagxrqk5twM4EyQ/XiqfVTp/fuxZdeKeQhsToQR
   gAmmNEcvWgb8UD79ej4VhkacEczaSaNVEopZyJzqKJ3PB5JP3DvGhriT8
   sFLjFKJaK5HS1a8yEQhtQtW6G45Z1bO3f1m4drG7xEcztp+hUM6Qu0sy/
   sxp2HczY/OUENMiukgV3unrH90KWyBqmhTNIujXPhJOf0jkjUjPMDmwfB
   g9JMH0znjSbkdI2WgMYWDkgSIm1DuNkguhxML2mkw2cMG4a8Zz4wqy17U
   g==;
X-CSE-ConnectionGUID: uYFEZZ3vQ9OeS9X02HfFDg==
X-CSE-MsgGUID: O3FVEN/YTUu7aYF9A/IMbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="169987096"
X-IronPort-AV: E=Sophos;i="6.12,184,1728918000"; 
   d="scan'208";a="169987096"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:30:22 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3978CD4C6E
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BBAB2D5620
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 45BCC70BF6
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 10:30:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E89951A006C;
	Tue, 26 Nov 2024 09:30:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/16] python3-websockets: upgrade 14.0 -> 14.1
Date: Tue, 26 Nov 2024 09:29:58 +0800
Message-Id: <1732584602-4785-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1732584602-4785-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28820.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28820.004
X-TMASE-Result: 10--5.800300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrKIGkIUTTRL4AIXlMppp3XyMO
	uGtF4L1EtFyW7k8xSBErbVWjKPRUzR1YpEPWJiyzP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFlwV2iaAfSWcURSScn+QSXt0H8LFZNFG7bkV4e2xSge6Sgg
	/7OooRMxxezNIf2OMXhyihb5LTCMOxlZnccOM3PGA7bUFBqh2V
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 01:30:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207819

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Supported max_queue=None in the asyncio and threading implementations for
  consistency with the legacy implementation, even though this is never a good idea.
- Added close_code and close_reason attributes in the asyncio and threading
  implementations for consistency with the legacy implementation.
- Once the connection is closed, messages previously received and buffered can
  be read in the asyncio and threading implementations, just like in the legacy implementation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-websockets_14.0.bb => python3-websockets_14.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_14.0.bb => python3-websockets_14.1.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_14.0.bb b/meta/recipes-devtools/python/python3-websockets_14.1.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_14.0.bb
rename to meta/recipes-devtools/python/python3-websockets_14.1.bb
index 00c6109864..ead833a2ac 100644
--- a/meta/recipes-devtools/python/python3-websockets_14.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_14.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "be90aa6dab180fed523c0c10a6729ad16c9ba79067402d01a4d8aa7ce48d4084"
+SRC_URI[sha256sum] = "398b10c77d471c0aab20a845e7a60076b6390bfdaac7a6d2edb0d2c59d75e8d8"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


