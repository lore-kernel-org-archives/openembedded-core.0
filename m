Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB94D6AC56
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Apr 2015 18:41:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t32IftE0014668
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Apr 2015 11:41:55 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Apr 2015 11:41:55 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Apr 2015 11:41:54 -0700
Message-ID: <1428000114-2897-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] nss: generate debug info
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
X-List-Received-Date: Thu, 02 Apr 2015 18:41:54 -0000
Content-Type: text/plain

Because the build of nss seems to ignore CFLAGS, we never
have put source code in the -dbg package.  We do not address
the CFLAGS issue, but we do add -g to the definition of CC
so that we will generate debug info.

We also let package.bbclass populate the -dbg package instead
of forcing the contents locally.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/nss/nss.inc |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 4be3557..4082930 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -74,8 +74,12 @@ do_compile() {
         export USE_64=1
     fi
 
-    make -C ./nss CCC="${CXX}" \
-        OS_TEST=${OS_TEST} \
+    # We can modify CC in the environment, but if we set it via an
+    # argument to make, nsinstall, a host program, will also build with it!
+    #
+    export CC="${CC} -g"
+    make -C ./nss CCC="${CXX} -g" \
+        OS_TEST=${OS_TEST}
 }
 
 
@@ -204,9 +208,6 @@ FILES_${PN}-dev = "\
     ${libdir}/pkgconfig/* \
     ${includedir}/* \
     "
-FILES_${PN}-dbg = "\
-    ${bindir}/.debug/* \
-    ${libdir}/.debug/* \
-    "
+# FILES_${PN}-dbg is populated automatically
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.9.5


