Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 7876473D5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:02:40 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 11:02:40 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id F0A9728BA1D;
	Wed, 29 Apr 2015 11:02:40 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 11:02:18 +0200
Message-ID: <1430298142-9117-2-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
References: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [daisy 1/5] Qemu: CVE-2014-2894
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
X-List-Received-Date: Wed, 29 Apr 2015 09:02:41 -0000
Content-Type: text/plain

From: Sona Sarmadi <sona.sarmadi@enea.com>

Fixes an out of bounds memory access flaw
in Qemu's IDE device model

Reference
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-2894

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../qemu/files/ide-CVE-2014-2894.patch             | 46 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.7.0.bb           |  3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/files/ide-CVE-2014-2894.patch

diff --git a/meta/recipes-devtools/qemu/files/ide-CVE-2014-2894.patch b/meta/recipes-devtools/qemu/files/ide-CVE-2014-2894.patch
new file mode 100644
index 0000000..bd3566e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/ide-CVE-2014-2894.patch
@@ -0,0 +1,46 @@
+From c5dae2f4c50ef848f224da718154af4438862cdb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Canet?= <benoit.canet@irqsave.net>
+Date: Sat, 12 Apr 2014 22:59:50 +0200
+Subject: [PATCH] ide: Correct improper smart self test counter reset in ide
+ core.
+
+The SMART self test counter was incorrectly being reset to zero,
+not 1. This had the effect that on every 21st SMART EXECUTE OFFLINE:
+ * We would write off the beginning of a dynamically allocated buffer
+ * We forgot the SMART history
+Fix this.
+
+Signed-off-by: Benoit Canet <benoit@irqsave.net>
+Message-id: 1397336390-24664-1-git-send-email-benoit.canet@irqsave.net
+Reviewed-by: Markus Armbruster <armbru@redhat.com>
+Cc: qemu-stable@nongnu.org
+Acked-by: Kevin Wolf <kwolf@redhat.com>
+[PMM: tweaked commit message as per suggestions from Markus]
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+
+Fixes CVE-2014-2894
+Upstream-Status: Backport
+
+(cherry picked from commit 940973ae0b45c9b6817bab8e4cf4df99a9ef83d7)
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+---
+ hw/ide/core.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/ide/core.c b/hw/ide/core.c
+index e1f4c33..6007f6f 100644
+--- a/hw/ide/core.c
++++ b/hw/ide/core.c
+@@ -1601,7 +1601,7 @@ static bool cmd_smart(IDEState *s, uint8_t cmd)
+         case 2: /* extended self test */
+             s->smart_selftest_count++;
+             if (s->smart_selftest_count > 21) {
+-                s->smart_selftest_count = 0;
++                s->smart_selftest_count = 1;
+             }
+             n = 2 + (s->smart_selftest_count - 1) * 24;
+             s->smart_selftest_data[n] = s->sector;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_1.7.0.bb b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
index b776ccc..a519645 100644
--- a/meta/recipes-devtools/qemu/qemu_1.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 
 SRC_URI += "file://fxrstorssefix.patch \
             file://qemu-enlarge-env-entry-size.patch \
-            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch"
+            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+            file://ide-CVE-2014-2894.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
 SRC_URI[md5sum] = "32893941d40d052a5e649efcf06aca06"
-- 
1.9.1


