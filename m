Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78DDC5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 17:10:43 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1401.1787159433159982433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 10:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CTAmJM8d;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2988; q=dns/txt;
  s=iport01; t=1787159433; x=1788369033;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B7t/7APYlzEzcHAC9/Tky3aR0gmT0fnWPIcGJ5KWGus=;
  b=CTAmJM8dWTKEikS5pTJKCWgEJ0qBLKnTaWLbGMFkxRtOpY39E4K5Ka4C
   WqEKn3d8I5JCuCdyd6rlcJNe71qIOgZboRzjsOWu/JvSh3gMesab6hvDU
   QSuH+5zXKzgW2Kj+y+7IcITrcIUNgnZwnHIwsTSVP2kkEf2XhXk7GAy09
   juO0Er2LFXeFI0wgCzvsiX3u+X1xlQleO2u7wo3OkjcjAyBF90V3KoCwA
   LaRuCCpsmGq0/Q6qnsddsssoKRD2KgQ4hh4HojiCeJ+BWTQ4At5QlK3L/
   lwloWj0f1kZisL5KYfNuGGk1coSdaNMSrtnE7DEKkCrDPHS8yB/x0MHW3
   w==;
X-CSE-ConnectionGUID: JYx//Yy8SayGZ8llYTSM9A==
X-CSE-MsgGUID: t1xxywndThC99cuopYWMfg==
X-IPAS-Result: =?us-ascii?q?A0BEAgD84oVq/48QJK1aglmCV3ReQ0m0aIF+DwEBAQ9ED?=
 =?us-ascii?q?QQBAYQ/Ro1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NhloBAgE1ARgBLSwDAQJaIyGDAgGCOgM3AxHEGoIsgQGDKAE/AkNQ2EsQg?=
 =?us-ascii?q?lUBCxQBgTiFP4giXRgBhHwnGxuBcoR+gQWBXAEBgi2FeASCIoEMgVqBLZA8S?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJX?=
 =?us-ascii?q?oErKmEBEheBCYIKAoJwggYCAUlFDgkMCxgNSBEsNxQZBD5uB45KIIF+TYEOA?=
 =?us-ascii?q?SuoIqEPCiiDdowhlToaM4VbpRELmH2OCpZQhGmBaDyBRwsHcBU7gmcJShkPj?=
 =?us-ascii?q?jiDa4F/g2XGVScyAgkyAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:9VHcsKIQigea5jgAFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENS12ZRm
 jBODT3XPKvbZmqhf951aIS0oRsH65DVzYQ2SlMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1MPVFxerwJqt1+EE58p
 fgcGQw2S0Gq0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzN3wsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhieS1bISEK4fiqcN9gh+It
 nPZ+WjFAjpLZdeCziK0zVeiibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVX95WVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:jIUI864qfcGCXJ+1OQPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:+RdshGzhydO6mtNPMH4JBgU2K9BiNUzMnEzZMmCKWWJteYGubA65rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AkQFkoA7h1wXjX33YnTF8UZ4Nxox0urS+GV8Lnak?=
 =?us-ascii?q?GkJjVPjF3IwaiqTq4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="814046993"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 17:10:32 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 0D58E180006C4;
	Wed, 19 Aug 2026 17:10:32 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 9E985CCA79B; Wed, 19 Aug 2026 10:10:31 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/4] python3-git: fix CVE-2026-42284
Date: Wed, 19 Aug 2026 10:10:22 -0700
Message-ID: <20260819171026.750280-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 17:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243774

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream 3.1.47 backport for
CVE-2026-42284. The upstream fix merge is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/gitpython-developers/GitPython/commit/da545232d0401fb9fb7660f9ff67991996674dda
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-42284

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3-git/CVE-2026-42284.patch   | 37 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  2 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
new file mode 100644
index 0000000000..456a455e53
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-42284.patch
@@ -0,0 +1,37 @@
+From dc3885fd7b4cee9ce4bf04d120e63ea00d905431 Mon Sep 17 00:00:00 2001
+From: "GPT 5.4" <codex@openai.com>
+Date: Tue, 21 Apr 2026 09:30:29 +0800
+Subject: [PATCH] Make sure that multi-options are checked after splitting them
+ with `shlex`
+
+CVE: CVE-2026-42284
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/c9a26789d88b18f8b4620f37307df2976292d2a0]
+
+Backport Changes:
+- Omit regression tests because the Scarthgap PyPI source
+  archive does not include the upstream test suite.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit c9a26789d88b18f8b4620f37307df2976292d2a0)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ git/repo/base.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/git/repo/base.py b/git/repo/base.py
+index f5069dbf..92ace3a0 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -1271,8 +1271,8 @@ class Repo:
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
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 19885a58c7..c294b23112 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -12,6 +12,8 @@ PYPI_PACKAGE = "GitPython"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://CVE-2026-42284.patch \
+           "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
 DEPENDS += " python3-gitdb"
-- 
2.44.4


