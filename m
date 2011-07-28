Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+pRgfu9zJkQGXO3MieYqRMmQG2vgOnQAo=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QmXXc-000475-Am
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 22:50:48 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6SKkXue028760
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 15:46:33 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2011 15:46:33 -0500
Message-Id: <1311885993-13462-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] bitbake.conf: Add PACKAGE_ARCHS to include TUNE_PKGARCH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2011 20:50:48 -0000

Recent changes to how TUNE_PKGARCH is composed means it might not be in
the PACKAGE_EXTRA_ARCHS_tune list.  Rather than having to update all
such lists we just add TUNE_PKGARCH to PACKAGE_ARCHS.

An example, for ppc603e TUNE_PKGARCH is now:

	powerpcppc603e

However, PACKAGE_EXTRA_ARCHS_tune-ppc603e = "powerpc ppc603e"

Thus we run into issues during things like rpm packagine since it will
not end up dealing the rpms created in a 'powerpcppc603e' directory.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9c80f11..d8b9f36 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -104,7 +104,7 @@ SDK_CC_ARCH = "${BUILD_CC_ARCH}"
 PACKAGE_ARCH = "${TUNE_PKGARCH}"
 MACHINE_ARCH = "${@[bb.data.getVar('TUNE_PKGARCH', d, 1), bb.data.getVar('MACHINE', d, 1)][bool(bb.data.getVar('MACHINE', d, 1))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
-PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
+PACKAGE_ARCHS = "all any noarch ${TUNE_PKGARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"
 # MACHINE_ARCH shouldn't be included here as a variable dependency
 # since machine specific packages are handled using multimachine
 PACKAGE_ARCHS[vardepsexclude] = "MACHINE_ARCH"
-- 
1.7.3.4



