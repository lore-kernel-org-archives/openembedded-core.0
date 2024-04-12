Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DF4C00A94
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 22:15:44 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.3863.1712960140769986500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 15:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fJrsPyDw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240412221537cf35a7c8ed4509800c-z_1kvp@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240412221537cf35a7c8ed4509800c
        for <openembedded-core@lists.openembedded.org>;
        Sat, 13 Apr 2024 00:15:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=f4kOd7FUvEKXYJZblJB9ffPVvm7LCVCJZLdyTvVH4N8=;
 b=fJrsPyDwcmuoRocSAolpyTx2JT7guj1K5p7XM43aVCsQFicRykJBE8yeubJbf0UsN+XdPM
 cPJSVPmjFIrzSEEBvSCK/T0AviTQd9hh9F6Mznk7SCBkp56XE5U4OqyhGGvxgzih7l9yHMR0
 MOz8bJYNb2ubyXNJBB2ZI9HeLy+OY=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ncurses: patch CVE-2023-50495
Date: Sat, 13 Apr 2024 00:14:26 +0200
Message-Id: <20240412221426.218393-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 22:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198188

From: Peter Marko <peter.marko@siemens.com>

backport relevant parts from
https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ncurses/files/CVE-2023-50495.patch        | 81 +++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
new file mode 100644
index 0000000000..3d92974227
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
@@ -0,0 +1,81 @@
+commit ebc08cff36689eec54edc1ce2de6ebac826bd6cd
+Author: Peter Marko <peter.marko@siemens.com>
+Date:   Fri Apr 12 23:56:25 2024 +0200
+
+check return value of _nc_save_str(), in special case for tic where
+extended capabilities are processed but the terminal description was
+not initialized (report by Ziqiao Kong).
+
+Only parts relevant for this CVE was extracted from upstream patch.
+
+CVE: CVE-2023-45853
+Upstream-Status: Backport [https://invisible-island.net/archives/ncurses/6.4/ncurses-6.4-20230424.patch.gz]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ ncurses/tinfo/parse_entry.c | 23 ++++++++++++++++-------
+ 1 file changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index a77cd0b..8ac02ac 100644
+--- a/ncurses/tinfo/parse_entry.c
++++ b/ncurses/tinfo/parse_entry.c
+@@ -110,7 +110,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	/* Well, we are given a cancel for a name that we don't recognize */
+ 	return _nc_extend_names(entryp, name, STRING);
+     default:
+-	return 0;
++	return NULL;
+     }
+ 
+     /* Adjust the 'offset' (insertion-point) to keep the lists of extended
+@@ -142,6 +142,11 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	for (last = (unsigned) (max - 1); last > tindex; last--)
+ 
+     if (!found) {
++	char *saved;
++
++	if ((saved = _nc_save_str(name)) == NULL)
++	    return NULL;
++
+ 	switch (token_type) {
+ 	case BOOLEAN:
+ 	    tp->ext_Booleans++;
+@@ -169,7 +174,7 @@ _nc_extend_names(ENTRY * entryp, const char *name, int token_type)
+ 	TYPE_REALLOC(char *, actual, tp->ext_Names);
+ 	while (--actual > offset)
+ 	    tp->ext_Names[actual] = tp->ext_Names[actual - 1];
+-	tp->ext_Names[offset] = _nc_save_str(name);
++	tp->ext_Names[offset] = saved;
+     }
+ 
+     temp.nte_name = tp->ext_Names[offset];
+@@ -337,6 +342,8 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 	bool is_use = (strcmp(_nc_curr_token.tk_name, "use") == 0);
+ 	bool is_tc = !is_use && (strcmp(_nc_curr_token.tk_name, "tc") == 0);
+ 	if (is_use || is_tc) {
++	    char *saved;
++
+ 	    if (!VALID_STRING(_nc_curr_token.tk_valstring)
+ 		|| _nc_curr_token.tk_valstring[0] == '\0') {
+ 		_nc_warning("missing name for use-clause");
+@@ -350,11 +357,13 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 			    _nc_curr_token.tk_valstring);
+ 		continue;
+ 	    }
+-	    entryp->uses[entryp->nuses].name = _nc_save_str(_nc_curr_token.tk_valstring);
+-	    entryp->uses[entryp->nuses].line = _nc_curr_line;
+-	    entryp->nuses++;
+-	    if (entryp->nuses > 1 && is_tc) {
+-		BAD_TC_USAGE
++	    if ((saved = _nc_save_str(_nc_curr_token.tk_valstring)) != NULL) {
++		entryp->uses[entryp->nuses].name = saved;
++		entryp->uses[entryp->nuses].line = _nc_curr_line;
++		entryp->nuses++;
++		if (entryp->nuses > 1 && is_tc) {
++		    BAD_TC_USAGE
++		}
+ 	    }
+ 	} else {
+ 	    /* normal token lookup */
diff --git a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
index a34a7bdfdc..da1e6d838d 100644
--- a/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-generated.patch \
            file://CVE-2023-29491.patch \
+           file://CVE-2023-50495.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
-- 
2.30.2


