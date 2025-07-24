Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB7BC83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 22:15:20 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.6126.1753395310661459976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 15:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Z2HldCIt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025072422150841bc1c03c3972b59aa-rkzwoj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025072422150841bc1c03c3972b59aa
        for <openembedded-core@lists.openembedded.org>;
        Fri, 25 Jul 2025 00:15:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ucubxI0fjf38Gs+IrIUwF33np1/WPcNKQOZmizgeKus=;
 b=Z2HldCItIC9AgZ7hcaCoAcU7dCl7QIEp+OfGe8Xv1N707aNVga2Ll7R/OKdr5BAbscYY33
 Jds/C6EjrzubHlZhR9PZ7j9xEUOuEslD4zEthxJFsdgkF2GraKefL3gPGsUdmfqps/ojjUyG
 ogLGsixH5x9ZGtEgLH8waOlzLmp/mO+OcBtpLr2LTXwS7P/WGtdDMFZWoqf+haamaHE+IS5Z
 Vb3lsoEVg8KXHgEtv2zvXW/r/kb9RA/Wh6MCQKNU/SmVZofRDW8evK51R18TuKuSSCpDk/N1
 qh2yynmByGp2VlGUE/Hq1W4+R0yBa9IfYuslASKKBGSqzjgZC0QG0mLg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] ncurses: patch CVE-2025-6141
Date: Fri, 25 Jul 2025 00:14:21 +0200
Message-Id: <20250724221421.394544-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 22:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220893

From: Peter Marko <peter.marko@siemens.com>

Pick relevant part of snapshot commit 20250329, see [1].

That has:
add a buffer-limit check in postprocess_termcap (report/testcase by
Yifan Zhang).

[1] https://invisible-island.net/ncurses/NEWS.html#index-t20250329

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ncurses/files/CVE-2025-6141.patch         | 25 +++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |  1 +
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
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 61558ecfa8..d3b4106118 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch \
            file://CVE-2023-50495.patch \
            file://CVE-2023-45918.patch \
+           file://CVE-2025-6141.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "1003914e200fd622a27237abca155ce6bf2e6030"

