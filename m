Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCC8C87FC5
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 22:14:20 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.6109.1753395252597554919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 15:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SUpQocig;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-2025072422141007b0b376ecb8c5e8b7-fmkzuf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025072422141007b0b376ecb8c5e8b7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 25 Jul 2025 00:14:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=iG3pppDo7K9u25zfqH98mlfyQcmEfgXgdQk9V3JjiW4=;
 b=SUpQocighbjKxBlOg7RW85XuQ62fhoMXT+n+eyF4MBeUfAvqTgJ2lQjlOC85PjFeQDGAFD
 Yo3I2YQJ0Ke0QByl5QPnDGU28dVjqDB7n4PGLeFd8Dp+zJ0zUwjEEyGtRXgyWzpi6a1ylmz/
 X+00vbQp8g6bQ0i6wcsLPAs+gW62TSA4YVvtbK658B8fdMBYvCkksVZ+NCxpBLPNuM/fv138
 /ftE2rV9GsynAyLHY4rm0+Xw2SZP7mJdDhYQKdbuKiF4CsGYSUBI/TaEDqhUSJZhf93BibUt
 lBNUR/aUvkMhYxZUbLXgOinslu1tfCoBF+ieh1ak5BXBXGCdoCPED4kw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH] ncurses: patch CVE-2025-6141
Date: Fri, 25 Jul 2025 00:13:24 +0200
Message-Id: <20250724221324.394492-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 22:14:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220892

From: Peter Marko <peter.marko@siemens.com>

Pick relevant part of snapshot commit 20250329, see [1].

That has:
add a buffer-limit check in postprocess_termcap (report/testcase by
Yifan Zhang).

[1] https://invisible-island.net/ncurses/NEWS.html#index-t20250329

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ncurses/files/CVE-2025-6141.patch         | 25 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.5.bb      |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-6141.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2025-6141.patch b/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
new file mode 100644
index 0000000000..ec7e8a94e4
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2025-6141.patch
@@ -0,0 +1,25 @@
+From 27d1493340d714e7be6e08c0a8f43e48276149c4 Mon Sep 17 00:00:00 2001
+From: "Thomas E. Dickey" <dickey@invisible-island.net>
+Date: Sat, 29 Mar 2025 22:52:37 +0000
+Subject: [PATCH] snapshot of project "ncurses", label v6_5_20250329
+
+CVE: CVE-2025-6141
+Upstream-Status: Backport [https://github.com/ThomasDickey/ncurses-snapshots/commit/27d1493340d714e7be6e08c0a8f43e48276149c4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ncurses/tinfo/parse_entry.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index a2278c07..c551c780 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -985,6 +985,8 @@ postprocess_termcap(TERMTYPE2 *tp, bool has_base)
+ 	    bp = tp->Strings[from_ptr->nte_index];
+ 	    if (VALID_STRING(bp)) {
+ 		for (dp = buf2; *bp; bp++) {
++		    if ((size_t) (dp - buf2) >= (sizeof(buf2) - sizeof(TERMTYPE2)))
++			  break;
+ 		    if (bp[0] == '$' && bp[1] == '<') {
+ 			while (*bp && *bp != '>') {
+ 			    ++bp;
diff --git a/meta/recipes-core/ncurses/ncurses_6.5.bb b/meta/recipes-core/ncurses/ncurses_6.5.bb
index 2e3ee337ea..83de792d89 100644
--- a/meta/recipes-core/ncurses/ncurses_6.5.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.5.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://exit_prototype.patch \
+           file://CVE-2025-6141.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "1c55d64d9d3e00399a21f04e9cac1e472ab5f70a"

