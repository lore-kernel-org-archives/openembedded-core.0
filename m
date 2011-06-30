Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QcCLF-0001RO-TH
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 10:11:19 +0200
Received: by mail-iw0-f175.google.com with SMTP id 4so1886628iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 01:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/V1W00qQl3Xqw7dGGjVAAUpoIB+dYteYTMkau42f/k4=;
	b=eFDfxXGf571XcOGv7dJzdJwPkKr6wlbIPXQrHJjPlErR2pZTVt40N7uSvKiXbH5ix0
	Qkr+R1LQ1eoxekfvrKejLctihZPICuvuoP1jnnHZhfPKelKQjat2+OFjBtCtN2nlTmFz
	UfbZuD7EDWLkTynVHCdbUoq3wntAtKEI4Rs9I=
Received: by 10.231.60.68 with SMTP id o4mr1605942ibh.12.1309421256688;
	Thu, 30 Jun 2011 01:07:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s2sm1093925ibe.1.2011.06.30.01.07.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Jun 2011 01:07:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 01:07:15 -0700
Message-Id: <ccc3cc7fd88d55c9189e078a3398b3091bc84ae7.1309420894.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
References: <681f30f772cb90b5ee4544f907013b7848e9e3fb.1309420894.git.raj.khem@gmail.com>
In-Reply-To: <cover.1309420894.git.raj.khem@gmail.com>
References: <cover.1309420894.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] uclibc: Fix bug exposed by udev 168+ for mips architecture
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
X-List-Received-Date: Thu, 30 Jun 2011 08:11:22 -0000

newer udev uses sgnalfd + epoll and this exposed a bug
in uclibc for mips where SFD_NONBLOCK should be defined
with 0200 for mips but was using 04000. This would cause
random segfaults in udev during boot process

Tested on qemumips/angstrom console-image since angstrom
uses udev 171. It worked well when we did not use meta-oe
layer because udev in oe-core will then be used which is
at version 164.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |   33 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_git.bb             |    3 +-
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch b/meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
new file mode 100644
index 0000000..6892ceb
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
@@ -0,0 +1,33 @@
+From ecc7d34cbbaf83aae87b091555650ed33e27ed2e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 30 Jun 2011 00:32:11 -0700
+Subject: [PATCH] mips/signalfd.h: SFD_NONBLOCK for mips is 0200 unlike 04000 commonly
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/sys/signalfd.h |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/include/sys/signalfd.h b/include/sys/signalfd.h
+index 8cee17c..f1cb63a 100644
+--- a/include/sys/signalfd.h
++++ b/include/sys/signalfd.h
+@@ -64,6 +64,15 @@ enum
+ # define SFD_NONBLOCK SFD_NONBLOCK
+   };
+ 
++#elif defined __mips__
++enum
++  {
++    SFD_CLOEXEC = 02000000,
++# define SFD_CLOEXEC SFD_CLOEXEC
++    SFD_NONBLOCK = 0200
++# define SFD_NONBLOCK SFD_NONBLOCK
++  };
++
+ #else
+ enum
+   {
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 201ec93..0e43f9e 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -2,7 +2,7 @@ SRCREV="71d63ed75648da9b0b71afabb9c60aaad792c55c"
 
 require uclibc.inc
 PV = "0.9.31+0.9.32rc3"
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
@@ -30,5 +30,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://orign_path.patch \
 	file://rtld_no.patch \
 	file://0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch \
+	file://0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1



