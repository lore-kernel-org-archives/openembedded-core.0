Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFI5i-000393-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 06:49:55 +0100
Received: by mail-pb0-f47.google.com with SMTP id rp2so4603360pbb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 22:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=xiggQE7oyMbeGT6k7rl3Ia/fdQY4lskU4Yzs2dj3GFM=;
	b=05DekR3zSaYiOSfwDPFJNILCnY5SidpwujFpEkiWxV1YtsM8Oh/Ayrkwm09TCeXzwk
	OPtLq9hbuG2qO6GamDZQiUCwuhaKKWEwJ6gSZYLrG+yjXhJt9uoqc5jUFvNjD5TzwYvT
	RKdSahqMrtNf+7KkE/cVJQ6msimCJyUqBC2ko42ge/xIjwh1abWOs+3w+OvDVqx1g0L/
	FX0tDesWxVWKb3J0I+Sj8CkBTo+AtU1NoLq22jRipx6iss1KNetu7TF0cpoOXDZ9B90B
	alq20bdI22vGEGVGOABM7hV9P14IAXIbX0aBaIVZ4d7BkZKPhgYiXb73IPzuNLJUG3gj
	6wbQ==
X-Received: by 10.68.245.201 with SMTP id xq9mr34433767pbc.160.1363066378056; 
	Mon, 11 Mar 2013 22:32:58 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id qp13sm23442794pbb.3.2013.03.11.22.32.56
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 22:32:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 22:32:45 -0700
Message-Id: <1363066365-8060-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] watchdog: Upgrade 5.12 -> 5.13
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
X-List-Received-Date: Tue, 12 Mar 2013 05:50:00 -0000

Part of ping failure patch is already applied
in 5.13 hence refreshed the patch.
Tested on x86_64 box

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../watchdog/files/fix-ping-failure.patch          |   21 ++++++--------------
 meta/recipes-extended/watchdog/watchdog_5.12.bb    |   21 --------------------
 meta/recipes-extended/watchdog/watchdog_5.13.bb    |   18 +++++++++++++++++
 3 files changed, 24 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-extended/watchdog/watchdog_5.12.bb
 create mode 100644 meta/recipes-extended/watchdog/watchdog_5.13.bb

diff --git a/meta/recipes-extended/watchdog/files/fix-ping-failure.patch b/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
index c6ee843..f5976eb 100644
--- a/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
+++ b/meta/recipes-extended/watchdog/files/fix-ping-failure.patch
@@ -33,19 +33,10 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
  src/watchdog.c |    5 ++++-
  2 files changed, 5 insertions(+), 2 deletions(-)
 
---- a/src/net.c
-+++ b/src/net.c
-@@ -118,7 +118,7 @@ int check_net(char *target, int sock_fp,
- 		    dtimeout.tv_usec -= 1000000;
- 		    dtimeout.tv_sec++;
- 		}
--		if (dtimeout.tv_sec <= 0)
-+		if (dtimeout.tv_sec < 0)
- 		    break;
- #if USE_SYSLOG
- 		if (verbose && logtick && ticker == 1)
---- a/src/watchdog.c
-+++ b/src/watchdog.c
+Index: watchdog-5.13/src/watchdog.c
+===================================================================
+--- watchdog-5.13.orig/src/watchdog.c	2013-02-01 03:15:44.000000000 -0800
++++ watchdog-5.13/src/watchdog.c	2013-03-11 22:27:48.741657881 -0700
 @@ -28,6 +28,7 @@
  #include <sys/types.h>
  #include <sys/ioctl.h>
@@ -54,7 +45,7 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
  #include <linux/watchdog.h>
  #include <string.h>
  
-@@ -567,6 +568,8 @@ int main(int argc, char *const argv[])
+@@ -567,6 +568,8 @@
      pid_t child_pid;
      int oom_adjusted = 0;
      struct stat s;
@@ -63,7 +54,7 @@ Signed-off-by: Roy.Li <rongqing.li@windriver.com>
  
  #if USE_SYSLOG
      char *opts = "d:i:n:Ffsvbql:p:t:c:r:m:a:";
-@@ -703,7 +706,7 @@ int main(int argc, char *const argv[])
+@@ -703,7 +706,7 @@
  		perror(progname);
  		exit(1);
  	    }
diff --git a/meta/recipes-extended/watchdog/watchdog_5.12.bb b/meta/recipes-extended/watchdog/watchdog_5.12.bb
deleted file mode 100644
index 78262b8..0000000
--- a/meta/recipes-extended/watchdog/watchdog_5.12.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Software watchdog"
-DESCRIPTION = "Watchdog is a daemon that checks if your system is still \
-working. If programs in user space are not longer executed \
-it will reboot the system."
-HOMEPAGE = "http://watchdog.sourceforge.net/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
-
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
-
-PR = "r1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
-	   file://fix-ping-failure.patch"
-
-SRC_URI[md5sum] = "cea28bea70e54f3625062bc808aef9af"
-SRC_URI[sha256sum] = "862d5da6ab34568bbd4ea695316f063fecabe107d0939ceea6c67c9ec0b1a08e"
-
-inherit autotools
-
-RRECOMMENDS_${PN} = "kernel-module-softdog"
diff --git a/meta/recipes-extended/watchdog/watchdog_5.13.bb b/meta/recipes-extended/watchdog/watchdog_5.13.bb
new file mode 100644
index 0000000..610e473
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog_5.13.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Software watchdog"
+DESCRIPTION = "Watchdog is a daemon that checks if your system is still \
+working. If programs in user space are not longer executed \
+it will reboot the system."
+HOMEPAGE = "http://watchdog.sourceforge.net/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
+
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ecc0551bf54ad97f6b541720f84d6569"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/watchdog/watchdog-${PV}.tar.gz \
+	   file://fix-ping-failure.patch"
+SRC_URI[md5sum] = "153455f008f1cf8f65f6ad9586a21ff1"
+SRC_URI[sha256sum] = "141e0faf3ee4d8187a6ff4e00b18ef7b7a4ce432a2d4c8a6e6fdc62507fc6eb0"
+
+inherit autotools
+
+RRECOMMENDS_${PN} = "kernel-module-softdog"
-- 
1.7.9.5



