Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Stgr0-000650-Em
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 17:16:54 +0200
Received: by yenl13 with SMTP id l13so6255870yen.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=iD+vAOYd7JYyD2RIB6Oxc+wNIhowHkGz1VLdEfo2JKc=;
	b=m5+pelbRvhcmNLq9qsGCXImVuo8LNgKHRMTqL2eSrTLljehP/XJQ78tkZpSc0Liplj
	e3LwnFaIxBWp8iYuZj0BI39M+SmkLquqaIJoLI0Fq7q1w0hHOPEQnuReaOi2r0y9STlB
	Lhaw6SrpL4SCxYKLbtzd6lt94GJUJPUoQxtzZr6YRY9x/cijOQHpwCkARh5huk943bg8
	EibX7i6DW+lGMQsF1nePsRp/GUgdV+hyOAITzTSFqPI2Am/1jEzRI51CnR/PiJbJm397
	V2luYVJHcScK1hOnGZqcSJVh4UtZi7OkM2iW2vzMKk/0o3FUzNBQGDU7dgONqGwaorPb
	EyNA==
Received: by 10.68.219.162 with SMTP id pp2mr45239913pbc.85.1343142325364;
	Tue, 24 Jul 2012 08:05:25 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sh3sm12332139pbc.16.2012.07.24.08.05.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 08:05:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 08:04:23 -0700
Message-Id: <e25e076b849d26a9f823536a1b0491a929d270ae.1343142062.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
References: <28fddc4106d02fc5b2c97bfd6f425360740cd5f8.1343142062.git.raj.khem@gmail.com>
In-Reply-To: <cover.1343142062.git.raj.khem@gmail.com>
References: <cover.1343142062.git.raj.khem@gmail.com>
Subject: [PATCH 4/5] gcc-cross-initial: Stage self sufficient fixed limits.h
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
X-List-Received-Date: Tue, 24 Jul 2012 15:16:54 -0000

currently gcc installs a limits.h which references to another
limits.h which it expects from target sysroot and that header
in target sysroot will come from eglibc. So we need to break
this catch-22 and hence we install a self sufficient limits.h
which is then happy when referenced and doesnt complain about
missing limits.h from target sysroot.

This is mostly used when eglibc-initial configure is run

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc           |    2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc |   10 ++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 43d77ec..709d7d8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r7"
+PR = "r8"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
index 93a6d78..aee46a6 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
@@ -27,3 +27,13 @@ EXTRA_OECONF = "--with-newlib \
 do_compile () {
     oe_runmake all-gcc all-target-libgcc
 }
+# fixed limits.h infact includes the so called real limits.h
+# which should come from libc but when we build libc-initial
+# then bunch of configure tests include fixed limits.h which in turn
+# includes real limits.h but this real limits.h is not staged yet
+# so we overwirte the generated include-fixed/limits.h for gcc-cross-initial
+# to get rid references to real limits.h
+
+do_install_append1() {
+    cp gcc/include-fixed/limits.h ${D}${gcclibdir}/${TARGET_SYS}/${BINV}/include-fixed/limits.h
+}
-- 
1.7.9.5



