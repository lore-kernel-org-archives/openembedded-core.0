Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49890C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 19:24:24 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.2000.1699989855868071626
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Nov 2023 11:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N6zVySCs;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6c320a821c4so5189670b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 11:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699989855; x=1700594655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=liQDoItL6+1fB8U7oQANIR3PvT34a88jTmPxxutgcKA=;
        b=N6zVySCshFBi8xXOi2hsdXOBpPerGbgC+7uA8TmGxsbZhA9TcpXbVzPREYly09FlNt
         3Az5qAmKE5ovtocv0Tc8s2mTgCGN/nyWobV19JO3oNt+du2zZWpiPtrYsU33r+Txgpzo
         8j7u/U28tnL1yeYfoHfvuSg9cCrH6t/mrPiF9GtbyTx1FA+stjypr+LPU0F4QCgl8tsY
         DdaECXpzSxywfHeiKedMWNiUVMJdLMhq+e9g9ZW4siSpSWAoB2rDpRUysyCUknR1QCbc
         rXaEGZp4oCo9xqjk7hR2dPRqGZU7mnukwteIA/MCxvgzjl7d4ds6esz0hzokLzvY2eqQ
         pY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699989855; x=1700594655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liQDoItL6+1fB8U7oQANIR3PvT34a88jTmPxxutgcKA=;
        b=VLhEp4qigHK0q1hC5Hh8gXqIOA5gsJJ/PhtWrmCN+R5Z1Wucn6f1TQESdsXNfmyV9y
         La2aPPa/jKZyTRstdISJvyYe8ojC+qUlgzo9n4Im7PP2vxXNlWC8+shTNi0uZeZH8xp/
         eVWIIsf9yH9n2F7T2kVH82+rpKHpThRnBl6pZvvR4xlm+V35hGJKnvdid0iuoWualnA5
         9ZBTt6tQIzWrMHM0aMpEzFmwYvpwaQFbwB534QT3RkvIH3GXriH4bJt7srWF8RJBi6/1
         tI58JMxsYxQVoYPZzp2CXr5o1TWtiVla2g5oGNv8AUhis4r1GjipdypcYb/pGiZr/B+f
         xEOw==
X-Gm-Message-State: AOJu0Yy/qkEQQIPS8LhNATDYeMSpGzRCo/xAws0GG9fYJs0QAx4UJ9/r
	5GsHqTBPiQIyvgodLd+1jWW6Y1mRdP1MVQ==
X-Google-Smtp-Source: AGHT+IGDate9iDj1+NQAfQxKEHbLiAZEZzdzgzDttrze1NwaGqwXV2laYlVK9V3VgTyfrzhkzgMadw==
X-Received: by 2002:a05:6a20:430b:b0:17b:689e:c751 with SMTP id h11-20020a056a20430b00b0017b689ec751mr9727275pzk.5.1699989854959;
        Tue, 14 Nov 2023 11:24:14 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id y135-20020a62ce8d000000b0068ffd4eb66dsm1593835pfg.35.2023.11.14.11.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 11:24:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: Upgrade to 17.0.5
Date: Tue, 14 Nov 2023 11:24:09 -0800
Message-ID: <20231114192409.1567773-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Nov 2023 19:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190513

Brings following changes

* 98bfdac5ce82 [BranchFolding] Remove dubious assert from operator< (#71639)
* 12c6ee8fd204 [GlobalOpt] Cache whether CC is changeable (#71381)
* 0a1274224ef8 [libc++] Fix UB in <expected> related to "has value" flag (#68552) (#68733)
* 42f8800b720f [clang] fix test PR69717.cpp (#72134)
* e666be92b44b [clang] Run test on x86 only
* aebee698ef16 [clang] Do not clear FP pragma stack when instantiating functions (#70646)
* 529aa6eadb27 [SLP]Fix PR70004: Do not change insert point for reduction gather nodes.
* 69b3baf9b87e [DAG] WidenVectorOperand - add basic handling for *_EXTEND_VECTOR_INREG nodes
* e7dc53b94212 [Mips] In LowerShift*Parts, xor with bits-1 instead of -1. (#71149)
* a6cbdae98272 [clang-format] Correctly annotate keyword operator function name (#66904)
* 094cfd14c813 Bump version to 17.0.5
* 05422e1dcf94 [Driver] Fix linking with -lm on Solaris (#65632)
* 910748f4ec5a [clang-repl] Fix BUILD_SHARED_LIBS symbols from libclangInterpreter on MinGW (#71393)
* 582f0469dae1 [CGExprConstant] stop calling into ConstExprEmitter for Reference type destinations (#70366)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 0f811624a46..de8d4116868 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.4"
+PV = "17.0.5"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "309d55140c46384b6de7a7573206cbeba3f7077f"
+SRCREV = "98bfdac5ce82d1679f8af9a57501471812ab68d7"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.42.1


