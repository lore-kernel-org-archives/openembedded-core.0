Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 98FB27328A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 07:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 4313D1EE081A;
	Tue, 23 Aug 2016 09:25:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id kWLDOyjVXeZp; Tue, 23 Aug 2016 09:25:42 +0200 (CEST)
Received: from pcrosen.daviel.openwide.fr (unknown [193.56.60.161])
	by idris.smile.fr (Postfix) with ESMTPA id C15491EE04C7;
	Tue, 23 Aug 2016 09:25:41 +0200 (CEST)
From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2016 09:25:28 +0200
Message-Id: <9492b5e7b4b350b21762201a11f189e35c0cfb04.1471936926.git-series.jeremy.rosen@smile.fr>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
MIME-Version: 1.0
In-Reply-To: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
Subject: [PATCH 7/8] [sanity] fix hardcoded references to gcc
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
X-List-Received-Date: Tue, 23 Aug 2016 07:25:41 -0000
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

