Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7HIx-0003QZ-SL
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 03:17:39 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 45B0330513
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 22:08:52 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 19:08:45 -0700
Message-Id: <bf65cecf177efa0cb06508aa95e63e4d3a65dcb1.1331604310.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
References: <cover.1331604310.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
References: <cover.1331604310.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 45B0330513.0ED75
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/3] path.py: add make_relative_symlink method
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
X-List-Received-Date: Tue, 13 Mar 2012 02:17:40 -0000

This method allows you to convert an absolute symlink into a
relative one.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/lib/oe/path.py |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py
index 683b097..1fdfa87 100644
--- a/meta/lib/oe/path.py
+++ b/meta/lib/oe/path.py
@@ -40,6 +40,33 @@ def relative(src, dest):
 
         return os.path.sep.join(relpath)
 
+def make_relative_symlink(path):
+    """ Convert an absolute symlink to a relative one """
+    if not os.path.islink(path):
+        return
+    link = os.readlink(path)
+    if not os.path.isabs(link):
+        return
+
+    # find the common ancestor directory
+    ancestor = path
+    depth = 0
+    while ancestor and not link.startswith(ancestor):
+        ancestor = ancestor.rpartition('/')[0]
+        depth += 1
+
+    if not ancestor:
+        print "make_relative_symlink() Error: unable to find the common ancestor of %s and its target" % path
+        return
+
+    base = link.partition(ancestor)[2].strip('/')
+    while depth > 1:
+        base = "../" + base
+        depth -= 1
+
+    os.remove(path)
+    os.symlink(base, path)
+
 def format_display(path, metadata):
     """ Prepare a path for display to the user. """
     rel = relative(metadata.getVar("TOPDIR", True), path)
-- 
1.7.5.4



