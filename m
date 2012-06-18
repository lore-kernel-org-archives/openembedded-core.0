Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SgiFn-0008Qu-Qq
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 22:08:52 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 6523D30468
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2012 15:58:06 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2012 12:57:57 -0700
Message-Id: <8e362de541f2827cb615e86b850353d929d33d24.1340038108.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340038108.git.scott.a.garman@intel.com>
References: <cover.1340038108.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 6523D30468.86291
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/6] sanity.bbclass: warn the user if BBPATH contains wrong entries
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
X-List-Received-Date: Mon, 18 Jun 2012 20:08:52 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

If BBPATH references the working directory, the user is warned and asked
to fix the problem.

[Yocto #1465]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Reworked commit to fix merge conflicts with denzil branch.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/sanity.bbclass |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9755694..298372b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -310,7 +310,18 @@ def check_sanity(sanity_data):
     if "." in data.getVar('PATH', sanity_data, True).split(":"):
         messages = messages + "PATH contains '.' which will break the build, please remove this"
 
-    if data.getVar('TARGET_ARCH', sanity_data, True) == "arm":
+    bbpaths = sanity_data.getVar('BBPATH', True).split(":")
+    if "." in bbpaths or "" in bbpaths:
+        # TODO: change the following message to fatal when all BBPATH issues
+        # are fixed
+        bb.warn("BBPATH references the current directory, either through "    \
+                "an empty entry, or a '.'.\n\t This is unsafe and means your "\
+                "layer configuration is adding empty elements to BBPATH.\n\t "\
+                "Please check your layer.conf files and other BBPATH "        \
+                "settings to remove the current working directory "           \
+                "references.");
+
+    if sanity_data.getVar('TARGET_ARCH', True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
             if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-- 
1.7.9.5



