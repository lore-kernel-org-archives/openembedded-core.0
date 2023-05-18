Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24985C7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 09:32:36 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13069.1684402350807222887
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 02:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=negnyS3c;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f50020e0f8so71047375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684402349; x=1686994349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dsILDRcmiD4rXGpP3Ujp+9ByY3Z639PD3FnbEKHxL+A=;
        b=negnyS3cZPFZS60V57SHRSE+gELFielamPyqTuEH/xoFl7KTU6y4f5pgJEaNbTI27X
         7g59s4xUDRf0S/5zUqJmI7j/kzPTgfrDOU7hVmNpgtO+ct7/1EQxykXfEWwxndlmy/rH
         PlwwN/nQbsBMDxa8tNcD4VSrJPzjXyZ/QmM9vuLPnObf0OJ08HpVTPDIN6rjU+bxsamE
         aHsDvrbsZ1L8zPUR0ENIw2yv4ifJZCOuQ5ucW2x7TbYev5DK/WwoiAFiOV3sk6zk3Ktx
         R7KDZ+yFIBdSD642HXoooU7/W6/rzE0/hp99VaD/eT1Emi0JL1x4zk/Hq47w9rzk+aU8
         1R9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684402349; x=1686994349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsILDRcmiD4rXGpP3Ujp+9ByY3Z639PD3FnbEKHxL+A=;
        b=UuRA3XC9NOh1ppug9EkNkAVPFXVG3WcP/aWvcktwdIb7VwdKXdELeMdmXWx6xByHvh
         eI4foBVAEax7k6/4dPf3dkc4IqeE0nBDfFFFAou+3qekckdXYCJoMcRTVgI1cB4IkwHH
         ygl/LNTKJvtJAloAnHlRtg8m9H++6xSirlDlTP1kBUAW+XidloGP7CAQItNP1w6rtfKr
         vsoxUzvXdb/RsdSTJp381J1XYMbGs83tAhr5pw2fvtsjTEYu1SF3SiXbJEF77CGN5sLu
         NHPm6HheMRr0JugUlML5TtrZLbnxSy5hsKhavOJ1THTkpNLhWre5xKhvyIpOe8uuDbjz
         IUNw==
X-Gm-Message-State: AC+VfDxUj6GLKw7pOR350M+DOZAz2rQjZQtnWfyea0kNrjmiN4UBv4uc
	Y0tmFjdKkYu4zXHN8cVZkSVwduzopBE=
X-Google-Smtp-Source: ACHHUZ6T8X0HRO3648H4XbUn6exlPQFpdywp49vreRa3WkB+oixSbIe3jx/Uyc76DTh76fJ+01ELlw==
X-Received: by 2002:a05:600c:1c1b:b0:3f5:b15:87ee with SMTP id j27-20020a05600c1c1b00b003f50b1587eemr970238wms.18.1684402349001;
        Thu, 18 May 2023 02:32:29 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l24-20020a1ced18000000b003f4f1b884cdsm4737498wmh.36.2023.05.18.02.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 02:32:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [kirkstone][PATCH] llvm: backport a fix for build with gcc-13
Date: Thu, 18 May 2023 11:32:24 +0200
Message-Id: <20230518093224.2895335-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 09:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181512

* needed for llvm-native on hosts with gcc-13

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-missing-cstdint-header-to-Signals.h.patch | 31 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch b/meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch
new file mode 100644
index 0000000000..fdb6307ab5
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-Support-Add-missing-cstdint-header-to-Signals.h.patch
@@ -0,0 +1,31 @@
+From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 23 May 2022 08:03:23 +0100
+Subject: [PATCH] [Support] Add missing <cstdint> header to Signals.h
+
+Without the change llvm build fails on this week's gcc-13 snapshot as:
+
+    [  0%] Building CXX object lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
+    In file included from llvm/lib/Support/Signals.cpp:14:
+    llvm/include/llvm/Support/Signals.h:119:8: error: variable or field 'CleanupOnSignal' declared void
+      119 |   void CleanupOnSignal(uintptr_t Context);
+          |        ^~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [llvmorg-15.0.0 ff1681ddb303223973653f7f5f3f3435b48a1983]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ llvm/include/llvm/Support/Signals.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/include/llvm/Support/Signals.h b/llvm/include/llvm/Support/Signals.h
+index 44f5a750ff5c..937e0572d4a7 100644
+--- a/llvm/include/llvm/Support/Signals.h
++++ b/llvm/include/llvm/Support/Signals.h
+@@ -14,6 +14,7 @@
+ #ifndef LLVM_SUPPORT_SIGNALS_H
+ #define LLVM_SUPPORT_SIGNALS_H
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace llvm {
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 9400bf0821..cedbfb138e 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0001-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.40.1


