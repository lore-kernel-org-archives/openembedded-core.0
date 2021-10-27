Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B977C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 18:05:41 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.765.1635357939781507285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 11:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=lv9iNlN1;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635357939;
  x=1666893939;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OXGjBKO0i/QZhfaHjNfVWhtS9h9bCfWIPiVnMFFCuQU=;
  b=lv9iNlN1YRYSJ27ZN53DCKhsWXSfBdA5KwXFMAoJGAtI4mNf0Be6Ydxb
   RDdI2kd4tqR3Plww/uzP+uN2SIrjo+GP2iAdlNbNDXwnrykz82SLs6mVO
   HVVeiohai8IKk7XGBBoFCEI+LNUCjPwlxb2WvyIqjuL5Fe/SCUo0AN72v
   i90tj0j5b/2lLGr3v4cWDe8nfrUi2gSMeffamDYs4xUL1Ga4+chXzUgTg
   bhL4k0c9ylUuDGE9vNm6gvl6doCG8GaHBhQ7l2qLV5ecpO5P5noLF8r5W
   GIOhNBcl2+0BO5LNFhzGlkaKXBWzRtSlY18pWe/iscOPZ/vmN2TsgXsCa
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] systemd: Do not install anything in /var/volatile
Date: Wed, 27 Oct 2021 20:05:21 +0200
Message-ID: <20211027180522.19680-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 18:05:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157563

/var/log is typically a symbolic link to inside /var/volatile, which
is expected to be empty. Check ${VOLATILE_LOG_DIR} to see if it is ok
to install /var/log.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Added check for ${VOLATILE_LOG_DIR} before removing /var/log.

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

