Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7379177016
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 13:17:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t98DH1se020868
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Oct 2015 06:17:02 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 8 Oct 2015 06:17:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 Oct 2015 06:16:57 -0700
Message-ID: <a7b8d1c512cc8b2cb98864f2fc124cb3336d809d.1444310101.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1444310101.git.liezhi.yang@windriver.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] package.bbclass: strip archive files
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
X-List-Received-Date: Thu, 08 Oct 2015 13:17:01 -0000
Content-Type: text/plain

For saving space and removing build path in .a files.

[YOCTO #8457]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package.bbclass |   18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 09230b5..583848f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -870,12 +870,25 @@ python split_and_strip_files () {
         return type
 
 
+    def isArchive(path):
+        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        if ret:
+            msg = "split_and_strip_files: 'file %s' failed" % path
+            package_qa_handle_error("split-strip", msg, d)
+            return False
+
+        if "current ar archive" in result:
+            return True
+        else:
+            return False
+
     #
     # First lets figure out all of the files we may have to process ... do this only once!
     #
     elffiles = {}
     symlinks = {}
     kernmods = []
+    archives = []
     inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir", True))
     baselibdir = os.path.abspath(dvar + os.sep + d.getVar("base_libdir", True))
@@ -886,6 +899,9 @@ python split_and_strip_files () {
                 if file.endswith(".ko") and file.find("/lib/modules/") != -1:
                     kernmods.append(file)
                     continue
+                if file.endswith('.a') and isArchive(file):
+                    archives.append(file)
+                    continue
 
                 # Skip debug files
                 if debugappend and file.endswith(debugappend):
@@ -1019,7 +1035,7 @@ python split_and_strip_files () {
             elf_file = int(elffiles[file])
             #bb.note("Strip %s" % file)
             sfiles.append((file, elf_file, strip))
-        for f in kernmods:
+        for f in kernmods + archives:
             sfiles.append((f, 16, strip))
 
         oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
-- 
1.7.9.5


