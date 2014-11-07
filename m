Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 6618065D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 23:25:13 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NEO003WSWXV4FI0@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 07 Nov 2014 16:25:08 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LdSLMYbn c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8
	a=FH3FK6_BR53TtrhpQn4A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4E4882008C;	Fri,
	7 Nov 2014 17:25:07 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 07 Nov 2014 17:24:49 -0500
Message-id: <1415399089-27578-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.1.2
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [RFC][PATCH] u-boot-mkimage: allow building target version of the tool
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
X-List-Received-Date: Fri, 07 Nov 2014 23:25:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

u-boot doesn't really support building its tools for the target, as they are
built with HOSTCC compiler, which is also used to compile fixdep utility
that gets executed during the build. Since it might be beneficial to have a
target version of mkimage, let's hack it to build fixdep in a separate step.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
index 7c05215..eabf680 100644
--- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2014.07.bb
@@ -20,6 +20,8 @@ do_compile () {
 	# Make sure the recompile is OK
 	rm -f ${B}/tools/.depend
 
+	make HOSTCC="${BUILD_CC}" HOSTLD="${BUILD_LD}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTSTRIP=true dot-config=0 scripts_basic
+	sed 's/^tools-only: scripts_basic /tools-only: /' -i Makefile
 	oe_runmake tools-only
 }
 
-- 
2.1.2


