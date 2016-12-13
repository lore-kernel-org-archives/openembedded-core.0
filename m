Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1096671B23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:10:09 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:10:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885821"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:10:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:37 +1300
Message-Id: <6a078a788f4b62c468b155d946e7494cd5a4bc40.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1481612135.git.paul.eggleton@linux.intel.com>
References: <cover.1481612135.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/14] classes/base: fix license file checksumming when source not under TMPDIR
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
X-List-Received-Date: Tue, 13 Dec 2016 07:10:09 -0000

With the changes to the code for extracting source for a recipe, we are
properly executing the tasks for a recipe, which means their stamps (and
therefore signatures) are important. When running devtool extract on
the lsof recipe I noticed that do_fetch and do_unpack were executing a
second time when we called for do_patch, and this turned out to be
because LIC_FILES_CHKSUM in that recipe contains an entry which
is an absolute path (has ${S} at the start). Normally this wouldn't be
an issue since S is under TMPDIR and thus the existing code would ignore
it, however devtool's extraction code extracts to a temporary directory
which is not under TMPDIR; the result was the path to this file was not
being ignored and the second time around when the license file had been
extracted it was incorporated into the signature. We don't want this, so
explicitly exclude S as well as B and WORKDIR for good measure.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/base.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 024fe43..19673e6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -98,6 +98,9 @@ def get_lic_checksum_file_list(d):
     filelist = []
     lic_files = d.getVar("LIC_FILES_CHKSUM", True) or ''
     tmpdir = d.getVar("TMPDIR", True)
+    s = d.getVar("S", True)
+    b = d.getVar("B", True)
+    workdir = d.getVar("WORKDIR", True)
 
     urls = lic_files.split()
     for url in urls:
@@ -109,7 +112,7 @@ def get_lic_checksum_file_list(d):
                 raise bb.fetch.MalformedUrl(url)
 
             if path[0] == '/':
-                if path.startswith(tmpdir):
+                if path.startswith((tmpdir, s, b, workdir)):
                     continue
                 filelist.append(path + ":" + str(os.path.exists(path)))
         except bb.fetch.MalformedUrl:
-- 
2.5.5


