Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 302A56B50B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 14:14:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBDEEbR2023076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 06:14:37 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 13 Dec 2018 06:14:37 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2018 09:14:11 -0500
Message-ID: <2be431b15f40d86875ed77ce0073d9d20658d2ff.1544710323.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
In-Reply-To: <cover.1544710323.git.kai.kang@windriver.com>
References: <cover.1544710323.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] lttng-tools: fix compile error for x32
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
X-List-Received-Date: Thu, 13 Dec 2018 14:14:37 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix build error of src/common/utils.c for x32:

| .../src/common/utils.c: Assembler messages:
| .../src/common/utils.c:1026: Error: register type mismatch for `bsr'
| .../src/common/utils.c:1028: Error: operand type mismatch for `movq'
| make[3]: *** [utils.lo] Error 1

[YOCTO #13081]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../lttng/lttng-tools/x32.patch               | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/x32.patch b/meta/recipes-kernel/lttng/lttng-tools/x32.patch
index b1bb8e4930..42cebf94ac 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/x32.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/x32.patch
@@ -1,11 +1,31 @@
 Fix build for x32
 
-Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 
---- lttng-tools-2.6.0/src/bin/lttng/utils.c~	2015-01-26 18:17:15.000000000 +0100
-+++ lttng-tools-2.6.0/src/bin/lttng/utils.c	2015-07-30 19:45:25.632045712 +0200
-@@ -130,7 +130,7 @@
+Fix build error of src/common/utils.c for x32.
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/150]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/src/bin/lttng/utils.c b/src/bin/lttng/utils.c
+index 0e96ef0c..5c79c8c7 100644
+--- a/src/bin/lttng/utils.c
++++ b/src/bin/lttng/utils.c
+@@ -158,7 +158,7 @@ unsigned int fls_u32(uint32_t x)
+ #define HAS_FLS_U32
+ #endif
+ 
+-#if defined(__x86_64)
++#if defined(__x86_64) && !defined(__ILP32__)
+ static inline
+ unsigned int fls_u64(uint64_t x)
+ {
+diff --git a/src/common/utils.c b/src/common/utils.c
+index 08139e5e..3c389981 100644
+--- a/src/common/utils.c
++++ b/src/common/utils.c
+@@ -1223,7 +1223,7 @@ static inline unsigned int fls_u32(uint32_t x)
  #define HAS_FLS_U32
  #endif
  
-- 
2.19.0.rc2


