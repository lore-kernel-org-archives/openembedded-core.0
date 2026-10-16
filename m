Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04E0CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:40:06 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15262.1792129203678193388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OBZgNjQN;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4673; q=dns/txt;
  s=iport01; t=1792129203; x=1793338803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QJPaV49fR3Cjg21mmOvD0B5dPT9yah+ffkIa44BPHHc=;
  b=OBZgNjQN24cDlUxn/2u4+urPJWL+lX++S6EE/2SBtm63JfsIDfWgs81W
   4UE/ednGiZdKJdPFs/Y51pnSO1utnSqGsg1qXADT/Wf3jEC6Sa1iYcWDc
   Oo1hHrbwclp6XZN2pnKFa2+XezbQwTJERe0tlDO3OkJ1ZRdAbauYOH0Jr
   ER7YMRV1dGRNeSiZWIFbLAw05ZluIktpuVO86R3He8sAcYYUQIresR5p/
   NrkbfMEL8LZJf12oFaRWmnPd2744pfG6cSmLSU9Tx+KwF2/7EegMRwxHd
   BM3xX2To14JTICnnEuZvSryj5iTb90zQOOfQYn3UzYnynlQsWQ5bRJNBQ
   A==;
X-CSE-ConnectionGUID: NSQqFFnvQUGIUmmbfHGfDw==
X-CSE-MsgGUID: N5Dc/Hg6QgGJfbRLDUuSwg==
X-IPAS-Result: =?us-ascii?q?A0BJAgAeuNFq/5T/Ja1aglmCV3VgQ0mWSgOeHIF+DwEBA?=
 =?us-ascii?q?Q9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgECAQMyARgBLRAcAwECGRYrIwgZCRGCaAGCdAMRvHiCLIEBg?=
 =?us-ascii?q?ykBOQEFAkNQ2zIBCxQBgTiFQIgjXRgBhHwnGxuBcoEVgTuCLoEFgVwBAYIwh?=
 =?us-ascii?q?XUEgiKBDIFaHogbhxOFe0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUH?=
 =?us-ascii?q?oJkAQF6EwETFwEggQAjaQcKCwYpkmqSQKEPCiiDdowilToaM4VbpRQLmH2OC?=
 =?us-ascii?q?pZPhGmBaDyBRwsHcBWDIglKGQ+OKw4Lg2CBf4MUUYE1x0EnMgIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAiQJgU8BAQ?=
IronPort-Data: A9a23:xLPD26Ncb8wo5b7vrR30lsFynXyQoLVcMsEvi/4bfWQNrUohhjFTn
 GcXXDjTMvmMNmT8fopxPoiyoEpX6p7dmoIxSHM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69NVNVgYE4sGw9tYIFxL8
 PYWCB8DQg/W0opawJrjIgVtrt4oIM+uOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzPHwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQsi+WwYYqMJo3iqcN9uBu0r
 SXm8DrADT44Otal7Ra470mzibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++NukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:yZuksa1tZeui105ZyLGRIgqjBJAkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7NJGk/q9rm6w+lFNtl6tyG/Ke0wdr69R5WPGdXg2UK1XYANu5deXcGPTV7OQ==
X-Talos-CUID: 9a23:hBy1gWAm7Wr3s7P6Ew9czVc6NMY7S0Dy7UrVJkW2KUlnZKLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A59HCVA9DMr9TabxOd6z11Q+Qf+E1z6/pKE9TqJo?=
 =?us-ascii?q?pmceODwhcBiqmkzviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535598149"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:40:02 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 9FC09180002E8;
	Fri, 16 Oct 2026 05:40:01 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 4365FCBF202; Thu, 15 Oct 2026 22:40:01 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 2/3] python3: fix CVE-2025-15367
Date: Thu, 15 Oct 2026 22:39:43 -0700
Message-Id: <20261016053944.3835603-3-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016053944.3835603-1-dkelaiya@cisco.com>
References: <20261016053944.3835603-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247927

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix shown in [1].
The advisory identifying the fix is referenced in [2].

CPython kept this change on main and deferred maintenance-branch
backports [3] because passwords containing control characters
such as tab or backspace could previously work. Wrynose takes the
compatibility change to prevent user-controlled POP3 arguments from
injecting extra commands. The new validation rejects C0 and DEL bytes
before sending a command.

Clients with affected stored credentials must replace those credentials
with ones free of control characters and handle the new ValueError with
a clear credential error. They must not silently strip password
characters or retry by bypassing the check.

[1] https://github.com/python/cpython/commit/b234a2b67539f787e191d2ef19a7cbdce32874e7
[2] https://nvd.nist.gov/vuln/detail/cve-2025-15367
[3] https://github.com/python/cpython/pull/143924

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../python/python3/CVE-2025-15367.patch       | 66 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.14.8.bb |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15367.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2025-15367.patch b/meta/recipes-devtools/python/python3/CVE-2025-15367.patch
new file mode 100644
index 0000000000..21f2dfa7ed
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2025-15367.patch
@@ -0,0 +1,66 @@
+From cf799923a7a039d52432629c45ae7c603cc0b2d6 Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <seth@python.org>
+Date: Tue, 20 Jan 2026 14:46:32 -0600
+Subject: [PATCH] gh-143923: Reject control characters in POP3 commands
+
+CVE: CVE-2025-15367
+Upstream-Status: Backport [https://github.com/python/cpython/commit/b234a2b67539f787e191d2ef19a7cbdce32874e7]
+
+(cherry picked from commit b234a2b67539f787e191d2ef19a7cbdce32874e7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ Lib/poplib.py                                             | 2 ++
+ Lib/test/test_poplib.py                                   | 8 ++++++++
+ .../2026-01-16-11-43-47.gh-issue-143923.DuytMe.rst        | 1 +
+ 3 files changed, 11 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-43-47.gh-issue-143923.DuytMe.rst
+
+diff --git a/Lib/poplib.py b/Lib/poplib.py
+index 4469bff..b97274c 100644
+--- a/Lib/poplib.py
++++ b/Lib/poplib.py
+@@ -122,6 +122,8 @@ class POP3:
+     def _putcmd(self, line):
+         if self._debugging: print('*cmd*', repr(line))
+         line = bytes(line, self.encoding)
++        if re.search(b'[\x00-\x1F\x7F]', line):
++            raise ValueError('Control characters not allowed in commands')
+         self._putline(line)
+ 
+ 
+diff --git a/Lib/test/test_poplib.py b/Lib/test/test_poplib.py
+index ef2da97..18ca7cb 100644
+--- a/Lib/test/test_poplib.py
++++ b/Lib/test/test_poplib.py
+@@ -17,6 +17,7 @@ from test.support import socket_helper
+ from test.support import threading_helper
+ from test.support import asynchat
+ from test.support import asyncore
++from test.support import control_characters_c0
+ 
+ 
+ test_support.requires_working_socket(module=True)
+@@ -395,6 +396,13 @@ class TestPOP3Class(TestCase):
+         self.assertIsNone(self.client.sock)
+         self.assertIsNone(self.client.file)
+ 
++    def test_control_characters(self):
++        for c0 in control_characters_c0():
++            with self.assertRaises(ValueError):
++                self.client.user(f'user{c0}')
++            with self.assertRaises(ValueError):
++                self.client.pass_(f'{c0}pass')
++
+     @requires_ssl
+     def test_stls_capa(self):
+         capa = self.client.capa()
+diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-43-47.gh-issue-143923.DuytMe.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-43-47.gh-issue-143923.DuytMe.rst
+new file mode 100644
+index 0000000..3cde4df
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-01-16-11-43-47.gh-issue-143923.DuytMe.rst
+@@ -0,0 +1 @@
++Reject control characters in POP3 commands.
+-- 
+2.35.6
+
diff --git a/meta/recipes-devtools/python/python3_3.14.8.bb b/meta/recipes-devtools/python/python3_3.14.8.bb
index f10d6a5f4d..6aa5514246 100644
--- a/meta/recipes-devtools/python/python3_3.14.8.bb
+++ b/meta/recipes-devtools/python/python3_3.14.8.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
            file://0001-prefer-valid-entrypoints.patch \
+           file://CVE-2025-15367.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
-- 
2.35.6


