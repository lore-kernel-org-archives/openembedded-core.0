Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1TsCZa-0003tD-ED
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:17:09 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r07D1k5s011251
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 14:01:47 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.76) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1TsCKo-00038J-9T; Mon, 07 Jan 2013 14:01:46 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2013 14:01:45 +0100
Message-Id: <1357563705-12012-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.11.7
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.3
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.73
Cc: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
Subject: [PATCH] procps: initialized environment correctly (backported from classic)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Jan 2013 13:17:15 -0000

From: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>

Without this patch, various procps tool can create "Unknown HZ value"
messages because internal initialization happens in a wrong, random
order.

It has been applied to classic already.

Signed-off-by: Enrico Scholz <enrico.scholz@informatik.tu-chemnitz.de>
---
 .../procps-3.2.8/60_linux_version_init.patch       | 54 ++++++++++++++++++++++
 meta/recipes-extended/procps/procps_3.2.8.bb       |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch

diff --git a/meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch b/meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch
new file mode 100644
index 0000000..203ccb3
--- /dev/null
+++ b/meta/recipes-extended/procps/procps-3.2.8/60_linux_version_init.patch
@@ -0,0 +1,54 @@
+## 60_linux_init.dpatch by  <david.sugar@canonical.com>
+##
+## All lines beginning with `## DP:' are a description of the patch.
+## DP: Fix Linux version detection which relied on elf loader side-effect.
+## DP: This patch also depends on 40_gnu-kbsd-version, which modified
+## DP: init_Linux_version().
+
+@DPATCH@
+
+Upstream-Status: inappropriate [upstream unmaintained]
+---
+ proc/sysinfo.c |    1 +
+ proc/version.c |    5 +++--
+ proc/version.h |    1 +
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+
+Index: procps-3.2.8/proc/sysinfo.c
+===================================================================
+--- procps-3.2.8.orig/proc/sysinfo.c
++++ procps-3.2.8/proc/sysinfo.c
+@@ -212,6 +212,7 @@ static int check_for_privs(void){
+ static void init_libproc(void) __attribute__((constructor));
+ static void init_libproc(void){
+   have_privs = check_for_privs();
++  init_Linux_version(); // make sure we have version before continuing...
+   // ought to count CPUs in /proc/stat instead of relying
+   // on glibc, which foolishly tries to parse /proc/cpuinfo
+   //
+Index: procps-3.2.8/proc/version.c
+===================================================================
+--- procps-3.2.8.orig/proc/version.c
++++ procps-3.2.8/proc/version.c
+@@ -33,8 +33,7 @@ void display_version(void) {
+ 
+ int linux_version_code;
+ 
+-static void init_Linux_version(void) __attribute__((constructor));
+-static void init_Linux_version(void) {
++void init_Linux_version(void) {
+     int x = 0, y = 0, z = 0;	/* cleared in case sscanf() < 2 */
+     FILE *fp;
+     char buf[256];
+Index: procps-3.2.8/proc/version.h
+===================================================================
+--- procps-3.2.8.orig/proc/version.h
++++ procps-3.2.8/proc/version.h
+@@ -14,6 +14,7 @@
+ 
+ EXTERN_C_BEGIN
+ 
++extern void init_Linux_version(void);	/* initialize linux version */
+ extern void display_version(void);	/* display suite version */
+ extern const char procps_version[];		/* global buf for suite version */
+ 
diff --git a/meta/recipes-extended/procps/procps_3.2.8.bb b/meta/recipes-extended/procps/procps_3.2.8.bb
index 3f20bea..7533859 100644
--- a/meta/recipes-extended/procps/procps_3.2.8.bb
+++ b/meta/recipes-extended/procps/procps_3.2.8.bb
@@ -1,6 +1,6 @@
 require procps.inc
 
-PR = "r10"
+PR = "r11"
 
 SRC_URI += "file://procmodule.patch \
             file://psmodule.patch \
@@ -8,6 +8,7 @@ SRC_URI += "file://procmodule.patch \
             file://sysctl.conf \
             file://procps-3.2.8+gmake-3.82.patch \
             file://gnu-kbsd-version.patch \
+            file://60_linux_version_init.patch \
            "
 
 SRC_URI[md5sum] = "9532714b6846013ca9898984ba4cd7e0"
-- 
1.7.11.7



