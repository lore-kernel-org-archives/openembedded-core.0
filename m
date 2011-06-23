Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QZj4l-0007Y9-0c
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 14:32:07 +0200
Received: by rex (Postfix, from userid 1000)
	id BAB8220D88; Thu, 23 Jun 2011 13:27:48 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jun 2011 13:27:27 +0100
Message-Id: <4a9f1c5f4aa04565439bcdfa522a287340f0ec24.1308831847.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
References: <cover.1308831847.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/4] base.bbclass: Since we require python 2.6 which always contains hashlib we can drop this fallback code
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
X-List-Received-Date: Thu, 23 Jun 2011 12:32:07 -0000

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 4681489..f390f08 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -326,16 +326,6 @@ python () {
         depends = depends + " osc-native:do_populate_sysroot"
         bb.data.setVarFlag('do_fetch', 'depends', depends, d)
 
-    # bb.utils.sha256_file() will fail if hashlib isn't present, so we fallback
-    # on shasum-native.  We need to ensure that it is staged before we fetch.
-    if bb.data.getVar('PN', d, True) != "shasum-native":
-        try:
-            import hashlib
-        except ImportError:
-            depends = bb.data.getVarFlag('do_fetch', 'depends', d) or ""
-            depends = depends + " shasum-native:do_populate_sysroot"
-            bb.data.setVarFlag('do_fetch', 'depends', depends, d)
-
     # *.xz should depends on xz-native for unpacking
     # Not endswith because of "*.patch.xz;patch=1". Need bb.decodeurl in future
     if '.xz' in srcuri:
-- 
1.7.4.1



