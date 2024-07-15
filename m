Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA90FC3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 18:38:22 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.317.1721068696499857390
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 11:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZF4qcjjp;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: asharma@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-75c3afd7a50so2891747a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 11:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721068696; x=1721673496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P9Pnc9f7UmW5MIY3nlbY5J5g/qNoa6Ach6RrHUtwSGE=;
        b=ZF4qcjjp+KdPGAPxj6bXYQwBsLK3SQYV29Q/WEgMdKOvlXhl6iYAsDnrt8UJ48aADu
         l13Uqll1DLzeJAm5+2Nb1F0M8+jik3KPkXs/CEeGZeqfHAOwcHexp6re9gWTQ7DfvIa5
         iZCx3VfkkvRbMXLFAxkIOAH7888E3MaGiWLu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721068696; x=1721673496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P9Pnc9f7UmW5MIY3nlbY5J5g/qNoa6Ach6RrHUtwSGE=;
        b=l8CvUcyvmEe1F0jIV16lPVGm7DHeLMQwiJp4v1L11XUeOCPZhKZpECT+4QSOddYcB9
         QWFi7Cbeho6x5sgI4SgnWjxN+5dH39mEZZUVEACiMipD5P11pzBPw5MO7WM3pK13/bWz
         LXMOr8ER5znlRDrCeNOSTxDnFGhqaw9OLSAicxdvUs+0T0y2ssJ75oocK31vM0kSA7qd
         s85F75+Jq99V2954T25ab1FS8/B3csmBj7kJ8W9en0S8x8R5dOGC4TlcWd6WWt2YmSLr
         1OlIoTx1fx4xdH2od2keHLzoUocwJANdTR9oEUtUByJqBMw4cMYHXA3SrynZCozy4Mi4
         Gh6g==
X-Gm-Message-State: AOJu0YxC5rGOxs8N9+GJ3LeSF0DJ6fzjIANbVgsZgwtqdPPyuqQxQb83
	oM0cIqve5yphh4tCV1mSvAAAHhQhCwbeYtKOE8XaDgjwCQLvGhZNzE6Pkylw7nX5F8vhPM+8COW
	b
X-Google-Smtp-Source: AGHT+IGGd0PhtNtNCAyPFRM9UcuVDyTfREMMdTmBeNGXAbIdxpdt7x3EqwoR/6nC/8IIhfNyVpEE9w==
X-Received: by 2002:a05:6a21:1690:b0:1c2:8c32:1380 with SMTP id adf61e73a8af0-1c3ee5c4a16mr962563637.35.1721068695535;
        Mon, 15 Jul 2024 11:38:15 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.83.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd70376asm6730133a91.50.2024.07.15.11.38.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2024 11:38:15 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Tue, 16 Jul 2024 00:05:58 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] ruby: backport fix for CVE-2024-27282
Date: Tue, 16 Jul 2024 00:05:57 +0530
Message-Id: <20240715183557.17104-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 18:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201942

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


