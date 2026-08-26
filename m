Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB631C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:23:34 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6076.1787721806858189594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gvj7YEEd;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4413; q=dns/txt;
  s=iport01; t=1787721806; x=1788931406;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=anFaw4YauTROOy13OlZi1ADsxhWURp879dsSLXD9kd8=;
  b=gvj7YEEdvCb6/KQLvCpzjYDpwmd0LcdREyMQ/REYs1tXNY9Ve7TSnWru
   tBqM04ftiNFPUAPSQxPDTYvFhzf63Dzt0VTPQyeZZUlWV5+DNfGfuS2tp
   Rj0EQasL6THDjcb7v7UiTlCKAbSEQzawpf/WOrK40MXX+HeKdVC0Ko85l
   KVnn9tQ3KHxqRoMW/gpEkA0Zp4O4DsNjTfOPymQbd4zbTpsOr49Jc3l06
   DaAVrUTGbkg/buwEWZAQGDgmJVwGC3CmKAMGIq5hgMmAc9vQHq6U2iVPo
   j+Usg0VFILj1ddBkGUdyPA9UZbyIKgpPtVueqsE56XXnVkS4jvlhq7VIa
   Q==;
X-CSE-ConnectionGUID: M7kfYKXBRO21ZtU9T+MK7Q==
X-CSE-MsgGUID: oMF0D8XWRaCrIukYy7bMXQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgD7do5q/5IQJK1aglmCV3ReQ0mWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhD9GjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2GWgECATUBGAEtLAMBAlojIQkRgmgBgnQDEb5OgiyBAYMoATEFCQJDU?=
 =?us-ascii?q?NswAQsUAYE4hT+IIl0YAYR8JxsbgXKBFYNpgQWBXAEBgSeGfgSCIoEMgVoek?=
 =?us-ascii?q?WpIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohBAjGTZ8g?=
 =?us-ascii?q?QlegSspYAESF4EJggcCglqCBQIBSUMOB0c+CxgNSBEsNxQZBD5uB45rH4JCB?=
 =?us-ascii?q?4EOASoBIDMsgS0eMJJqkj6hDwoog3aMIpU6GjOFW6URmQiOCpZQhGmBaDyBR?=
 =?us-ascii?q?wsHcBWDIglKGQ+OOINrgX+DFFHGVScyAgkyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:7xmvcKtzO86j2eeqvHb9PLj3cefnVABfMUV32f8akzHdYApBsoF/q
 tZmKTuGOPqDZ2OnfIsnYY+290pV7cPWmINrTQRr+H9gHnxBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/LZ9ks21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw37l0D1Btx
 dYiD2pUXAy+1t715ZHkc7w57igjBJGD0II3s3Vky3TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgl/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9KoXaFJ0IzxbIz
 o7A12PcLEk2ZOyg8zOu6FOxhd7ewineaLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:laDuT6r1/OfpEMnsonv9JP4aV5odeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjizEht7t2uqUuEimpRGsZd0zs=
X-Talos-CUID: 9a23:elZonGxdblxPambR/5y4BgUxRcMrQ17t5k33eRaKFVs4dP6wagCprfY=
X-Talos-MUID: 9a23:LX6emgSGRCDDFr3qRXTroR86GJdY3J6nI1osjJY3qpaOEBxJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="818905988"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:23:25 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id BD7001800016E;
	Wed, 26 Aug 2026 05:23:25 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 5469ECCA79B; Tue, 25 Aug 2026 22:23:25 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3: fix CVE-2026-0864
Date: Tue, 25 Aug 2026 22:23:22 -0700
Message-Id: <20260826052322.716321-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244284

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/python/cpython/commit/db4a157c790479710a1a840d7937c5c815a6f8b6
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-0864

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3/CVE-2026-0864.patch        | 72 +++++++++++++++++++
 .../python/python3_3.12.13.bb                 |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-0864.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2026-0864.patch b/meta/recipes-devtools/python/python3/CVE-2026-0864.patch
new file mode 100644
index 0000000000..e39177bdcb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2026-0864.patch
@@ -0,0 +1,72 @@
+From 1426c0d9d57a1ed19f95de0d461903e7cd6f6f64 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 4 Aug 2026 11:27:20 +0200
+Subject: [PATCH] [3.12] gh-143927: Normalize all line endings (CR, CRLF, and
+ LF) in configparser (GH-143929) (#152005)
+
+gh-143927: Normalize all line endings (CR, CRLF, and LF) in configparser (GH-143929)
+
+CVE: CVE-2026-0864
+Upstream-Status: Backport [https://github.com/python/cpython/commit/db4a157c790479710a1a840d7937c5c815a6f8b6]
+
+(cherry picked from commit 5858e42c539dac8394636a6e9b30472b8994851f)
+
+Co-authored-by: Seth Larson <seth@python.org>
+(cherry picked from commit db4a157c790479710a1a840d7937c5c815a6f8b6)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ Lib/configparser.py                                   |  4 +++-
+ Lib/test/test_configparser.py                         | 11 +++++++++++
+ .../2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst    |  2 ++
+ 3 files changed, 16 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
+
+diff --git a/Lib/configparser.py b/Lib/configparser.py
+index f96704eb455..8ae35a0a189 100644
+--- a/Lib/configparser.py
++++ b/Lib/configparser.py
+@@ -907,7 +907,9 @@ class RawConfigParser(MutableMapping):
+             value = self._interpolation.before_write(self, section_name, key,
+                                                      value)
+             if value is not None or not self._allow_no_value:
+-                value = delimiter + str(value).replace('\n', '\n\t')
++                # Convert all possible line-endings into '\n\t'
++                value = (delimiter + str(value).replace('\r\n', '\n')
++                         .replace('\r', '\n').replace('\n', '\n\t'))
+             else:
+                 value = ""
+             fp.write("{}{}\n".format(key, value))
+diff --git a/Lib/test/test_configparser.py b/Lib/test/test_configparser.py
+index b7e68d7a3e7..389aa15e670 100644
+--- a/Lib/test/test_configparser.py
++++ b/Lib/test/test_configparser.py
+@@ -527,6 +527,17 @@ boolean {0[0]} NO
+             cf.get(self.default_section, "Foo"), "Bar",
+             "could not locate option, expecting case-insensitive defaults")
+ 
++    def test_crlf_normalization(self):
++        cf = self.newconfig({"key1": "a\nb","key2": "a\rb", "key3": "a\r\nb", "key4": "a\r\nb"})
++        buf = io.StringIO()
++        cf.write(buf)
++        cf_str = buf.getvalue()
++        self.assertNotIn("\r", cf_str)
++        self.assertNotIn("\r\n", cf_str)
++        self.assertEqual(cf_str.count("\n"), 10)
++        self.assertEqual(cf_str.count("\n\t"), 4)
++        self.assertTrue(cf_str.endswith("\n\n"))
++
+     def test_parse_errors(self):
+         cf = self.newconfig()
+         self.parse_error(cf, configparser.ParsingError,
+diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
+new file mode 100644
+index 00000000000..ca554997e5c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
+@@ -0,0 +1,2 @@
++Normalize all line endings (CR, CRLF, and LF) to LF+TAB when writing
++multi-line configparser values.
+-- 
+2.44.4
+
diff --git a/meta/recipes-devtools/python/python3_3.12.13.bb b/meta/recipes-devtools/python/python3_3.12.13.bb
index b6ceb0c634..752e2b888f 100644
--- a/meta/recipes-devtools/python/python3_3.12.13.bb
+++ b/meta/recipes-devtools/python/python3_3.12.13.bb
@@ -48,6 +48,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://CVE-2026-11972.patch \
            file://CVE-2026-9669.patch \
            file://CVE-2026-7210.patch \
+           file://CVE-2026-0864.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.6


