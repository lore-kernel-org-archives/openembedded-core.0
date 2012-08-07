Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SyrTo-0001EM-08
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 23:38:20 +0200
Received: by yenm1 with SMTP id m1so99646yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 14:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KaRqJXxXOweV42sgFJu3V4o80r1I7pGRodzzc3VaM7Q=;
	b=t/f98B7XqYn7bMjfJntZ+xyJib8xKc2aKGzeqmm3kcVa/YZgbwE860MRGHXPbqXZcO
	KgYDAInqlDIyXfZ0rGEruyWPjUQPe5kuN2ODXYKXmeKEVg/e7zJt/FMRYlo1QmsBFnHf
	YLu2VEJjH5Ig+hPU2l2Jo+kRLENsClbBxb7rZoak2TGGKtpAKqqyXdm2SCpuC4FidCfB
	4TP7zGewG+39cyR2VVxz5bTKGBbLdZmuznwftzgqZIFqX8xSIL7phl27cKWzyesnoJ7o
	MYMiqKKQgBqF0B77dLZY3LDi4/CT3IFbue+Z9QCNbfP1GEbKPRvm6MyZzJW3W+CPvZFR
	0mcA==
Received: by 10.66.86.166 with SMTP id q6mr1607430paz.5.1344374792841;
	Tue, 07 Aug 2012 14:26:32 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rp9sm4016283pbc.52.2012.08.07.14.26.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 14:26:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2012 14:26:21 -0700
Message-Id: <1344374781-21240-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] binutils: Enable threaded linking with gold
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
X-List-Received-Date: Tue, 07 Aug 2012 21:38:20 -0000

This options will let gold spawn multiple
threads for linking and speeding up linking
on multicore build hosts.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.22.inc |    2 +-
 meta/recipes-devtools/binutils/binutils.inc      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
index e3e179d..17950a2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.22.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
@@ -1,4 +1,4 @@
-PR = "r13"
+PR = "r14"
 
 LIC_FILES_CHKSUM="\
     file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index cd923bd..ee748a4 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -53,7 +53,7 @@ B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
 EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
                 --disable-werror \
 		--enable-plugins \
-		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default', '', d)} \
+		${@base_contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '', d)} \
                 ${@base_contains('DISTRO_FEATURES', 'multiarch', '--enable-64-bit-bfd', '', d)}"
 
 # This is necessary due to a bug in the binutils Makefiles
-- 
1.7.9.5



