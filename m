Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy4f-0002Iy-UV
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:22:11 +0200
Received: by iwn4 with SMTP id 4so3529022iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=McD48v2dRMXYENORGFlNGy/fpATKbvEP/evRP+yU9Pc=;
	b=GdBliigagodCsWviJ6WbtxC4On9Mv/1aZ4532QL91q6gpgoYRyYgs2f4+091sA8raF
	SZkFGfEno4XCoZtcbcf33t5t1p2YxAAtoc61/JDzKraWrz66VlP0rScnNuq3/QRJ1jJE
	+0s2/4C7inlnqFDMDm8X2hJ6pFOMYZsmhwOS4=
Received: by 10.231.52.209 with SMTP id j17mr1065043ibg.94.1311034681837;
	Mon, 18 Jul 2011 17:18:01 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.18.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:18:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:34 -0700
Message-Id: <2ef6713615812e4c14255667c26dbea751998165.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 15/16] sysprof: Define NT_GNU_BUILD_ID if undefined
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
X-List-Received-Date: Tue, 19 Jul 2011 00:22:13 -0000

This is needed on uclibc which does not have all GNU extentions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |   22 ++++++++++++++++++++
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    5 ++-
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch

diff --git a/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
new file mode 100644
index 0000000..dcc2cbe
--- /dev/null
+++ b/meta/recipes-kernel/sysprof/files/define-NT_GNU_BUILD_ID.patch
@@ -0,0 +1,22 @@
+On uclibc elf.h does not have GNU extentions but we need this define
+so we define it locally if its not getting it from elf.h
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: git/elfparser.h
+===================================================================
+--- git.orig/elfparser.h	2011-07-16 18:57:41.000000000 -0700
++++ git/elfparser.h	2011-07-16 20:28:54.733829895 -0700
+@@ -17,6 +17,10 @@
+  */
+ #include <glib.h>
+ 
++#ifndef NT_GNU_BUILD_ID
++#define NT_GNU_BUILD_ID 3
++#endif
++
+ typedef struct ElfSym ElfSym;
+ typedef struct ElfParser ElfParser;
+ 
diff --git a/meta/recipes-kernel/sysprof/sysprof_git.bb b/meta/recipes-kernel/sysprof/sysprof_git.bb
index 2246803..1af5822 100644
--- a/meta/recipes-kernel/sysprof/sysprof_git.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_git.bb
@@ -5,11 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "gtk+ libglade"
 
 SRCREV = "38a6af1f0a45e528fd2842983da71e0f23c70d6a"
-PR = r0
+PR = r1
 PV = "1.1.6+git${SRCPV}"
 
 SRC_URI = "git://git.gnome.org/sysprof;protocol=git \
-           "
+           file://define-NT_GNU_BUILD_ID.patch \
+          "
 
 SRC_URI_append_arm  = " file://rmb-arm.patch"
 SRC_URI_append_mips = " file://rmb-mips.patch"
-- 
1.7.4.1



