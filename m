Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47286CCF2C4
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:18 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15275.1792129268839428503
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Xy4OrOlT;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4213; q=dns/txt;
  s=iport01; t=1792129269; x=1793338869;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=rH9xpLjwH5fohzB6Q84L/32WfavdeGGii8hRLrUf8Ws=;
  b=Xy4OrOlT+1ajrN3eosrfBYIz9xgAwxf0YwFvZCEPlCXjuelKV7t8RBch
   rqHcCocCR0dU84Xa4fLxTaorC86dpuxWbEedZtjBW0EGCmvhwrLMiLzrz
   WJAiuNrT9J3ABbrJUKRXS/ofjfvYfaYTpPEYimMDPFn8dxACnmU28nSFy
   Wk+VohDFKALM1Euvjni6MfeDYqsnZfhVAJcndgb5Hk9CAdenu+7zsPQQI
   NAx2p1jKw1VERzwcCOGS0LZ4s2mXIe5T/F32qUv9icZR4sRU+OXBaWJPV
   4OPHuN58XRN8Zo4lV9U9yWogLpF8hNo/fi+FDeC3mnASqpMdUtssyV4ha
   w==;
X-CSE-ConnectionGUID: hNP+KxKVRnuK7wRAriSiOA==
X-CSE-MsgGUID: wPb3jF62RL2a6fcOp16Cpg==
X-IPAS-Result: =?us-ascii?q?A0BJAgCGuNFq/5T/Ja1aglmCV3VgQ0kDlCaCIQOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCOgM3AxG8eIF5M?=
 =?us-ascii?q?4EBgykBPwJDUNhLEG+BaAELFAGBOIVAiCNdGAGEfCcbgUlEgRWDaYEFgVwBA?=
 =?us-ascii?q?YglBIMcEoFagQOUREiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIE?=
 =?us-ascii?q?gkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQeghhNA?=
 =?us-ascii?q?R4eUQEKIYEglEOSPqEPhCiMIpU6GjOqbwuYfY4Klk+EaYFoPIFHCwczGggbF?=
 =?us-ascii?q?TuCZwlKGQ+OOYNrgX+DZch2JzICBgMyAQEHAgcOAwuBaIRhiyEtgU8BAQ?=
IronPort-Data: A9a23:7lK+Lq3tmdstk5uLBvbD5YRwkn2cJEfYwER7XKvMYLTBsI5bpzBUz
 GBLXD/SOf2CajCgfdonOd+w9E9SvMDdzYNjSVQ/3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDGcOfq4I2dhNB3xtq
 uMiASoMVRGkrrfjqF67YrEEasULNsLnOsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiQC/FMEg9/5JYWjfqyj3XyWzZZs1mS46Ew5gA/ySQsi+ayaIuLJ4HiqcN9gX6S/
 WDooT7DJksTatKU7iLcrFm0ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:4jgYXa24i0aj657zRHQj7gqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:jKAGqG2g4B1tQA4FBtaeJLxfGuYdMV7N70nqJVKbVnlTYaeUcl630fYx
X-Talos-MUID: 9a23:li/mngt/5loEpmsCC82nmwlob8VGvf6ULBoEz5sNnNHdawdoNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536709655"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 4D86418000148
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 77A21CBEF72; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 15/27] python3-git: fix CVE-2026-76220
Date: Thu, 15 Oct 2026 22:40:54 -0700
Message-Id: <20261016054106.210444-16-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247949

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/96a888f4d782cb2f80452148e48e60ce4af6d541
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-76220

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-76220.patch   | 67 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
new file mode 100644
index 0000000000..0ea0edab95
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
@@ -0,0 +1,67 @@
+From 8f29b889df8dff1c1227dafabac0f49306d45838 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Sun, 2 Aug 2026 08:59:57 +0000
+Subject: [PATCH] Check joined short-option values before Git execution
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
+- Omitted test/test_git.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does 
+  not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 96a888f4d782cb2f80452148e48e60ce4af6d541)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+(cherry picked from commit 7cb2771d0968649e57c72a1f1470d7cbb9a82758)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index e2c4bf73..9c2d5d23 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -811,13 +811,21 @@ class Git(metaclass=_GitMeta):
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
+ 
+     class AutoInterrupt:
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 8579b298e0..aece60339a 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -36,6 +36,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73620.patch \
            file://CVE-2026-73619.patch \
            file://CVE-2026-76221.patch \
+           file://CVE-2026-76220.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


