Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7F7A66028A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 16:56:43 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1X0Cya-0003bk-NI from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jun 2014 09:56:44 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 26 Jun 2014 09:56:44 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-02.mgc.mentorg.com (147.34.96.168) with Microsoft SMTP
	Server id 14.2.247.3; Thu, 26 Jun 2014 09:56:09 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jun 2014 12:56:42 -0400
Message-ID: <1403801802-15101-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Jun 2014 16:56:44.0353 (UTC)
	FILETIME=[9C144B10:01CF915F]
Subject: [PATCH] classes/kernel: Use full path for symlink in update-alternatives.
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
X-List-Received-Date: Thu, 26 Jun 2014 16:56:57 -0000
Content-Type: text/plain

Use a fully qualified path for the <path> parameter in calls
to update-alternatives.  The chkconfig-alternatives version
requires a full path and without it, the symlink is not
properly created.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6ed1cb7..f5d7258 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -374,7 +374,7 @@ pkg_postinst_kernel-base () {
 }
 
 pkg_postinst_kernel-image () {
-	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
+	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 }
 
 pkg_postrm_kernel-image () {
-- 
1.9.1


