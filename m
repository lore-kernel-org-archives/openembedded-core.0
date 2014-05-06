Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 619F365FBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 07:53:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s467r3PS022025
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 00:53:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 6 May 2014 00:53:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 15:53:12 +0800
Message-ID: <8d81d6f9406caf97225d9d80b8880eb29d6b5f64.1399362735.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399362735.git.Qi.Chen@windriver.com>
References: <cover.1399362735.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mmc-utils: fix compilation failure for mips64 target.
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
X-List-Received-Date: Tue, 06 May 2014 07:53:05 -0000
Content-Type: text/plain

This patch fixes mmc-utils compilation failure for qemumips64.
Remove the 'include <asm-generic/int-ll64.h>' line from mmc.h,
because this file is automatically included if _MIPS_SZLONG
is not 64, otherwise, <asm-generic/int-l64.h> is included.

Expicitly including <asm-generic/int-ll64.h> will cause the
compilation failure for mips64 target.

[YOCTO #6267]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...mc.h-don-t-include-asm-generic-int-ll64.h.patch |   28 ++++++++++++++++++++
 meta/recipes-devtools/mmc/mmc-utils_git.bb         |    4 +--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch

diff --git a/meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch
new file mode 100644
index 0000000..1724de5
--- /dev/null
+++ b/meta/recipes-devtools/mmc/mmc-utils/0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Pending
+
+mmc.h: don't include <asm-generic/int-ll64.h>
+
+Including this file causes a compile failure for qemumips64.
+This file is not needed to be explicitly included, because it will be
+included by the <linux/mmc/ioctl.h> file if _MIPS_SZLONG is not 64.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ mmc.h |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/mmc.h b/mmc.h
+index 9871d62..3df2cdf 100644
+--- a/mmc.h
++++ b/mmc.h
+@@ -14,7 +14,6 @@
+  * Boston, MA 021110-1307, USA.
+  */
+ 
+-#include <asm-generic/int-ll64.h>
+ #include <linux/mmc/ioctl.h>
+ #include <stdio.h>
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index abde4b1..d88520c 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -8,8 +8,8 @@ SRCREV = "11f2ceabc4ad3f0dd568e0ce68166e4803e0615b"
 
 PV = "0.1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;protocol=git;branch=${BRANCH}"
-
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;protocol=git;branch=${BRANCH} \
+           file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


