Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7437FCCF2C6
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:19:34 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15900.1792131564578225035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Pqi0rnew;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4144; q=dns/txt;
  s=iport01; t=1792131564; x=1793341164;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=g45VyjM9lRj4Rm1wPZa4W1PxjHCA+qI5CWGqPZKsu+U=;
  b=Pqi0rnewYAU+ZSHdZ8MSMLc2BCeqnMYz//0RDnJVBtG9J64UqtmGq9UB
   fX6in02/YC1bUlQV9qABLvrP9Wbe+KXrWVaOQIf51CRYAkkjsYI07lMKH
   1z7SwVUzUdhF06F7/15VhBTwi2lO2Eat6pYSqygFB6MriNJw7xFm+6Gwd
   5WN0obUn6I/aESWWbUydvqWh2UvKVbgBOndXmWoHPAIw7ycC/0uY9FGbd
   ItDT2DkAKbXRxNFY9LSt/ARR24ScOj+WTjZ+zQDfSvEghvncLA7aZZkon
   7E8gXu49oGZyNIGM74lvTAPjL9mL3bwZwqcg+sZjAryPIIyTlwgtI7b5z
   g==;
X-CSE-ConnectionGUID: OPfn20qYRmqptj6Lt6ZyIA==
X-CSE-MsgGUID: ZmgIJI5ITbW5/vWg7L4ShA==
X-IPAS-Result: =?us-ascii?q?A0BJAgDpwNFq/4v/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8doF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWDaYEFgVwCA?=
 =?us-ascii?q?hiICwSDHBKBWoEDlERIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoIYT?=
 =?us-ascii?q?QEeHlEBCiGBIC2mVKEPhCiMIpU6GjOqbwuYfY4Klk+EaYFoPIFZMxoIGxU7g?=
 =?us-ascii?q?mcJShkPjjmDa4UTUch2JzICBgMyAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:Q9Uri665bsW4sMHKIpTKfQxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jceDz2CM/qPMWXyeopzatvipkIF7JaHyN9mSQZr+ChmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOex9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqazpNtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGrUW/LwvGFB08
 OUANDJTSgzdtfOX6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYeUrsUIMpWcOOAl2TlejFVgFmUvqEwpWPUyWSd1ZCwa4SNIYPVGJ49ckCwl
 GfJ3kbYXzAmPuPCjiS6/S2I2tTPtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:LkDLjK3VeGNW+SsZrtNHrwqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:y2wKHW1uvCV5Cptish2IGrxfPfgrdCeF1UbqJlagFWQ3bKHLe06x0fYx
X-Talos-MUID: 9a23:TYx1qQnC0Fxs1iFsJKHKdnpQMchJwYXzKXwHrshBpfaLaggsADe02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536037753"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:19:24 +0000
Received: from sjc-ads-7310.cisco.com (sjc-ads-7310.cisco.com [10.30.220.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id E67631800022B
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:23 +0000 (GMT)
Received: by sjc-ads-7310.cisco.com (Postfix, from userid 1889728)
	id 24644CC1633; Thu, 15 Oct 2026 23:19:23 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 15/27] python3-git: fix CVE-2026-76220
Date: Thu, 15 Oct 2026 23:19:10 -0700
Message-Id: <20261016061922.843414-16-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016061922.843414-1-yurade@cisco.com>
References: <20261016061922.843414-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-7310.cisco.com [10.30.220.95];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.220.95, sjc-ads-7310.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247977

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/96a888f4d782cb2f80452148e48e60ce4af6d541
[2] https://www.cve.org/CVERecord?id=CVE-2026-76220

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76220.patch   | 66 +++++++++++++++++++
 .../python/python3-git_3.1.42.bb              |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
new file mode 100644
index 0000000000..cf88138008
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
@@ -0,0 +1,66 @@
+From a45e209e84248dbddbbbddae5c31d057ef00bfec Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 08:59:57 +0000
+Subject: [PATCH 23/38] Check joined short-option values before Git execution
+
+<!-- agent -->
+GHSA-wvpp-8hx9-p66j reports that unsafe-option checks omitted the value
+joined to a one-character option when split_single_char_options was false. A
+regression test reproduced the mismatch: GitPython checked only -n even though
+it emitted a joined -nVALUE token that Git parses as clustered short options.
+
+Collect the exact joined token for unsplit one-character keyword arguments so
+the existing clustered-short-option validation sees every option character.
+The split form and long-option behavior remain unchanged.
+
+A broader audit confirmed that all guarded keyword-forwarding APIs use
+_option_candidates, including clone, ls-remote, fetch, pull, push, archive,
+revision, diff, checkout-index, and tag paths. Git cf5497b14 confirms repeated
+short-option parsing within a joined token. Focused candidate and unsafe-option
+tests pass.
+
+CVE: CVE-2026-76220
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/96a888f4d782cb2f80452148e48e60ce4af6d541]
+
+Backport Changes:
+- Omit upstream regression test changes because the current PyPI 
+  source archive does not include its test suite.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 96a888f4d782cb2f80452148e48e60ce4af6d541)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py |   12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index f907fa4e..b1aef9d3 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -638,13 +638,21 @@ class Git(LazyMixin):
+                 values = value if isinstance(value, (list, tuple)) else (value,)
+                 if any(value is True or (value is not False and value is not None) for value in values):
+                     key = str(key)
+-                    options.append(f"-{key}" if len(key) == 1 else f"--{dashify(key)}")
+-                    if len(key) == 1 and split_single_char_options:
++                    if len(key) != 1:
++                        options.append(f"--{dashify(key)}")
++                    elif split_single_char_options:
++                        options.append(f"-{key}")
+                         options.extend(
+                             str(value)
+                             for value in values
+                             if value is not True and value not in (False, None) and str(value).startswith("-")
+                         )
++                    else:
++                        options.extend(
++                            f"-{key}" if value is True else f"-{key}{value}"
++                            for value in values
++                            if value is True or (value is not False and value is not None)
++                        )
+         return options
+     class AutoInterrupt:
+         """Process wrapper that terminates the wrapped process on finalization.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/python/python3-git_3.1.42.bb b/meta/recipes-devtools/python/python3-git_3.1.42.bb
index 80cdc59f92..37de657041 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.42.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.42.bb
@@ -36,6 +36,7 @@ SRC_URI += "            file://CVE-2026-42284.patch \
             file://CVE-2026-73620.patch \
             file://CVE-2026-73619.patch \
             file://CVE-2026-76221.patch \
+            file://CVE-2026-76220.patch \
            "
 SRC_URI[sha256sum] = "2d99869e0fef71a73cbd242528105af1d6c1b108c60dfabd994bf292f76c3ceb"
 
-- 
2.44.4


