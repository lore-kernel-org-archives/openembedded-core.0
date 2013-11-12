Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6FE6D598
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:34:02 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id CCDA140181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:05:21 +0100 (CET)
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 09:33:56 +0100
Message-Id: <1384245243-20247-3-git-send-email-tobias.henkel@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
References: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
Subject: [PATCH 2/9] icecc: Remove output on stderr when calling which
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
X-List-Received-Date: Tue, 12 Nov 2013 08:34:03 -0000

From: Tobias Henkel <tobias.henkel@bmw-carit.de>

The icecc class often uses 'which' for determining paths. This leads
to many messages on stderr in case 'which' doesn't find the
executable. Redirecting stderr to /dev/null inhibits these messages as
the result is handled correctly anyway.

Signed-off-by: Tobias Henkel <tobias.henkel@bmw-carit.de>
---
 meta/classes/icecc.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 71c556f..c4088af 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -48,7 +48,7 @@ def get_cross_kernel_cc(bb,d):
     return kernel_cc
 
 def get_icecc(d):
-    return d.getVar('ICECC_PATH') or os.popen("which icecc").read()[:-1]
+    return d.getVar('ICECC_PATH') or os.popen("which icecc 2> /dev/null").read()[:-1]
 
 def create_path(compilers, bb, d):
     """
@@ -161,9 +161,9 @@ def icc_get_external_tool(bb, d, tool):
 
 def icc_get_tool(bb, d, tool):
     if icc_is_native(bb, d):
-        return os.popen("which %s" % tool).read()[:-1]
+        return os.popen("which %s 2> /dev/null" % tool).read()[:-1]
     elif icc_is_kernel(bb, d):
-        return os.popen("which %s" % get_cross_kernel_cc(bb, d)).read()[:-1]
+        return os.popen("which %s 2> /dev/null" % get_cross_kernel_cc(bb, d)).read()[:-1]
     else:
         ice_dir = d.expand('${STAGING_BINDIR_TOOLCHAIN}')
         target_sys = d.expand('${TARGET_SYS}')
-- 
1.8.3.1


