Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id E71A46FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 08:28:26 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym02.jp.fujitsu.com with smtp
	id 4660_1a64_7a44bce5_a4d6_4c75_8daf_871ca7cebeb3;
	Mon, 14 Dec 2015 17:28:18 +0900
Received: from g01jpfmpwkw02.exch.g01.fujitsu.local
	(g01jpfmpwkw02.exch.g01.fujitsu.local [10.0.193.56])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A8FDAC01B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 17:28:18 +0900 (JST)
Received: from g01jpexchkw38.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	3E9443284A3 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 17:28:17 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw38.g01.fujitsu.local (10.0.193.68) with Microsoft SMTP
	Server id 14.3.266.1; Mon, 14 Dec 2015 17:28:16 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Dec 2015 17:29:24 +0900
Message-ID: <1450081764-19732-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450076120-18740-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1450076120-18740-1-git-send-email-fan.xin@jp.fujitsu.com>
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH v2] ltp: Upgrade 20150420 -> 20150903
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
X-List-Received-Date: Mon, 14 Dec 2015 08:28:28 -0000
Content-Type: text/plain

1. Upgrade from 20150420 to 20150903

https://github.com/linux-test-project/ltp/releases/tag/20150903

2. Replace the patch file 0001-replace-inline-with-static-inline-for-gcc-5.x.patch due to the ltp original source code is changed.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 ...atch => 0001-Fix-compilation-for-gcc-5.x.patch} | 39 +++++++++++++---------
 .../ltp/{ltp_20150420.bb => ltp_20150903.bb}       |  4 +--
 2 files changed, 26 insertions(+), 17 deletions(-)
 rename meta/recipes-extended/ltp/ltp/{0001-replace-inline-with-static-inline-for-gcc-5.x.patch => 0001-Fix-compilation-for-gcc-5.x.patch} (69%)
 rename meta/recipes-extended/ltp/{ltp_20150420.bb => ltp_20150903.bb} (97%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch b/meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch
similarity index 69%
rename from meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch
rename to meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch
index 0b594dc..390a3c8 100644
--- a/meta/recipes-extended/ltp/ltp/0001-replace-inline-with-static-inline-for-gcc-5.x.patch
+++ b/meta/recipes-extended/ltp/ltp/0001-Fix-compilation-for-gcc-5.x.patch
@@ -1,15 +1,24 @@
-Upstream-Status: Backport [From https://github.com/linux-test-project/ltp/commit/40a2457cb8ec42a05a2f96b0810057efdb2a55f5]
+From 40a2457cb8ec42a05a2f96b0810057efdb2a55f5 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Wed, 16 Sep 2015 13:23:43 +0200
+Subject: [PATCH] Fix compilation for gcc-5.x
 
-gcc 5.x defaults to -std=gnu11 instead of -std=gnu89 which causes
+The gcc-5.x defaults to -std=gnu11 instead of -std=gnu89 which causes
 semantics for inline functions changes.
 
-The standalone 'inline' causes error with gcc 5 such as:
+GNU89 inline: Same as C99 extern inline.
+
+So the standalone 'inline' causes error such as:
 
 git/testcases/kernel/syscalls/kill/kill10.c:355: undefined reference to `k_sigaction'
 
-Replace inline with static inline to be compatible with both gcc 4 and 5.
+Replace inline with static inline to fix this issue.
+
+Ref:
+https://gcc.gnu.org/gcc-5/porting_to.html
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Acked-by: Cyril Hrubis <chrubis@suse.cz>
 ---
  testcases/kernel/controllers/libcontrollers/libcontrollers.c | 2 +-
  testcases/kernel/controllers/libcontrollers/libcontrollers.h | 2 +-
@@ -17,30 +26,30 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.c b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
-index b01e1b8..8857bc9 100644
+index 844c5bc..75766fc 100644
 --- a/testcases/kernel/controllers/libcontrollers/libcontrollers.c
 +++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.c
-@@ -146,7 +146,7 @@ int read_file(char *filepath, int action, unsigned int *value)
+@@ -158,7 +158,7 @@ int read_file(char *filepath, int action, unsigned int *value)
   * Prints error message and returns -1
   */
  
--inline int error_function(char *msg1, char *msg2)
-+static inline int error_function(char *msg1, char *msg2)
+-inline void error_function(char *msg1, char *msg2)
++static inline void error_function(char *msg1, char *msg2)
  {
  	fprintf(stdout, "ERROR: %s ", msg1);
  	fprintf(stdout, "%s\n", msg2);
 diff --git a/testcases/kernel/controllers/libcontrollers/libcontrollers.h b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
-index 4001555..a1a0dfa 100644
+index bd8e2d8..cdde9f9 100644
 --- a/testcases/kernel/controllers/libcontrollers/libcontrollers.h
 +++ b/testcases/kernel/controllers/libcontrollers/libcontrollers.h
 @@ -70,7 +70,7 @@ enum{
  	GET_TASKS
  };
  
--inline int error_function(char *msg1, char *msg2);
-+static inline int error_function(char *msg1, char *msg2);
+-inline void error_function(char *msg1, char *msg2);
++static inline void error_function(char *msg1, char *msg2);
  
- unsigned int read_shares_file (char *filepath);
+ int read_shares_file(char *filepath);
  
 diff --git a/testcases/kernel/syscalls/kill/kill10.c b/testcases/kernel/syscalls/kill/kill10.c
 index 982d9da..33dbcd3 100644
@@ -64,6 +73,6 @@ index 982d9da..33dbcd3 100644
  {
  	int ret;
  	if ((ret = sigaction(sig, sa, osa)) == -1) {
----
--1.9.1
--
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20150420.bb b/meta/recipes-extended/ltp/ltp_20150903.bb
similarity index 97%
rename from meta/recipes-extended/ltp/ltp_20150420.bb
rename to meta/recipes-extended/ltp/ltp_20150903.bb
index ed46b5e..31043c6 100644
--- a/meta/recipes-extended/ltp/ltp_20150420.bb
+++ b/meta/recipes-extended/ltp/ltp_20150903.bb
@@ -20,7 +20,7 @@ LIC_FILES_CHKSUM = "\
 "
 
 DEPENDS = "attr libaio libcap acl openssl zip-native"
-SRCREV = "77d0b7fd0148ce657c5a25060667e978c07662a0"
+SRCREV = "d19755a1deddd0268d7c29991afddab497da1823"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://0001-Rename-runtests_noltp.sh-script-so-have-unique-name.patch \
@@ -29,7 +29,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
     file://add-knob-for-numa.patch \
     file://add-knob-for-tirpc.patch \
     file://0001-ltp-vma03-fix-the-alginment-of-page-size.patch \
-    file://0001-replace-inline-with-static-inline-for-gcc-5.x.patch \
+    file://0001-Fix-compilation-for-gcc-5.x.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.8.4.2


