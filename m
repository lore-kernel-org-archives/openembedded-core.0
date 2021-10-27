Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCD2C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 16:37:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.14447.1635352643742823335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 09:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=oEG9fxg5;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1635352644;
  x=1666888644;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VAP2ZK/V/y2yztWrTfB9/XvYGDBgCelr/PoXbtLL43M=;
  b=oEG9fxg57YsG0ASUFravza01haYHm/sIxlmpL0HfHJSD8WPlpiewzjdM
   J9BFHqn/eVQFlSpgFE3MjAkVnK5WKiHo5zeoe091I4tT8RQ9XmZ580U1G
   juAm6hTVMREDwdihrryszxOz7ebvx1CBiAE0ssO8qJhwzZBazSjO5cJJf
   WTqM5VTBG/W36NAgrVSspLBaeY6gbo8mjS08cCbOBjjbG0mIN/iv1+bxh
   wt3zwsNS9wnzdkAbph3J5I4YG46SmjWiusOWUqsv9T0lgW2rK35PTJ/zE
   fKU7P+nWskcDH3KxMpv0L8IjxsE9uun9qVdpARmMYGYssiK7KycS6L8f2
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] systemd: Do not install anything in /var/log
Date: Wed, 27 Oct 2021 18:37:12 +0200
Message-ID: <20211027163713.17300-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 16:37:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157555

/var/log is typically a symbolic link to inside /var/volatile, which
is expected to be empty.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/systemd/systemd_249.5.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.5.bb b/meta/recipes-core/systemd/systemd_249.5.bb
index d87f54bf16..f2e6a79d6c 100644
--- a/meta/recipes-core/systemd/systemd_249.5.bb
+++ b/meta/recipes-core/systemd/systemd_249.5.bb
@@ -270,13 +270,10 @@ do_install() {
 		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_system_unitdir}d-sysv-install
 	fi
 
-	chown root:systemd-journal ${D}/${localstatedir}/log/journal
-
-	# Delete journal README, as log can be symlinked inside volatile.
-	rm -f ${D}/${localstatedir}/log/README
-
-	# journal-remote creates this at start
-	rm -rf ${D}/${localstatedir}/log/journal/remote
+	# /var/log is typically a symbolic link to inside /var/volatile, which
+	# is expected to be empty. This remove /var/log/README and
+	# /var/log/journal/.
+	rm -rf ${D}${localstatedir}/log
 
 	install -d ${D}${systemd_system_unitdir}/graphical.target.wants
 	install -d ${D}${systemd_system_unitdir}/multi-user.target.wants

