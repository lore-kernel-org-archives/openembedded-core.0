Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CDBC25B7B
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:46 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.61046.1716212020198772632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z4uGRYXz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f4603237e0so1658007b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212019; x=1716816819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpJstW6TNLFsCNL/V2qqRcalum8FxHFzbN0s/WNZX2U=;
        b=z4uGRYXzlPLCA6qQPe7c1uElRHFs61T/R9S7pbjlLFBKTxOCfTE1NMTeIusQjgzHSk
         /zGj6D1PeM9YD/kcxC0gSq1tUPXBrfhpodEFb5RCeWLngzBpCjhbw/XEWg2IZ99FjaHk
         Pfh+icCBefumjbdFSLcilEQ55StD29kGq5F6a0yai2fqDN1GB6xhJtudfxlatIPIckZp
         Pef3Cleu/lQ1CvjdlQnqBAsF84k9B4/Z/PK97v1BwqtxbgVjmSwVyPIG0KYGgbnTnI/+
         Jr35yYFFjoAAGMBJeRVPon+qq0AaI8ydug4hv1ae+RsOE89Y74O5e2yDjhXoWNA5jVel
         s66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212019; x=1716816819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpJstW6TNLFsCNL/V2qqRcalum8FxHFzbN0s/WNZX2U=;
        b=SDxb64DgYmX++6x9tsEqgwrs8G2bvUKiev96B7iYAMGY1d1IdZsHho5eQb4afZ1pxr
         t+ootHhakSjXqK5oqaQc5AZexckhdxfH6kEDNumMKO2/4xHVhKofjP0MEt7WRSLALQ3j
         omMyNPFWmk10rpWH9QDuBfCBV0WRXRx/MBcwbAkUpTyG4JxFmcMy/HAk9uFTknuY99Lv
         Y93BcVLblQfhdCNUc5fiqaOcXsRJhWIomX+4FibJU7Ltl/+lpwoSSbN+foM6jn0G6k3R
         Q57OtZ8KimjjUzxMqnWwbzp3cGvq5dwRJ06bd8JNY0Vy6s8UTGicXc3HANlmzY6y6/rF
         eBTQ==
X-Gm-Message-State: AOJu0YzI5VTfy/1OTYvv9B/rz6arY7UjI5y6TZvhBfbVIOdwwuW6KQex
	/vgh/IW2oGUC7eWBn13aP0ysbPJQykzLRrN+hCyDxm1cG0R4ZfzaX3A3ajM6hM0ph4rDRqRrtCq
	z
X-Google-Smtp-Source: AGHT+IGzZk1ABv2RclzsRK9b4GvBOafXqVVXyp17Jm1JnRODuOaTe58GOBY+jOY/pUKViTIwKGAz3Q==
X-Received: by 2002:a05:6a00:21c4:b0:6ec:d3a6:801 with SMTP id d2e1a72fcca58-6f69fbfe7e5mr7674633b3a.11.1716212019227;
        Mon, 20 May 2024 06:33:39 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/21] ncurses: Fix CVE-2023-50495
Date: Mon, 20 May 2024 06:33:12 -0700
Message-Id: <55cca070799a236b06f5cba6f53487fca458f25d.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716211838.git.steve@sakoman.com>
References: <cover.1716211838.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199572

From: Mingli Yu <mingli.yu@windriver.com>

Backport a patch [1] to fix CVE-2023-50495.

[1] http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=7723dd6799ab10b32047ec73b14df9f107bafe99

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit bdf7b7460a4816e3d447264730a2814209667fb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ncurses/files/CVE-2023-50495.patch        | 301 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 2 files changed, 302 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch

diff --git a/meta/recipes-core/ncurses/files/CVE-2023-50495.patch b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
new file mode 100644
index 0000000000..7d90ddd30f
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/CVE-2023-50495.patch
@@ -0,0 +1,301 @@
+From 7daae3f2139a678fe0ae0b42fcf8d807cbff485c Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Sun, 4 Feb 2024 13:42:38 +0800
+Subject: [PATCH] parse_entry.c: check return value of _nc_save_str
+
+* check return value of _nc_save_str(), in special case for tic where
+extended capabilities are processed but the terminal description was
+not initialized (report by Ziqiao Kong).
+
+* regenerate llib-* files.
+
+CVE: CVE-2023-50495
+
+Upstream-Status: Backport [http://ncurses.scripts.mit.edu/?p=ncurses.git;a=commitdiff;h=7723dd6799ab10b32047ec73b14df9f107bafe99]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ ncurses/llib-lncurses       | 15 +++++++++++++++
+ ncurses/llib-lncursest      | 15 +++++++++++++++
+ ncurses/llib-lncursestw     | 15 +++++++++++++++
+ ncurses/llib-lncursesw      | 15 +++++++++++++++
+ ncurses/llib-ltinfo         | 15 +++++++++++++++
+ ncurses/llib-ltinfot        | 15 +++++++++++++++
+ ncurses/llib-ltinfotw       | 15 +++++++++++++++
+ ncurses/llib-ltinfow        | 15 +++++++++++++++
+ ncurses/tinfo/parse_entry.c | 23 ++++++++++++++++-------
+ 9 files changed, 136 insertions(+), 7 deletions(-)
+
+diff --git a/ncurses/llib-lncurses b/ncurses/llib-lncurses
+index 211cf3b7..e4190aa2 100644
+--- a/ncurses/llib-lncurses
++++ b/ncurses/llib-lncurses
+@@ -3656,6 +3656,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-lncursest b/ncurses/llib-lncursest
+index 1b09d676..e07abba6 100644
+--- a/ncurses/llib-lncursest
++++ b/ncurses/llib-lncursest
+@@ -3741,6 +3741,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-lncursestw b/ncurses/llib-lncursestw
+index 4576e0fc..747c6be8 100644
+--- a/ncurses/llib-lncursestw
++++ b/ncurses/llib-lncursestw
+@@ -4702,6 +4702,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-lncursesw b/ncurses/llib-lncursesw
+index 127350d2..862305d9 100644
+--- a/ncurses/llib-lncursesw
++++ b/ncurses/llib-lncursesw
+@@ -4617,6 +4617,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfo b/ncurses/llib-ltinfo
+index a5cd7cd3..31e5e9a6 100644
+--- a/ncurses/llib-ltinfo
++++ b/ncurses/llib-ltinfo
+@@ -927,6 +927,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfot b/ncurses/llib-ltinfot
+index bd3de812..48e5c25a 100644
+--- a/ncurses/llib-ltinfot
++++ b/ncurses/llib-ltinfot
+@@ -1003,6 +1003,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfotw b/ncurses/llib-ltinfotw
+index 4d35a1e1..64dfdfa5 100644
+--- a/ncurses/llib-ltinfotw
++++ b/ncurses/llib-ltinfotw
+@@ -1025,6 +1025,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/llib-ltinfow b/ncurses/llib-ltinfow
+index db846764..7e17a35f 100644
+--- a/ncurses/llib-ltinfow
++++ b/ncurses/llib-ltinfow
+@@ -949,6 +949,21 @@ char	*tiparm(
+ 		...)
+ 		{ return(*(char **)0); }
+ 
++#undef tiparm_s
++char	*tiparm_s(
++		int	num_expected,
++		int	tparm_type,
++		const char *string,
++		...)
++		{ return(*(char **)0); }
++
++#undef tiscan_s
++int	tiscan_s(
++		int	*num_expected,
++		int	*tparm_type,
++		const char *string)
++		{ return(*(int *)0); }
++
+ #undef _nc_tiparm
+ char	*_nc_tiparm(
+ 		int	expected,
+diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
+index 14bcb67e..0a0b5637 100644
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
+@@ -364,6 +369,8 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 	bool is_use = (strcmp(_nc_curr_token.tk_name, "use") == 0);
+ 	bool is_tc = !is_use && (strcmp(_nc_curr_token.tk_name, "tc") == 0);
+ 	if (is_use || is_tc) {
++	    char *saved;
++
+ 	    if (!VALID_STRING(_nc_curr_token.tk_valstring)
+ 		|| _nc_curr_token.tk_valstring[0] == '\0') {
+ 		_nc_warning("missing name for use-clause");
+@@ -377,11 +384,13 @@ _nc_parse_entry(ENTRY * entryp, int literal, bool silent)
+ 			    _nc_curr_token.tk_valstring);
+ 		continue;
+ 	    }
+-	    entryp->uses[entryp->nuses].name = _nc_save_str(_nc_curr_token.tk_valstring);
+-	    entryp->uses[entryp->nuses].line = _nc_curr_line;
+-	    entryp->nuses++;
+-	    if (entryp->nuses > 1 && is_tc) {
+-		BAD_TC_USAGE
++	    if ((saved = _nc_save_str(_nc_curr_token.tk_valstring)) != NULL) {
++			entryp->uses[entryp->nuses].name = saved;
++			entryp->uses[entryp->nuses].line = _nc_curr_line;
++			entryp->nuses++;
++			if (entryp->nuses > 1 && is_tc) {
++			    BAD_TC_USAGE
++		    }
+ 	    }
+ 	} else {
+ 	    /* normal token lookup */
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/ncurses/ncurses_6.4.bb b/meta/recipes-core/ncurses/ncurses_6.4.bb
index 2c621525f9..31f18bbadc 100644
--- a/meta/recipes-core/ncurses/ncurses_6.4.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.4.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://0001-tic-hang.patch \
            file://exit_prototype.patch \
            file://0001-Fix-CVE-2023-29491.patch \
            file://0001-Updating-reset-code-ncurses-6.4-patch-20231104.patch \
+           file://CVE-2023-50495.patch \
            "
 # commit id corresponds to the revision in package version
 SRCREV = "79b9071f2be20a24c7be031655a5638f6032f29f"
-- 
2.34.1


