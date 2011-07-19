Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qiy5a-0002Os-Uv
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 02:23:14 +0200
Received: by iwn4 with SMTP id 4so3528940iwn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 17:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Lk/ceGt3W6nvbx+AL25eQZuezmjan+aUVNTLijC1V4U=;
	b=rkB4pwzHk2L44XU7YCbnoTvV0bFp5p32QEhRtrLDkWdEcSbuLShnaE0N9nPGZUTTYo
	VPMEzmL2eQXC0YD6v4OTRS8glimGUDukxBeCyd/XAxIEN28zR+/IbQgbwJ915xkcyBeF
	vSJ1pbEsZF80CdJ1s+G9pof8WTkz5fARSjJC8=
Received: by 10.42.150.71 with SMTP id z7mr7414584icv.474.1311034674350;
	Mon, 18 Jul 2011 17:17:54 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id b6sm3248255ibg.14.2011.07.18.17.17.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jul 2011 17:17:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2011 17:17:28 -0700
Message-Id: <bcd71928a9187721cbbd00795a8bde5f2b503710.1311034342.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
In-Reply-To: <cover.1311034342.git.raj.khem@gmail.com>
References: <cover.1311034342.git.raj.khem@gmail.com>
Subject: [PATCH 09/16] uclibc_0.9.32: Implement sync_file_range2.
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
X-List-Received-Date: Tue, 19 Jul 2011 00:23:14 -0000

On some arches e.g. arm, ppc sync_file_range2 is used
instead of sync_file_range so we should consider that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   15 +++++++++++++++
 meta/recipes-core/uclibc/uclibc_0.9.32.bb          |    3 ++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch

diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
new file mode 100644
index 0000000..8ca2560
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
@@ -0,0 +1,15 @@
+Index: git/libc/sysdeps/linux/common/sync_file_range.c
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/sync_file_range.c	2011-07-16 19:19:40.000000000 -0700
++++ git/libc/sysdeps/linux/common/sync_file_range.c	2011-07-17 22:21:48.893808544 -0700
+@@ -10,7 +10,9 @@
+ #include <sys/syscall.h>
+ #if defined __USE_GNU
+ #include <fcntl.h>
+-
++#if defined __NR_sync_file_range2
++#define __NR_sync_file_range __NR_sync_file_range2
++#endif
+ #if defined __NR_sync_file_range && defined __UCLIBC_HAS_LFS__
+ #define __NR___syscall_sync_file_range __NR_sync_file_range
+ static __inline__ _syscall6(int, __syscall_sync_file_range, int, fd,
diff --git a/meta/recipes-core/uclibc/uclibc_0.9.32.bb b/meta/recipes-core/uclibc/uclibc_0.9.32.bb
index b959279..8dcb260 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.32.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.32.bb
@@ -1,7 +1,7 @@
 SRCREV="9152c4d67c763fde5712e2d181d92c0d7e1e2ab9"
 
 require uclibc.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
@@ -28,5 +28,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
 	file://0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch \
 	file://uclibc-execvpe.patch \
 	file://uclibc_scheduler_update.patch \
+	file://sync_file_range2.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.4.1



