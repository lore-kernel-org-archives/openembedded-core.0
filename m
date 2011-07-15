Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QhqXX-0006C0-MZ
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jul 2011 00:07:19 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6FM3CMh018958
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 17:03:13 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 15:03:06 -0700
Message-Id: <b17a0239a855501401b60cb43140f601e4a9b554.1310758615.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
In-Reply-To: <cover.1310758615.git.tom_rini@mentor.com>
References: <cover.1310758615.git.tom_rini@mentor.com>
Subject: [PATCH 2/5] bitbake.conf, sanity.bbclass: Make mercurial-native optional
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
X-List-Received-Date: Fri, 15 Jul 2011 22:07:20 -0000

Drop mercurial-native from the initial ASSUME_PROVIDED list and
instead only add it if we find 'hg' is installed.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/sanity.bbclass |    6 +++++-
 meta/conf/bitbake.conf      |    1 -
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index c9d37c9..2bc3fca 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -209,7 +209,7 @@ def check_sanity(e):
     if not check_app_exists('${BUILD_PREFIX}g++', e.data):
         missing = missing + "C++ Compiler (%sg++)," % data.getVar("BUILD_PREFIX", e.data, True)
 
-    required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk hg chrpath wget cpio"
+    required_utilities = "patch help2man diffstat texi2html makeinfo cvs svn bzip2 tar gzip gawk chrpath wget cpio"
 
     # qemu-native needs gcc 3.x
     if "qemu-native" not in assume_provided and "gcc3-native" in assume_provided:
@@ -243,6 +243,10 @@ def check_sanity(e):
         if not check_app_exists( util, e.data ):
             missing = missing + "%s," % util
 
+    # If we've found 'hg', add mercurial-native to ASSUME_PROVIDED.
+    if check_app_exists( "hg", e.data ):
+        bb.data.setVar('ASSUME_PROVIDED', data.getVar('ASSUME_PROVIDED', e.data , True) + "mercurial-native", e.data)
+
     if missing != "":
         missing = missing.rstrip(',')
         messages = messages + "Please install following missing utilities: %s\n" % missing
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 463991d..15fd97e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -132,7 +132,6 @@ ASSUME_PROVIDED = "\
     cvs-native \
     grep-native \
     diffstat-native \
-    mercurial-native \
     patch-native \
     perl-native-runtime \
     python-native-runtime \
-- 
1.7.0.4



