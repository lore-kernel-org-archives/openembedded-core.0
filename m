Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F32C77B7C
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.26253.1750065418149590378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=anxI+NRU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065419; x=1781601419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=btYsuX8T/WGgrP+prgwD5K0fZ/ESOo10GxUqALJc9IM=;
  b=anxI+NRUZQpsZRJxOGa4O9cu/dYcVKNDsFygP3/Q2mxqv2B1mJYhAnJb
   SNynK4m6z04GxOQe3u1gTE+xh252iUw0UsOlYBYfRNSpoo8S7tlrzy7vX
   krrku4vhcS8oKZGkYCZqdK0jFL/zFJV2wFxYVsL2FLA5nUpuenxYJenJ6
   CHGhXQWOyUWBkiyKZhDCn5KYCGOT6vzbMIAdWSi8TOiKzc6t8UXl4UGPr
   WrIms0TFrMJiAIkCBEH+Qq0PvVJL8pvqubq7wesGaE3Q/SQaM8o0LRnIZ
   p1QGuidVXav6jBYCTEXZaO8EHeMy89PvfJtHV9tQjzadLxQzpG9zK9Nrj
   A==;
X-CSE-ConnectionGUID: jJSs6q2gR12VIiPkxAFZRA==
X-CSE-MsgGUID: rfK4+9ktSyuybOfHDRH/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202902727"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202902727"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02397D944F
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D6ABD5042
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 308DB1A0073;
	Mon, 16 Jun 2025 17:16:54 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/24] python3-pdm: upgrade 2.24.2 -> 2.25.1
Date: Mon, 16 Jun 2025 17:16:36 +0800
Message-ID: <20250616091643.918-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218789

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix duplicated dependencies added to the lock file when the same dependency with extras is requested.
- Stabilize order of the extras and dependency-groups fields in pylock output.
- Fix Windows 11 install pdm error, which is because of msgpack install failure.
- Change the return type of array_of_inline_tables to list[dict] from list[str]
- Ensure uv resolver to include hash for package files.
- Avoid infinite recursion when reading pyproject.toml with circular file dependencies.
- Support pylock as alternative lock format and make it opt-in by config.
- Search for package metadata in lock file first when reuse strategy is used.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.24.2.bb => python3-pdm_2.25.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.24.2.bb => python3-pdm_2.25.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.24.2.bb b/meta/recipes-devtools/python/python3-pdm_2.25.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.24.2.bb
rename to meta/recipes-devtools/python/python3-pdm_2.25.1.bb
index d24e03d650..d9331ba72c 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.24.2.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.25.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "ce0d5e9005fe26238b8ba5cf0e37ac00acab2fb90f904bf0219a5e8445849dfb"
+SRC_URI[sha256sum] = "3145251f37a3f94fa211ade992e7db7792da4c3e8e3eeeb1993d952adebe0b96"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


