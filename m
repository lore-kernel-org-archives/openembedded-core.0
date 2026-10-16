Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E6FCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:40:06 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15263.1792129204013666494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Yg+6mDMT;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3044; q=dns/txt;
  s=iport01; t=1792129204; x=1793338804;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DN8w0D62BUk2oIQKfFYbm/FvpPlfns5hJ7PdnKwPZws=;
  b=Yg+6mDMTsLkJjcMy+EfawE8mflngVgFFLpqFl4WEj7jX8Hhc5QZTj6cy
   AOmcutNjmE/bUntKV3ppbT2mut1tEjFfVl2TJ2OiaZaPS+RDlODnXPgMw
   XNRZJQug+FP8jiUeUmUkfj/v+Ajnkd5qHJ+c6Ty0kljZ3UPgvwKhphGue
   NzE3FOLQUX/rwIIk+h3/vzMkwKuMqL+PgtnIkpgFxOQAioUQeboTJ6/O4
   8zeHxDDga+Rgky8dDmHmxe8nwimTdDX1MyzeMGmD+Y5RXLPoZt7OJmzR6
   p4660GZ/84+UL6wr4ralwqkYCtvCGli7SvEqFx3AuVl9UJa+YI5Qruhnw
   A==;
X-CSE-ConnectionGUID: O1AmSLzGRCuii2vGF40o0A==
X-CSE-MsgGUID: RXiIIywWQgmS6ZvNeXvy0A==
X-IPAS-Result: =?us-ascii?q?A0BGAgAUt9Fq/4z/Ja1aglmCV3VgQ0kElkYDnhyBfg8BA?=
 =?us-ascii?q?QEPNB0EAQGEP0YCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBMCAQMnCwEYAS0QIDErKxmDAgGCdAMRBrx/gXkzgQGDKQExA?=
 =?us-ascii?q?wIDAQlBUNsyAQsUAYE4hUCII3UBhHwnGxuBcoQIdoJhAgKBJYEGhXgEgiJ6E?=
 =?us-ascii?q?oMnk3pIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgghYjG?=
 =?us-ascii?q?TZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALg?=
 =?us-ascii?q?Rs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSFB6CZWEjCioCBBwCg?=
 =?us-ascii?q?gqTepF7oQ8KKIN2jCKVOhozqm+ZCI4Klk+EaYFoPIEoHA4HcBWCbgEzCUoZD?=
 =?us-ascii?q?5IkhRPJRycyAgE6AgcCBw4DC5FogX4BAQ?=
IronPort-Data: A9a23:lIqdyanp3H8wRkWtu5pVWifo5gztJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKCGnSaPyLZWX9eNFzPInl9kJSvZTQztVqGVZk/yFgH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FapB0+NMJXNhz
 9cFKTFXcD+t27qxmJvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIIYLSH5kKwRzwS
 mTuxVT4IzALK+Omxj++rECyoOL/gzKjcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM/JOGusn8xyXy4LR/QeCGmFCRTlEAOHKr+csTjAsk
 1vMlNTzCHk36/ueSGmW8fGfqjba1TUpEFLurBQsFWMti+QPaqlq5v4TZr6PyJKIs+A=
IronPort-HdrOrdr: A9a23:zRfy2K85xaOM+UjdtUNuk+D6I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HIoB11737JYVoqNU3I3OrwWpVoIkmskaKdn7NwAV7KZmCP0wGVxcNZnO7fKlbbdREWmNQw6U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: 9a23:97/KQ24rMZncJhFSodss0xc9H/sBYFLn52rRIhWmJkg1ELrNYArF
X-Talos-MUID: =?us-ascii?q?9a23=3AzjJ/og1Oy/l8xwEdoxE1bDJ9SDUj2ZSvKWEcjqo?=
 =?us-ascii?q?/tMy/ax5uHTqtkiXva9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536024772"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:40:02 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 8F25318000690;
	Fri, 16 Oct 2026 05:40:02 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3F433CBF201; Thu, 15 Oct 2026 22:40:01 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/3] python3: upgrade 3.14.7 -> 3.14.8
Date: Thu, 15 Oct 2026 22:39:42 -0700
Message-Id: <20261016053944.3835603-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016053944.3835603-1-dkelaiya@cisco.com>
References: <20261016053944.3835603-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247928

From: Vijay Anusuri <vanusuri@mvista.com>

Release information:
* https://www.python.org/downloads/release/python-3148/
* Python 3.14.8 is an expedited security release and the eighth
  maintenance release of 3.14, containing around 354 bugfixes,
  build improvements and documentation changes from 142 contributors
  since 3.14.7.

Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
CVE-2026-15806 CVE-2026-17084

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-8-final

Backport Changes:
- The new test_append_limited_history ptest fails on musl with the
  default libedit backend. libedit opens the history file for
  appending, then emits a header if ftell() reports offset zero.
  musl leaves the initial append stream at that offset, so a second
  _HiStOrY_V2_ header is appended and CPython's truncation keeps it
  in place of the expected history entry. Skip only that test on musl
  until the libedit interaction is fixed.

OE-Core failure report:
https://patchwork.yoctoproject.org/project/oe-core/patch/010101a0f6296539-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com/

Upstream issue:
https://github.com/python/cpython/issues/123018

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/{python3_3.14.7.bb => python3_3.14.8.bb}          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.8.bb} (98%)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.8.bb
similarity index 98%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.8.bb
index e73dc8d772..f10d6a5f4d 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.8.bb
@@ -40,7 +40,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
+SRC_URI[sha256sum] = "c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
@@ -263,6 +263,8 @@ SKIPPED_TESTS += " \
     --ignore test.test_tracemalloc.TestCAPI.test_tracemalloc_track_race \
 "
 
+# libedit treats musl's initial append-stream offset as an empty file,
+# appending a second history header (gh-123018).
 SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test__locale \
     -x test_c_locale_coercion \
@@ -272,6 +274,7 @@ SKIPPED_TESTS:append:class-target:libc-musl = " \
     -x test_threading \
     --ignore test.test_strptime.StrptimeTests.test_date_locale2 \
     --ignore test.test_ctypes.test_dlerror.TestNullDlsym.test_null_dlsym \
+    --ignore test.test_readline.TestHistoryManipulation.test_append_limited_history \
 "
 
 
-- 
2.35.6


