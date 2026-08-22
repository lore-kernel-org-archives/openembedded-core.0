Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3A5C5DF8C
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 20:03:30 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3126.1787429008310723337
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Aug 2026 13:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DU8sdd4s;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20260822200325e8fb30b93700020707-hmw1fs@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20260822200325e8fb30b93700020707
        for <openembedded-core@lists.openembedded.org>;
        Sat, 22 Aug 2026 22:03:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=je2xfgJ4XAKc2Ib5n0U1EMtMc5vldrL7yQ+FfTB0GjE=;
 b=DU8sdd4ssUNNh3VW50WKswuzZIpDXU5ZDnFVME2ROLMkR+YR3v3BGYyy+2t9FlO6xihTIV
 eh6t3ulZ6tSJ+ockAQUoqbS4/VSeQ/np7Syups4v6Os0zsrC26+We6AgMtkgpjCOX2gXKYId
 Z+dXCGQB9FOf6w5fDXu5cZauj6RbR9WHNihMjUF/153qOYq2hFxCPtcKy2Ry788GoyWD3Auy
 ynTa3qPS48Pp/X+FUCeM+QHsRysU6bD8cfuzoCQioptTYFkwNO018TGQ9j8xhp/bH39TfHRJ
 hRWtmXqi5oN4dGyR2+7E2yMnwlKetVhDHDAz0MJrNiHVEKu3Thqotm7w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] alsa-lib: patch CVE-2026-56109
Date: Sat, 22 Aug 2026 22:01:17 +0200
Message-ID: <20260822200117.3372119-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 20:03:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244002

From: Peter Marko <peter.marko@siemens.com>

Pick patch listed in NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../alsa/alsa-lib/CVE-2026-56109.patch        | 33 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
new file mode 100644
index 0000000000..c6ecc837f8
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-56109.patch
@@ -0,0 +1,33 @@
+From 536dd6f8affdf5197c12a63a71c92a70b2833cc0 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 8 Jun 2026 14:33:19 +0200
+Subject: [PATCH] conf: add missing return value check in parse_def()
+
+A malformed configuration may cause SIGSEGV.
+
+Link: https://lore.kernel.org/alsa-devel/CAGt8pqBU0p2voB+qHxWGcNJrKHAcBhAyHUUBPLBN-Yj_SiV6MQ@mail.gmail.com/
+Reported-by: Luigino Camastra <luigino.camastra@aisle.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-56109
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/536dd6f8affdf5197c12a63a71c92a70b2833cc0]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/conf.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/conf.c b/src/conf.c
+index b0dd6298..e1dba23d 100644
+--- a/src/conf.c
++++ b/src/conf.c
+@@ -1485,6 +1485,10 @@ static int parse_def(snd_config_t *parent, input_t *input, int skip, int overrid
+ 			endchr = ']';
+ 		}
+ 		c = get_nonwhite(input);
++		if (c < 0) {
++			err = c;
++			goto __end;
++		}
+ 		if (c != endchr) {
+ 			if (n)
+ 				snd_config_delete(n);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index 1ebb356925..04976f3bf7 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
 SRC_URI += "file://CVE-2026-25068.patch"
+SRC_URI += "file://CVE-2026-56109.patch"
 SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig

