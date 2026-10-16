Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49B5CCA473
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:29 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15278.1792129282730516981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h5qsk6kK;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5074; q=dns/txt;
  s=iport01; t=1792129283; x=1793338883;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NY9nOfSipMT1GpbcFzMtUFiWmlTNf0c1iw0fyq1m+6w=;
  b=h5qsk6kKAnKI7lVmKMYcN6r0wCB8lIKP1sQ1oLbI9GtWgzMG1bI5GtXX
   duhPGWCM+MncaxpIdCqGZS3DBsNil8u0PL2wPsdtorDqT6SIBDJzHwxXv
   E55J7wUfG7tPRAHGScWk16LXdLOoYFTvjyShd/WHox9Ct0NuQ6nFfDMsH
   29DQpJy1THOWb3qVZnj9kL2D2o0pGZuUqoWm6VEt/rxuc2x+YnmiXzmMT
   ffkK+FyigKDIYC102+q09zG7sKPMQY2kKmSpDi/CTxdSBw7e0yWTbbm7j
   VIfEcOhedKDpgKUGm7qj94XJWsSERrd8q35PU3j2CSBxZB3i7hAf2ld19
   Q==;
X-CSE-ConnectionGUID: 22ttIXX6RTesKqUssNsQ2g==
X-CSE-MsgGUID: q4V8ZZ/pTEStdRz5/4zVfQ==
X-IPAS-Result: =?us-ascii?q?A0AnAACGuNFq/5P/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YENJjHKHN4IhA54cgX4PAQEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvK?=
 =?us-ascii?q?yMIGYMCAYI6AzcDEbx4gXkzgQGDKQE/AkNQ2EsQb4FoAQsUAYE4AYU/iCNdG?=
 =?us-ascii?q?AGEfCcbgUlEgRWDaYEFgVwBAYglBIMcEoFalUdIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5IUHoFyJi0OEi8OUQErVkWUP0KPZIIhgTWfWoQojCKVOhozh?=
 =?us-ascii?q?ASBV6UUC5h9glmLMZZPhGmBaDyBRwsHMxoIGxWDIglKGQ+OLgsLg2CBf4Nly?=
 =?us-ascii?q?HYnMgIJMgEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:avUW5qhfyj1jfQ9vq225GFdGX161NxEKZh0ujC45NGQN5FlHY01je
 htvWGCGb/2NYGX0KN0na4uz/BhXu5XWmt41S1A5pHxhQyxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVCoPprIFF+q
 8YkJSsudy2YnMSt+ei0H7wEasQLdKEHPasFsX1miDWcBvE8TNWaG+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgh/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIePKoTXFZkJwy50o
 Erfo1qpMCNdLOCy8iaJyGDxwbPdoy3CDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFcCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3uz8Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:+6vqjKpQwa4Op86kGMJHjNYaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:ls3ZNG9c3640UzlAS8qVvxROBtwEQk2D9kvdOGyhNH1ybqasE1DFrQ==
X-Talos-MUID: 9a23:4RlMYwvxzO3yarki082nnW1cZPVapLySJXsRna8U5o7YJxJ+AmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528058445"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 5B1AB1800025B
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 9C55ECBF201; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 21/27] python3-git: fix CVE-2026-78677
Date: Thu, 15 Oct 2026 22:41:00 -0700
Message-Id: <20261016054106.210444-22-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247958

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/b68afff45af0f49e79a3e2d2162018986b37ad5d
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-78677

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-78677.patch   | 86 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
new file mode 100644
index 0000000000..cdee200d1e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
@@ -0,0 +1,86 @@
+From 03baa6374b8769a9544292d84040b323c5f1437a Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 11:20:03 +0200
+Subject: [PATCH] Block separate git directories during clone
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
+- Omitted test/test_clone.py, test/test_submodule.py because the current PyPI 
+  source archive does not include the test suite and the python3-git recipe 
+  does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit b68afff45af0f49e79a3e2d2162018986b37ad5d)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 10 ++++++++++
+ git/repo/base.py              |  3 +++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index d25df367..410f41e2 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -9,6 +9,7 @@ import logging
+ import ntpath
+ import os
+ import os.path as osp
++import shlex
+ import stat
+ import sys
+ import uuid
+@@ -360,6 +361,15 @@ class Submodule(IndexObject, TraversableIterableObj):
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
+index fd6d660d..56a19dc5 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -158,7 +158,10 @@ class Repo:
+         "-c",
+         # Can install hooks that execute during clone:
+         "--template",
++        # Redirects the repository metadata to a caller-controlled path:
++        "--separate-git-dir",
+         # Fetches from a caller-controlled URL:
++        # Fetches from an additional caller-controlled URI:
+         "--bundle-uri",
+     ]
+     """Options to :manpage:`git-clone(1)` that allow arbitrary commands to be executed.
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 18d7299ce3..e2a762ab8e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -44,6 +44,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76222-regression.patch \
            file://CVE-2026-76222_p2.patch \
            file://CVE-2026-78678_CVE-2026-78679.patch \
+           file://CVE-2026-78677.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


