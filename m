Received: from good-out-31.clustermail.de (good-out-31.clustermail.de [212.223.166.9])
 by mx.groups.io with SMTP id smtpd.web12.13368.1593517193381739114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 04:39:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gin.de, ip: 212.223.166.9, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.15] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92.3)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1jqEc6-0006LI-48; Tue, 30 Jun 2020 13:39:51 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.92.3)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1jqEc6-0004tp-2U; Tue, 30 Jun 2020 13:39:46 +0200
Received: from daniel-desktop.fritz.box (10.176.8.42) by
 Win2012-02.gin-domain.local (10.160.128.12) with Microsoft SMTP Server (TLS)
 id 15.0.1395.4; Tue, 30 Jun 2020 13:39:45 +0200
From: "Daniel Klauer" <daniel.klauer@gin.de>
To: <openembedded-core@lists.openembedded.org>
CC: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] deploy.bbclass: Clean DEPLOYDIR before do_deploy
Date: Tue, 30 Jun 2020 13:38:54 +0200
Message-ID: <20200630113854.19611-2-daniel.klauer@gin.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200630113854.19611-1-daniel.klauer@gin.de>
References: <20200630113854.19611-1-daniel.klauer@gin.de>
MIME-Version: 1.0
X-Originating-IP: [10.176.8.42]
X-ClientProxiedBy: Win2012-02.gin-domain.local (10.160.128.12) To
 Win2012-02.gin-domain.local (10.160.128.12)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

do_deploy should clean up ${DEPLOYDIR} before running, just like do_install
cleans up ${D} before running. This reduces the risk of DEPLOYDIR being
accidentally contaminated by files from previous runs, possibly even with
different config, in case of incremental builds.

It is convenient to have this in deploy.bbclass, so it doesn't have to be
duplicated in every recipe, considering for example meta-freescale, which
has 23 affected recipes.

All recipes using deploy.bbclass (grep -r 'inherit .*deploy') in poky,
meta-openembedded and meta-freescale look like they either benefit from
this or are at least not affected negatively by it. The only exception
I've noticed was uboot-sign.bbclass, which was however fixed by the
previous patch.

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
index a1219f3156..301e3b86b2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -729,8 +729,6 @@ kernel_do_deploy() {
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
index 7292ebbb77..84547630e8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -220,7 +220,6 @@ do_deploy[depends] += "${DEPLOYDEP}"
 
 do_deploy() {
 }
-do_deploy[cleandirs] = "${DEPLOYDIR}"
 do_deploy_class-target() {
     # For use with "runqemu ovmf".
     for i in \
-- 
2.20.1

