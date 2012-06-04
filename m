Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sbfpn-00015X-F8
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jun 2012 00:33:11 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so6811315pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 15:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=osKjyKK/klnOiMQHRgo/1Sy7D7oC8N7HT7q0CcesQ2A=;
	b=NdM/nncZdS11gpNHIrl8pNt7Sg4uPSpB437NCSC6+gbV0rUonV1RaVwUxM0r0SeUQo
	VrtCnGSMjAoHBcrzbWkD9+Eh94AIyd82bUJm+6Sb3ESsqfVTaWggJZaxqw9L53AJXNq7
	+RVYeX7iiuhy07RR8AF1otmLKm6JonxXoUvOM1/A2Gd3g8paISgi643IbvNZFfKwaevw
	UPt90L/GvxNvz6NotUF1Z9lDMm9yGMnZHlV1ipDNfx+q4T9iW7VuDEoTiVF6wXniiaCn
	4hocMV2kgDJ5rnGFm0+8H76EUXbXJkYtgIvy07J7rfA4v6gfEU8duMV2eDxlM0DZdGVU
	w3uw==
Received: by 10.68.194.6 with SMTP id hs6mr43430155pbc.133.1338848568188;
	Mon, 04 Jun 2012 15:22:48 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id we10sm34017pbc.13.2012.06.04.15.22.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 15:22:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2012 15:21:45 -0700
Message-Id: <5843b30ec92b7dabe295f70b7579ec130262ab2d.1338848379.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
References: <8e405c03573c5f1cf6ee7601ccffa148244a3403.1338848379.git.raj.khem@gmail.com>
In-Reply-To: <cover.1338848379.git.raj.khem@gmail.com>
References: <cover.1338848379.git.raj.khem@gmail.com>
Subject: [PATCH 6/7] sat-solver: Fix build on uclibc
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
X-List-Received-Date: Mon, 04 Jun 2012 22:33:11 -0000

futimes is not available on uclibc so use utimes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sat-solver/sat-solver/futimes.patch            |   32 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    7 +++-
 2 files changed, 37 insertions(+), 2 deletions(-)
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
index 9d8422f..743c6f8 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -8,7 +8,7 @@ DEPENDS = "libcheck rpm zlib expat db"
 
 SRCREV = "0a7378d5f482f477a01cf1690d76871ab8bdcc32"
 PV = "0.0-git${SRCPV}"
-PR = "r13"
+PR = "r14"
 
 PARALLEL_MAKE=""
 
@@ -20,14 +20,17 @@ SRC_URI = "git://github.com/openSUSE/sat-solver.git;protocol=git \
            file://sat-solver_core.patch \
            file://fix_gcc-4.6.0_compile_issue.patch \
            file://0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch \
+           file://futimes.patch \
           "
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE += "-DRPM5=RPM5 -DOE_CORE=OE_CORE"
+EXTRA_OECMAKE += "-DRPM5=RPM5 -DOE_CORE=OE_CORE -DUSE_OWN_QSORT=1"
 
 EXTRA_OECMAKE += " -DLIB=${@os.path.basename('${libdir}')}"
 
+TUNE_CCARGS += "-DUSE_OWN_QSORT=1"
+
 inherit cmake pkgconfig
 
 RDEPENDS_${PN} = "rpm-libs"
-- 
1.7.5.4



