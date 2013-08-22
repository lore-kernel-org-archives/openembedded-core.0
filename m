Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B33256B66A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fY001261; Thu, 22 Aug 2013 12:42:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HJTrU0NL1qJf; Thu, 22 Aug 2013 12:42:11 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg7FB001223
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:08 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5a-0001i8-QB; Thu, 22 Aug 2013 12:30:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:42 +0100
Message-Id: <1377171000-6469-10-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/28] gcc: Drop gcc-cross4.inc, its pointless now
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:30 -0000

The include was useful historically, its not anymore so lets remove it.
This should have no functional change except on any layers directly depending
on it or gcc-cross.inc but even then it would only impact sh4 and is easily
fixed if there was a problem.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-cross.inc    | 2 ++
 meta/recipes-devtools/gcc/gcc-cross4.inc   | 3 ---
 meta/recipes-devtools/gcc/gcc-cross_4.7.bb | 2 +-
 meta/recipes-devtools/gcc/gcc-cross_4.8.bb | 2 +-
 4 files changed, 4 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-cross4.inc

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 9d29f56..2913df7 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -106,3 +106,5 @@ STOP
 	chmod +x ${B}/${TARGET_PREFIX}testgcc
 
 }
+
+EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
diff --git a/meta/recipes-devtools/gcc/gcc-cross4.inc b/meta/recipes-devtools/gcc/gcc-cross4.inc
deleted file mode 100644
index 4a20818..0000000
--- a/meta/recipes-devtools/gcc/gcc-cross4.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-require gcc-cross.inc
-
-EXTRA_OECONF_append_sh4 = " --with-multilib-list= --enable-incomplete-targets "
diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.7.bb b/meta/recipes-devtools/gcc/gcc-cross_4.7.bb
index d605235..b02ea13 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_4.7.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_4.7.bb
@@ -1,5 +1,5 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-cross4.inc
+require gcc-cross.inc
 
 EXTRA_OECONF += "--disable-libunwind-exceptions \
                  --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
diff --git a/meta/recipes-devtools/gcc/gcc-cross_4.8.bb b/meta/recipes-devtools/gcc/gcc-cross_4.8.bb
index d605235..b02ea13 100644
--- a/meta/recipes-devtools/gcc/gcc-cross_4.8.bb
+++ b/meta/recipes-devtools/gcc/gcc-cross_4.8.bb
@@ -1,5 +1,5 @@
 require recipes-devtools/gcc/gcc-${PV}.inc
-require gcc-cross4.inc
+require gcc-cross.inc
 
 EXTRA_OECONF += "--disable-libunwind-exceptions \
                  --with-mpfr=${STAGING_DIR_NATIVE}${prefix_native} \
-- 
1.8.1.2


