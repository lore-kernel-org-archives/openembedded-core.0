Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBC6C4332F
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:27:54 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.23872.1641767273729283890
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=grg/AHNH;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 x18-20020a7bc212000000b00347cc83ec07so3879706wmi.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lPe7fOZWnE2hBuu4SW1Ayan4DTj8p0aOJQc22nKf/IE=;
        b=grg/AHNH6VIWntGvq9WDYIMau/uDDUxSMcoF1TyAjQnViULs1q8SdxFYJJZM6BildW
         roZz6ac2IIJhXxcwmxQHy2nrBZWoVoY2tSpmiiqXZFwiebAd+h8oRIr/AGAZ2aJoLZ1T
         B12T4IqFxwBxH2YDO/MTdZNjqQdnQ4Z3cOhRTOOMDaPbDUq4qkEFZuGNRUIeXxi4FUCT
         57ulbzVgohtdeIS9qfdUoo4Fjad6wP+132sSiS7nAUc9FaDOkE6YvE65pqmxfe/wFLwh
         if4syskC/Oet1U7OWGMmLDrG3DC/C/6lFgrudiy5zGFfmTneI6xwBDJltxJNg+xkbc0L
         JeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lPe7fOZWnE2hBuu4SW1Ayan4DTj8p0aOJQc22nKf/IE=;
        b=GoVq6I3cxZ13vLj4kiQw6LA2k4nYE7u873VrbuXXdu05lPW/9gv034Yz0HNrXp+VXT
         fKCzq9w2Gt/zID8RBv310aUAcfCXNA8Imf7vb0hPU29LYf1xvMEYdmwqSFV5nupfKg+V
         wSMufWWWMoMqdRWZwsk8gEQAX49A0zOQkfz6HzlX0IInH9YHjZj/IZu90EkG8X8IK2Y/
         tCbUjP8eSX6oaQev0GmUohtlXL7SNSFKk7o6/7oWW31cQd/Wo/SPDAZJtmy4dfFx5vhQ
         Sk9/vfYvwDsDullK1irNWfZ4o+Gi5xtN69VyYWc8+Om07QDi7FYnAn5ljiOO/jfHY8w6
         ckEg==
X-Gm-Message-State: AOAM532ILerAKo36bvIfmdpIBlFgyfTSBPCUMSveY9LBXzJDAcuyT4Ii
	xREKG0y3X2HJ7a3vAdXLmg/f9qubCEQ=
X-Google-Smtp-Source: 
 ABdhPJyY4nkSvnlZVvdRpf89MC86B6x9dWrejmzOPWkcNXh2G37EauIxezbAeb4pgA1FloOZkyQFMw==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr19882020wmj.99.1641767272361;
        Sun, 09 Jan 2022 14:27:52 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/14] rust-llvm: apply the same reproducibility patch as for
 llvm proper
Date: Sun,  9 Jan 2022 23:27:21 +0100
Message-Id: <20220109222732.2252416-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:27:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160306

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/selftest/cases/reproducible.py  |  4 ---
 meta/recipes-devtools/rust/rust-llvm.inc      |  3 +-
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 +++++++++++++++++++
 3 files changed, 33 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a0dc76977f..e539365031 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -17,11 +17,7 @@ import stat
 import os
 import datetime
 
-# rust-llvm:
-#https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210825-kaihham6/
 exclude_packages = [
-	'rust-llvm-liblto',
-	'rust-llvm-staticdev'
 	]
 
 def is_excluded(package):
diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
index 0f8fb785b7..5c2ccdac9a 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -2,7 +2,8 @@ SUMMARY = "LLVM compiler framework (packaged with rust)"
 LICENSE ?= "Apache-2.0-with-LLVM-exception"
 HOMEPAGE = "http://www.rust-lang.org"
 
-SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2"
+SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
+            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
new file mode 100644
index 0000000000..48af6fc283
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -0,0 +1,31 @@
+From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 27 Nov 2020 10:11:08 +0000
+Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
+
+Otherwise, there are instances which are identical in
+every other field and therefore sort non-reproducibly
+(which breaks binary and source reproducibiliy).
+
+Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
+index ccf0959389b..1f801e83b7d 100644
+--- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
++++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
+@@ -359,7 +359,10 @@ public:
+     // name of a class shouldn't be significant. However, some of the backends
+     // accidentally rely on this behaviour, so it will have to stay like this
+     // until they are fixed.
+-    return ValueName < RHS.ValueName;
++    if (ValueName != RHS.ValueName)
++        return ValueName < RHS.ValueName;
++    // All else being equal, we should sort by name, for source and binary reproducibility
++    return Name < RHS.Name;
+   }
+ };
+ 
-- 
2.20.1


