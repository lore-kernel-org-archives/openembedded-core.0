Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RTxQY-0004jE-5d for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 16:11:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF4LVx006133
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:04:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05426-05 for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:04:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPF4CCM006127
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2011 15:04:13 GMT
Message-ID: <1322233459.10928.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 15:04:19 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] ghostscript: Really fix parallel make race
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
X-List-Received-Date: Fri, 25 Nov 2011 15:11:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There continues to be parallel make race issues showing up on the autobuilder.
This patch removes some potential sources of these. The rm is unrequired
since we're using cp -f. The || true ensures that if we did race against
someone it becomes harmless.

[YOCTO #1202]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
index 76d1676..bb0c41c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.02-parallel-make.patch
@@ -4,6 +4,8 @@ http://bugzilla.pokylinux.org/show_bug.cgi?id=1202
 Upstream-Status: Pending
 
 Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+RP: Tweaked to include lib.mak fixes
 --- ghostscript-9.02/base/unixhead.mak.orig	2011-07-27 17:06:17.749456100 +0800
 +++ ghostscript-9.02/base/unixhead.mak	2011-07-27 17:06:37.449456100 +0800
 @@ -54,7 +54,7 @@
@@ -15,3 +17,20 @@ Signed-off-by: Kang Kai <kai.kang@windriver.com>
  RM_=rm -f
  RMN_=rm -f
  
+Index: ghostscript-9.04/base/lib.mak
+===================================================================
+--- ghostscript-9.04.orig/base/lib.mak	2011-11-25 13:06:21.728502636 +0000
++++ ghostscript-9.04/base/lib.mak	2011-11-25 13:08:33.924504957 +0000
+@@ -592,10 +592,8 @@
+  $(gscdefs_h) $(gconf_h)\
+  $(gxdevice_h) $(gxiclass_h) $(gxiodev_h) $(gxiparam_h) $(TOP_MAKEFILES)\
+  $(MAKEDDIRS)
+-	$(RM_) $(GLGEN)gconfig.c
+-	$(RM_) $(GLGEN)gconfig.h
+-	$(CP_) $(gconfig_h) $(GLGEN)gconfig.h
+-	$(CP_) $(GLSRC)gconf.c $(GLGEN)gconfig.c
++	$(CP_) $(gconfig_h) $(GLGEN)gconfig.h || true
++	$(CP_) $(GLSRC)gconf.c $(GLGEN)gconfig.c || true
+ 	$(GLCC) $(GLO_)gconfig.$(OBJ) $(C_) $(GLGEN)gconfig.c
+ 
+ $(GLOBJ)gscdefs.$(OBJ) : $(GLSRC)gscdef.c\
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
index dba92e9..d444810 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.04.bb
@@ -15,7 +15,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d151214b3131251dfc9d858593acbd24"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
 DEPENDS_virtclass-native = ""




