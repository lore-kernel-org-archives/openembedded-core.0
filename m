Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1U1HRl-0004lc-3A
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Feb 2013 15:18:32 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r11E2fTP000226;
	Fri, 1 Feb 2013 06:02:43 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  1 Feb 2013 09:02:35 -0500
Message-Id: <b154e7daddf3121b2767651bc09a16abbbf80182.1359726620.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1359726620.git.bruce.ashfield@windriver.com>
References: <cover.1359726620.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] kernel-yocto: make configuration audit details debug only
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Feb 2013 14:18:55 -0000
X-List-Received-Date: Fri, 01 Feb 2013 14:18:55 -0000

The details of the kernel configuration audit are typically a
debug action, so should be moved to bb.debug(). But in order
to maintain visibility of the results, a reference to the log
file is provided in the standard message.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index aaee441..b336e43 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -207,7 +207,7 @@ do_kernel_configme() {
 python do_kernel_configcheck() {
     import re, string, sys, commands
 
-    bb.plain("NOTE: validating kernel configuration")
+    bb.plain("NOTE: validating kernel config, see log.do_kernel_configcheck for details")
 
     # if KMETA isn't set globally by a recipe using this routine, we need to
     # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
@@ -218,7 +218,11 @@ python do_kernel_configcheck() {
     cmd = d.expand("cd ${S}; kconf_check -config- %s/meta-series ${S} ${B}" % kmeta)
     ret, result = commands.getstatusoutput("%s%s" % (pathprefix, cmd))
 
-    bb.plain( "%s" % result )
+    config_check_visibility = d.getVar( "KCONF_AUDIT_LEVEL", True ) or 1
+    if config_check_visibility == 1:
+        bb.debug( 1, "%s" % result )
+    else:
+        bb.note( "%s" % result )
 }
 
 # Ensure that the branches (BSP and meta) are on the locations specified by
-- 
1.7.10.4



