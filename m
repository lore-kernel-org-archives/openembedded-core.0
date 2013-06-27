Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5DB6A5DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 13:57:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5RDvlKB009085
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 06:57:47 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 27 Jun 2013 06:57:46 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Jun 2013 09:08:33 -0500
Message-ID: <1372342113-32763-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/3 v2] sanity.bbclass: Check for the known broken version of make
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
X-List-Received-Date: Thu, 27 Jun 2013 13:57:46 -0000
Content-Type: text/plain

See GNU Savannah bug 30612 -- make 3.82 is known to be broken.

A number of vendors are providing a modified version, so checking
for just the version string is not enough.  We also need to check
if the patch for the issue has been applied.  We use a modified
version of the reproduced to check for the issue.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/sanity.bbclass | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index e21cb6b..f2ed91e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -306,6 +306,42 @@ def check_gcc_march(sanity_data):
 
     return result
 
+# Unpatched versions of make 3.82 are known to be broken.  See GNU Savannah Bug 30612.
+# Use a modified reproducer from http://savannah.gnu.org/bugs/?30612 to validate.
+def check_make_version(sanity_data):
+    from distutils.version import LooseVersion
+    status, result = oe.utils.getstatusoutput("make --version")
+    if status != 0:
+        return "Unable to execute make --version, exit code %s\n" % status
+    version = result.split()[2]
+    if LooseVersion(version) == LooseVersion("3.82"):
+        # Construct a test file
+        f = open("makefile_test", "w")
+        f.write("makefile_test.a: makefile_test_a.c makefile_test_b.c makefile_test.a( makefile_test_a.c makefile_test_b.c)\n")
+        f.write("\n")
+        f.write("makefile_test_a.c:\n")
+        f.write("	touch $@\n")
+        f.write("\n")
+        f.write("makefile_test_b.c:\n")
+        f.write("	touch $@\n")
+        f.close()
+
+        # Check if make 3.82 has been patched
+        status,result = oe.utils.getstatusoutput("make -f makefile_test")
+
+        os.remove("makefile_test")
+        if os.path.exists("makefile_test_a.c"):
+            os.remove("makefile_test_a.c")
+        if os.path.exists("makefile_test_b.c"):
+            os.remove("makefile_test_b.c")
+        if os.path.exists("makefile_test.a"):
+            os.remove("makefile_test.a")
+
+        if status != 0:
+            return "Your version of make 3.82 is broken. Please revert to 3.81 or install a patched version.\n"
+    return None
+
+
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
 def check_tar_version(sanity_data):
@@ -436,6 +472,7 @@ def check_sanity_version_change(status, d):
     except ImportError:
         status.addresult('Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n')
 
+    status.addresult(check_make_version(d))
     status.addresult(check_tar_version(d))
     status.addresult(check_git_version(d))
 
-- 
1.8.3.1


