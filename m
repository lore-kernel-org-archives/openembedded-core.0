Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web11.62.1588026812904752205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 15:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id 23FDD20B4737
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2020 15:33:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 23FDD20B4737
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] baremetal-helloworld: Fix IMGDEPLOYDIR expansion
Date: Mon, 27 Apr 2020 15:33:28 -0700
Message-Id: <20200427223328.38984-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

IMGDEPLOYDIR is not being expanded anymore, this causes
do_rootfs to fail because it can't create the manifest file,
we can set it to the default being set on image.bbclass since
this is only a decoy function anyway to satisfy testimage,
this makes do_rootfs happy and allows it to continue.

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
---
 .../baremetal-examples/baremetal-helloworld_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
index d8633702fc..e84a90f28c 100644
--- a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
+++ b/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
@@ -37,6 +37,7 @@ do_install(){
 # Borrowed from meta-freertos
 inherit rootfs-postcommands
 inherit deploy
+IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
 do_deploy[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
 do_rootfs[dirs] = "${DEPLOYDIR} ${DEPLOY_DIR_IMAGE}"
 DEPLOYDIR = "${IMGDEPLOYDIR}"
-- 
2.17.1

