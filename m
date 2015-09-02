Return-Path: <Li.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E61F77015
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:04:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t82346Fc010217
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Sep 2015 20:04:07 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Tue, 1 Sep 2015 20:04:06 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Sep 2015 11:03:39 +0800
Message-ID: <1441163019-12457-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] libunwind: Security Advisory - libunwind - CVE-2015-3239
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
X-List-Received-Date: Wed, 02 Sep 2015 03:04:07 -0000
Content-Type: text/plain

libunwind: Invalid dwarf opcodes can cause references beyond the end of
the array

Off-by-one error in the dwarf_to_unw_regnum function in include/dwarf_i.h
 in libunwind 1.1 allows local users to have unspecified impact via
invalid dwarf opcodes.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...rf-opcodes-can-cause-references-beyond-th.patch |   29 ++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch b/meta/recipes-support/libunwind/libunwind-1.1/0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch
new file mode 100644
index 0000000..af972f8
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch
@@ -0,0 +1,29 @@
+From 396b6c7ab737e2bff244d640601c436a26260ca1 Mon Sep 17 00:00:00 2001
+From: Arun Sharma <arun@sharma-home.net>
+Date: Fri, 19 Jun 2015 19:47:22 -0700
+Subject: [PATCH] Invalid dwarf opcodes can cause references beyond the end of
+ the array.
+
+Upstream-Status: backport
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ include/dwarf_i.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/dwarf_i.h b/include/dwarf_i.h
+index 1e6231e..4a02a7d 100644
+--- a/include/dwarf_i.h
++++ b/include/dwarf_i.h
+@@ -20,7 +20,7 @@
+ extern const uint8_t dwarf_to_unw_regnum_map[DWARF_REGNUM_MAP_LENGTH];
+ /* REG is evaluated multiple times; it better be side-effects free!  */
+ # define dwarf_to_unw_regnum(reg)					  \
+-  (((reg) <= DWARF_REGNUM_MAP_LENGTH) ? dwarf_to_unw_regnum_map[reg] : 0)
++  (((reg) < DWARF_REGNUM_MAP_LENGTH) ? dwarf_to_unw_regnum_map[reg] : 0)
+ #endif
+ 
+ #ifdef UNW_LOCAL_ONLY
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index ee6f522..8282c1b 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -5,6 +5,7 @@ SRC_URI += "\
     file://AArch64-port.patch \
     file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
     file://Link-libunwind-to-libgcc_s-rather-than-libgcc.patch \
+    file://0001-Invalid-dwarf-opcodes-can-cause-references-beyond-th.patch \
 "
 
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
-- 
1.7.9.5


