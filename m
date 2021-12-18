Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232F9C433EF
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 04:54:04 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.1840.1639803242968685191
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 20:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NS8y2jX+;
 spf=pass (domain: gmail.com, ip: 209.85.215.172,
 mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 200so4106592pgg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 20:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcQduq3H6xlyIFVD24vMWMCtakgxk3J5J2CJZCufvIQ=;
        b=NS8y2jX+wGD1SQMRmsg3U5ts9IDJbboO7iNf+nuNH2wXlTKFwtV8fVTwS6TgBWPb4E
         r8z3NtzyQmqKkuuNDoZ6M3uBnWeCeLO8zMMg1EWGMwEs9bIICpymhb2rYL8Koii5sD/2
         QN0eP8YF51oJ7Q6wlpujUxx9wsY0gA7sxBjJHFjFwlmDo/7ov87VX33QxN9Jn8yDH9b9
         UKEOjWIQoTG2Sh1duPLzPlfh2MLdahQpNXHNdQMaezWIa0+S0xZkm2kK3MmCTxfRFK5I
         /rKfHbt4up6FzzG8t2DgXfCmvfjvBGuLUrVtc4qb9NBT7KCl5Ei/jSUiROG5OeEmpP35
         n7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcQduq3H6xlyIFVD24vMWMCtakgxk3J5J2CJZCufvIQ=;
        b=bEP/AxUp7c0bZOXwgYI9Vm90n0dr7SxHtLXXejK/UL5Dns4v7p6AlK6An6JukHX50/
         +vEjnRSV1VwKS2H/dueID76TyyRaWNpTqKNSHTsFBkocHSJ6ZpiCws4By4t5NrA4B2Zh
         CRGx1U3g2bhtD+wtkU2C8kgMo8Qu6CLrYKtpiq+Pv3Z/4fkE4fwW+Ls+FYuRzOzieJGq
         Zz+9lfbBFgSZRWVyXNR6hFonhRWOd+A771kmtjDU2iaiD16I+u2LVcD60LR4Q1kvDwJ8
         /7kLhnCiK8VzRzlWdp3DT7f8zeia0xirA3mjL0IPuwcJkG3dLNB2QgCMn7upmYMmVyBR
         FX8w==
X-Gm-Message-State: AOAM530jKH6pY1q1ctboyJ4fc4YMqPmxNWgbQXjgYQcqzyrxjcNfciXo
	8r3+OT4RENQP60DD7ZkYsvWafHYhdKbjJ+VzpUo=
X-Google-Smtp-Source: 
 ABdhPJzzs1Z8W819kZwvNKtx9IpA2gKV1oEmOviJv2yVEYluqs3ihxc7DbHBSHvxCltwj9QLRkYSVQ==
X-Received: by 2002:a05:6a00:1581:b0:4b1:3b03:be86 with SMTP id
 u1-20020a056a00158100b004b13b03be86mr6293356pfk.63.1639803242103;
        Fri, 17 Dec 2021 20:54:02 -0800 (PST)
Received: from ubuntu.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 w2sm8778062pgt.93.2021.12.17.20.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 20:54:01 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] git: fix CVE-2021-4069
Date: Fri, 17 Dec 2021 20:53:49 -0800
Message-Id: <20211218045349.14010-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Dec 2021 04:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159839

Use After Free in vim/vim

Upstream-Status: Backport [https://github.com/vim/vim/commit/e031fe90cf2e375ce861ff5e5e281e4ad229ebb9]
CVE: CVE-2021-4069
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


