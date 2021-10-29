Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53237C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 21:29:35 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.11747.1635542973599241944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 14:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=Ef4twRLp;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635542972;
  x=1667078972;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sokNQ3vKTAtwn+TNw4u9DNexYgiu8i3M+9PGdT9VTyY=;
  b=Ef4twRLpZodzmQijKHSorgjsKQXIWYUKly/o53100hUkd/e8QujoGnZA
   +57lY7q7WibO28z0Ta6JiR0ikRTX8gLfWGvD7h7xmWfhWZkeH/cjcN+uT
   cdMCkyog4PwrGO3M2bp+hRECR9JYKA4ietIdS1zdPN2g2kxdInNh6gpi8
   UrTgn7BAdgxg3Bi9c0V2chlAXbKTfbYQpQyX7BPMVi7YhcjPL+KAK3OQZ
   7z5emxtz607C3yQHioslkw6z65z2msDHWWMyHJ4+iy1cX4pwP+tHtgr7w
   hqc+1WeW0KtaTAwyQPsLjEiEa7lE6nNdLNOIqC0C1b7iZhQxQI/o99jsv
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv3 1/3] systemd: Do not install anything in /var/volatile
Date: Fri, 29 Oct 2021 23:29:16 +0200
Message-ID: <20211029212918.16283-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 21:29:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157638

/var/log is typically a symbolic link to inside /var/volatile, which
is expected to be empty. Check ${VOLATILE_LOG_DIR} to see if it is ok
to install /var/log.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Added check for ${VOLATILE_LOG_DIR} before removing /var/log.
PATCHv3: No changes.

 meta/recipes-core/systemd/systemd_249.5.bb | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index d87f54bf16..c0c1f9bcfc 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -270,13 +270,16 @@ do_install() {
 		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_system_unitdir}d-sysv-install
 	fi
 
-	chown root:systemd-journal ${D}/${localstatedir}/log/journal
-
-	# Delete journal README, as log can be symlinked inside volatile.
-	rm -f ${D}/${localstatedir}/log/README
+	if "${@'true' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'false'}"; then
+		# /var/log is typically a symbolic link to inside /var/volatile,
+		# which is expected to be empty.
+		rm -rf ${D}${localstatedir}/log
+	else
+		chown root:systemd-journal ${D}${localstatedir}/log/journal
 
-	# journal-remote creates this at start
-	rm -rf ${D}/${localstatedir}/log/journal/remote
+		# journal-remote creates this at start
+		rm -rf ${D}${localstatedir}/log/journal/remote
+	fi
 
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
 	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants

