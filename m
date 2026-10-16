Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A7DCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 11:26:17 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19387.1792149970665460305
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 04:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iAswAB7t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49ff680331aso33654445e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 04:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792149969; x=1792754769; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LqLnKoaAPWkqMZA7SlgkhwhSUXPocA4GxUHTY9bOf8Y=;
        b=iAswAB7tOrlBjq31D33U1kGUoKWL06aBZuMy0YzkA9FrhFkKUjIdS3ELgNP2bt3jdK
         krK/zU5+fa0Y88u5A91AufgfzEMy1zUOt7lNzEFNH9DKG6dc/I/yL0h6bL2AhYGRrVbg
         J8yc5Eemxq+aLCoyCi/wwNsjYg9hW+Up9/dTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149969; x=1792754769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LqLnKoaAPWkqMZA7SlgkhwhSUXPocA4GxUHTY9bOf8Y=;
        b=KZvXGh4qPQBnl1Y2frDApXfY0Bop43llgz3wYCDUQiEsTSjWWkdqJ+bUyLCFQO99xu
         vA70e/HDNDGTLNOTBVWX7FZOYHyAayfjq4AlbQllLG+lvhbZ8vu02i7mq5bxQ89RDHD+
         PP6cq+XwCjZv7vRONnvGIceI0UmY20FIME/ah6y78YKli5UfzIAykSjbNNQz5F3LGDH7
         LEqsztV2AXQlZpMCgxodrgWPDLPkyprIUel0FVAr8hZ95svnVXcTHXGSJ1jjUG7NwYu+
         NkB+sY8ad3cQPXc8RcyvCGOvb5Gl6YdQblny6GAJvlv19Rvier5WRbKm2AtbvFdV3JOp
         b6sQ==
X-Gm-Message-State: AFq9FYICMInTldkWzgvsAQ5zYA7n0R6rz9qUkbYgt2VMLWJ587msOEc/
	kzIwE3airWi4QqmRoYPzAIS2ov4ZYxPYqSIksJ1sBfTwq5GvHRytZw2NMYvAJjWh4/tVLj7y9jS
	CHZNX8S8=
X-Gm-Gg: AYBFou2zApYjR4rk9AMXXUF3x8WxCUiuT1Cbu0vpm1UBPJ2tZQBTFHAa+7KcJeKaCp8
	VOY6PG3zYF2AcIyI5yhfeQvUvuMnK3LLe+f+BjLBYaT8qiTVFSYaSss1GLzDp5rP+mnLWjl2rJ8
	ZDaCZs4xSzPQBL3clvWOcn/H3J4NbU4RFB3BNae2mW3+Wyk1ajf0Efosp2Sr0ACOIRDuEhV/8YW
	mmr8e54G6o18YAWej0X/f0Sf0aS4Nd/prSpLlZ7kJZ4RX0tqe/uQTAYODgV7W417paS0eVDSRcv
	IY3oRpdSy+NsDYRC/jqrIy4UFdywKqlnCbXAna79Q4Posn7ekZro7XIpumJahXd0j7Bv8Sl+DF2
	7NUHr4S8Fq3UNW9pZiDmBcaqb9yAPZd48XcU0X0lpghYX+CTiF1LfY1Bpz3CjzQRUtRs5euUb0B
	ytnxR/ydHZCE2FbA6FQ6TdtleBf0kzbGtxFlSOZDS8azE3E/MosZMROz52WEORRDfioX7c6aTq0
	Kl6Aesi9p4QQ+ww8UKt2u3KsOc=
X-Received: by 2002:a05:600c:e547:20b0:4a1:946c:953d with SMTP id 5b1f17b1804b1-4a1946c968cmr275829515e9.27.1792149968502;
        Fri, 16 Oct 2026 04:26:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:988f:f245:635a:3450])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm168526725e9.11.2026.10.16.04.26.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:26:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Pull in various fixes and logging improvements
Date: Fri, 16 Oct 2026 12:26:06 +0100
Message-ID: <20261016112606.1072360-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248013

Adds:

* pseudo_util: Add default log severity values
* pseudo: Change pseudo_diag() name to pseudo_log()
* wrappers: Change pseudo_diag() calls to appropriate macros
* pseudolog.c: Change pseudo_diag() calls to appropriate macros
* pseudo.c: Change pseudo_diag() calls to appropriate macros
* pseudo_server: Change pseudo_diag() calls to appropriate macros
* pseudo_client: Change pseudo_diag() calls to appropriate macros
* pseudo_db: Change pseudo_diag() calls to appropriate macros
* pseudo_util: Change pseudo_diag() calls to appropriate logging macros
* pseudo: Add new logging macros
* pseudo_util: Add log severity flags
* Makefile.in: Move version to 1.99.0 to prep for 2.0 development
* pseudo_util: bound pseudo_get_value()'s recovery re-init
* ports/linux/pseudo_wrappers: forward pre-init syscall/prctl to the real function
* ports/linux/guts: Add open_tree_attr wrapper
* test: Add open_tree_attr syscall test
* test: Add open_tree syscall test
* ports/linux/pseudo_wrappers.c: Add syscall support for open_tree() wrapper
* test: Add open_tree test
* ports/linux/guts: Add open_tree wrapper
* pseudo_client: Fix xattr/rename handling with empty paths

Moves to the 2.0 pre-release versioning

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index d8466b018e1..15d90b4acaa 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https;tag=pseudo-${PV} \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://fallback-passwd \
            file://fallback-group \
            "
@@ -12,8 +12,8 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "ba8887e5f1e922f866681ec7dec1a00b602a9328"
-PV = "1.9.11"
+SRCREV = "6347db607e9560421a75af6bcc246179eea428b1"
+PV = "1.99.0+git"
 
 # largefile and 64bit time_t support adds these macros via compiler flags globally
 # remove them for pseudo since pseudo intercepts some of the functions which will be

