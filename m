Return-Path: <openembedded@mindchasers.com>
X-Greylist: delayed 1447 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 Jan 2015 18:28:44 UTC
Received: from smtp.webfaction.com (mail6.webfaction.com [74.55.86.74])
	by mail.openembedded.org (Postfix) with ESMTP id 0228165CF5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 18:28:44 +0000 (UTC)
Received: from localhost.localdomain (c-73-194-208-34.hsd1.nj.comcast.net
	[73.194.208.34])
	by smtp.webfaction.com (Postfix) with ESMTP id 98A4520790A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jan 2015 18:04:37 +0000 (UTC)
From: Bob Cochran <openembedded@mindchasers.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jan 2015 13:04:33 -0500
Message-Id: <1420826673-9471-1-git-send-email-openembedded@mindchasers.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] kernel.bbclass: change oldnoconfig to olddefconfig
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
X-List-Received-Date: Fri, 09 Jan 2015 18:28:52 -0000

KERNEL_CONFIG_COMMAND is defined as passing oldnoconfig to
oe_runmake_call, but oldnoconfig is both an alias to olddefconfig and a
misleading name.  Therefore, change it to the meaningfully named
option: olddefconfig.

For further background, please see commit fb16d8912db5268f29706010ecafff74b971c58d  in
Linux kernel source tree:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=fb16d8912db5268f29706010ecafff74b971c58d

Signed-off-by: Bob Cochran <openembedded@mindchasers.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 88356b1..aebbc65 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -275,7 +275,7 @@ python sysroot_stage_all () {
     oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"), d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
 }
 
-KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} oldnoconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
+KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} O=${B} olddefconfig || yes '' | oe_runmake -C ${S} O=${B} oldconfig"
 
 kernel_do_configure() {
 	# fixes extra + in /lib/modules/2.6.37+
-- 
1.7.9.5


