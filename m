Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B63CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:06:06 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25233.1791219957173545072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jL3YYkDl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202610051705555a5dc089e100020760-jb0dc6@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202610051705555a5dc089e100020760
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Oct 2026 19:05:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TV0kE1e9yRi0sxPQuJG9fAuTbGpsRNc5F0BUUfeGYMs=;
 b=jL3YYkDlW7tkLj3QbpbLF1JRPt0T7UtGpfIQ8qX2WsuYO0bJTuEbBLWKttHIwC/zDKg0Kn
 /m7eLGeQWktR3LF3x7QEsl3L1xa9hIsQZ9F4jzg/BbWn7f3Ty33WIhWsWHNjWC10adO5Re76
 ZvWJ5M8rfRxihOMpPu3+mhMJITIUFG878QzAa2WZCrAWvHA4zhlzPZCdIWaWxMDX/BPvrNac
 hJw5wy/cdFc23eTL5TNUcaR+m1Vu8naiytERQYL98IJb8h7jiwGFJdPCNPrVlGv8QgThRNDb
 k5MZbyDA3o4+ExcryQIYrodXaz7WP4Y3Yr1jfOu/i4lHvvg31LbGqz6w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 4/7] util-linux: patch CVE-2024-28085 regression
Date: Mon,  5 Oct 2026 19:05:09 +0200
Message-ID: <20261005170513.632348-4-peter.marko@siemens.com>
In-Reply-To: <20261005170513.632348-1-peter.marko@siemens.com>
References: <20261005170513.632348-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247249

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.6 release.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 .../util-linux/CVE-2024-28085-0003.patch      | 77 +++++++++++++++++++
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 4b889927c80..6598a92b30f 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -56,6 +56,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch \
            file://CVE-2026-53613.patch \
            file://CVE-2026-53612.patch \
+           file://CVE-2024-28085-0003.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
new file mode 100644
index 00000000000..63d09ef4a1b
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2024-28085-0003.patch
@@ -0,0 +1,77 @@
+From 61b49b7160bbb6780279344574746617e7fb11a4 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 24 Aug 2026 16:37:28 +0200
+Subject: [PATCH] wall, write: sanitize hostname in banner header
+
+The CVE-2024-28085 fix sanitized only message bodies via
+fputs_careful(), but the banner headers in wall(1) and write(1)
+still interpolate the system hostname without sanitization.
+
+An unprivileged user can set a malicious hostname containing
+terminal escape sequences via a user namespace (unshare -Ur -u
++ sethostname(2)), and wall/write will deliver those sequences
+to the terminals of all logged-in users.
+
+Fix by routing the banner output through fputs_careful() which
+strips control characters.
+
+This is an additional fix for CVE-2024-28085 (CVSS 3.1 score: 3.3).
+A new CVE ID has not been assigned (yet).
+
+Reported-by: Skyler Ferrante <sjf5462@rit.edu>
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 9ce8f2b5aefa011ef5b0c34aa14df9bb9db02dab)
+(cherry picked from commit f358b098d47659837d85b66fb387201224b272a0)
+
+CVE: CVE-2024-28085
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/61b49b7160bbb6780279344574746617e7fb11a4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ term-utils/wall.c  | 3 ++-
+ term-utils/write.c | 6 ++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/term-utils/wall.c b/term-utils/wall.c
+index 7a4a858f5..c1c47d531 100644
+--- a/term-utils/wall.c
++++ b/term-utils/wall.c
+@@ -316,7 +316,8 @@ static char *makemsg(char *fname, char **mvec, int mvecsz,
+ 		snprintf(lbuf, lbuflen,
+ 				_("Broadcast message from %s@%s (%s) (%s):"),
+ 				whom, hostname, where, date);
+-		fprintf(fs, "%-*.*s\007\007\r\n", TERM_WIDTH, TERM_WIDTH, lbuf);
++		fputs_careful(lbuf, fs, '^', true, TERM_WIDTH);
++		fprintf(fs, "\007\007\r\n");
+ 		free(hostname);
+ 	}
+ 	fprintf(fs, "%*s\r\n", TERM_WIDTH, " ");
+diff --git a/term-utils/write.c b/term-utils/write.c
+index 3784f0300..d680d7464 100644
+--- a/term-utils/write.c
++++ b/term-utils/write.c
+@@ -233,6 +233,7 @@ static void do_write(const struct write_control *ctl)
+ 	time_t now;
+ 	struct tm *tm;
+ 	char *host, *line = NULL;
++	char buf[512];
+ 	size_t linelen = 0;
+ 	struct sigaction sigact;
+ 
+@@ -262,14 +263,15 @@ static void do_write(const struct write_control *ctl)
+ 	/* print greeting */
+ 	printf("\r\n\a\a\a");
+ 	if (strcmp(login, pwuid) != 0)
+-		printf(_("Message from %s@%s (as %s) on %s at %02d:%02d ..."),
++		snprintf(buf, sizeof(buf), _("Message from %s@%s (as %s) on %s at %02d:%02d ..."),
+ 		       login, host, pwuid, ctl->src_tty_name,
+ 		       tm->tm_hour, tm->tm_min);
+ 	else
+-		printf(_("Message from %s@%s on %s at %02d:%02d ..."),
++		snprintf(buf, sizeof(buf), _("Message from %s@%s on %s at %02d:%02d ..."),
+ 		       login, host, ctl->src_tty_name,
+ 		       tm->tm_hour, tm->tm_min);
+ 	free(host);
++	fputs_careful(buf, stdout, '^', true, 0);
+ 	printf("\r\n");
+ 
+ 	while (getline(&line, &linelen, stdin) >= 0) {

