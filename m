Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DA1CCF2C0
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15275.1792129268839428503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YxwBej/k;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4002; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=p4abwU/a34sChYrR88BlOl8450jdLMiMQbmZCN1Z0Q0=;
  b=YxwBej/ksA3F7M+WMnQyCZwZM/PJ7vssk7R1sGNMIB3pm5qTpMPSX3qr
   7N3dam/13E97SurwGxFVA4wYKIMovFsMqetQH6NLLZfZSNM9Sq2ycMsqq
   hZC76GwKjkUoSWrn8WP3cBRWz4QTxQcXLHlwWwkhPl7vdkIaFoBU9AYRb
   zZKzSFIUyzbC8iF/gTxURXKIBQBPs1EXVdo/yLpsmmoGmv7vFbAycj+Aj
   5bDAzhEcVYIWJmtHRmtcVOwOmtVrUxYmz22mAuWiwIjJ+YE6EY+W1Ncl5
   LVf2uW4DoU9HGtC+lhNXN8IUwCP3SqCYIh03estaRCRLSIqMYTSInMTlE
   w==;
X-CSE-ConnectionGUID: mLKfV9u5TmekSEWB9c1INA==
X-CSE-MsgGUID: lQKhTyO0QjueTwW/KAnZ7w==
X-IPAS-Result: =?us-ascii?q?A0BIAgCGuNFq/5X/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvHiCLIEBg?=
 =?us-ascii?q?ykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAGEfCcbgUlEhH6BBYEyKgEBiCUEg?=
 =?us-ascii?q?xwSgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCF?=
 =?us-ascii?q?iMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC?=
 =?us-ascii?q?4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeghg7Ej1RASuBQ?=
 =?us-ascii?q?wqBARiSfZAdgiGhD4QojCKHJ44TGjOFW6UUC5h9jgqVYxxQhGmBaDyBRwsHM?=
 =?us-ascii?q?xoIGxWDIglKGQ+OOYNrgX+DZch2JzICCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:d9q8d6txO27Meplw1XFGdIOR3efnVAFfMUV32f8akzHdYApBsoF/q
 tZmKTqPPKyKZjf1KI8jPIvioUJX6JbdxtdqTAtvrXpnESpBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvra9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/8JUD18f6
 KEkLT0OVT28rbO9mZOdY7w57igjBJGD0II3oHpsy3TdSP0hW52GGv+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtGYH49tL/Aan3XYiBCoV6YjaE2+GPUigd21dABNfKIIYLVHZQLwx3wS
 mTu+13aAi0LE4SmyyeIzm2TwczmmxGkR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Oxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:6iTopqo0TwCwXSODgcgBTVUaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:webwBWHSw2CmFXNsqmJi0G0aJJE4L0HYwXTrDnCSWG0waZu8HAo=
X-Talos-MUID: 9a23:RxTWjAvZc2E1ymVmZM2ngAhBNPt5xPyXCl0ArYo5/OqtMx4vJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536709653"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id F060D180001CB
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 5C640CBEF6B; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 10/27] python3-git: fix CVE-2026-73622
Date: Thu, 15 Oct 2026 22:40:49 -0700
Message-Id: <20261016054106.210444-11-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247947

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/863417457a0633db7ea5aed4fd01e0b291a41162
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-73622

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73622.patch   | 60 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
new file mode 100644
index 0000000000..c43013b9e4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
@@ -0,0 +1,60 @@
+From 5043b75a697c0f9110d2014234831dd1bc568a60 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 15:42:44 +0200
+Subject: [PATCH] fix: prevent environment expansion in remote URLs
+
+Remote and submodule creation expanded environment-variable references in
+caller-supplied URLs before storing them in Git configuration. This could
+expose process environment values through a later network request or a tracked
+.gitmodules file.
+
+Preserve variables literally in the remaining untrusted URL callers while
+retaining Git.polish_url() expansion for intentional local-path normalization.
+Add regression tests covering remote configuration and submodule configuration.
+
+Git baseline: git remote add and git submodule add accept URL arguments
+literally; Git does not perform shell-style environment expansion on those
+arguments.
+
+CVE: CVE-2026-73622
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/863417457a0633db7ea5aed4fd01e0b291a41162]
+
+Backport Changes:
+- Omitted test/test_remote.py, test/test_submodule.py because the current 
+  PyPI source archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 863417457a0633db7ea5aed4fd01e0b291a41162)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py | 2 +-
+ git/remote.py                 | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index fa60bcda..43e0ec9a 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -601,7 +601,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # END verify url
+ 
+         ## See #525 for ensuring git URLs in config-files are valid under Windows.
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+ 
+         # It's important to add the URL to the parent config, to let `git submodule` know.
+         # Otherwise there is a '-' character in front of the submodule listing:
+diff --git a/git/remote.py b/git/remote.py
+index cafa1f84..dd892fdc 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -805,7 +805,7 @@ class Remote(LazyMixin, IterableObj):
+         """
+         scmd = "add"
+         kwargs["insert_kwargs_after"] = scmd
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+         if not allow_unsafe_protocols:
+             Git.check_unsafe_protocols(url)
+         repo.git.remote(scmd, "--", name, url, **kwargs)
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 847bdfeab2..6456031620 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -31,6 +31,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73625.patch \
            file://CVE-2026-73623.patch \
            file://CVE-2026-73624.patch \
+           file://CVE-2026-73622.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


