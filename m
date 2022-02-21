Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2F1C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:34:52 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.3369.1645472091184542681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2BNVQwhd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 gf13-20020a17090ac7cd00b001bbfb9d760eso116271pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vGb3h37kVKN44Xin29pc2FJtHaMbHWTWGDTl5TiupCY=;
        b=2BNVQwhdNwhkwgAW2LzbL0KfZ/K+fyqCwilo4DW6d2Xwdr2Jd0nAbIfinFz8Y+La9H
         dO9Z4+reEQyatvNbSIkvjv8BUDwHIjJ6HbzF2H3UlARFMl5M89iIu8piuhaka+fvsuBR
         5ezOiJbXyCIS0CFTcwJvbEZ1dezUes71iXlCcT0aOPiH7v+k3PVGHm0jVtM1YoP4vz+z
         2UO905/tnTXfoxs3H8WK714du7woRTQp10NYNvQ46CkBa4MoNSpzj7FuHXbDjknDuYec
         qwnRabtwSxPwxKZ8uFZqFpjOamUtvoIhZJEP5KUMuPp7M0xWQN4LOzpYqOwPDTvRhsUw
         oucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vGb3h37kVKN44Xin29pc2FJtHaMbHWTWGDTl5TiupCY=;
        b=CZj683qhevq6EPt+BTdolfWyht8deTUgn4txr7/TvYXS+sQEanWjpS9fDiWhODmjo/
         h7hf/GVpR9gIWa59oYKfMwx88ErJ6UWfg8i3U1xy+4HkHOlugFJO8ytn1k3onlqtb+Dd
         thqTNHtaFVBJJHkCj5bdqcHn74J+zrdTVErkwjqxXDseuiP/riCtLxgfwWxfgyybBUg7
         NEq4HI5+ZqaF62sJY1uYVE/Sy0t+rMvuXABMdBINUpO5OhDF2TBxgWz7cna42hBWs4dP
         ntM6nUT25dg8n1fA1nHnONKa3+QYcLGXD7gueZqNo1fCoTEXkJNPK/EIg3NoeiZbKUaB
         wntQ==
X-Gm-Message-State: AOAM530bsc6FxrVqXEzhz5ZFKMEhZF0FfFlw3z2T1OxFhJs+NL8MOe1l
	Y6SGFF1Z33mCpfr6yBxwtmIDNAr2HBJaQ4q/
X-Google-Smtp-Source: 
 ABdhPJxEIWzIChap+GxpNVknad0wHkNLIhyItr97WFWosK5fkjSvxBz//oPMIs7uRyBlYn2+pIhHmQ==
X-Received: by 2002:a17:902:8ec6:b0:14f:a7cd:7dfa with SMTP id
 x6-20020a1709028ec600b0014fa7cd7dfamr8303162plo.141.1645472090140;
        Mon, 21 Feb 2022 11:34:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.34.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:34:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/8] Revert "vim: fix CVE-2021-4069"
Date: Mon, 21 Feb 2022 09:34:22 -1000
Message-Id: 
 <519f30e697f14d6a3864a22ec2e12544a9d3a107.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
References: <cover.1645465376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:34:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162068

Prepare to cherry-pick CVE fixes from master

This reverts commit 9db3b4ac4018bcaedb995bc77a9e675c2bca468f.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../vim/files/CVE-2021-4069.patch             | 43 -------------------
 meta/recipes-support/vim/vim.inc              |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-support/vim/files/CVE-2021-4069.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-4069.patch b/meta/recipes-support/vim/files/CVE-2021-4069.patch
deleted file mode 100644
index 6a67281907..0000000000
--- a/meta/recipes-support/vim/files/CVE-2021-4069.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From cd2422ee2dab3f33b2dbd1271e17cdaf8762b6d1 Mon Sep 17 00:00:00 2001
-From: Minjae Kim <flowergom@gmail.com>
-Date: Fri, 17 Dec 2021 20:32:02 -0800
-Subject: [PATCH] using freed memory in open command
-
-Problem:    Using freed memory in open command.
-Solution:   Make a copy of the current line.
-
-Upstream-Status: Backported [https://github.com/vim/vim/commit/e031fe90cf2e375ce861ff5e5e281e4ad229ebb9]
-CVE: CVE-2021-4069
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
----
- src/ex_docmd.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/ex_docmd.c b/src/ex_docmd.c
-index 59e245bee..ccd9e8bed 100644
---- a/src/ex_docmd.c
-+++ b/src/ex_docmd.c
-@@ -6029,13 +6029,17 @@ ex_open(exarg_T *eap)
- 	regmatch.regprog = vim_regcomp(eap->arg, p_magic ? RE_MAGIC : 0);
- 	if (regmatch.regprog != NULL)
- 	{
-+            // make a copy of the line, when searching for a mark it might be
-+	    // flushed
-+	    char_u *line = vim_strsave(ml_get_curline());
-+
- 	    regmatch.rm_ic = p_ic;
--	    p = ml_get_curline();
--	    if (vim_regexec(&regmatch, p, (colnr_T)0))
--		curwin->w_cursor.col = (colnr_T)(regmatch.startp[0] - p);
-+	    if (vim_regexec(&regmatch, line, (colnr_T)0))
-+		curwin->w_cursor.col = (colnr_T)(regmatch.startp[0] - line);
- 	    else
- 		emsg(_(e_nomatch));
- 	    vim_regfree(regmatch.regprog);
-+	    vim_free(line);
- 	}
- 	// Move to the NUL, ignore any other arguments.
- 	eap->arg += STRLEN(eap->arg);
--- 
-2.25.1
-
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 51a6861325..11fed67527 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -26,7 +26,6 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-patch-8.2.3581-reading-character-past-end-of-line.patch \
            file://0002-patch-8.2.3582-reading-uninitialized-memory-when-giv.patch \
            file://0002-patch-8.2.3611-crash-when-using-CTRL-W-f-without-fin.patch \
-	   file://CVE-2021-4069.patch \
            "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.25.1


