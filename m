Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB83C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:12:52 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.19521.1640182371974650153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Xr2hZuiN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso6026043pji.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4SfnGxVZDWmphTuh+0Gli1eSDbNsg7cPb2KzO5AGMoY=;
        b=Xr2hZuiNPK/uoaAU1qfSjazeMrqBy+Ib74vjJuQyYYL/Qc/wwoL+B+Cx62HmMoMIvO
         27ZJ3gnYZE2UlwKfuO906lU36FHgskkl67VxKsSmRetFLUFQuGIwTGzBQCq8QTQZMFs0
         Oivc5QtA+BbkXqj7GTpdWJ5BiCbzkR92jABcWxAemLewzipu+MiPBZDgeiAKDjar9LJ/
         KvjkbZDULI7B2XSIdB9zH0IoAMsbD1UzkYzRdgdJxjq42JxmrlrVzqYwCbPRMnG9sAJx
         HcnL7OjQL1FYeE3kR3A7rjAx/jW92xB51oOaWkUKbOWA/dB4LnTa9YcE4twAgYrGSMVo
         fDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4SfnGxVZDWmphTuh+0Gli1eSDbNsg7cPb2KzO5AGMoY=;
        b=3GUU4ntK01rXz+7lxmVCDSxPXxLD65oew6vU7ZmSy8byVj7m4DIul3PRISuTIumm2W
         fHsMvn/91ChUzui1UXjJoCYrBGXlbPeRpGASQ3oqkgrfx/lELTFu47SBk5XSYsK19LJp
         SqplymHfT4IgrgpPG76+1TX68+CVbNPC2X+NYg5b+ewgf+4kmVnLV26FarnM7zpY5MW3
         2Fg7kOYOiM7UizE+oXeAKtc5bTSH3HqKu0NlDmJNoYq90caYsh3fFgbEvUwvxxv/3egI
         LxE6x9uWnCE/ST7lWGmTAopQUZVDEslXlkIKD/UGL2PMz4nmKVlZgfhtdom5dRdoiBPH
         hjRw==
X-Gm-Message-State: AOAM5304ynO56XxAnRYqoA0tnChfX1oMEuCHTy4zu29kFvRzWY8ENnZa
	AAYgCGzNapP2Y635pZiM3A2nPSKH4+plaX4+
X-Google-Smtp-Source: 
 ABdhPJyE8OQUGiTTOqWPVVBp4bO49viZG14GAFT2IgXcU5PuKueTttwa4jscWF3xAsMI/3WukgbaIQ==
X-Received: by 2002:a17:90a:8041:: with SMTP id
 e1mr1566460pjw.60.1640182371029;
        Wed, 22 Dec 2021 06:12:51 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.12.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:12:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] vim: fix CVE-2021-4069
Date: Wed, 22 Dec 2021 04:12:17 -1000
Message-Id: 
 <9db3b4ac4018bcaedb995bc77a9e675c2bca468f.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:12:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159949

From: Minjae Kim <flowergom@gmail.com>

Use After Free in vim/vim

Upstream-Status: Backport [https://github.com/vim/vim/commit/e031fe90cf2e375ce861ff5e5e281e4ad229ebb9]
CVE: CVE-2021-4069
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/CVE-2021-4069.patch             | 43 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-4069.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-4069.patch b/meta/recipes-support/vim/files/CVE-2021-4069.patch
new file mode 100644
index 0000000000..6a67281907
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-4069.patch
@@ -0,0 +1,43 @@
+From cd2422ee2dab3f33b2dbd1271e17cdaf8762b6d1 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Fri, 17 Dec 2021 20:32:02 -0800
+Subject: [PATCH] using freed memory in open command
+
+Problem:    Using freed memory in open command.
+Solution:   Make a copy of the current line.
+
+Upstream-Status: Backported [https://github.com/vim/vim/commit/e031fe90cf2e375ce861ff5e5e281e4ad229ebb9]
+CVE: CVE-2021-4069
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ src/ex_docmd.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/ex_docmd.c b/src/ex_docmd.c
+index 59e245bee..ccd9e8bed 100644
+--- a/src/ex_docmd.c
++++ b/src/ex_docmd.c
+@@ -6029,13 +6029,17 @@ ex_open(exarg_T *eap)
+ 	regmatch.regprog = vim_regcomp(eap->arg, p_magic ? RE_MAGIC : 0);
+ 	if (regmatch.regprog != NULL)
+ 	{
++            // make a copy of the line, when searching for a mark it might be
++	    // flushed
++	    char_u *line = vim_strsave(ml_get_curline());
++
+ 	    regmatch.rm_ic = p_ic;
+-	    p = ml_get_curline();
+-	    if (vim_regexec(&regmatch, p, (colnr_T)0))
+-		curwin->w_cursor.col = (colnr_T)(regmatch.startp[0] - p);
++	    if (vim_regexec(&regmatch, line, (colnr_T)0))
++		curwin->w_cursor.col = (colnr_T)(regmatch.startp[0] - line);
+ 	    else
+ 		emsg(_(e_nomatch));
+ 	    vim_regfree(regmatch.regprog);
++	    vim_free(line);
+ 	}
+ 	// Move to the NUL, ignore any other arguments.
+ 	eap->arg += STRLEN(eap->arg);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 11fed67527..51a6861325 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-patch-8.2.3581-reading-character-past-end-of-line.patch \
            file://0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch \
            file://0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch \
+	   file://CVE-2021-4069.patch \
            "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.25.1


