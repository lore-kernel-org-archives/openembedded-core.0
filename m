Return-Path: <rahulchauhankitps@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A996C433FE
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 12:50:39 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.10085.1651495830500636135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 05:50:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=grEK4MWr;
 spf=pass (domain: gmail.com, ip: 209.85.216.50,
 mailfrom: rahulchauhankitps@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so16055142pjq.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=g5sgT/hhLsGBz+M+IVYQAXHKC+XY9ivm/TO7fqOVPNs=;
        b=grEK4MWrqJ9ZZuBlMWOuNRrl5chGCp3tSFMdTZBuIXst3Q9rg/RrYk1npnFF4Vx7Z3
         MnKcEF/ZKY7s/KsfTAaGmJGHPKsQbyVkM6SG6Yu0Y1SBcyfYjtDQHkKd3Jv8Uvuhj8uY
         DZENTIENmhJ5tp+Wt2ZopRu0C9Cs0FGFUndY83NltqGJQk7CXsGicOWThGtTeHe4oWVL
         i2YBkQNb6anTWQI9sU7533Rr36iBrYhiYZQM6OmNWJ9ndUIFxmephm5j9HK8qsAU4LxE
         /9mldbRCphuW0iSFrthkOniV4DeUtiikdeBVVQtfDFfRdktB4rmo5IpdWkHdFyrVmtc6
         +YBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=g5sgT/hhLsGBz+M+IVYQAXHKC+XY9ivm/TO7fqOVPNs=;
        b=zHf/zmSx4DT58BiOs/UdvIJ3oJ8UZXZBPYxvDCFe4clmsGrZf26MoJauleuynaR/HG
         aXXOoTeiK0CkLfKV5x2wuNfOIVKjxr34CjdoZCgP0J9a7hC7UUgBSluK6/hwGpayWo0E
         uEZfvkqaAO7JxqVYjiZEuLyp9flSdj2XO/0cawNcvB8/RxfhhbNK+eov7o8LIvaSqfj6
         haVszl5WCQT2HDQ41Xug8k541TWWI0wOs4ya5VXkO58X4ZjMNrDzydv6Pf3k57V+Tfid
         Vz8YGa1DsRwBoURPPLq3WazO6TKrZUL/Zn3s6k1zr+Ewkp8eTghE84In9yytfWx6/yGb
         7MjQ==
X-Gm-Message-State: AOAM531ZsWUUfzEGurcGlXJO4oiu9Mk8bmmW3mBZB/sMgH+JiTIUTjfe
	Kw5l04gCJR6zckISW4648tvlJHKfcFSdFg==
X-Google-Smtp-Source: 
 ABdhPJzwURr8/e4wZQS1Th2Tbht8FI+KvGJRm9jkrDa/4B7pvy08ahyB3wZaG+ZurmsET+PmePUEwg==
X-Received: by 2002:a17:902:e742:b0:15e:9a7b:24c3 with SMTP id
 p2-20020a170902e74200b0015e9a7b24c3mr7624598plf.17.1651495829790;
        Mon, 02 May 2022 05:50:29 -0700 (PDT)
Received: from rahul.Optilink ([103.211.17.117])
        by smtp.gmail.com with ESMTPSA id
 lw4-20020a17090b180400b001d7faf357b7sm21522226pjb.4.2022.05.02.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 05:50:29 -0700 (PDT)
From: Rahul Chauhan <rahulchauhankitps@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Rahul Chauhan <rahulchauhankitps@gmail.com>
Subject: [PATCH 1/2] vim: Security Fix For CVE-2022-1381
Date: Mon,  2 May 2022 18:20:11 +0530
Message-Id: <20220502125012.11630-1-rahulchauhankitps@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 12:50:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165165

CVE: CVE-2022-1381

Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
---
 .../vim/files/CVE-2022-1381.patch             | 111 ++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2022-1381.patch

diff --git a/meta/recipes-support/vim/files/CVE-2022-1381.patch b/meta/recipes-support/vim/files/CVE-2022-1381.patch
new file mode 100644
index 0000000000..1b0e129746
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2022-1381.patch
@@ -0,0 +1,111 @@
+From 6a6cb529c7a8bda2c45964137d7c8df9c2623d51 Mon Sep 17 00:00:00 2001
+From: Bram Moolenaar <Bram@vim.org>
+Date: Sat, 16 Apr 2022 18:52:17 +0100
+Subject: [PATCH] patch 8.2.4763: using invalid pointer with "V:" in Ex mode
+
+Problem:    Using invalid pointer with "V:" in Ex mode.
+Solution:   Correctly handle the command being changed to "+".
+
+Upstream-Status: Backport [https://github.com/vim/vim/commit/f50808ed135ab973296bca515ae4029b321afe47]
+CVE-2022-1381
+
+Signed-off-by: Rahul Chauhan <rahulchauhankitps@gmail.com>
+---
+ src/ex_docmd.c               | 29 ++++++++++++++++++++++++-----
+ src/testdir/test_ex_mode.vim | 13 +++++++++++++
+ src/version.c                |  2 ++
+ 3 files changed, 39 insertions(+), 5 deletions(-)
+
+diff --git a/src/ex_docmd.c b/src/ex_docmd.c
+index c12f151c3..9d3f1b420 100644
+--- a/src/ex_docmd.c
++++ b/src/ex_docmd.c
+@@ -2782,7 +2782,9 @@ parse_command_modifiers(
+ 	cmdmod_T    *cmod,
+ 	int	    skip_only)
+ {
++    char_u  *orig_cmd = eap->cmd;
+     char_u  *cmd_start = NULL;
++    int	    did_plus_cmd = FALSE;
+     char_u  *p;
+     int	    starts_with_colon = FALSE;
+     int	    vim9script = in_vim9script();
+@@ -2818,6 +2820,7 @@ parse_command_modifiers(
+ 			&& curwin->w_cursor.lnum < curbuf->b_ml.ml_line_count)
+ 	{
+ 	    eap->cmd = (char_u *)"+";
++	    did_plus_cmd = TRUE;
+ 	    if (!skip_only)
+ 		ex_pressedreturn = TRUE;
+ 	}
+@@ -3100,13 +3103,29 @@ parse_command_modifiers(
+ 	    // Since the modifiers have been parsed put the colon on top of the
+ 	    // space: "'<,'>mod cmd" -> "mod:'<,'>cmd
+ 	    // Put eap->cmd after the colon.
+-	    mch_memmove(cmd_start - 5, cmd_start, eap->cmd - cmd_start);
+-	    eap->cmd -= 5;
+-	    mch_memmove(eap->cmd - 1, ":'<,'>", 6);
++	    if (did_plus_cmd)
++	    {
++		size_t len = STRLEN(cmd_start);
++
++		// Special case: empty command may have been changed to "+":
++		//  "'<,'>mod" -> "mod'<,'>+
++		mch_memmove(orig_cmd, cmd_start, len);
++		STRCPY(orig_cmd + len, "'<,'>+");
++	    }
++	    else
++	    {
++		mch_memmove(cmd_start - 5, cmd_start, eap->cmd - cmd_start);
++		eap->cmd -= 5;
++		mch_memmove(eap->cmd - 1, ":'<,'>", 6);
++	    }
+ 	}
+ 	else
+-	    // no modifiers, move the pointer back
+-	    eap->cmd -= 5;
++	    // No modifiers, move the pointer back.
++	    // Special case: empty command may have been changed to "+".
++	    if (did_plus_cmd)
++		eap->cmd = (char_u *)"'<,'>+";
++	    else
++		eap->cmd = orig_cmd;
+     }
+ 
+     return OK;
+diff --git a/src/testdir/test_ex_mode.vim b/src/testdir/test_ex_mode.vim
+index 2642a16d2..d981ced6b 100644
+--- a/src/testdir/test_ex_mode.vim
++++ b/src/testdir/test_ex_mode.vim
+@@ -250,5 +250,18 @@ func Test_ex_mode_large_indent()
+   bwipe!
+ endfunc
+ 
++" This was accessing illegal memory when using "+" for eap->cmd.
++func Test_empty_command_visual_mode()
++  let lines =<< trim END
++      r<sfile>
++      0norm0V:
++      :qall!
++  END
++  call writefile(lines, 'Xexmodescript')
++  call assert_equal(1, RunVim([], [], '-u NONE -e -s -S Xexmodescript'))
++
++  call delete('Xexmodescript')
++endfunc
++
+ 
+ " vim: shiftwidth=2 sts=2 expandtab
+diff --git a/src/version.c b/src/version.c
+index 79a3bad67..38c3e69b6 100644
+--- a/src/version.c
++++ b/src/version.c
+@@ -750,6 +750,8 @@ static char *(features[]) =
+ 
+ static int included_patches[] =
+ {   /* Add new patch number below this line */
++/**/
++    4763,
+ /**/
+     4681,
+ /**/
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 21ff036cf4..c78e53007e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+           file://CVE-2022-1381.patch \
            "
 
 PV .= ".4681"
-- 
2.17.1


