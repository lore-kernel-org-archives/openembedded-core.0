Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530ADCC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:45 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15906.1792131584148701298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iEhk4jto;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3963; q=dns/txt;
  s=iport01; t=1792131584; x=1793341184;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7/kQm587nbe+x+KnDxryISvMtRaOXYPz3B2oiXrVX0A=;
  b=iEhk4jtoWUiQ7to1U1ro9z/YYnc4wblM08c3KXKDGdfO8vNJjOJIsYVF
   RHhz3vsp3fEMLBFWenNVcHqJt0Z1/5tox8eAk/LLvk3Wetc3JVmUqisv+
   4LQhmzciukQGzQxQPZhtAT8xeyoifelmgu7g7DrN1YSn4e64da0/fKKfO
   NdUtgPIBRXcZVxxFPqIhOQpx7P07chLnxxsJ+G/OVz6M5Ks8J0Iqyl9Qn
   +BbTCfg5HOGU6b9nNL0mjJrCxBMqN4ZGifXj60+ER3seJ/efP2mk0EpOo
   SGfQ9q6/eadn4IS/1o7j5uhBcOVkrX4A/vDr/vGpsDs0CxNiDiiF+id78
   A==;
X-CSE-ConnectionGUID: ea2wPSgaR9eA0Mp7fuuydw==
X-CSE-MsgGUID: RC4d27mTTm27hXCofdnTIg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBfwdFq/5X/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAi8rIwgZgwIBgjoDNwMRvHOCLIEBg?=
 =?us-ascii?q?ykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAGEfCcbgUlEhH6BBYEyKgICGIgLB?=
 =?us-ascii?q?IMcEoFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaM?=
 =?us-ascii?q?AuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoIYOxI9UQErg?=
 =?us-ascii?q?UMKgQEYoxqCIaEPhCiMIocnjhMaM4VbpRQLmH2OCpVjHFCEaYFoPIFZMxoIG?=
 =?us-ascii?q?xWDIglKGQ+OOYNrhRNRyHYnMgIJMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:9zkVBK4RYBldL9mu04hyBwxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jdLDGuPaayIMDGhfdtyYYTioBhTv5bXzNI3Twplqy88Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eMIRC5d5MDmh0p
 PExcBUVMR6emvO63+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEeUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4SJKoHXHps9ckCwn
 Ema8z6mBy0mMYbAyQqu9XyggNPuknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rNnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:U5tOtqnNHjH/eRNY+EcQc9znhQfpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A8EXI+ml+Jm/5z2HwaCP+tZ+J7g/XOXDUlmjoGEC?=
 =?us-ascii?q?xMzdkYeWwUQCe5b51n9U7zg=3D=3D?=
X-Talos-MUID: 9a23:+YalagbxzxW9zuBTjRSwiGs9MftU5v7xCHAmlpsKvfWlOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536485536"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:23 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 9D61A18000301
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 05DD0CC1250; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 10/27] python3-git: fix CVE-2026-73622
Date: Thu, 15 Oct 2026 23:19:05 -0700
Message-Id: <20261016061922.843414-11-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247991

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/863417457a0633db7ea5aed4fd01e0b291a41162
[2] https://www.cve.org/CVERecord?id=CVE-2026-73622

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-73622.patch   | 61 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
new file mode 100644
index 0000000000..e8df692c03
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
@@ -0,0 +1,61 @@
+From 6bb3d376f6e22140b5ff3d1d4c67c1408ee7e4e6 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 22 Jul 2026 15:42:44 +0200
+Subject: [PATCH 18/38] fix: prevent environment expansion in remote URLs
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
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 863417457a0633db7ea5aed4fd01e0b291a41162)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/objects/submodule/base.py |    2 +-
+ git/remote.py                 |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/objects/submodule/base.py b/git/objects/submodule/base.py
+index d08e967b..4fe2ff3f 100644
+--- a/git/objects/submodule/base.py
++++ b/git/objects/submodule/base.py
+@@ -516,7 +516,7 @@ class Submodule(IndexObject, TraversableIterableObj):
+         # END verify url
+ 
+         ## See #525 for ensuring git URLs in config-files are valid under Windows.
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+ 
+         # It's important to add the URL to the parent config, to let `git submodule` know.
+         # Otherwise there is a '-' character in front of the submodule listing:
+diff --git a/git/remote.py b/git/remote.py
+index 25e076f3..28fd35a5 100644
+--- a/git/remote.py
++++ b/git/remote.py
+@@ -759,7 +759,7 @@ class Remote(LazyMixin, IterableObj):
+         """
+         scmd = "add"
+         kwargs["insert_kwargs_after"] = scmd
+-        url = Git.polish_url(url)
++        url = Git.polish_url(url, expand_vars=False)
+         if not allow_unsafe_protocols:
+             Git.check_unsafe_protocols(url)
+         repo.git.remote(scmd, "--", name, url, **kwargs)
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 734144dc31..fe809b2229 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -31,6 +31,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-73625.patch \
             file://CVE-2026-73623.patch \
             file://CVE-2026-73624.patch \
+            file://CVE-2026-73622.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


