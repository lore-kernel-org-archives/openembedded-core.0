Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R7BnQ-0006S1-NS
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 21:52:28 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so4179714bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=l281RvGqnH2iFUnVNBLrXYAERR/jQkRNRoUMoaJsFzE=;
	b=x4qngDWRNXcAqGlOqLPpznY7iUPMlm1L3FSdf8WKsJUG1/toH+ZUTbEWpb0PtHvRfz
	wJ37vsym8N8TFncePKr66ii1eXbRiwTBrBekx6TZDUtH3/Th3BtF8fwZR8682f82YbAE
	qevV27hYhUEM0zKKgq0yE9EHgrkO29LKEk2IE=
Received: by 10.204.148.72 with SMTP id o8mr2958077bkv.65.1316807225729;
	Fri, 23 Sep 2011 12:47:05 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id ex8sm5500310bkc.2.2011.09.23.12.47.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Sep 2011 12:47:04 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2011 23:46:39 +0400
Message-Id: <1316807201-22623-8-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
References: <1316807201-22623-1-git-send-email-dbaryshkov@gmail.com>
Cc: lumag <dbaryshkov@gmail.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 08/10] gcc: include libgcov.a into libgcc-dev package
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
X-List-Received-Date: Fri, 23 Sep 2011 19:52:29 -0000

From: lumag <dbaryshkov@gmail.com>

First, this lib is usefull for coverage analysis-enabled building.
Second, this fixes the warning about unpackaged files in libgcc recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc   |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc     |    2 +-
 meta/recipes-devtools/gcc/libgcc_4.5.1.bb |    1 +
 meta/recipes-devtools/gcc/libgcc_4.6.bb   |    1 +
 4 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index 6a9a7a6..839529e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r11"
+PR = "r12"
 
 DEPENDS =+ "mpfr gmp libmpc elfutils"
 NATIVEDEPS = "mpfr-native gmp-native gettext-native libmpc-native elfutils-native"
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 5d83e90..b7b6a43 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r12"
+PR = "r13"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
index 09e3c1e..500dda9 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.5.1.bb
@@ -12,6 +12,7 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 
 do_configure[noexec] = "1"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 63a46ec..6ba0339 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -12,6 +12,7 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 
 do_configure[noexec] = "1"
-- 
1.7.2.5



