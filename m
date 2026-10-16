Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A805CCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:32 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15615.1792131565476857463
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Vnqqn25J;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3528; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LRkueFuBByVm71qEt6/92Vl7wGew0PfM70aJXfeX8vE=;
  b=Vnqqn25Jf94VSmSJBY2ijKVz/XMOvXtJx9Fa6RT4WX4UBb7wFhIRcRe6
   Mj5LHzFRZ0G5A2sAWVvbWVlnjYMUtkYB+lof60w0S5c7segnFmvcd42+E
   AgIQk7lkAXShdaVQMnC5WFUKeU7J1En03q1nkU4MHM4MasSpa11F8k5/D
   fJaFvEafwowPOYLLfhckrM3+pnvvuxq0xMMkCS398sTfJvL6zDPD17EX1
   zfjrPCudUNrBjkvFoB+j7tS4h/vjGrf+Gf08zeXxOhUn7G7YLCCLfw0+U
   UbBJB+KV2O/b5axuBOmmHSoOolAZB1DioQYYL1bBUiztwQ/vA49eSV+zS
   g==;
X-CSE-ConnectionGUID: OKO/v37jR7qznwkYymLpVA==
X-CSE-MsgGUID: rWR+4jUeSiytZ5F7oi3oJQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgBfwdFq/4//Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbxzgXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAICG?=
 =?us-ascii?q?IENhn4EgxwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeghhNP?=
 =?us-ascii?q?Rw1ASsEgQ2BaZJnkkChD4QojCKVOhozhASBV5JAklQLmH2OCpZPhGmBaDyBW?=
 =?us-ascii?q?TMaCBsVgyIJShkPjjmDa4UTUch2JzICCTIBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:wqqpSag6mBl595K1q3lyjpz8X161NxEKZh0ujC45NGQN5FlHY01je
 htvWWCOa/qIMDf1Kt10aIi+ox8HvMXRzYdiQApl+HgzQiJjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU/2cEwHzoR9
 8ZHMSILcROylueS2IySH7wEasQLdKEHPasFsX1miDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgx/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeOJIbWHJ4Pxi50o
 ErcwF66XhMnOeee2Ca3r1zzge6UmgHCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBaCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:9UNTJ60UM+rRXQL0F3PZrAqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:1n4M1W+ND1PLNIyJ4n6Vv2k3PYc7KSLf9ijJMUmnCld4TZmNd3bFrQ==
X-Talos-MUID: 9a23:NGzSqwiseQNaKVGox1PPsMMpLvhSoPisNU02kIQaiZSqaitxYDC/tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536241320"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 0BBD418000C07
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:24 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 50D2FCC12A8; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 23/27] python3-git: fix CVE-2026-78675
Date: Thu, 15 Oct 2026 23:19:18 -0700
Message-Id: <20261016061922.843414-24-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247990

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/ef7568e3b317ce617eacda39b8b54dcdff8c3b5c
[2] https://www.cve.org/CVERecord?id=CVE-2026-78675

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-78675.patch   | 49 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
new file mode 100644
index 0000000000..89616c8575
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
@@ -0,0 +1,49 @@
+From f65d897b463910ef494e480fc28d9fb8c856dfa1 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 12:32:24 +0200
+Subject: [PATCH 31/38] fix: ignore includes in submodule configuration
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
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit ef7568e3b317ce617eacda39b8b54dcdff8c3b5c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 4f2315fa..b0c660fb 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -239,7 +239,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+             raise ValueError("Cannot write blobs of 'historical' submodule configurations")
+         # END handle writes of historical submodules
+ 
+-        return SubmoduleConfigParser(fp_module, read_only=read_only)
++        return SubmoduleConfigParser(fp_module, read_only=read_only, merge_includes=False)
+ 
+     def _clear_cache(self) -> None:
+         """Clear the possibly changed values."""
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 813dd5a3f3..54bc423fa6 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -46,6 +46,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-78678_CVE-2026-78679.patch \
             file://CVE-2026-78677.patch \
             file://CVE-2026-78676.patch \
+            file://CVE-2026-78675.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


