Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ADDFE6075E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 06:48:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7O6mvEO025676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 23:48:57 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 23:48:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2018 14:48:55 +0800
Message-ID: <1535093335-316035-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <”5B7FA726.2020102@windriver.com”>
References: <”5B7FA726.2020102@windriver.com”>
MIME-Version: 1.0
Subject: [PATCH v2] bluez5: Fix ptest hang
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
X-List-Received-Date: Fri, 24 Aug 2018 06:48:56 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

The below test hangs infinitely
$ ./run-ptest

Actually it stuck at test-gatt unit test and
the detailed test output as below:
$ unit/test-gatt -p  /robustness/unkown-request -d
/robustness/unkown-request - init
/robustness/unkown-request - setup
/robustness/unkown-request - setup complete
/robustness/unkown-request - run
GATT: < 02 17 00                                         ...
bt_gatt_server:MTU exchange complete, with MTU: 23
GATT: > 03 00 02                                         ...
PDU: = 03 00 02                                         ...
GATT: < bf 00

Considering the /robustness/unkown-request test
actually does no action, update to raw_pdu() to
fix the hang issue.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 .../bluez5/0001-test-gatt-Fix-hung-issue.patch     | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index c0b6571..9d9739e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -51,6 +51,7 @@ SRC_URI = "\
     file://run-ptest \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
     file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+    file://0001-test-gatt-Fix-hung-issue.patch \
 "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
new file mode 100644
index 0000000..e90b6a5
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-test-gatt-Fix-hung-issue.patch
@@ -0,0 +1,43 @@
+From 61e741654cc2eb167bca212a3bb2ba8f3ba280c1 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Fri, 24 Aug 2018 12:04:03 +0800
+Subject: [PATCH] test-gatt: Fix hung issue
+
+The below test hangs infinitely
+$ unit/test-gatt -p  /robustness/unkown-request -d
+/robustness/unkown-request - init
+/robustness/unkown-request - setup
+/robustness/unkown-request - setup complete
+/robustness/unkown-request - run
+  GATT: < 02 17 00                                         ...
+  bt_gatt_server:MTU exchange complete, with MTU: 23
+  GATT: > 03 00 02                                         ...
+  PDU: = 03 00 02                                         ...
+  GATT: < bf 00
+
+Actually, the /robustness/unkown-request test does
+no action.
+
+Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=153508881804635&w=2]
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ unit/test-gatt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unit/test-gatt.c b/unit/test-gatt.c
+index c7e28f8..b57373b 100644
+--- a/unit/test-gatt.c
++++ b/unit/test-gatt.c
+@@ -4463,7 +4463,7 @@ int main(int argc, char *argv[])
+ 			test_server, service_db_1, NULL,
+ 			raw_pdu(0x03, 0x00, 0x02),
+ 			raw_pdu(0xbf, 0x00),
+-			raw_pdu(0x01, 0xbf, 0x00, 0x00, 0x06));
++			raw_pdu());
+ 
+ 	define_test_server("/robustness/unkown-command",
+ 			test_server, service_db_1, NULL,
+-- 
+2.7.4
+
-- 
2.7.4


