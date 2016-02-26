Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 358C877353
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 01:45:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1Q1j8Nq016728
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Feb 2016 17:45:08 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 25 Feb 2016 17:45:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <alejandro.hernandez@linux.intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 25 Feb 2016 20:44:54 -0500
Message-ID: <91b6f37e1908f6222c590b68c53ccc70e041e08e.1456449257.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1456449257.git.hongxu.jia@windriver.com>
References: <cover.1456449257.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/15] insane:add buildpaths QA ignore pattern
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
X-List-Received-Date: Fri, 26 Feb 2016 01:45:09 -0000
Content-Type: text/plain

Add variable QA_BUILDPATHS_SKIP_PATTERN to ignore buildpaths QA
while filename (do not include directory) matches patterns,
the patterns are Unix shell style and separated by space.

[YOCTO #9169]
[YOCTO #7058]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/insane.bbclass | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 61936e1..57a3e42 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -592,11 +592,16 @@ def package_qa_hash_style(path, name, d, elf, messages):
         package_qa_add_message(messages, "ldflags", "No GNU_HASH in the elf binary: '%s'" % path)
 
 
+# Ignore buildpaths QA while filename (do not include directory)
+# matches patterns, patterns are Unix shell style and separated by space
+QA_BUILDPATHS_SKIP_PATTERN ??= "Makefile"
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
 def package_qa_check_buildpaths(path, name, d, elf, messages):
     """
     Check for build paths inside target files and error if not found in the whitelist
     """
+    from fnmatch import fnmatch
+
     # Ignore .debug files, not interesting
     if path.find(".debug") != -1:
         return
@@ -609,6 +614,14 @@ def package_qa_check_buildpaths(path, name, d, elf, messages):
     if path.find(name + "/CONTROL/") != -1 or path.find(name + "/DEBIAN/") != -1:
         return
 
+    # Ignore matched pattern file
+    ignores = d.getVar('QA_BUILDPATHS_SKIP_PATTERN', True).split()
+    file = os.path.basename(path)
+    for ignore in ignores:
+        if fnmatch(file, ignore):
+            bb.note("Package %s skipping buildpaths QA: %s" % (name, path))
+            return
+
     tmpdir = d.getVar('TMPDIR', True)
     with open(path) as f:
         file_content = f.read()
-- 
1.9.1


