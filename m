Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 75FDE65C87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 11:09:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9TB9Vvu027986
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 04:09:31 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Wed, 29 Oct 2014 04:09:31 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Oct 2014 19:06:11 +0800
Message-ID: <1414580771-32464-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414580771-32464-1-git-send-email-kai.kang@windriver.com>
References: <1414580771-32464-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 2/2] python-2.7.3:remove BOM insertion code
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Oct 2014 11:09:35 -0000
Content-Type: text/plain

Backport patch from:
https://hg.python.org/cpython/rev/af46a001d5ec

SysLogHandler converts message to utf8 and adds BOM, supposedly
to conform with RFC5424, but the implementation is broken:
the RFC specifies that the BOM should prefix only unstructured
message part, but current Python implementation puts it in the
middle of structured part, thus confusing RFC-compliant receivers.

Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python/python/remove-BOM-insection-code.patch  | 24 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/remove-BOM-insection-code.patch

diff --git a/meta/recipes-devtools/python/python/remove-BOM-insection-code.patch b/meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
new file mode 100644
index 0000000..6c96e30
--- /dev/null
+++ b/meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
@@ -0,0 +1,24 @@
+# HG changeset patch
+# User Vinay Sajip <vinay_sajip@yahoo.co.uk>
+# Date 1334583503 -3600
+# Node ID af46a001d5eca99a7ff44ed18256c235c5c3f1d0
+# Parent  33bc53e0aa9ea42c6a6bb077d182e62c8c569aa1
+Issue #14452: remove BOM insertion code.
+
+Backport from https://hg.python.org/cpython/rev/af46a001d5ec.
+
+Upstream-Status: Pending
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/Lib/logging/handlers.py b/Lib/logging/handlers.py
+--- a/Lib/logging/handlers.py
++++ b/Lib/logging/handlers.py
+@@ -821,8 +821,6 @@ class SysLogHandler(logging.Handler):
+         # Message is a string. Convert to bytes as required by RFC 5424
+         if type(msg) is unicode:
+             msg = msg.encode('utf-8')
+-            if codecs:
+-                msg = codecs.BOM_UTF8 + msg
+         msg = prio + msg
+         try:
+             if self.unixsocket:
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index cc92ebc..f2e6fde 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -38,6 +38,7 @@ SRC_URI += "\
   file://python-2.7.3-CVE-2014-1912.patch \
   file://json-flaw-fix.patch \
   file://posix_close.patch \
+  file://remove-BOM-insection-code.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1


