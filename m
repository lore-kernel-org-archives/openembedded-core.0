Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE42C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 00:03:55 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.37856.1635725034067232822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 17:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=aYL1xUdg;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635725034;
  x=1667261034;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CETrRTPMfzHTbVstHWrWfj8Uok8YhjWKmqRBVaVhcbs=;
  b=aYL1xUdgqtj/jQhtM+8JKmzNizLKGS+num/ReEMkEGJAsa2ROwNvqM3h
   0j5n3PqDLL3+l52QM9JvI3CTVLH98696rVXCCq0ew1dInn91VzatFS9TH
   J6NbjlAd2THGdrEQHKyWbYchQMun6T5boNWy0ZCDSRxtmlUQCf94SnP8r
   jW856ECPAO+uUF6RmhJ4bgp91ID1j4W6dMhhIoj7NLKzohf2GccyZsnQI
   G0y/pSvZuuEtKyC/DpXOziL58y07iNZb+lc6aNKNjtkhCNO9GYW6aGOrI
   Mcglc+xO1Htp1b+hkF0d1MtVrRBmgNW7fcjoJ+LPzMM/dv8S5TELjgLDA
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv4 1/4] systemd: Do not install anything in /var/volatile
Date: Mon, 1 Nov 2021 01:03:40 +0100
Message-ID: <20211101000343.18979-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 00:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157696

/var/log is typically a symbolic link to inside /var/volatile, which
is expected to be empty. Check ${VOLATILE_LOG_DIR} to see if it is ok
to install /var/log.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Added check for ${VOLATILE_LOG_DIR} before removing /var/log.
PATCHv3: No changes.
PATCHv4: No changes.

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

