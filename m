Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B6BC3ABD7
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.45916.1747040638854317555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FGf9Xt3l;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040647; x=1778576647;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rljk2YyHES0duHwlhic/mc4W6L47sy128ZkgYjQEBQs=;
  b=FGf9Xt3loSTM5YUz3jZA8qENRyYWodcZCrJvzAwUsymK2XgkpPbmuGqf
   l60Prs2ki7QOvmuWFpuf3VsBKgHwZiAV8Hj2j0+6rdIKamYtIukZKiZoT
   aL9r0oQVoTEx3rXgx8Ggh+YD6CbHjrsENIV4uy8Zx2C9vd+fcbx3ZdQxK
   DJToi58pUlzhDl8chGM+EJbkcBo4OILQXtT6TKPdnQJvYHFZpVhSjhmau
   KwJ3DaOoclGt+U3Ua+Ttykb4kv+p45QwzaYGkVRbaBEZOZqmTeb2oq4Uz
   VTEVFIijBUWJlzDwXsFoVrNZtRJRvHzfAncC6hR+qz6K19UBza1nENeEC
   w==;
X-CSE-ConnectionGUID: tk5Jq6VMTUis01xZk8FHBg==
X-CSE-MsgGUID: T25wvhahTYq5YaubHiKYZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="202056489"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="202056489"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:06 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41155D5051
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03210D20AF
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8CF691A009A;
	Mon, 12 May 2025 17:04:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 45/56] python3-pdm: upgrade 2.23.1 -> 2.24.1
Date: Mon, 12 May 2025 17:03:28 +0800
Message-Id: <1747040619-7566-45-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216342

From: Wang Mingyu <wangmy@fujitsu.com>

Features & Improvements
------------------------
- New command pdm new that behaves like pdm init but creates a new project.
- Support use --name as project name for command pdm new e.g. pdm new hello --name world
- Support exporting to pylock.toml format as described by PEP 751.

Bug Fixes
---------
- Pass the --quiet option to pdm sync command.
- If a .python-version file is found and it contains multiple lines, the file
  will be ignored. The usage of the .python-version file can be disabled, if
  configuration value python.use_python_version (or environment variable PDM_USE_PYTHON_VERSION) is False.
- fix pdm config -e command to open read-only file under linux
- Replace project names and import names in both README.md and pyproject.toml when running pdm init <template>.
- Fix a bug that URL dependency hashes are not updated if running pdm lock --update-reuse. 
- Install the project when using the BaseSynchronizer with install_self set
  to True. This fixes the bug that when calling pdm sync --quiet, it skips
  installing the project itself.
- Mark one additional test as requiring network, and fix another one
  not to require it anymore. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.23.1.bb => python3-pdm_2.24.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.23.1.bb => python3-pdm_2.24.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.23.1.bb b/meta/recipes-devtools/python/python3-pdm_2.24.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.23.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.24.1.bb
index acab401392..3f251c7f0f 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.23.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.24.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "cf12cd2201df78a6543a5485ac1d7015a73b3a6b10c98b66dfae6ebd481386fe"
+SRC_URI[sha256sum] = "fc8adf011caa4ee2b0f25dabf890152aa4153cc21599ea67fe0c14e533dcd6d9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


