Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE17FCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:29 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15278.1792129282730516981
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hthNkdSB;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3804; q=dns/txt;
  s=iport01; t=1792129283; x=1793338883;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ngeElvHCiDhLcHZ1TGNWcH1F8hyU+Au5XhOTYOu7+Ho=;
  b=hthNkdSB3fGsIIftUWMds3pmKjoBsqF9Zg9+7iSuTfDLe94tWt+lECzg
   w3nSr0hNx0OhSVOA2h7Vxz1Wl9qZrbNynxUZaJfgVTpCbgpZYwpQ0bNPZ
   3nKnlGlX48uvo7DxqwZLmSh8eUNANomfZOirxteiBBy1Z2Nqk7K2UL5Jp
   iScppWK9UHHbQuXdxpT3br46jR+VTILob9vVOBcrMrQsu4PqK0RYFLVQt
   8/prRZJ3esq+9C9D5C0EXvo+z8+jCDQZ17DlttUtQ6p/zQpDsNSxFuXu1
   Q3BE8O2OAVDKDbP+NkWqwvknHQs8E19eDAXh0gg1u/gegaTUAjcMbOSGC
   Q==;
X-CSE-ConnectionGUID: OMx9U/sNTtqN7orTd9HcIg==
X-CSE-MsgGUID: rkzqku1GSzySycSc6q2aFg==
X-IPAS-Result: =?us-ascii?q?A0BIAgCGuNFq/5P/Ja1aglmCV3VgQ0mUKYIhA54cgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4VAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbx4gXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAYR8JxuBSUSBFYNpgQWBXAEBg?=
 =?us-ascii?q?SeGfgSDHBKBWpVHSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BIIIWIxk2eoEJXoErKWEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CGEwBL?=
 =?us-ascii?q?RBRASuCTiylJ6EPhCiMIpU6GjOEBIFXkkCSVAuYfY4Klk+EaYFoPIFHCwczG?=
 =?us-ascii?q?ggbFYMiCUoZD445g2uBf4NlyHYnMgIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:i1YRJq+2iHZzdBrtUqhPDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 2oWWz2PbPuIYTD9LYhxYI+zpEMG78fdyddqTwJl+SxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kRGJ1Jx6FsJ11S7
 NpHLyoxYkGjjMO5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0In1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW3YIKIKoDWG625mG6Cp
 XDf/HmgLSoIJeeOwgGOrGv2j8HAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYS71Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:G4+P9a0YPFkLY9yMV2xM1AqjBJ4kLtp133Aq2lEZdPUzSL39qy
 nAppomPHPP5Qr5HUtQ+uxoW5PwJE80i6QV3WB5B97LN2PbUSmTXeNfBODZrAEIdReTygck78
 ddWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:rvwtoG3kxCSQ5Axz0hxk2rxfPeU1I0Ca11HsP1aeVmFzdLHEaVSx9/Yx
X-Talos-MUID: 9a23:4FSbrQs7i9Z0ZmQtkc2nnjJwLcR1uouVGlE2gJ49sJedbyVeNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528058446"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 5CDEE1800026E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:08 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id A1513CBF202; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 22/27] python3-git: fix CVE-2026-78676
Date: Thu, 15 Oct 2026 22:41:01 -0700
Message-Id: <20261016054106.210444-23-yurade@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247957

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/4b4e47fc1224e23b0c8ee7220a7192818f2e4abb
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-78676

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-78676.patch   | 54 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
new file mode 100644
index 0000000000..a897b4ee78
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
@@ -0,0 +1,54 @@
+From 5095b034dc451f3ec0c4c77c69403c8fce7eb6d7 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Mon, 10 Aug 2026 12:22:31 +0200
+Subject: [PATCH] fix: preserve multiline config values when writing
+
+<!-- agent -->
+GitConfigParser decoded valid multiline values into embedded newlines, but
+_write() serialized those newlines as indented physical lines. Rewriting an
+otherwise unchanged config could therefore change its meaning to Git.
+
+Serialize resident multiline values with Git-compatible escapes inside a
+quoted continuation, preserving GitPython read compatibility while keeping
+each option structurally intact. This addresses GHSA-284h-m62q-gf8w.
+
+The regression starts with an inert multiline value, performs an unrelated
+write, and verifies with both GitPython and git config that it remains one
+value and does not create another option.
+
+Git baseline: config.c parse_value() and write_pair() at cf5497b14c5a escape
+embedded LF as \\n rather than emitting it as a physical config line.
+
+CVE: CVE-2026-78676
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/4b4e47fc1224e23b0c8ee7220a7192818f2e4abb]
+
+Backport Changes:
+- Omitted test/test_config.py because the current PyPI source 
+  archive does not include the test suite and the python3-git 
+  recipe does not run it.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 4b4e47fc1224e23b0c8ee7220a7192818f2e4abb)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/config.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/git/config.py b/git/config.py
+index 30218dba..e8482a08 100644
+--- a/git/config.py
++++ b/git/config.py
+@@ -681,7 +681,11 @@ class GitConfigParser(cp.RawConfigParser, metaclass=MetaParserBuilder):
+                     continue
+ 
+                 for v in values:
+-                    fp.write(("\t%s = %s\n" % (key, self._value_to_string(v).replace("\n", "\n\t"))).encode(defenc))
++                    value = self._value_to_string(v)
++                    if any(char in value for char in '\n\t\b\\"'):
++                        value = value.replace("\\", "\\\\").replace('"', '\\"')
++                        value = '"%s\\\n"' % value.replace("\n", "\\n").replace("\t", "\\t").replace("\b", "\\b")
++                    fp.write(("\t%s = %s\n" % (key, value)).encode(defenc))
+                 # END if key is not __name__
+ 
+         # END section writing
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index e2a762ab8e..fba7883c2e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -45,6 +45,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-76222_p2.patch \
            file://CVE-2026-78678_CVE-2026-78679.patch \
            file://CVE-2026-78677.patch \
+           file://CVE-2026-78676.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


