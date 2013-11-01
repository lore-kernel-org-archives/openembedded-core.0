Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD7DA6D58F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 09:24:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA19OxUC009033
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Nov 2013 02:25:00 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 1 Nov 2013 02:24:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Nov 2013 01:26:39 +0800
Message-ID: <d79dba30a0175bd4344ba595cfce74e465f9a148.1383326626.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1383326626.git.liezhi.yang@windriver.com>
References: <cover.1383326626.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sanity.bbclass: check that TMPDIR is not located on nfs
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
X-List-Received-Date: Fri, 01 Nov 2013 09:24:58 -0000
Content-Type: text/plain

There would be some unexpected errors when the whole TMPDIR is located
on nfs, so add a test for it in sanity.bbclass.

Note:
The better way to get the filesystem id should be get f_fsid from struct
statvfs, but there is no f_fsid in os.stat() or os.statvfs(), so we use
'stat -f -c "%t"' here.

[YOCTO #5442]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/sanity.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c4827f4..7517120 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -198,6 +198,21 @@ def check_path_length(filepath, pathname, limit):
         return "The length of %s is longer than 410, this would cause unexpected errors, please use a shorter path.\n" % pathname
     return ""
 
+def get_filesystem_id(path):
+    status, result = oe.utils.getstatusoutput("stat -f -c '%s' %s" % ("%t", path))
+    if status == 0:
+        return result
+    else:
+        bb.warn("Can't get the filesystem id of: %s" % path)
+        return None
+
+# Check that the path isn't located on nfs.
+def check_not_nfs(path, name):
+    # The nfs' filesystem id is 6969
+    if get_filesystem_id(path) == "6969":
+        return "The %s can't be located on nfs.\n" % name
+    return ""
+
 def check_connectivity(d):
     # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
     # using the same syntax as for SRC_URI. If the variable is not set
@@ -672,6 +687,9 @@ def check_sanity_everybuild(status, d):
     # The length of TMPDIR can't be longer than 410
     status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
 
+    # Check that TMPDIR isn't located on nfs
+    status.addresult(check_not_nfs(tmpdir, "TMPDIR"))
+
 def check_sanity(sanity_data):
     import subprocess
 
-- 
1.8.3.1


