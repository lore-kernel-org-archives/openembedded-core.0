Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8775C02185
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 06:55:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.31983.1737356138549417919
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 22:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tZlhA-0000Nj-L9; Mon, 20 Jan 2025 07:55:36 +0100
Received: from dude06.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::5c])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tZlh9-000tJ1-2s;
	Mon, 20 Jan 2025 07:55:35 +0100
Received: from ejo by dude06.red.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ejo@pengutronix.de>)
	id 1tZlh9-00CUds-2h;
	Mon, 20 Jan 2025 07:55:35 +0100
From: =?UTF-8?q?Enrico=20J=C3=B6rns?= <ejo@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Felix Kloeckner <F.Kloeckner@weinmann-emt.de>
Subject: [PATCH v2] kernel-yocto: make kernel commits reproducible
Date: Mon, 20 Jan 2025 07:55:15 +0100
Message-Id: <20250120065515.2977687-1-ejo@pengutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 06:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210022

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

The class uses 'check_git_config' from utils.bbclass, but this only sets
the git user and only if none existed before. Thus it doesn't really
help here.

Since in Git the committer information can be set only from the
environment variables GIT_COMMITTER_NAME, GIT_COMMITTER_EMAIL, and
GIT_COMMITTER_DATE, we introduce a helper function to set those and
apply the author settings in the same way.
As values simply use PATCH_GIT_USER_NAME, PATCH_GIT_USER_EMAIL (from
patch.bbclass) and SOURCE_DATE_EPOCH.
For convenience, put the new helper 'reproducible_git_committer_author'
into utils.bbclass next to 'check_git_config' so others can use it, too.

Using this helper in kernel-yocto.bbclass makes the committer and author
date/name/email for the initial commit reproducible, as well as the
committer name/email for the patches applied with kern-tools.

For debugging purpose, allow disabling the reproducibility features by
setting KERNEL_DEBUG_TIMESTAMPS to "1".

Suggested-by: Felix Klöckner <F.Kloeckner@weinmann-emt.de>
Signed-off-by: Enrico Jörns <ejo@pengutronix.de>
---
 meta/classes-global/utils.bbclass        | 10 ++++++++++
 meta/classes-recipe/kernel-yocto.bbclass |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.bbclass
index c9cae8930f..530a490ea8 100644
--- a/meta/classes-global/utils.bbclass
+++ b/meta/classes-global/utils.bbclass
@@ -367,3 +367,13 @@ check_git_config() {
 		git config --local user.name "${PATCH_GIT_USER_NAME}"
 	fi
 }
+
+# Sets fixed git committer and author for reproducible commits
+reproducible_git_committer_author() {
+	export GIT_COMMITTER_NAME="${PATCH_GIT_USER_NAME}"
+	export GIT_COMMITTER_EMAIL="${PATCH_GIT_USER_EMAIL}"
+	export GIT_COMMITTER_DATE="$(date -d @${SOURCE_DATE_EPOCH})"
+	export GIT_AUTHOR_NAME="${PATCH_GIT_USER_NAME}"
+	export GIT_AUTHOR_EMAIL="${PATCH_GIT_USER_EMAIL}"
+	export GIT_AUTHOR_DATE="$(date -d @${SOURCE_DATE_EPOCH})"
+}
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index 7d80e9aa52..697132c073 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -352,6 +352,9 @@ do_patch() {
 	cd ${S}
 
 	check_git_config
+	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
+		reproducible_git_committer_author
+	fi
 	meta_dir=$(kgit --meta)
 	(cd ${meta_dir}; ln -sf patch.queue series)
 	if [ -f "${meta_dir}/series" ]; then
@@ -434,6 +437,9 @@ do_kernel_checkout() {
 		rm -f .gitignore
 		git init
 		check_git_config
+		if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
+			reproducible_git_committer_author
+		fi
 		git add .
 		git commit -q -n -m "baseline commit: creating repo for ${PN}-${PV}"
 		git clean -d -f
-- 
2.39.5


