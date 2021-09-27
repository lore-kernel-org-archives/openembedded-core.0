Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263DDC433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 10:44:43 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.29462.1632739482700527784
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PYwzJwlo;
 spf=pass (domain: gmail.com, ip: 209.85.215.180,
 mailfrom: flowergom@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id k24so17409769pgh.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sG5FjILLcDtf1EqBHd9qWpH8jHfVPjI4QNz8v4mZOLs=;
        b=PYwzJwloEQuI2E8vxcwtIiCaZQ964446ESFv7vgL8kHCRqj7UYCdp0ysxGT4USUCFj
         b/XkC6CWB0lMEL3/44ukPccSD+QaFHEYOCzfcbZGN9nrUFiOA6UzjRnyVXBDBHvq/1St
         d0THPxCRhIe9oz0TaPOT8mb7XOE8kxHuCAkDiMBdtSMRJCrp7iWPS5gQtIr4VrTO7n/b
         I78xbPbJaKapuYz3rFtpOhqLN4aw5MVucAkiUf69GSGuigc1eZN+blbyt9TpMSuYNZaw
         msQ9Ukcvon3lUtIxVAAeixjQdhGgInmIUVEDx5VY6qNGsIEr7jqJJFI6A1yrMZYWArID
         lCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sG5FjILLcDtf1EqBHd9qWpH8jHfVPjI4QNz8v4mZOLs=;
        b=2FrZ3x6u0xhRR4bmR5PGVV388C7FZy7sSQq6uBiBXYr4xsMQoY1eQ0ouv1NZRfjX/M
         5Vn67Qbx2g0Q73Bv9VB191GsiiFjvQof5fXhh8qoU+QLfbPZK2nVmmXXURck+kCK972m
         4sTBEgfbtekWFST719Z9A8BPPnmuadkCvNf2T5tQdpNDcDUg8ONbTuP4DHh2rtJAK9Fw
         gBLiIE3lCZtDxN0KCftla+CIlQOhtPPjI2Yd5Z8CWime3gob6TFkc8k8rlAEtf+LW5hI
         /5BieNBRHdWx0HaUlhkDKfV85CGPW66/vhw3PAQXMaBISL8NfnIC20jk2MnkbFml6v8x
         40oA==
X-Gm-Message-State: AOAM530kji5uAxgwWhsKe6/L9Gsqmwn7y+YqrQ9ZlqBY0FezM/EAg+Kb
	FwY+auyryniq56AGp1uYE0eNRbQCVrulc6ByHKY=
X-Google-Smtp-Source: 
 ABdhPJy1EQ2hxeBfAOacn/vIC2BO92ZsNcT450nxGMymSdMYlCR84NEft37sUdSog/zeP/l5EUEd4w==
X-Received: by 2002:a62:7508:0:b0:43d:d9cf:1f95 with SMTP id
 q8-20020a627508000000b0043dd9cf1f95mr22831411pfc.4.1632739481702;
        Mon, 27 Sep 2021 03:44:41 -0700 (PDT)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 mp24sm3908827pjb.41.2021.09.27.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 03:44:41 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] vim: fix CVE-2021-3778
Date: Mon, 27 Sep 2021 19:44:30 +0900
Message-Id: <20210927104430.414250-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 10:44:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156382

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
index 0000000000..9cb61a6ac7
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
+               match = FALSE;
+               break;
+           }
+-          len2 += MB_CHAR2LEN(c2);
++          len2 += enc_utf8 ? utf_ptr2len(rex.line + col + len2)
++                                                           : MB_CHAR2LEN(c2);
+       }
+       if (match
+               // check that no composing char follows
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
index 7e9225fbcb..db1e9caf4d 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://no-path-adjust.patch \
            file://racefix.patch \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
+          file://CVE-2021-3778.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.25.1


