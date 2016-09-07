Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 3C01677735
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 09:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id D5E661EECBAA;
	Wed,  7 Sep 2016 11:09:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fmofZQUqoKPu; Wed,  7 Sep 2016 11:09:02 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id 62F321EECBA8;
	Wed,  7 Sep 2016 11:09:02 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2016 11:08:46 +0200
Message-Id: <72f7b2213a986efc2ee983cdd3922937f3dd24fc.1473239261.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
References: <cover.b47dcbad9b495b8e621528579e9ae39cd15d32e8.1473239261.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH v2 5/8] sanity: fix hardcoded references to gcc
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
X-List-Received-Date: Wed, 07 Sep 2016 09:09:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
---
 meta/classes/sanity.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 202b5db..f17e2d4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -459,19 +459,19 @@ def check_gcc_march(sanity_data):
 
         # Check if GCC could work without march
         if not result:
-            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_PREFIX}gcc gcc_test.c -o gcc_test"))
+            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_CC} gcc_test.c -o gcc_test"))
             if status == 0:
                 result = True;
 
         if not result:
-            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test"))
+            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_CC} -march=native gcc_test.c -o gcc_test"))
             if status == 0:
                 message = "BUILD_CFLAGS_append = \" -march=native\""
                 result = True;
 
         if not result:
             build_arch = sanity_data.getVar('BUILD_ARCH', True)
-            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_PREFIX}gcc -march=%s gcc_test.c -o gcc_test" % build_arch))
+            status,res = oe.utils.getstatusoutput(sanity_data.expand("${BUILD_CC} -march=%s gcc_test.c -o gcc_test" % build_arch))
             if status == 0:
                 message = "BUILD_CFLAGS_append = \" -march=%s\"" % build_arch
                 result = True;
@@ -673,11 +673,11 @@ def check_sanity_version_change(status, d):
     if not check_app_exists("${MAKE}", d):
         missing = missing + "GNU make,"
 
-    if not check_app_exists('${BUILD_PREFIX}gcc', d):
-        missing = missing + "C Compiler (%sgcc)," % d.getVar("BUILD_PREFIX", True)
+    if not check_app_exists('${BUILD_CC}', d):
+        missing = missing + "C Compiler (%s)," % d.getVar("BUILD_CC", True)
 
-    if not check_app_exists('${BUILD_PREFIX}g++', d):
-        missing = missing + "C++ Compiler (%sg++)," % d.getVar("BUILD_PREFIX", True)
+    if not check_app_exists('${BUILD_CXX}', d):
+        missing = missing + "C++ Compiler (%s)," % d.getVar("BUILD_CXX", True)
 
     required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES', True)
 
-- 
git-series 0.8.9

