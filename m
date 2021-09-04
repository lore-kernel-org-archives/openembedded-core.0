Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E21C433F5
	for <webhook@archiver.kernel.org>; Mon, 27 Sep 2021 10:18:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.29267.1632737903286510453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Z4n1tMyy;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: flowergom@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id 203so15337257pfy.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Sep 2021 03:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2ewtOpZXugzaN1NXF0AMQeNccx6JNJFhziUy1PeS9g=;
        b=Z4n1tMyyvvshYmpquJviFiatw/QNVbrn4oMKMt1Q/13LZ1txeD37twxCrfPotkgO4N
         ZiYVRlhotktp2Bs0OkDTnuVgHpWJEVhZQKP5OTbopFzwMvYKcYGuG8bOeMzzB6PcXY1F
         PeMcx7paHB48MAiyrG9n7Bfc82+n5BxptuO5UZkktILTOt486WUbffogVHkk2QBz6zNT
         3o7/TfIP3avlL2DPc8/1olMFylcruBJ/9WdhRvpO0IKXujt7THMT9qJVE4DpaerbGMjW
         NCW6gNtMtxEqEfYZBkw5Aot0lxJ71nHox62xu/W7/bqS1sjTGGtwpPjvu4OyHJq/QKLs
         z3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+2ewtOpZXugzaN1NXF0AMQeNccx6JNJFhziUy1PeS9g=;
        b=nR5V8szAN2pgoymheuSEvXAYBvgljiTcdgk9Eh4HeBNr5lOdsYISIHcfEIv3mOyC6h
         hbgJiXKURtXGBzXJnNYttXhboGjh4uVpDrrMW0Ii0aLcKMYm70x9hKlIbxKtB7k2XWQE
         bOp9La+13UfX11nrkG1KN933MY3UAJ49b3uMGGWZ/1gDf/jbyT3PyEPW6mWh3OD5JoGI
         MiIz8KY+XpJr1hg0sab/Jnmyo4o9S9vet8ZfpQYVwOiauviJ6Xhc9eCJSVb8c0Wzh3YV
         oj6mZYOBU8gFhqf9l3oWxUNeFJfVH+JtNIu1LDkQp1lsVZY3gpPl4OxJM1ZTlPJUkpba
         B4xg==
X-Gm-Message-State: AOAM5327SEhTvYI3m2nd8F0R4hc7J6MA8M0MxWCePygnADqCjvcrjYu2
	xnePdYGaNxxVaw1tY/xuRv5Kbzhz/kjUhWmBb6A=
X-Google-Smtp-Source: 
 ABdhPJxVrW82XV3+/SKga1DHU3GfQnaYcmq8G0v9iIjlN8WnX7tZdm6EWJaRQPB58XAX6Rx/JWYbng==
X-Received: by 2002:a63:6e41:: with SMTP id
 j62mr15858075pgc.120.1632737902163;
        Mon, 27 Sep 2021 03:18:22 -0700 (PDT)
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id
 y13sm18422320pgc.46.2021.09.27.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 03:18:21 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] vim: fix CVE-2021-3778
Date: Sat,  4 Sep 2021 13:08:21 +0900
Message-Id: <20210904040821.376601-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Sep 2021 10:18:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156380

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


