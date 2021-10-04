Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C196C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:02 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.10120.1633357261131672966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ww6FCAjr;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id g184so16692109pgc.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ckfynAMMaSFlJBDDA3jHTPQ55/ng+ngNNX4osm6EHzo=;
        b=ww6FCAjrI1ZtueQlQk4ISXCR3pO1w9NjfzYiMQEMJCDAXdwH6+JqON4r9hqaSAWjHo
         frct48LNAtYHxz/5f1GuhOOERKk+difuT4loZnKglXdroVMO/ldUvQjC4zlnINyfmNSi
         /8S9VrMXUwuWpfbXqqQtv5R6fkFOJGqHwJJOc53jwociLnJmhN+O+fmA0KUq57Fc/KBs
         sIMFAZ4/Lbs8X+D8UhYF1WpujhajsYSoeDyHllX1ccLgvkU3RbOJ6w8/12iU/ICn1/U4
         Q357cb963P7QLdzCiDS4yq4tfwJx3jf3yE/RDd5YpI02mZ4F+rAW37ulZ8bXAwYs8Qmk
         4bwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckfynAMMaSFlJBDDA3jHTPQ55/ng+ngNNX4osm6EHzo=;
        b=y6mAR8T7ZINhDSyKI70CzTHvbK8lHidu/Nug2J1AZf2J+OSC7qgvwjjwgdP0OaWlrT
         yVJ8AMpPBTRy1ZHhLM/ujUO24g5EuS1krsANeTInG7KM+cmcZy2WGUx00JaQsov/G0em
         LTJwlsxOfFYpSRdk1se8Q6w6qDA8RU6Ik6l0RgnT7GJ5FdSKlDI70qfi+dxoVG1247Xw
         DAKbCElRoJN54uqCQZ1xG2kQkTLIsYLnzV6Gna6WExpDNt4Xc50gb9cvtZZQfLmayB9S
         ZYmLU4Ewl8XSma47hUHil6xjiL+ei3Jy21PpZq5AsH2nfGGcqNRF79TaQoyjIjfBoOAK
         nLgA==
X-Gm-Message-State: AOAM532H4BRofgORtT3x2QB0aHxfHpHl5lWS8a/TZnFjUwLdZwc2/aD9
	jkqBfscT4jjugWdXhliC9i/WtLYTyLoaIYBhNEE=
X-Google-Smtp-Source: 
 ABdhPJwS52VwoxALqOPspYBBJ3Hd4f+b4fDu/kxMn/oc53DUoaN5WSaZxkDBNAXJckQXG7gbTtqG8w==
X-Received: by 2002:a65:6187:: with SMTP id c7mr11151794pgv.317.1633357260102;
        Mon, 04 Oct 2021 07:21:00 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:20:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/15] vim: fix CVE-2021-3778
Date: Mon,  4 Oct 2021 04:18:29 -1000
Message-Id: 
 <0fb9be3925f258a7e8009c581c1cf93ace2a498b.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156594

From: Minjae Kim <flowergom@gmail.com>

vim is vulnerable to Heap-based Buffer Overflow

reference:
https://github.com/vim/vim/commit/65b605665997fad54ef39a93199e305af2fe4d7f
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index ecaba7107e..fc4e205b74 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://no-path-adjust.patch \
            file://racefix.patch \
            file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
+	   file://CVE-2021-3778.patch \
 "
 
 SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
-- 
2.25.1


