Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A00597F36C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 03:07:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9F37vbu026568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2019 20:07:57 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Mon, 14 Oct 2019 20:07:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2019 11:08:12 +0800
Message-ID: <aa9461815011753bbf676b65e1c7a69f9a985a50.1571108794.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571108794.git.liezhi.yang@windriver.com>
References: <cover.1571108794.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] bluez5: Fix for --enable-btpclient
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
X-List-Received-Date: Tue, 15 Oct 2019 03:07:56 -0000
Content-Type: text/plain

Fixed:
PACKAGECONFIG_append_pn-bluez5 = ' btpclient'

$ bitbake bluez5
btpclient.c:2834:7: error: 'SIGINT' undeclared (first use in this function)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../0001-tools-btpclient.c-include-signal.h.patch  | 30 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index f582a07..1702323 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -58,6 +58,7 @@ SRC_URI = "\
     file://CVE-2018-10910.patch \
     file://gcc9-fixes.patch \
     file://0001-tools-Fix-build-after-y2038-changes-in-glibc.patch \
+    file://0001-tools-btpclient.c-include-signal.h.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch
new file mode 100644
index 0000000..620aaab
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-btpclient.c-include-signal.h.patch
@@ -0,0 +1,30 @@
+From 0b1766514f6847c7367fce07f19a750ec74c11a6 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 26 Sep 2019 16:19:34 +0800
+Subject: [PATCH] tools/btpclient.c: include signal.h
+
+Fix compile failure when configure --enable-btpclient:
+btpclient.c:2834:7: error: 'SIGINT' undeclared (first use in this function)
+
+Upstream-Status: Backport [A subset of the full fix that went upstream]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ tools/btpclient.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/btpclient.c b/tools/btpclient.c
+index b217df5..aece7fe 100644
+--- a/tools/btpclient.c
++++ b/tools/btpclient.c
+@@ -29,6 +29,7 @@
+ #include <stdlib.h>
+ #include <assert.h>
+ #include <getopt.h>
++#include <signal.h>
+ 
+ #include <ell/ell.h>
+ 
+-- 
+2.7.4
+
-- 
2.7.4


