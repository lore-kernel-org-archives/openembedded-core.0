Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxR-0001W7-CH
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:33 +0200
Received: by dalh21 with SMTP id h21so3477246dal.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fgjbzAhB9Ahnokr8iJfJkgY6tn4B43IV/4/IzH9f3/8=;
	b=WvQG+2WeLZ+9/VUGD50o+iQXvymT/HHOrX4AEBiXffWveIXOSv/X9t7+bD3KvpEzoa
	hjk64Gy1UjuriC1Y1TTB93Q97eJLP6Li8I7250/mUOTiHzWmKkF8ll+NL5v7wyO+f4/m
	Ke2Xn5d7sRJmI42mHp7vJh5AvO0yv7lcA7VuYNI2yno9xidHm6K0Ao14P+9ER0ZgD9v6
	mdsOGHHKw5rOaHCjGHMLSqcShdrjtpUi7s7DLoKXXqc8JgxkCD4b8z2b2uH8lv9QQJF+
	c7aACY/NF3opjPu6Vkd7lam9w0Ey4+vxUnXXMlDia0l3KrNYHpZz63khbd6bwKnMdF3u
	H0PA==
Received: by 10.68.226.226 with SMTP id rv2mr16445645pbc.101.1339740834694;
	Thu, 14 Jun 2012 23:13:54 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.13.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:32 -0700
Message-Id: <c49e7e2915d4ade3dd67f706f12b3979a3b5c021.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 5/9] sat-solver: Fix build on uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 06:24:34 -0000

futimes is not available on uclibc so use utimes
qsort is also not as expected by sat-solver therefore
for uclibc we resort to using internal version of
qsort

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 ++
 2 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/futimes.patch

diff --git a/meta/recipes-extended/sat-solver/sat-solver/futimes.patch b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
new file mode 100644
index 0000000..b24d852
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/futimes.patch
@@ -0,0 +1,32 @@
+This patch uses utimes instead of futimes for uclibc
+since futimes is not available
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: git/examples/solv.c
+===================================================================
+--- git.orig/examples/solv.c	2012-06-01 12:06:22.041552848 -0700
++++ git/examples/solv.c	2012-06-01 12:49:17.417677449 -0700
+@@ -1027,7 +1027,8 @@
+   int flags;
+ 
+   cinfo = repo->appdata;
+-  if (!(fp = fopen(calccachepath(repo, repoext), "r")))
++  const char* fname = calccachepath(repo, repoext);
++  if (!(fp = fopen(fname, "r")))
+     return 0;
+   if (fseek(fp, -sizeof(mycookie), SEEK_END) || fread(mycookie, sizeof(mycookie), 1, fp) != 1)
+     {
+@@ -1068,7 +1069,11 @@
+       memcpy(cinfo->extcookie, myextcookie, sizeof(myextcookie));
+     }
+   if (mark)
++#ifdef __UCLIBC__
++    utimes(fname, 0);	/* try to set modification time */
++#else
+     futimes(fileno(fp), 0);	/* try to set modification time */
++#endif
+   fclose(fp);
+   return 1;
+ }
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index b0382f6..b0daa6a 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
            file://sat-solver_core.patch \
            file://fix_gcc-4.6.0_compile_issue.patch \
            file://0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch \
+           file://futimes.patch \
           "
 
 S = "${WORKDIR}/git"
@@ -28,6 +29,8 @@ EXTRA_OECMAKE += "-DRPM5=RPM5 -DOE_CORE=OE_CORE"
 
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
+TUNE_CCARGS_libc-uclibc_append = " -DUSE_OWN_QSORT=1 "
+
 inherit cmake pkgconfig
 
 RDEPENDS_${PN} = "rpm-libs"
-- 
1.7.5.4



