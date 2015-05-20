Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [217.30.184.167])
	by mail.openembedded.org (Postfix) with ESMTP id 750D9601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 06:45:30 +0000 (UTC)
Received: from lakka.kapsi.fi ([2001:1bc8:1004::1] ident=Debian-exim)
	by mail.kapsi.fi with esmtps (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <mcfrisk@kapsi.fi>)
	id 1Yuxkx-0000wJ-CZ; Wed, 20 May 2015 09:45:31 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.80)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1Yuxkx-0002Rw-6d; Wed, 20 May 2015 09:45:31 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 09:45:29 +0300
Message-Id: <1432104329-6352-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 1.7.10.4
X-SA-Exim-Connect-IP: 2001:1bc8:1004::1
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] buildhistory: set commit user name and email for the new git repo
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
X-List-Received-Date: Wed, 20 May 2015 06:45:30 -0000

git commit needs a user name and email even if --author is set. In most
cases users have ~/.gitconfig but in some cases the build user account
does not have these set which breaks the build.

Change-Id: Idd35df626332756ba5bd61d9273c76c7e63ed3f9
Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/classes/buildhistory.bbclass | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 211dcf1..dbd27b0 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -14,7 +14,9 @@ BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}
 BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}/${IMAGE_BASENAME}"
 BUILDHISTORY_IMAGE_FILES ?= "/etc/passwd /etc/group"
 BUILDHISTORY_COMMIT ?= "0"
-BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
+BUILDHISTORY_COMMIT_USER_NAME ?= "buildhistory"
+BUILDHISTORY_COMMIT_USER_EMAIL ?= "<buildhistory@${DISTRO}>"
+BUILDHISTORY_COMMIT_AUTHOR ?= "${BUILDHISTORY_COMMIT_USER_NAME} ${BUILDHISTORY_COMMIT_USER_EMAIL}"
 BUILDHISTORY_PUSH_REPO ?= ""
 
 SSTATEPOSTINSTFUNCS_append = " buildhistory_emit_pkghistory"
@@ -586,6 +588,11 @@ END
 		HOSTNAME=`hostname 2>/dev/null || echo unknown`
 		CMDLINE="${@buildhistory_get_cmdline(d)}"
 		if [ "$repostatus" != "" ] ; then
+			# git commit needs this setup, done every time before
+			# commit to support name and email changes via
+			# bitbake configuration
+			git config user.name "${BUILDHISTORY_COMMIT_USER_NAME}"
+			git config user.email "${BUILDHISTORY_COMMIT_USER_EMAIL}"
 			git add -A .
 			# porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
-- 
2.1.4


