Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270B6C021B8
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.14683.1739864488156792405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FtfCfXga;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864492; x=1771400492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cXX3TK+VbthMk5EfdRMNPlvLssvROBmHNefl1vzim6o=;
  b=FtfCfXgavWI8Xjg59zUJ4orlXN2+8bxpUTOliUVTzYYGPRlToijFdUYn
   ztOwooarCwKyZTLqu8Y7PHWCsClzfzFUZlB0JwsYjei2TYMByMowgkQK9
   bUa9IbcuAAU5rVoKg1YUrZPuK4ki37EtI9+N/cKWwzToVgfjkRuwGxwgZ
   i5BPMC10GiqyVcZb4D60mAtxZT1MrS0+qpAkhmySX/TlDIKuw061xGwVk
   pDJdGDv+hzbwE+CqkGPYSj40LpzdJ/mkeuwzbpWjtb7q66eH0kDt1h4aL
   ACxPoDDjY1EkkWajGanx0CptNMu5yMXsetx7yc6Sqzm4u2IlPtzp6Jw9A
   g==;
X-CSE-ConnectionGUID: CYwPQfM/S+W/zP4I2iT6Iw==
X-CSE-MsgGUID: nW1hn2uoQ8iYMDGphzHnAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190382325"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190382325"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 24BFBC2264
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7476BDC8A
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C8B21A006C;
	Tue, 18 Feb 2025 15:41:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/32] python3-poetry-core: upgrade 2.0.1 -> 2.1.1
Date: Tue, 18 Feb 2025 15:39:26 +0800
Message-Id: <1739864375-21394-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211584

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Pass a local version label to the build backend interface
- Expose build-system dependencies via the poetry instance
- Add has_upper_bound method to VersionConstraint
- Improve performance of calculating intersections and unions of extra markers
- Improve performance of calculating intersections and unions of complex markers
- Improve performance of marker operations by simplifying python_version markers
- Improve performance by caching parsed requirements
- Improve error message when a referenced license file is missing
- Fix an issue where inclusive ordering with post releases was inconsistent with PEP 440
- Fix an issue where invalid URI tokens in PEP 508 requirement strings were silently discarded
- Fix an issue where wrong markers were calculated when removing parts covered by the project's python constraint
- Fix an issue where optional dependencies that are not part of an extra were included in the wheel metadata
- Fix an issue where the __pycache__ directory and *.pyc files were included in sdists and wheels
- Fix an issue where simplifying a python_version marker resulted in an invalid marker

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-poetry-core_2.0.1.bb => python3-poetry-core_2.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_2.0.1.bb => python3-poetry-core_2.1.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb b/meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
rename to meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb
index 8fb39a7d67..1dd4337ae2 100644
--- a/meta/recipes-devtools/python/python3-poetry-core_2.0.1.bb
+++ b/meta/recipes-devtools/python/python3-poetry-core_2.1.1.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "\
     file://src/poetry/core/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
 "
 
-SRC_URI[sha256sum] = "10177c2772469d9032a49f0d8707af761b1c597cea3b4fb31546e5cd436eb157"
+SRC_URI[sha256sum] = "c1a1f6f00e4254742f40988a8caf665549101cf9991122cd5de1198897768b1a"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


