Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F05FCCA473
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15274.1792129268537946542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NHP3XAB9;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3543; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4UuBPcM+uwOX+FNJprXEqdRM7BhfPNKjMMzqBOcH38s=;
  b=NHP3XAB9pNiIn3Qt1U+s/DHo8bcsQj4UgYi2+ID5wJf3PiictihBNkNq
   z9vpkYhuYv6DovavA6boBQLNshaFOu35zOK7NGgpClIIdwJ9qWb95+Zuz
   QiTRkI/T97FYtb1tiqziBpzELbxwdSJ3Ewrax83QmQdB9kWqNPTRjTfoL
   A0HVeehnVVcGTUie69DkcyyrQETeFIxZWifOOjH3p7t3N9v0CvCHIexS1
   Zisp22Lhz9W/7J+L0bepuiAI3iAZZrczGQFF+jU4Nsm5gN6aCkFXUEieN
   LWnUjwvLe+M4DZdWG/JWeM64ACpDKbptWKEun/3Z/OvvdbVMtl62zqbRn
   Q==;
X-CSE-ConnectionGUID: 2TZjW1eDTbO0lVCB1cfivQ==
X-CSE-MsgGUID: IrYQSFuvQzu9Tuo2X6qU9g==
X-IPAS-Result: =?us-ascii?q?A0BIAgAeuNFq/5D/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx4gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAEBg?=
 =?us-ascii?q?SeGfgSDHBKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CGE09H?=
 =?us-ascii?q?DUBKwSBDYFpkmeSQKEPhCiMIpU6GjOEBIFXkkCSVAuYfY4Klk+EaYFoPIFHC?=
 =?us-ascii?q?wczGggbFYMiCUoZD445g2uBf4NlyHYnMgIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:L2eIUKhPYrBAjVTQc2C2M6OfX161NxEKZh0ujC45NGQN5FlHY01je
 htvD2yHOvqONjOjKY8iaojj90pT7MSHxtBgG1RspS00RitjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVCxtR1PjhD2
 cASD2gJUDup3um4wayCH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgt/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOJIDVHZ4Fzy50o
 Ern5VXAOT8HKuWN1Gu573X2trHWoHL0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBbCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Zx/Ww62yJbmIg8FozDGJGwqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:P2fRW2AKSHCsuPj6E3NbxkwrQ80JTnf6lHPuCGXhAmhoVoTAHA==
X-Talos-MUID: 9a23:0h2LmAnfgqgsmfqoIzQQdnpDLvZR2IqzFnkfjMQ6ps7eBXJpBmaS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536470389"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id 5CF8318000231
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id A8B58CBF203; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 23/27] python3-git: fix CVE-2026-78675
Date: Thu, 15 Oct 2026 22:41:02 -0700
Message-Id: <20261016054106.210444-24-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247946

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ef7568e3b317ce617eacda39b8b54dcdff8c3b5c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-78675

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-78675.patch   | 47 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
new file mode 100644
index 0000000000..7772aac55e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
@@ -0,0 +1,47 @@
+From eaa63265a59f069bf13384481c48fa48a25ff087 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 12:32:24 +0200
+Subject: [PATCH] fix: ignore includes in submodule configuration
+
+<!-- agent -->
+Submodule configuration is read from .gitmodules, whose contents may come
+from an untrusted repository. Its parser inherited merge_includes=True and
+could therefore open files named by include directives during ordinary
+submodule enumeration.
+
+Disable include merging at the SubmoduleConfigParser construction site. This
+matches Repo.config_writer() hardening from 41ecc6a4 and addresses
+GHSA-7833-fr7j-v32q without changing include behavior for trusted config
+parsers.
+
+The regression points .gitmodules at a non-config file and verifies the
+submodule entry remains readable without opening the included path.
+
+CVE: CVE-2026-78675
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/ef7568e3b317ce617eacda39b8b54dcdff8c3b5c]
+
+Backport Changes:
+- Omitted test/test_submodule.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit ef7568e3b317ce617eacda39b8b54dcdff8c3b5c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 410f41e2..e37f8fa9 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -268,7 +268,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("Cannot write blobs of 'historical' submodule configurations")
+         # END handle writes of historical submodules
+ 
+-        return SubmoduleConfigParser(fp_module, read_only=read_only)
++        return SubmoduleConfigParser(fp_module, read_only=read_only, merge_includes=False)
+ 
+     def _clear_cache(self) -> None:
+         """Clear the possibly changed values."""
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index fba7883c2e..0d9e7b0a9d 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -46,6 +46,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78678_CVE-2026-78679.patch \
            file://CVE-2026-78677.patch \
            file://CVE-2026-78676.patch \
+           file://CVE-2026-78675.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


