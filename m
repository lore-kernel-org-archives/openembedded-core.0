Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18h+sBQ1rYfoJmiHH5fQbcxh6KIq7xSTYI=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjENX-0006ZS-HN
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:46:43 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6JHfcvK009967;
	Tue, 19 Jul 2011 12:41:39 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 12:41:33 -0500
Message-Id: <1311097296-17200-3-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311097296-17200-2-git-send-email-galak@kernel.crashing.org>
References: <1311097296-17200-1-git-send-email-galak@kernel.crashing.org>
	<1311097296-17200-2-git-send-email-galak@kernel.crashing.org>
Cc: yocto@yoctoproject.org
Subject: [PATCH v2 2/5] tclibc-*libc: Utilize TARGET_FPU for gnuspe setting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jul 2011 17:46:43 -0000

Its possible that BASE_PACKAGE_ARCH isn't set to ppce500 or ppce500v2 when
we build native toolchains.  So we can utilize TARGET_FPU being set to
'ppc-efd' or 'ppc-efs' to determine if we should enable the gnuspe ABI.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/distro/include/tclibc-eglibc.inc |    2 +-
 meta/conf/distro/include/tclibc-glibc.inc  |    2 +-
 meta/conf/distro/include/tclibc-uclibc.inc |    1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

* Use ppc-efs, ppc-efd instead of spe
* Added change to uclibc as well

diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distro/include/tclibc-eglibc.inc
index e070aad..9fab4dc 100644
--- a/meta/conf/distro/include/tclibc-eglibc.inc
+++ b/meta/conf/distro/include/tclibc-eglibc.inc
@@ -5,7 +5,7 @@
 TARGET_OS = "linux"
 TARGET_OS_arm = "linux-gnueabi"
 TARGET_OS_armeb = "linux-gnueabi"
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}"
+TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
 
 # Add glibc overrides to the overrides for eglibc.
 OVERRIDES .= ":libc-glibc"
diff --git a/meta/conf/distro/include/tclibc-glibc.inc b/meta/conf/distro/include/tclibc-glibc.inc
index 5e7afc1..0370dfa 100644
--- a/meta/conf/distro/include/tclibc-glibc.inc
+++ b/meta/conf/distro/include/tclibc-glibc.inc
@@ -5,7 +5,7 @@
 TARGET_OS = "linux"
 TARGET_OS_arm = "linux-gnueabi"
 TARGET_OS_armeb = "linux-gnueabi"
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}"
+TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
 
 # Add glibc to the overrides.
 OVERRIDES =. "libc-glibc:"
diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 65693a9..2ccda5b 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -5,6 +5,7 @@
 TARGET_OS = "linux-uclibc"
 TARGET_OS_arm = "linux-uclibceabi"
 TARGET_OS_armeb = "linux-uclibceabi"
+TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
 
 # Add uclibc overrides to the overrides.
 OVERRIDES =. "libc-uclibc:"
-- 
1.7.3.4



