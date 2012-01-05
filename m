Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RithA-0001np-SM
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 21:13:55 +0100
Received: by iakh37 with SMTP id h37so1415534iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 12:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zRMWFSQR7QGE/HGGk9keVFwJH/f+DvD2b4AMr/RqcvA=;
	b=io3Fu7miDrhPO+I+kyGGCXWwsf4aTHzMUdLkGR+7MQk82DYiVbcEVQH8b94BQPv1s7
	U5A1OizpjzMPxpPluNzosvapTaTBFUVwgpMOBUgC/RmwaHdMVxyFvPZ25KrBCV2TCBmh
	swKbSYCW5ZAMzQ83PTX2sy8vSKD1AWOR8nQK0=
Received: by 10.50.193.229 with SMTP id hr5mr4247749igc.15.1325793987913;
	Thu, 05 Jan 2012 12:06:27 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gh9sm125208225igb.3.2012.01.05.12.06.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 12:06:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 12:06:07 -0800
Message-Id: <1325793967-13002-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] linux-yocto-3.0: Fix compile failure in perf
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
X-List-Received-Date: Thu, 05 Jan 2012 20:13:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Undef-before-redefining-__attribute_const.patch |   33 ++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    4 ++-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-before-redefining-__attribute_const.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-before-redefining-__attribute_const.patch b/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
new file mode 100644
index 0000000..b85cc97
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-compiler.h-Undef-before-redefining-__attribute_const.patch
@@ -0,0 +1,33 @@
+From 6f92ab6de9d8daeb575949bbbcbc7bcdcebc60af Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 5 Jan 2012 11:42:35 -0800
+Subject: [PATCH] compiler.h: Undef before redefining __attribute_const__
+
+This is required to avoid warnings like
+util/include/linux/compiler.h:8:0: error: "__attribute_const__" redefined [-Werror]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/perf/util/include/linux/compiler.h |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/tools/perf/util/include/linux/compiler.h b/tools/perf/util/include/linux/compiler.h
+index 791f9dd..f17ecef 100644
+--- a/tools/perf/util/include/linux/compiler.h
++++ b/tools/perf/util/include/linux/compiler.h
+@@ -4,9 +4,11 @@
+ #ifndef __always_inline
+ #define __always_inline	inline
+ #endif
++#undef __user
+ #define __user
++#undef __attribute_const__
+ #define __attribute_const__
+-
++#undef __used
+ #define __used		__attribute__((__unused__))
+ 
+ #endif
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index b650c84..2e87f7f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -23,7 +23,9 @@ SRCREV_meta ?= "c979f1365b1eb74e882b2cbbc8407ec536ab6eb8"
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta \
+           file://0001-compiler.h-Undef-before-redefining-__attribute_const.patch \
+           "
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64)"
 
-- 
1.7.5.4



