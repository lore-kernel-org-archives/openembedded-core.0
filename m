Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5673176DEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:28:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G2SoLt002044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:28:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:28:49 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:28:47 -0700
Message-ID: <6f49ee1c3fac0a39d8976d7c74000ad507031516.1442370259.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442370259.git.liezhi.yang@windriver.com>
References: <cover.1442370259.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] insane.bbclass: fix package_qa_check_buildpaths
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
X-List-Received-Date: Wed, 16 Sep 2015 02:28:51 -0000
Content-Type: text/plain

* Ignore elf files because they usually contain build path:
  - The path of the source file such as .c, these are usually happen
    when separate B and S since we use absolute path to run configure
    script, and then VPATH in Makefile will be an absolute path and
    contains build path, we can use relative path in autotools.bbclass
    to fix the problem, but we don't have to since they are harmless.
  - The configure options such as "configure --with-libtool-sysroot"
  - The compile options such as "gcc --sysroot"
  These are harmless usually, so ignore elf files.

* Ignore "-dbg" and "-staticdev" package since symbols and .a files
  usually contain buildpath.

* Ignore .a files too since they contain buildpath, this mainly for
  ignoring:
  glibc-2.21: glibc-dev/usr/lib/libc_nonshared.a
  libgcc-4.9.3: libgcc-dev/usr/lib/x86_64-poky-linux/4.9.3/libgcc_eh.a
  gcc-runtime-4.9.3: libssp-dev/usr/lib/libssp_nonshared.a

* Use full path rather than package_qa_clean_path() when report issue,
  this makes it easier to find the file and fix the problem.

Then we will verify other warings and fix one be one.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/insane.bbclass |   12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 5c8629a..943ada8 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -571,8 +571,14 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     """
     Check for build paths inside target files and error if not found in the whitelist
     """
-    # Ignore .debug files, not interesting
-    if path.find(".debug") != -1:
+
+    # Ignore staticdev and debug files since symbols and .a usually
+    # contain buildpath.
+    if name.endswith("-dbg") or name.endswith("-staticdev"):
+        return
+
+    # Ignore elf and .a files
+    if elf or path.endswith('.a'):
         return
 
     # Ignore symlinks
@@ -583,7 +589,7 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     with open(path) as f:
         file_content = f.read()
         if tmpdir in file_content:
-            messages["buildpaths"] = "File %s in package contained reference to tmpdir" % package_qa_clean_path(path,d)
+            messages["buildpaths"] = "File %s in package contained reference to tmpdir" % path
 
 
 QAPATHTEST[xorg-driver-abi] = "package_qa_check_xorg_driver_abi"
-- 
1.7.9.5


