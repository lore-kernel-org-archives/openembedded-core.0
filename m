Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 11767778D6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 14:16:09 +0000 (UTC)
From: Jack Mitchell <ml@embed.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 14:16:02 +0000
Message-Id: <20170311141603.18357-1-ml@embed.me.uk>
X-Mailer: git-send-email 2.12.0
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: [PATCH 1/2] u-boot: fix extlinux creation race
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
X-List-Received-Date: Sat, 11 Mar 2017 14:16:12 -0000

From: Jack Mitchell <jack@embed.me.uk>

There was a race condition in the uboot-extlinux bbclass where
only a half written extlinux.conf would be put in the deploy
directory. Fix this by adding the deploy task after the do_install
rather than after the do_compile.

Signed-off-by: Jack Mitchell <jack@embed.me.uk>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index c2bcf99840..aa21c0e556 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -304,4 +304,4 @@ do_deploy () {
     fi
 }
 
-addtask deploy before do_build after do_compile
+addtask deploy before do_build after do_install
-- 
2.12.0


