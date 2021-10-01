Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90B6C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 07:24:56 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by mx.groups.io with SMTP id smtpd.web11.4727.1633073095960916107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 00:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CXX/M1zk;
 spf=pass (domain: gmail.com, ip: 209.85.166.181,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-il1-f181.google.com with SMTP id h20so9544424ilj.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 00:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VQV0LBnQtRaz84FsIACoZ2Y1osbSZK8ol6hkWsndIbY=;
        b=CXX/M1zkVAUyKziyHn/6mc7QsCZZRlsiLDRVt8NwG2WRgoSsDPx1yL18rfG6vwt6kD
         vczW6CWj6rigeZ4ajm/2+6RZ0ZMj5w1alkPMUMzL3tYWmbFnCtbU1fBoIljqzZCL4uvD
         ruDhgB0oycRk4Y033DVxv5SO4tj458sfDTPY6u36wTLK/JIbY4LLt0mnyHiGNvNCBopn
         cQePhyeJyKOpgwpPFUMPpwbL9nVKZFOaGSFhU0rK+fp3QgSOIAJaLlewPDzCFm9bp2Vs
         qu5Gs2s9IKOLhxrqjDXcXYFkoJgk4lLOvsnhyudDhpMbOYDz4TSItSOckW1N2QUepwbd
         yWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VQV0LBnQtRaz84FsIACoZ2Y1osbSZK8ol6hkWsndIbY=;
        b=mvlGWsBJFCjGflSt2VoLIdabFNUKkq1047j6iS8D33XF7umpX5d/xK7ZWoGeGKj2jO
         kzOk1FynvvLA+q1RpDEt0milioPJF81pfOcInYPUcVNlxrd23GO/K32moq/gdWnJ8YTr
         nuKxd6N4txDrXXq7D5Zs6Ja+Ty5f9L2D10vZ/zrndM4dlBEfb8YehBFSwcX+DiNVSL1c
         G3BIQBPGOga3W3qgTMmXMcg+QQNaLsB07tz8fT4M0LjiaJEYXPalVLcqBNhC8fLjtIF6
         vL39f2d8CiOkx51NikJWSQBOho6XpxU/YO5iJWhDcz16E/0waVjJF1iSM6VgVAEuFB1z
         NLcA==
X-Gm-Message-State: AOAM530wKnvV5bJFvxQ2yX2h7NWqrJ9OltBmwSYnEvrBg4kmFthmbPkK
	U+IJ7IOvKvOql99arxvdOLyrnyy6j0CgGA==
X-Google-Smtp-Source: 
 ABdhPJxkfU1kxCEoOdESvPtNo0DidJjPzICHrPwlY+U5yAq/WoFiflCru1tGX/4VejgHoL2gN0TK8w==
X-Received: by 2002:a92:c564:: with SMTP id b4mr5236622ilj.229.1633073095070;
        Fri, 01 Oct 2021 00:24:55 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com.
 [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id
 t10sm3141074iol.34.2021.10.01.00.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 00:24:54 -0700 (PDT)
From: Pgowda <pgowda.cve@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	Pgowda <pgowda.cve@gmail.com>
Subject: [PATCH v2] state/staging: Fix directory not deleted for race
Date: Fri,  1 Oct 2021 00:24:40 -0700
Message-Id: <20211001072440.18158-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: 
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
References: 
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 07:24:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156513

Modify the SYSROOT PATH to fix race around issue when rust-hello-world
is run for two libc one after the other.

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
---
 meta/recipes-devtools/rust/rust-cross.inc | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index bee7c9f12f..09d0078d17 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -32,7 +32,17 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
 DEPENDS += "rust-native"
 
 PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TARGET_ARCH}"
+
+# Modify the sysroot PATH based on the libc used to fix race around issue.
+def get_libc(d):
+    tclibc = d.getVar('TCLIBC')
+    if tclibc == 'glibc':
+        pn = "rust-cross-${TARGET_ARCH}"
+    else:
+        pn = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
+    return pn
+
+PN := "${@get_libc(d)}"
 
 # In the cross compilation case, rustc doesn't seem to get the rpath quite
 # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
-- 
2.31.1


