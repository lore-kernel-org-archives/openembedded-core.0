Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1DF5673CC9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:02 +0000 (UTC)
Received: by ierf6 with SMTP id f6so26623806ier.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=cdV4kw4fKvbwLwuGtWhRvExhaQryZ76fKJTfXiSXwlc=;
	b=Z1vHxl4bzI8sKi1Q44Np4wgtcMQXx/MJWv0gBLkeTOGf/zBUKfxuJr+4kMeYEtI00V
	wKCLPWmN10khyAaNdrlLkfCKzEzlJdp+OpMiCUFv22Xf/d/aH2IY7rO5M2zaMfr/N8wp
	WSMAhsp7fy4TV5DIHHCe5rL6z7zE+r8LkQQSpXanRrFY2iNMcfv6RxqjL5fxhmaE90Sf
	Meo67hDd532ezV3852uLdC+MHWXLKfwKqWm+0o2zOrq7QJ1+rXV7od08dcmxPdCqtYUZ
	Wc1b0RbcSclpjm4GLFWuEa8hohaEcW5dPxPd+R8JEL8C+nbTtE9Cr+TzHq0B3v+NlDx7
	nfdw==
X-Received: by 10.50.87.42 with SMTP id u10mr25357833igz.31.1428341823902;
	Mon, 06 Apr 2015 10:37:03 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:32 +0000
Message-Id: <48ab0128ac6a76b1116d51d9b9d0ba463dddf695.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 04/24] binutils: Fix ICE in gold
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:04 -0000

Found when linking busybox using gold linker

Change-Id: I47b89998b9cb3d75ac97113a1b0fba109483b198
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.25.inc   |  1 +
 ...rnal-error-in-do_print_to_mapfile-seen-wi.patch | 36 ++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.25.inc b/meta/recipes-devtools/binutils/binutils-2.25.inc
index d69b519..d9075b6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.inc
@@ -24,6 +24,7 @@ SRC_URI = "\
      file://binutils-armv5e.patch \
      file://mips64-default-ld-emulation.patch \
      file://binutils-xlp-support.patch \
+     file://0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch \
      "
 SRC_URI[md5sum] = "d9f3303f802a5b6b0bb73a335ab89d66"
 SRC_URI[sha256sum] = "22defc65cfa3ef2a3395faaea75d6331c6e62ea5dfacfed3e2ec17b08c882923"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch b/meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
new file mode 100644
index 0000000..a47faef
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch
@@ -0,0 +1,36 @@
+From 54583eb23233b5369372ae41768655693d0584ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Feb 2015 09:05:49 +0000
+Subject: [PATCH] Fix an internal error in do_print_to_mapfile seen with gold
+ on arm
+
+This is due to missing implementation of do_print_to_mapfile for
+atrributea section (ARM.attributes), it started to show up after fix
+for PR gold/16980 was installed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Submitted
+---
+ gold/ChangeLog    | 5 +++++
+ gold/attributes.h | 4 ++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/gold/attributes.h b/gold/attributes.h
+index c0b171f..6e3ab8c 100644
+--- a/gold/attributes.h
++++ b/gold/attributes.h
+@@ -387,6 +387,10 @@ class Output_attributes_section_data : public Output_section_data
+   { }
+ 
+  protected:
++  // Write to a map file.
++  void
++  do_print_to_mapfile(Mapfile* mapfile) const
++  { mapfile->print_output_data(this, _("** attributes")); }
+   // Write the data to the output file.
+   void
+   do_write(Output_file*);
+-- 
+2.1.4
+
-- 
2.1.4


