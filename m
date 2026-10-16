Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DF4CCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:33 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15612.1792131564472441473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EnBwPg7t;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5031; q=dns/txt;
  s=iport01; t=1792131565; x=1793341165;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MV6caU4mTrKZxQ+vrq0R3Sn9HTMImVZfB2eZqZav66E=;
  b=EnBwPg7twRNiM4cbivMH4eQ58A4/NXWZDD4o3SrM81X/SqfYoP/Slbzy
   4xRR8eNcow7UuWcYUufPd6RZUTC2ktwOIMUfT7YykTzufqOtxsdMZ10Iv
   opa/JdP6RUsN4Y4NLKDR6oCtYJc7nwnEofFWIq+CU6b5S6DE1mEL218rp
   zJuyFGnHOLAmMvmM5hG7uhVIYnWpbCqUXxPCbfT7vTBwbs/F5yUiKpxQT
   i3PV6kEXr8r8FliFvySn2hFvCfUKqdbn7d2HW+Qko/lplS7kIejn/zRWU
   ihT1p0i/X6Q+4og9dwIkQnNdY7wghH0bp41BDmg/P/HVyAQ0Qhjo/K1wt
   g==;
X-CSE-ConnectionGUID: FwK6vjrzRheDG+72/ycvZw==
X-CSE-MsgGUID: u6gGlXleQ7uYYKI/zL/GnA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBrwNFq/4//Ja1aH4I6gld1YENJlCmCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8doF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWDaYEFgVwCA?=
 =?us-ascii?q?hiBDYZ+BIMcEoFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoFyJ?=
 =?us-ascii?q?i0OEi8OUQErVkWUP0KPZIIhgTWfWoQojCKVOhozhASBV6UUC5h9glmLMZZPh?=
 =?us-ascii?q?GmBaDyBWTMaCBsVgyIJShkPji4LC4NghRNRyHYnMgIJMgEBBwIHDgMLgWiQA?=
 =?us-ascii?q?AImB4FPAQE?=
IronPort-Data: A9a23:9kDW4KLP2Gn7HFLSFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENShjwCy
 WIfWziCaa3bamD8Kt12PN609h4C68PUzNVmTFEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1AE2JoI48C6Nx3DE1ht
 qNCbyEGcCKc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLovgf2hinTXeDxDo1XTrq0yi4TW5FEqjeO2bIOFKrRmQ+1IwEm3o
 lLC8l2mHyArF/3Y2x7C3XSF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOH9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:RrMs+aEDOrxzb2eRpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AV+24gGnwI0ISzCT91Afne8SvdtjXOVPC7ynOIVW?=
 =?us-ascii?q?qM2ZkZJLWFgXX6ah6odU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AwUSQ8g+lFh9C6alGFHk5y4GQf9o27IuqOEQAqMo?=
 =?us-ascii?q?bivinFGtiH3Cyih3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535334188"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 027CC180004B2
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:24 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 45975CBEFBF; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 21/27] python3-git: fix CVE-2026-78677
Date: Thu, 15 Oct 2026 23:19:16 -0700
Message-Id: <20261016061922.843414-22-yurade@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247983

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/b68afff45af0f49e79a3e2d2162018986b37ad5d
[2] https://www.cve.org/CVERecord?id=CVE-2026-78677

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-78677.patch   | 87 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
new file mode 100644
index 0000000000..23e0fc931a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
@@ -0,0 +1,87 @@
+From 2e39328f9df501adf6656ced51bda466dd164bfe Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 11:20:03 +0200
+Subject: [PATCH 29/38] Block separate git directories during clone
+
+<!-- agent -->
+Repo.clone() and Repo.clone_from() did not reject the clone option that
+redirects repository metadata to a caller-controlled path (GHSA-8mcc-hrx5-hvxc).
+Regression coverage exercises both keyword and multi-option input through both
+public clone APIs.
+
+Add the option to the existing clone denylist, matching Repo.init()
+and the documented allow_unsafe_options contract. Git itself registers
+
+The Python package and Alpine test workflows failed across the submodule suite
+because GitPython internally supplies --separate-git-dir when creating modern
+submodule layouts. The new public clone guard correctly rejected that option,
+but could not distinguish the library-generated path from caller input.
+
+Validate caller-provided keyword and multi-options before adding the
+library-controlled metadata path, then explicitly allow the resulting trusted
+clone invocation. This preserves rejection of unsafe clone_multi_options while
+restoring normal submodule creation. Update the one test that intentionally
+invokes Repo.clone_from() with its own separate git directory to opt in
+explicitly.
+
+CVE: CVE-2026-78677
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/b68afff45af0f49e79a3e2d2162018986b37ad5d]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit b68afff45af0f49e79a3e2d2162018986b37ad5d)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py |   10 ++++++++++
+ git/repo/base.py              |    4 +++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index 09a784e1..4f2315fa 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -7,6 +7,7 @@ import logging
+ import ntpath
+ import os
+ import os.path as osp
++import shlex
+ import stat
+ import uuid
+ 
+@@ -312,6 +313,15 @@ class Submodule(IndexObject, TraversableIterableObj):
+         module_abspath = cls._module_abspath(repo, path, name)
+         module_checkout_path = module_abspath
+         if cls._need_gitfile_submodules(repo.git):
++            if not allow_unsafe_options:
++                Git.check_unsafe_options(Git._option_candidates([], kwargs), repo.unsafe_git_clone_options)
++                multi_options = kwargs.get("multi_options")
++                if multi_options:
++                    Git.check_unsafe_options(
++                        shlex.split(" ".join(cast("Sequence[str]", multi_options))),
++                        repo.unsafe_git_clone_options,
++                    )
++            allow_unsafe_options = True
+             kwargs["separate_git_dir"] = module_abspath
+             module_abspath_dir = osp.dirname(module_abspath)
+             if not osp.isdir(module_abspath_dir):
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 772beb75..9011b0a4 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -150,7 +150,9 @@ class Repo:
+         "-c",
+         # Can install hooks that execute during clone:
+         "--template",
+-        # Fetches from a caller-controlled URL:
++        # Redirects the repository metadata to a caller-controlled path:
++        "--separate-git-dir",
++        # Fetches from an additional caller-controlled URI:
+         "--bundle-uri",
+     ]
+     """Options to ``git clone`` that allow arbitrary commands to be executed.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index a77fddda5b..56d55b14c4 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -44,6 +44,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-76222-regression.patch \
             file://CVE-2026-76222_p2.patch \
             file://CVE-2026-78678_CVE-2026-78679.patch \
+            file://CVE-2026-78677.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


