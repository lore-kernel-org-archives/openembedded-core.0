Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1SrIYk-0006Ko-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 02:56:10 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6I0imnN010481
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 17:44:49 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2012 20:44:46 -0400
Message-Id: <1342572286-18552-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] qemu-nativesdk: fix the build failure that linux/kvm.h not found
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
X-List-Received-Date: Wed, 18 Jul 2012 00:56:11 -0000

qemu.inc: on older kernel build hosts that have < 2.6.20 which
doesn't support kvm yet, build will fail. Add a check in do_configure
to make sure whether linux/kvm.h exists for nativesdk build.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 707493e..713674e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -22,8 +22,9 @@ inherit autotools
 do_configure() {
     # Handle distros such as CentOS 5 32-bit that do not have kvm support
     KVMOPTS="--disable-kvm"
-    if [ "${PN}" != "qemu-native" ] || [ -f /usr/include/linux/kvm.h ] ; then
-        KVMOPTS="--enable-kvm"
+    if [ "${PN}" != "qemu-native" -a "${PN}" != "qemu-nativesdk" ] \
+       || [ -f /usr/include/linux/kvm.h ] ; then
+       KVMOPTS="--enable-kvm"
     fi
 
     ${S}/configure --prefix=${prefix} --sysconfdir=${sysconfdir} --disable-strip ${EXTRA_OECONF} $KVMOPTS
-- 
1.7.9.5



