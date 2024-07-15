Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C36C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 17:47:16 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.1721.1721065630892598145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 10:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HgxBHt3z;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ca867b23bfso2920217a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 10:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721065630; x=1721670430; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9Pnc9f7UmW5MIY3nlbY5J5g/qNoa6Ach6RrHUtwSGE=;
        b=HgxBHt3zWwO92SQ8A0nKJ4Q/w4pDHcObnnRVzd/r3hO0PM9CrwMGU8CwKCUV0QoaWJ
         ABuLA9V3nDfBDoJytVs7yoquUpNq13t1RFl7NF2il5hXBrucORsqu7HaC0bohrc1OILM
         Q3A6+8g38qtUB3m6PomFGALq6Ul+BxZVECxEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721065630; x=1721670430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9Pnc9f7UmW5MIY3nlbY5J5g/qNoa6Ach6RrHUtwSGE=;
        b=Td0LybAo3iTX3LWOwEJj7XQicSZU+/wL0zmUbNNNyJx6I/uTEPpdj1Qmvv2gtygI/R
         bLguwMpV3X/sy1vvWWcaNqhNdW9ARJ+dDEMpXaCZCVZ4H9TlVwoMVex3sF+RrKMwBsy6
         wR5ZCYsgnMMJ/a1KMXyTWVTzhJkxz6a9WH/HfjovmxD3TN5RqzrqRdc5eyN9sOx4nYN3
         ejmBgPcrygOrz2ZP+2Yiv81l7ZzPc1vAY3QylMzaYvI5KVcsK/ywnmRGEO0k1qtpYVXG
         BUvP6C0KjbEWtVKW5EQ4Kn/gSxGErPcT6X1CpCf2/hMDBIVx+SBlSMgxiI9vHH9xurll
         77iA==
X-Gm-Message-State: AOJu0YwOcmG8prm6Pckuau7B58kDK2/24TDuA3Fvt+8nIF2iOv6Hu8XJ
	bJGfg/rsVtTTbYNk8vsoNGpZWzFWJErjGuuPK9/wX5h/5eqpOUVoRcmJK96mBYKQRyQsPgqomrj
	b
X-Google-Smtp-Source: AGHT+IGWXCEy/lsy7EWTsYkb2TI8c58CK38Aam9ZLBsByyBUMEOvwUNv5eHuMKnBi+OX+Uwql2AbyQ==
X-Received: by 2002:a17:90a:c291:b0:2c9:7e20:f834 with SMTP id 98e67ed59e1d1-2ca35d5496dmr13605726a91.40.1721065629893;
        Mon, 15 Jul 2024 10:47:09 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.83.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd6da488sm6717772a91.40.2024.07.15.10.47.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2024 10:47:09 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Mon, 15 Jul 2024 23:14:53 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] ruby: backport fix for CVE-2024-27282 Arbitrary memory address read vulnerability with Regex search
Date: Mon, 15 Jul 2024 23:14:51 +0530
Message-Id: <20240715174451.7373-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 17:47:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201939

Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../ruby/ruby/CVE-2024-27282.patch            | 29 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
new file mode 100644
index 0000000000..5d64a51488
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2024-27282.patch
@@ -0,0 +1,29 @@
+From 989a2355808a63fc45367785c82ffd46d18c900a Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 12 Apr 2024 15:01:47 +1000
+Subject: [PATCH] Fix Use-After-Free issue for Regexp
+
+Co-authored-by: Isaac Peka <7493006+isaac-peka@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/989a2355808a63fc45367785c82ffd46d18c900a]
+CVE: CVE-2024-27282
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+ regexec.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/regexec.c b/regexec.c
+index 73694ab14a0b0a..140691ad42489f 100644
+--- a/regexec.c
++++ b/regexec.c
+@@ -3449,8 +3449,8 @@ match_at(regex_t* reg, const UChar* str, const UChar* end,
+     CASE(OP_MEMORY_END_PUSH_REC)  MOP_IN(OP_MEMORY_END_PUSH_REC);
+       GET_MEMNUM_INC(mem, p);
+       STACK_GET_MEM_START(mem, stkp); /* should be before push mem-end. */
+-      STACK_PUSH_MEM_END(mem, s);
+       mem_start_stk[mem] = GET_STACK_INDEX(stkp);
++      STACK_PUSH_MEM_END(mem, s);
+       MOP_OUT;
+       JUMP;
+ 
diff --git a/meta/recipes-devtools/ruby/ruby_3.1.3.bb b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
index 2ad3c9e207..05e65d466a 100644
--- a/meta/recipes-devtools/ruby/ruby_3.1.3.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.1.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://CVE-2023-36617_1.patch \
            file://CVE-2023-36617_2.patch \
            file://CVE-2024-27281.patch \
+           file://CVE-2024-27282.patch \
            "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
-- 
2.35.7


