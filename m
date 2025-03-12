Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B321BC2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 18:38:56 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.2859.1741804726888002607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 11:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=hFSOHPqf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202503121838436adfef51b645582474-cub_ov@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202503121838436adfef51b645582474
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Mar 2025 19:38:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=oMqt3ShZ7VYiaiUWrC+HHyPZ3bAcV5dZjwbYR2n90GQ=;
 b=hFSOHPqfhcn018W9Vube7Kuou9cJ16JrVLwaEvSUBIGXEdLiOx3YtjetVwrtRcXBkKaZO5
 E54r1J6zAj7pXc3MJp0yQOAi4EDKNZ4Kno3YTWh9F1kGORRpbiHxXfBhA0sbujWsD0tP1HCj
 5+1iqvm/h3EduYLCnTroYZFFI1/eLjR7Vee6fK/CZHbsU4C++fz55VTjrMO5Te8sQhjOd7IR
 Knj9ymCVoscQvOvjI8epsPmZj6tAWSv9poA4XOVjsKfktN/uK9062/9XEbZrZBIn4IsMM0iR
 lg/YOSvCjB5ENrfa7yMuWlrwCl58xmmDroquPaMBnf6zSejDGO9dsgrw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][styhead][PATCH 1/2] openssh: patch CVE-2025-26466
Date: Wed, 12 Mar 2025 19:37:52 +0100
Message-Id: <20250312183753.1638055-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 18:38:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212664

From: Peter Marko <peter.marko@siemens.com>

Pick commit:
https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../openssh/openssh/CVE-2025-26466.patch      | 36 +++++++++++++++++++
 .../openssh/openssh_9.8p1.bb                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
new file mode 100644
index 0000000000..1c81515638
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-26466.patch
@@ -0,0 +1,36 @@
+From 6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 18 Feb 2025 08:02:12 +0000
+Subject: [PATCH 1/2] upstream: Don't reply to PING in preauth phase or during
+ KEX
+
+Reported by the Qualys Security Advisory team. ok markus@
+
+OpenBSD-Commit-ID: c656ac4abd1504389d1733d85152044b15830217
+
+CVE: CVE-2025-26466
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/6ce00f0c2ecbb9f75023dbe627ee6460bcec78c2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ packet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/packet.c b/packet.c
+index 486f85157..9dea2cfc5 100644
+--- a/packet.c
++++ b/packet.c
+@@ -1865,6 +1865,14 @@ ssh_packet_read_poll_seqnr(struct ssh *ssh, u_char *typep, u_int32_t *seqnr_p)
+ 			if ((r = sshpkt_get_string_direct(ssh, &d, &len)) != 0)
+ 				return r;
+ 			DBG(debug("Received SSH2_MSG_PING len %zu", len));
++			if (!ssh->state->after_authentication) {
++				DBG(debug("Won't reply to PING in preauth"));
++				break;
++			}
++			if (ssh_packet_is_rekeying(ssh)) {
++				DBG(debug("Won't reply to PING during KEX"));
++				break;
++			}
+ 			if ((r = sshpkt_start(ssh, SSH2_MSG_PONG)) != 0 ||
+ 			    (r = sshpkt_put_string(ssh, d, len)) != 0 ||
+ 			    (r = sshpkt_send(ssh)) != 0)
diff --git a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
index 83145dbd18..3d6cb9f245 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.8p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://0001-Cast-to-sockaddr-in-systemd-interface.patch \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://0001-regress-test-exec-use-the-absolute-path-in-the-SSH-e.patch \
+           file://CVE-2025-26466.patch \
            "
 SRC_URI[sha256sum] = "dd8bd002a379b5d499dfb050dd1fa9af8029e80461f4bb6c523c49973f5a39f3"
 

