Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B1BC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:08:19 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.585.1787116092288966794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bvY2hDhb;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2981; q=dns/txt;
  s=iport01; t=1787116092; x=1788325692;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2e5lJHPbmNXmZFuOS8ZpLzi3Kp7258cBI1nrkeJha+Q=;
  b=bvY2hDhbWJLU8NEdFNfr15adS1N3NAAY5sJ5r51K2SzoilzH/Mzp2jGq
   i5KrhZbrhRToEME5aVPABd7ofXfgW7CpluBdbJyM5kvXgek+KtRRwG0oA
   u4FpVwkKVn2HlGSgna6xTykSiD4UAPYvnkxJaaSuQ+yOEmnkZGaacFbyh
   ZId7sGtGeacmoJuLoaoKg7MYROBK4H3Zhyah8p0R5daxeFOK6cw0QSfM1
   wRzypxfGVgTZ7qoC0cg0uEF5PiXKRiGksuZFdV9BEqLudI+dC/CkXL7SZ
   t+r9b2XuHjBzaJpN+0NGWID7Tujwg80Uz/PXnMJngeJpmsK6+QnDN+Ctm
   w==;
X-CSE-ConnectionGUID: PUFJI4ijTDu+K/O52IU/zA==
X-CSE-MsgGUID: ZaVJ7OFTT8msK/xzjcCu7g==
X-IPAS-Result: =?us-ascii?q?A0BEAgB4OYVq/5IQJK1aHgEBCxIMggULgld0XkNJA7Rlg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECATUBGAEtLAMBAlojIYMCAYI6AzcDEcMagiyBAYMoA?=
 =?us-ascii?q?TEFgR7YSxCCVQELFAEFgTOFP4giXRgBhHwnGxuBcoEVg2mBBYFcAoIthXgEg?=
 =?us-ascii?q?iKBDIFagS2QOEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdg?=
 =?us-ascii?q?SiENyMZNnqBCV6BKyphARIXgQmCCgKCc4IGAgFJRREKCwsYDUgRLDcUGQQ+b?=
 =?us-ascii?q?geOSSCCR4EOASuCLKV2oQ8KKIN2jCGVOhozhVulEQuYfY4KllCEaYFoPIFZc?=
 =?us-ascii?q?BU7gmcJShkPjjiDa4VkxlUnMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:h63+lqkiF5e1FDfj5vfF91no5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfD2uBO/yPZmv9ed5ybIzj/E8AuMOHmoJnQFc4rCtkQltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpEsvPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbUl1MRWXWBMy
 dAFaxNKSU3Zpt/x0pvuH4GAhux7RCXqFIobvnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkERUrsUIMpWcOOAinrydzRZuVu9rqss6G+Vxwt0uFToGIqMI4HbG50Fzi50o
 Er09lrbXTY0CODPzCGmtWK+hOTkgHz0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:gJ+0IKy03cvsNH9xZW+8KrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:zUgWE2GCjtMHCPoJqmJfyWA2O5wkcEHx0TTzZGjlU0dUD6+8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AGrZvwAyfKG9v6p+nQVKcCdt/p0SaqJanNmJStrs?=
 =?us-ascii?q?6h5mBLg83KyWfhx+qHYByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="811596088"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 05:08:11 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 4AFD71800014B;
	Wed, 19 Aug 2026 05:08:11 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id E1A2FCCA79B; Tue, 18 Aug 2026 22:08:10 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/4] python3-git: fix CVE-2026-42284
Date: Tue, 18 Aug 2026 22:08:05 -0700
Message-Id: <20260819050808.3986732-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243697

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/c9a26789d88b18f8b4620f37307df2976292d2a0
[2] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-x2qx-6953-8485

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-git/CVE-2026-42284.patch   | 36 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
new file mode 100644
index 0000000000..3e5b9908a7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
@@ -0,0 +1,36 @@
+From 01d579e1b0a3e78cf82695b84967d0c343cfdd0f Mon Sep 17 00:00:00 2001
+From: "GPT 5.4" <codex@openai.com>
+Date: Tue, 21 Apr 2026 09:30:29 +0800
+Subject: [PATCH] Make sure that multi-options are checked after splitting them
+ with `shlex`
+
+CVE: CVE-2026-42284
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c9a26789d88b18f8b4620f37307df2976292d2a0]
+
+Backport Changes:
+- Omitted test/test_clone.py and test/test_submodule.py because the
+  PyPI 3.1.43 source used by the recipe does not ship the upstream
+  test tree.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit c9a26789d88b18f8b4620f37307df2976292d2a0)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/repo/base.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 51ea7690..8059fceb 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -1365,8 +1365,8 @@ class Repo:
+             Git.check_unsafe_protocols(str(url))
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(options=list(kwargs.keys()), unsafe_options=cls.unsafe_git_clone_options)
+-        if not allow_unsafe_options and multi_options:
+-            Git.check_unsafe_options(options=multi_options, unsafe_options=cls.unsafe_git_clone_options)
++        if not allow_unsafe_options and multi:
++            Git.check_unsafe_options(options=multi, unsafe_options=cls.unsafe_git_clone_options)
+ 
+         proc = git.clone(
+             multi,
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 45c988117b..bfbdd80289 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -12,6 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://CVE-2026-42284.patch \
+           "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
 DEPENDS += " python3-gitdb"
-- 
2.35.6


