Return-Path: <Daniel.Klauer@gin.de>
X-Greylist: delayed 978 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 Aug 2019 11:58:31 UTC
Received: from good-out-35.clustermail.de (good-out-35.clustermail.de
	[212.223.166.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF4A7DD6A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 11:58:31 +0000 (UTC)
Received: from [10.0.0.8] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i2wL2-0007aq-4A
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Aug 2019 13:42:13 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
	(envelope-from <Daniel.Klauer@gin.de>) id 1i2wL2-0005DN-1t
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Aug 2019 13:42:08 +0200
Received: from daniel-desktop.gin-domain.local (10.160.138.39) by
	Win2012-02.gin-domain.local (192.168.1.12) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Wed, 28 Aug 2019 13:42:07 +0200
From: Daniel Klauer <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2019 13:41:31 +0200
Message-ID: <20190828114131.10340-2-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828114131.10340-1-daniel.klauer@gin.de>
References: <20190828114131.10340-1-daniel.klauer@gin.de>
MIME-Version: 1.0
X-Originating-IP: [10.160.138.39]
X-ClientProxiedBy: Win2012-02.gin-domain.local (192.168.1.12) To
	Win2012-02.gin-domain.local (192.168.1.12)
Subject: [PATCH 2/2] deploy.bbclass: Clean DEPLOYDIR before do_deploy
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
X-List-Received-Date: Wed, 28 Aug 2019 11:58:31 -0000
Content-Type: text/plain

It seems convenient for do_deploy to clean up ${DEPLOYDIR} (its output
directory) before running, just like do_install cleans up ${D} before
running. This way we can be sure that a recipe's do_deploy output is not
accidentally contaminated by previously existing files in DEPLOYDIR in
case of incremental builds.

All recipes using deploy.bbclass (grep -r 'inherit .*deploy') in poky,
meta-openembedded and meta-freescale look to me like they either benefit
from this or are at least not affected negatively by it. The only exception
I've noticed was uboot-sign.bbclass, which was however fixed by the
previous patch.

I tested this by running "bitbake virtual/kernel u-boot":
1. on patched, but clean poky source tree
2. after adding "touch ${DEPLOYDIR}/foo-${PN}" to linux-yocto's/u-boot's
   do_deploy, to manually trigger an incremental build of do_deploy only.
3. after removing the modifications again.
The foo-${PN} files existed in tmp/deploy/images/qemux86-64 after step 2,
and not anymore after step 3, as expected. Thus the cleandirs still works.

Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
---
 meta/classes/deploy.bbclass            | 1 +
 meta/classes/kernel.bbclass            | 2 --
 meta/recipes-core/meta/signing-keys.bb | 2 --
 meta/recipes-core/ovmf/ovmf_git.bb     | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/classes/deploy.bbclass b/meta/classes/deploy.bbclass
index 6d52908783..737c26122b 100644
--- a/meta/classes/deploy.bbclass
+++ b/meta/classes/deploy.bbclass
@@ -8,4 +8,5 @@ python do_deploy_setscene () {
 }
 addtask do_deploy_setscene
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
+do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index bf3674238f..aa339ace7e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -706,8 +706,6 @@ kernel_do_deploy() {
 		done
 	fi
 }
-do_deploy[cleandirs] = "${DEPLOYDIR}"
-do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"
 
 addtask deploy after do_populate_sysroot do_packagedata
diff --git a/meta/recipes-core/meta/signing-keys.bb b/meta/recipes-core/meta/signing-keys.bb
index 1e1c7e3459..5bab94aa36 100644
--- a/meta/recipes-core/meta/signing-keys.bb
+++ b/meta/recipes-core/meta/signing-keys.bb
@@ -67,8 +67,6 @@ do_deploy () {
     fi
 }
 do_deploy[sstate-outputdirs] = "${DEPLOY_DIR_RPM}"
-# cleandirs should possibly be in deploy.bbclass but we need it
-do_deploy[cleandirs] = "${DEPLOYDIR}"
 # clear stamp-extra-info since MACHINE_ARCH is normally put there by
 # deploy.bbclass
 do_deploy[stamp-extra-info] = ""
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index b569b593fc..2c804381ee 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -223,7 +223,6 @@ do_deploy[depends] += "${DEPLOYDEP}"
 
 do_deploy() {
 }
-do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy_class-target() {
     # For use with "runqemu ovmf".
     for i in \
-- 
2.17.1


