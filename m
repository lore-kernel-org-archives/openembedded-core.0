Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAFBC433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 10:20:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.29281.1632738046303789332
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D6jr4eJY;
 spf=pass (domain: gmail.com, ip: 209.85.215.174,
 mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id e7so17390759pgk.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2ewtOpZXugzaN1NXF0AMQeNccx6JNJFhziUy1PeS9g=;
        b=D6jr4eJYh8SPzo8YRAaVYKo2eDqnhqZknj9LeoBJNKw8AG3Ao9pmog+StDholTLu3i
         J1hOuZEilFgdlNi2G0n1oLtYvAkBuoMHqqeuQ7ex7o2m62YBqWlebHlhPK9lkNl9gtPA
         /Kalr8C0kXRSm6q3S8S4kTi5+DCIPaThB/xc/hRKvSJxbC6P12w3LcsSK7yEtZYFBu4B
         LtBnRb2q0/oZuXNL1EanioDUsA46BnoQUuRMN1kvBrU77L5WrnNOTkRNEJ+VbSCbkiQr
         u1q1O/bhO9/Ysg2NibBqsfLRFIN7MZhqJpn7mXKPUodAeugrIx+o4NO1UVej3jAeta5O
         wK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2ewtOpZXugzaN1NXF0AMQeNccx6JNJFhziUy1PeS9g=;
        b=OySWRSPq3TY0iP1oFlfd2CPiZI6/VPTE83x8gH/YRwQlU2FUWKUQL0etm26t8zPs6z
         Zhcu9TE/qMmJE5hpubRO+VRHuUBPRVmyKq/QONnPF7BuVUVPxR4O/qVEu97OCOM40mUw
         b/qUOzyKRcNet8n/qkFMEuIDReaVqJPPdXIB45TtdjaXmAVBcD3D358eBTj2mW207SZ4
         YpGvRs6sLT9WA0IDYL8pBWqlCvvfXWiSp841HnQoovfvLz15szPWHI9+uj+YiMclTsdV
         upHpKqDYZdonbZXYuWZ8ymptA9Toxp+5wIgurVLRK0y5RAGI/FnoYP8hHGtjeD/hrJ0S
         zzwQ==
X-Gm-Message-State: AOAM5319IZbISnnLW+CVWTUDh94c6f6mI63o0+MDpPqSchEuPQDP1Rhb
	TvyRQ4T/K7ToVqL7OAnDmPJXNtfH4noQw8+gJso=
X-Google-Smtp-Source: 
 ABdhPJy3bElhS7qVtk0eGum0EcvpbP/Vtkb0JxXoFaFEzxrP/i67FaHMKwnaLQlj3CLnvzMyCq/twg==
X-Received: by 2002:a62:5f03:0:b0:445:38d5:98bd with SMTP id
 t3-20020a625f03000000b0044538d598bdmr22691992pfb.81.1632738045305;
        Mon, 27 Sep 2021 03:20:45 -0700 (PDT)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 p15sm13551706pfn.31.2021.09.27.03.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 03:20:44 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [hardknott][PATCH] vim: fix CVE-2021-3778
Date: Mon, 27 Sep 2021 19:20:36 +0900
Message-Id: <20210927102036.378535-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 10:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156381

vim is vulnerable to Heap-based Buffer Overflow

reference:
https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f
---
 .../vim/files/CVE-2021-3778.patch             | 49 +++++++++++++++++++
 meta/recipes-support/vim/vim.inc              |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3778.patch

diff --git a/meta/recipes-support/vim/files/CVE-2021-3778.patch b/meta/recipes-support/vim/files/CVE-2021-3778.patch
new file mode 100644
index 0000000000..9e1c4d29be
--- /dev/null
+++ b/meta/recipes-support/vim/files/CVE-2021-3778.patch
@@ -0,0 +1,49 @@
+From eb41373c8c88b0789e5cf04669d6116f9a199264 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Sun, 26 Sep 2021 23:48:00 +0000
+Subject: [PATCH] patch 8.2.3409: reading beyond end of line with invalid utf-8
+ character
+
+Problem: Reading beyond end of line with invalid utf-8 character.
+Solution: Check for NUL when advancing.
+
+Upstream-Status: Accepted [https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f]
+CVE: CVE-2021-3778
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ src/regexp_nfa.c                 | 3 ++-
+ src/testdir/test_regexp_utf8.vim | 7 +++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/src/regexp_nfa.c b/src/regexp_nfa.c
+index fb512f961..4d337f1f1 100644
+--- a/src/regexp_nfa.c
++++ b/src/regexp_nfa.c
+@@ -5455,7 +5455,8 @@ find_match_text(colnr_T startcol, int regstart, char_u *match_text)
+ 		match = FALSE;
+ 		break;
+ 	    }
+-	    len2 += MB_CHAR2LEN(c2);
++	    len2 += enc_utf8 ? utf_ptr2len(rex.line + col + len2)
++		                                             : MB_CHAR2LEN(c2);
+ 	}
+ 	if (match
+ 		// check that no composing char follows
+diff --git a/src/testdir/test_regexp_utf8.vim b/src/testdir/test_regexp_utf8.vim
+index 19ff882be..e0665818b 100644
+--- a/src/testdir/test_regexp_utf8.vim
++++ b/src/testdir/test_regexp_utf8.vim
+@@ -215,3 +215,10 @@ func Test_optmatch_toolong()
+   set re=0
+ endfunc
+ 
++func Test_match_invalid_byte()
++  call writefile(0z630a.765d30aa0a.2e0a.790a.4030, 'Xinvalid')
++  new
++  source Xinvalid
++  bwipe!
++  call delete('Xinvalid')
++endfunc
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 6fe8fb90db..2c6d7a9ec5 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://0001-src-Makefile-improve-reproducibility.patch \
            file://no-path-adjust.patch \
            file://racefix.patch \
+	   file://CVE-2021-3778.patch \
 "
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
 
-- 
2.25.1


