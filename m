Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9BDB7E7BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 02:26:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x642QNpa010284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jul 2019 19:26:23 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 3 Jul 2019 19:26:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2019 10:38:37 +0800
Message-ID: <2ee53694e2727911d67896d55305110919f189d3.1562207791.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562207791.git.Qi.Chen@windriver.com>
References: <cover.1562207791.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub-efi.bbclass: take into consideration of multilib
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
X-List-Received-Date: Thu, 04 Jul 2019 02:26:22 -0000
Content-Type: text/plain

When enabling multilib and building lib32-IMAGE which
uses grub-efi, the build fails with the following error.

  install: cannot stat '/PROJ_DIR/build/tmp-glibc/deploy/images/intel-x86-64/grub-efi-bootia32.efi': No such file or directory

The grub-efi is in NON_MULTILIB_SCRIPTS. That means we
will use 64bit grub-efi for lib32-IMAGE.

So take into consideration of multilib to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/grub-efi.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 90badc0..ec692f1 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -9,9 +9,16 @@ efi_populate() {
 
 	GRUB_IMAGE="grub-efi-bootia32.efi"
 	DEST_IMAGE="bootia32.efi"
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		GRUB_IMAGE="grub-efi-bootx64.efi"
-		DEST_IMAGE="bootx64.efi"
+	if [ -n "${MLPREFIX}" ]; then
+		if [ "${TARGET_ARCH_MULTILIB_ORIGINAL}" = "x86_64" ]; then
+			GRUB_IMAGE="grub-efi-bootx64.efi"
+			DEST_IMAGE="bootx64.efi"
+		fi
+	else
+		if [ "${TARGET_ARCH}" = "x86_64" ]; then
+			GRUB_IMAGE="grub-efi-bootx64.efi"
+			DEST_IMAGE="bootx64.efi"
+		fi
 	fi
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}/${DEST_IMAGE}
 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-- 
1.9.1


