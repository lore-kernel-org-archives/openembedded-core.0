Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9EDE7190D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 02:41:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAJ2fYQU004229
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Nov 2014 18:41:34 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Nov 2014 18:41:34 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Nov 2014 20:41:33 -0600
Message-ID: <1416364893-213981-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Subject: [PATCH][dizzy] nss: define MP_USE_UINT_DIGIT when compile mpi_x86.s
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
X-List-Received-Date: Wed, 19 Nov 2014 02:41:35 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Backport patch to fix the segfault when do multiple.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../nss/files/Using-correct-macro-for-x86.patch    | 42 ++++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch

diff --git a/meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch b/meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch
new file mode 100644
index 0000000..21d2ef7
--- /dev/null
+++ b/meta/recipes-support/nss/files/Using-correct-macro-for-x86.patch
@@ -0,0 +1,42 @@
+Using correct macro for x86
+
+Upstream-Status: Backport
+
+squash 11040 and 11043 as one patch
+
+changeset:   11040:60412aa39b8d
+user:        Stephan Bergmann <sbergman@redhat.com>
+date:        Fri Feb 14 17:45:40 2014 -0800
+files:       lib/freebl/Makefile
+description:
+Bug 972450: Define -DMP_USE_UINT_DIGIT for Linux x86 because mpi_x86.s
+requires mp_digit to be an unsigned int. The MP_USE_UINT_DIGIT macro
+ensures that. We were previously relying on ULLONG_MAX being undefined
+in the compilation environment, which isn't true in C99 mode. Also
+define -DMP_NO_MP_WORD to match Windows x86. r=wtc.
+
+
+changeset:   11043:fa9a3a970910
+parent:      11040:60412aa39b8d
+user:        Wan-Teh Chang <wtc@google.com>
+date:        Tue Feb 18 14:26:25 2014 -0800
+files:       lib/freebl/Makefile
+description:
+Bug 972450: Don't define -DMP_NO_MP_WORD for Linux x86 (unless one
+can show it improves performance).
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+diff -r f451ea1a2b12 -r 60412aa39b8d nss/lib/freebl/Makefile
+--- a/nss/lib/freebl/Makefile	Thu Feb 13 18:55:13 2014 -0800
++++ b/nss/lib/freebl/Makefile	Fri Feb 14 17:45:40 2014 -0800
+@@ -195,7 +195,7 @@
+ ifeq ($(CPU_ARCH),x86)
+     ASFILES  = mpi_x86.s
+     DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_ASSEMBLY_SQUARE 
+-    DEFINES += -DMP_ASSEMBLY_DIV_2DX1D
++    DEFINES += -DMP_ASSEMBLY_DIV_2DX1D -DMP_USE_UINT_DIGIT
+     DEFINES += -DMP_CHAR_STORE_SLOW -DMP_IS_LITTLE_ENDIAN
+     # The floating point ECC code doesn't work on Linux x86 (bug 311432).
+     #ECL_USE_FP = 1
+
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 7919ddd..c284e63 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -24,6 +24,7 @@ SRC_URI = "\
     file://nss-CVE-2013-5606.patch \
     file://nss-CVE-2014-1544.patch \
     file://nss-CVE-2014-1568.patch \
+    file://Using-correct-macro-for-x86.patch \
 "
 SRC_URI_append = "\
     file://nss.pc.in \
-- 
1.9.3


