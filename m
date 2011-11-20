Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSBdz-0003Wj-Sr
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 18:57:34 +0100
Received: by ywt2 with SMTP id 2so3995651ywt.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 09:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5Unu7Bd0Gaaq6CxPuY7HTuKcmMEXLBl4gxC+c3JOqJU=;
	b=a+EU89RP6DeoqWW5Rh2+g52FAguBixjUq4WdMv3O5ou/YtwS9oH6d3GZ65ivA9mkj2
	YvzDxLPcN/NAkPrYhydAKWukLW1zQo35oiLRNPCzEaAF8MJq/u+9Fv4S0rwrHgt4/amF
	UOXSpnWxwj63fNIGruCw6iMDX/weXGmljiucA=
Received: by 10.50.216.137 with SMTP id oq9mr11409218igc.40.1321811462297;
	Sun, 20 Nov 2011 09:51:02 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm34710971ibb.7.2011.11.20.09.51.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 09:51:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 09:50:45 -0800
Message-Id: <0abcddc2e0bdf826919f7aee820f60fa64024177.1321811216.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
References: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
In-Reply-To: <cover.1321811216.git.raj.khem@gmail.com>
References: <cover.1321811216.git.raj.khem@gmail.com>
Subject: [PATCH 3/5] pulseaudio-0.9.23: Fix build on uclibc
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
X-List-Received-Date: Sun, 20 Nov 2011 17:57:34 -0000

Import patch from oe.dev rev 7c33f2e906a20e139d53b4f2d8fbc2773a4725b3
to fix bluez build when using uclibc

cgit link here

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=7c33f2e906a20e139d53b4f2d8fbc2773a4725b3

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pulseaudio-0.9.23/fix_bluez_build.patch        |   26 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_0.9.23.bb                |    3 +-
 2 files changed, 28 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch
new file mode 100644
index 0000000..fbb22d7
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio-0.9.23/fix_bluez_build.patch
@@ -0,0 +1,26 @@
+using uClibc $(INTLLIBS) is not empty but set to -lintl
+this means that AM_LIBADD wont be empty as well and hence
+a missing space which otherwise works starts to show up as error
+
+| make[4]: *** No rule to make target `-lintl', needed by `libbluetooth-ipc.la'.  Stop.
+| make[4]: Leaving directory `/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-uclibc/work/armv5te-oe-linux-uclibceabi/pulseaudio-0.9.23-r7/pulseaudio-0.9.23/src'
+| make[3]: *** [all-recursive] Error 1
+
+We add missing space
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: pulseaudio-0.9.23/src/Makefile.am
+===================================================================
+--- pulseaudio-0.9.23.orig/src/Makefile.am	2011-06-23 13:18:54.000000000 -0700
++++ pulseaudio-0.9.23/src/Makefile.am	2011-11-20 09:04:00.986917207 -0800
+@@ -1701,7 +1701,7 @@
+ 
+ libbluetooth_ipc_la_SOURCES = modules/bluetooth/ipc.c modules/bluetooth/ipc.h
+ libbluetooth_ipc_la_LDFLAGS = -avoid-version
+-libbluetooth_ipc_la_LIBADD = $(AM_LIBADD)libpulsecore-@PA_MAJORMINORMICRO@.la libpulsecommon-@PA_MAJORMINORMICRO@.la libpulse.la
++libbluetooth_ipc_la_LIBADD = $(AM_LIBADD) libpulsecore-@PA_MAJORMINORMICRO@.la libpulsecommon-@PA_MAJORMINORMICRO@.la libpulse.la
+ libbluetooth_ipc_la_CFLAGS = $(AM_CFLAGS)
+ BLUETOOTH_IPC_FILES = $(subst modules/bluetooth/,,$(libbluetooth_ipc_la_SOURCES)) rtp.h
+ 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
index 62832d9..e712cab 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r7"
+PR = "r8"
 
 DEPENDS += "gdbm speex libxml-parser-perl-native"
 
@@ -12,6 +12,7 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.
   file://tls_m4.patch \
   file://configure_silent_rules.patch \
   file://volatiles.04_pulse \
+  file://fix_bluez_build.patch \
 "
 
 SRC_URI[md5sum] = "7391205a337d1e04a9ff38025f684034"
-- 
1.7.5.4



