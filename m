Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C02A796F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 02:16:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8K2GTf3007130
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 19:16:29 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 19 Sep 2018 19:16:28 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Sep 2018 10:16:27 +0800
Message-ID: <1537409787-431114-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] dbus-test: fix ptest failed problem when multilib is enabled
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
X-List-Received-Date: Thu, 20 Sep 2018 02:16:28 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix some failed info like:
| ./test/test-bus: relocation error: ./test/test-bus: symbol
| _dbus_threads_init_debug, version LIBDBUS_PRIVATE_1.10.10 not defined
| in file libdbus-1.so.3 with link time reference
| FAIL: test/test-bus

In run-ptest, LD_LIBRARY_PATH is set to /usr/lib, but when multilib
is enabled, /usr/lib64 will be used. fix by replace with correct path.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.12.10.bb | 1 +
 meta/recipes-core/dbus/dbus/run-ptest       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
index e3ee608..25b9395 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
@@ -75,6 +75,7 @@ do_install_ptest() {
 		sed -i \
 		 -e 's:${B}:${PTEST_PATH}:g' \
 		 {} +
+        sed -i -e 's;@PTEST_PATH@;${PTEST_PATH};g'  ${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS_${PN}-ptest += "bash"
diff --git a/meta/recipes-core/dbus/dbus/run-ptest b/meta/recipes-core/dbus/dbus/run-ptest
index 8a8970e..353ba1e 100755
--- a/meta/recipes-core/dbus/dbus/run-ptest
+++ b/meta/recipes-core/dbus/dbus/run-ptest
@@ -12,7 +12,7 @@ output() {
 
 export DBUS_TEST_HOMEDIR=./test
 export XDG_RUNTIME_DIR=./test
-export LD_LIBRARY_PATH=/usr/lib/dbus-test/ptest/test/.libs
+export LD_LIBRARY_PATH=@PTEST_PATH@/test/.libs
 
 files=`ls test/test-*`
 
-- 
2.7.4


