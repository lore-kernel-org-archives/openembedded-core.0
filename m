Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BADC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 11:15:17 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4770.1787138116577085690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 04:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hZ2acLmB;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5695; q=dns/txt;
  s=iport01; t=1787138116; x=1788347716;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pau2Gz7p/N+pCZNHPxTP7oE4dOwNaH+2UKxx9Ayi4Wc=;
  b=hZ2acLmBNWIXGY+Cak2Ir5dLCMAhzp0uDSGOSmbaRquB0vduAcO41w+C
   Jjx3vYn1GeHOZAW5jEG98qPmbJIViqkHVDv0YwKfSIiyXVwCpkAG1gDU7
   6VRkzLUfjOpIYbRHvNqHAlIeZGlW601Byw/4N7XNxEG9LdljbdQCdgYU5
   GdGePNPEPu+bnskabqUjJJTl2c2iQbWx+9w0uOj4xrg6XK4x0Aqy2sViJ
   Ck5xH8YMLHMcMD8ulpnNQk+yDqXVk/x51ork3AqDwl99WqkUlYuCUyuo/
   81c9T7/zC3WTdL2bx11BrV8/AdV248lBMEe3uI3M+NqzmuzNk0MAbV1KK
   w==;
X-CSE-ConnectionGUID: rAlS/KmTQ8m/2YbF/7TO9g==
X-CSE-MsgGUID: PihQq3g8Rbu2sKamISxUXQ==
X-IPAS-Result: =?us-ascii?q?A0BEAgDEjoVq/44QJK1aglmCV3ReQ0mWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWNbQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZaAQIBNQEYAS0sAwECWiMhgwIBgnQDEcN5giyBAYMoAYFU2zABCxQBB?=
 =?us-ascii?q?YEzhT+DA4EQhA9dGAGEfCcbG4FygRWDaYEFgVwCgU6GVwSCIoEMgVoekUdIg?=
 =?us-ascii?q?R4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ6gQleg?=
 =?us-ascii?q?SsqYQESF4EJggoCgnOCBgIBSUURCgsLGA1IESw3FBkEPm4HjkkggkYBAYENA?=
 =?us-ascii?q?SkCIHFngQKSZ5JBoQ8KKIN2jCGVOhozhVulEQuYfY4KlTslJkqEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OOINrhWTGVScyAgkyAQEHAgcOAwuBaJAABCiBUgEB?=
IronPort-Data: A9a23:FPVVYKLO2G1QSjhEFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS12QDz
 WAdXj+Aa6reZWr3fd5zaI219htVsceByoI2HQMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2clajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN10JUUNeq4dxt8nBCYUx
 PY2b28xSUGM0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNnwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5Fwoiua8YIGEI7RmQ+1tn0ahv
 znJr17zH0sBF9Wa6AGVz0KV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:b0mdYKuYky9li5L9ZCfGvZ017skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:ZsTRTG5a1f6X7F6xUdss7mcQIYcGd0HknHKXeX6yJyE2dJrERgrF
X-Talos-MUID: 9a23:JkQK1AWBSnSK+6Xq/AfthAh7b8g42a6zUlsumJAngNm5BRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,231,1779148800"; 
   d="scan'208";a="812698391"
Received: from alln-l-core-05.cisco.com ([173.36.16.142])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Aug 2026 11:15:15 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-05.cisco.com (Postfix) with ESMTPS id 8C96018000172;
	Wed, 19 Aug 2026 11:15:15 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id 259A3CC12A6; Wed, 19 Aug 2026 04:15:15 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-mako: Fix CVE-2026-41205
Date: Wed, 19 Aug 2026 04:15:09 -0700
Message-Id: <20260819111509.53180-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 11:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243724

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using
the commit shown in [1].

The backport makes Template URI normalization strip all leading
slashes, preventing a double-slash URI from bypassing the path
traversal check while keeping Mako at version 1.3.2.

[1] https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cfd72dc48328719a3
[2] https://github.com/advisories/GHSA-v92g-xgxw-vvmm

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../python/python3-mako/CVE-2026-41205.patch  | 110 ++++++++++++++++++
 .../python/python3-mako_1.3.2.bb              |   2 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch

diff --git a/meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch b/meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch
new file mode 100644
index 0000000000..0699654b53
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-mako/CVE-2026-41205.patch
@@ -0,0 +1,110 @@
+From e05ac61989a7fb9dd7dcde6cfd72dc48328719a3 Mon Sep 17 00:00:00 2001
+From: Mike Bayer <mike_mp@zzzcomputing.com>
+Date: Tue, 14 Apr 2026 15:45:19 -0400
+Subject: [PATCH] Fix path traversal via double-slash URI prefix in
+ TemplateLookup
+
+The URI normalization in Template.__init__ stripped only a single
+leading slash, while TemplateLookup.get_template() stripped all
+leading slashes. A URI such as "//../../secret.txt" could bypass
+the directory traversal check.  Changed to use lstrip("/") so
+both code paths handle leading slashes consistently.
+
+Fixes: #434
+Change-Id: I400b9a40aed956cc2b5826a9c8736f104e84f1a4
+
+CVE: CVE-2026-41205
+Upstream-Status: Backport [https://github.com/sqlalchemy/mako/commit/e05ac61989a7fb9dd7dcde6cfd72dc48328719a3]
+
+(cherry picked from commit e05ac61989a7fb9dd7dcde6cfd72dc48328719a3)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ doc/build/unreleased/434.rst | 10 +++++++++
+ mako/template.py             |  4 +---
+ test/test_lookup.py          | 41 ++++++++++++++++++++++++++++++++++++
+ 3 files changed, 52 insertions(+), 3 deletions(-)
+ create mode 100644 doc/build/unreleased/434.rst
+
+diff --git a/doc/build/unreleased/434.rst b/doc/build/unreleased/434.rst
+new file mode 100644
+index 00000000..452265ad
+--- /dev/null
++++ b/doc/build/unreleased/434.rst
+@@ -0,0 +1,10 @@
++.. change::
++    :tags: bug, template
++    :tickets: 434
++
++    Fixed issue in :class:`.TemplateLookup` where a URI with a double-slash
++    prefix (e.g. ``//../../``) could bypass the directory traversal check in
++    :class:`.Template`, allowing reads of arbitrary files outside of the
++    template directory. The issue was caused by an inconsistency in how leading
++    slashes were stripped between :meth:`.TemplateLookup.get_template` and
++    :class:`.Template` initialization.
+diff --git a/mako/template.py b/mako/template.py
+index 82c7cba8..d8ebc949 100644
+--- a/mako/template.py
++++ b/mako/template.py
+@@ -259,9 +259,7 @@ def __init__(
+             self.module_id = "memory:" + hex(id(self))
+             self.uri = self.module_id
+ 
+-        u_norm = self.uri
+-        if u_norm.startswith("/"):
+-            u_norm = u_norm[1:]
++        u_norm = self.uri.lstrip("/")
+         u_norm = os.path.normpath(u_norm)
+         if u_norm.startswith(".."):
+             raise exceptions.TemplateLookupException(
+diff --git a/test/test_lookup.py b/test/test_lookup.py
+index 6a797d7a..2f7cdf0b 100644
+--- a/test/test_lookup.py
++++ b/test/test_lookup.py
+@@ -127,6 +127,47 @@ def test_dont_accept_relative_outside_of_root(self):
+         # this is OK since the .. cancels out
+         runtime._lookup_template(ctx, "foo/../index.html", index.uri)
+ 
++    def test_dont_accept_relative_outside_of_root_via_double_slash(self):
++        """test that double-slash URI prefix can't bypass the
++        path traversal check"""
++        with tempfile.TemporaryDirectory() as base:
++            tmpl_dir = os.path.join(base, "app", "templates")
++            os.makedirs(tmpl_dir)
++            with open(os.path.join(tmpl_dir, "index.html"), "w") as f:
++                f.write("Hello")
++
++            secret = os.path.join(base, "secrets", "creds.txt")
++            os.makedirs(os.path.dirname(secret))
++            with open(secret, "w") as f:
++                f.write("SECRET_KEY=supersecret123")
++
++            tl = lookup.TemplateLookup(directories=[tmpl_dir])
++            rel = os.path.relpath(secret, tmpl_dir)
++
++            # single-slash prefix should also be blocked
++            assert_raises_message(
++                exceptions.TemplateLookupException,
++                "cannot be relative outside of the root path",
++                tl.get_template,
++                "/" + rel,
++            )
++
++            # double-slash prefix must not bypass the check
++            assert_raises_message(
++                exceptions.TemplateLookupException,
++                "cannot be relative outside of the root path",
++                tl.get_template,
++                "//" + rel,
++            )
++
++            # triple-slash prefix must not bypass the check
++            assert_raises_message(
++                exceptions.TemplateLookupException,
++                "cannot be relative outside of the root path",
++                tl.get_template,
++                "///" + rel,
++            )
++
+     def test_checking_against_bad_filetype(self):
+         with tempfile.TemporaryDirectory() as tempdir:
+             tl = lookup.TemplateLookup(directories=[tempdir])
diff --git a/meta/recipes-devtools/python/python3-mako_1.3.2.bb b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
index f9a8f60ff0..a328985a07 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.3.2.bb
@@ -10,6 +10,8 @@ PYPI_PACKAGE = "Mako"
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://CVE-2026-41205.patch \
+            "
 SRC_URI[sha256sum] = "2a0c8ad7f6274271b3bb7467dd37cf9cc6dab4bc19cb69a4ef10669402de698e"
 
 RDEPENDS:${PN} = "python3-html \
-- 
2.35.6


