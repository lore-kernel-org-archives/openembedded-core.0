Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC25E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 07:46:55 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.76637.1734421605337138101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 23:46:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tNSHz-0008Fu-Sa; Tue, 17 Dec 2024 08:46:43 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tNSHy-003pNe-1M;
	Tue, 17 Dec 2024 08:46:43 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tNSHz-006ial-0R;
	Tue, 17 Dec 2024 08:46:43 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Felix Kloeckner <F.Kloeckner@weinmann-emt.de>
Subject: [PATCH] kernel-yocto: make kernel commits reproducible
Date: Tue, 17 Dec 2024 08:45:47 +0100
Message-Id: <20241217074547.1601328-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 07:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208804

The git commit hashes for the kernel checkout are not reproducible under
certain conditions:

- If the git repository is initialized on an archive (rather than a
  git), the initial git commit not only has the current user name set,
  it also uses the current system time as committer and author date.
  This will affect the initial git hash and thus all subsequent ones.

- The patches applied by the kern-tools have a valid author and date.
  However, their committer again depends on the user building the BSP.

This is an issue, for example, if one compiles a kernel with
CONFIG_LOCALVERSION_AUTO enabled where the commit hash lands into the
kernel and thus the package version. This not only makes the package
version non-reproducible, but also leads to version mismatches between
kernel modules built against a fresh kernel checkout and the kernel
retrieved from the sstate cache.

The class uses 'check_git_config', but this only sets the git user and
only if none existed before. Thus it doesn't really help here.

Since in Git the committer information can be set only from the
environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and
GIT_COMMITTER_DATE, we introduce the helper function
'reproducible_git_committer' here to set those.
As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from
patch.bbclass) and SOURCE_DATE_EPOCH.

Using this helper makes the committer date/name/email for the initial
reproducible, as well as the committer name/email for the patches
applied with kern-tools.

What's still missing is the initial commit's date/name/email which we
just set explicitly via command line arguments.

Suggested-by: Felix Klöckner <F.Kloeckner@weinmann-emt.de>
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-recipe/kernel-yocto.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index a5d89dc2c8..1ba2f91e62 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -9,6 +9,12 @@ SRCTREECOVEREDTASKS += "do_validate_branches do_kernel_configcheck do_kernel_che
 PATCH_GIT_USER_EMAIL ?= "kernel-yocto@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
+reproducible_git_committer() {
+	export GIT_COMMITTER_NAME="${PATCH_GIT_USER_NAME}"
+	export GIT_COMMITTER_EMAIL="${PATCH_GIT_USER_EMAIL}"
+	export GIT_COMMITTER_DATE="$(date -d @${SOURCE_DATE_EPOCH})"
+}
+
 # The distro or local.conf should set this, but if nobody cares...
 LINUX_KERNEL_TYPE ??= "standard"
 
@@ -349,6 +355,7 @@ do_patch() {
 	cd ${S}
 
 	check_git_config
+	reproducible_git_committer
 	meta_dir=$(kgit --meta)
 	(cd ${meta_dir}; ln -sf patch.queue series)
 	if [ -f "${meta_dir}/series" ]; then
@@ -431,8 +438,9 @@ do_kernel_checkout() {
 		rm -f .gitignore
 		git init
 		check_git_config
+		reproducible_git_committer
 		git add .
-		git commit -q -n -m "baseline commit: creating repo for ${PN}-${PV}"
+		git commit --author="${PATCH_GIT_USER_NAME} <${PATCH_GIT_USER_EMAIL}>" --date=${SOURCE_DATE_EPOCH} -q -n -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
 	fi
 
-- 
2.39.5


