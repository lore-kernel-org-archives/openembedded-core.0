Received: from mail-ie0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stanhu@gmail.com>) id 1ThonS-0006q0-DZ
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Dec 2012 22:52:26 +0100
Received: by mail-ie0-f180.google.com with SMTP id c10so6425710ieb.25
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Dec 2012 13:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=oQ50+O78QCM0ZunbiWegUKMGV1nCG88Kyu+GJ1G+7H0=;
	b=QtLpVhnNorDN3zo4e6LScmNLrGVDT8wGiB9ldSQcCv7bJ10BLq8ZIkVHQrP23ZAKTx
	qbJaqCZAGf7Ut+J5vlfqVLihKWGxVjqDywyYmG4OSGpe7W3OKGkDzx20sLXTZA44F8t2
	anH+TBLtRH/0BgSwJ/BlZA4g0ShqsIB1J6YQQnDgBleXq8hGoPs4e4yrIDQdBlbzT/qF
	7BWbAZnociZitIkDyo+m5F4BpLgNPzxOnFyhKeapQPt+qY+k6gfm/k8jg9zrlwUzdUbt
	jMDO1HRbdJ6DgWeJoJN6ZexB1NmNmRGc7san/t8P+FZbw4BwOFMvzFasg5dhqc5pT3Xu
	EvdQ==
Received: by 10.50.12.168 with SMTP id z8mr4671231igb.53.1355089076187;
	Sun, 09 Dec 2012 13:37:56 -0800 (PST)
Received: from localhost.localdomain ([76.73.74.194])
	by mx.google.com with ESMTPS id i9sm4434262igl.9.2012.12.09.13.37.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Dec 2012 13:37:55 -0800 (PST)
From: Stan Hu <stanhu@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Dec 2012 14:37:53 -0700
Message-Id: <1355089073-30880-1-git-send-email-stanhu@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] procps: apply patch from Ubuntu to finally get rid of 'Unknown Hz value'
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
X-List-Received-Date: Sun, 09 Dec 2012 21:52:26 -0000

Patch ported from openembedded tree:

http://cgit.openembedded.org/openembedded/commit/?id=ce2d4f482a41ee2b8884095174ce278d8fc277de
---
 .../procps/procps-3.2.8/linux-version-init.patch   |   45 ++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch

diff --git a/meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch b/meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch
new file mode 100644
index 0000000..9c1477a
--- /dev/null
+++ b/meta/recipes-extended/procps/procps-3.2.8/linux-version-init.patch
@@ -0,0 +1,45 @@
+Index: procps-3.2.8/proc/sysinfo.c
+===================================================================
+--- procps-3.2.8.orig/proc/sysinfo.c	2008-03-23 21:33:43.000000000 -0700
++++ procps-3.2.8/proc/sysinfo.c	2012-12-09 00:52:53.288000030 -0800
+@@ -212,6 +212,7 @@
+ static void init_libproc(void) __attribute__((constructor));
+ static void init_libproc(void){
+   have_privs = check_for_privs();
++  init_Linux_version(); // make sure we have version before continuing...
+   // ought to count CPUs in /proc/stat instead of relying
+   // on glibc, which foolishly tries to parse /proc/cpuinfo
+   //
+Index: procps-3.2.8/proc/version.c
+===================================================================
+--- procps-3.2.8.orig/proc/version.c	2012-12-09 00:52:53.228000030 -0800
++++ procps-3.2.8/proc/version.c	2012-12-09 00:56:14.468000086 -0800
+@@ -33,12 +33,13 @@
+ 
+ int linux_version_code;
+ 
+-static void init_Linux_version(void) __attribute__((constructor));
+-static void init_Linux_version(void) {
++// cannot depend on this auto-running before libproc init...
++//static void init_Linux_version(void) __attribute__((constructor));
++void init_Linux_version(void) {
+     int x = 0, y = 0, z = 0;	/* cleared in case sscanf() < 2 */
+     FILE *fp;
+     char buf[256];
+-    
++
+     if ( (fp=fopen("/proc/version","r")) == NULL) /* failure implies impending death */
+       exit(1);
+     if (fgets(buf, 256, fp) == NULL) {
+Index: procps-3.2.8/proc/version.h
+===================================================================
+--- procps-3.2.8.orig/proc/version.h	2002-12-14 16:08:32.000000000 -0800
++++ procps-3.2.8/proc/version.h	2012-12-09 00:52:53.288000030 -0800
+@@ -14,6 +14,7 @@
+ 
+ EXTERN_C_BEGIN
+ 
++extern void init_Linux_version(void);	/* initialize linux version */
+ extern void display_version(void);	/* display suite version */
+ extern const char procps_version[];		/* global buf for suite version */
+ 
-- 
1.7.9.5



