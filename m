Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1038E750FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:26:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8J8QAdr001175
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 01:26:26 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 19 Sep 2018 01:26:08 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Sep 2018 16:26:07 +0800
Message-ID: <1537345567-112142-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] dbus-test: fix ptest failed problem when multilib is enabled
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
X-List-Received-Date: Wed, 19 Sep 2018 08:26:35 -0000
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
 meta/recipes-core/dbus/dbus-test_1.12.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus-test_1.12.10.bb b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
index e3ee608..a438627 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.10.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.10.bb
@@ -75,6 +75,8 @@ do_install_ptest() {
 		sed -i \
 		 -e 's:${B}:${PTEST_PATH}:g' \
 		 {} +
+        #correct LD_LIBRARY_PATH for run-ptest according current baselib
+        sed -i -e 's;/lib/;/${baselib}/;g'  ${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS_${PN}-ptest += "bash"
-- 
2.7.4


