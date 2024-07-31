Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F833C49EA1
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 12:02:18 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.41068.1722427335113634600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 05:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KUtok+va;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc60c3ead4so39003365ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722427334; x=1723032134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8ljnfNmnNsTIjhFiO9ymirbCU7aBE+9zj4lUiocmhc=;
        b=KUtok+vajatzOrkf7bhSXF72mRJXR8lblUxJqy85ueX0xm4Y8LGm2PRmGLUeNs3mjm
         FgtYnSBEYE/q5o1DLVE4qTT1Hb8W2H0xHxQVJsFNrC7sNHfzhsK0R2QHaM9/rEcau7J+
         In0PLaLdeQmtVqcwZDA8ELM4M9Kph3t7DzBW8jbtBuNXMp+1vLpjufscSjTNR96AUflw
         +32i/91rLUo1EGd3nQClZy61+9NO70yOONdo19rL6erTISgjhYF6ai5zyXNYtNp1Jrxr
         8iQe/2kpSCLWuaGHg0j16KMeMAHIh/7/GG93jjB92JeQplrbIoBLmOpv3FcEgev2Op3g
         EpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427334; x=1723032134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8ljnfNmnNsTIjhFiO9ymirbCU7aBE+9zj4lUiocmhc=;
        b=t2QLX9Zh4ZmUuGn824SsCiMu9nl9br/ESdih3qNn+n140ZCVfpNRn88NmMQtRkxOzi
         U/xCwP8wW+ElaeOSbXzsIwcZM9r9ANfKPqglSBJ6g8f5DvIA8wqgl4aY3/70BaE7uNav
         u5282+swYUNKHzbjEVGijT14wduqo/AJdhVpfgks/Lg3cKU7KuAfQ9tCWkMwWkmA3v24
         2r03sODPLkUZO11SUu5jDCHsnhsR4lvAb9k8Ex+U/KazeCY5zIQp52TsF/v2VCugwvwT
         MTvNQ8AkWeZWpHly+l+XsUyQQTaRMbsForTI//5Pbns0WfAnUEpfVHJOF+byLKApSFYP
         4vIw==
X-Gm-Message-State: AOJu0YwuQ5D9eb9uLmy+1gqyyldi3EbPAJcE0ss2BmLU9Lg6ne1aPSda
	IEA3Qrd3YwjFZfk0WCGWm9hYtSpmg6vBGblfdQv+ItMahLe6J7mao+wJt/YjbegD9IB8xbNBHPG
	Dty0=
X-Google-Smtp-Source: AGHT+IHm35t+j6rdaEN+CAkKZQ0cpoAaMNT8a6luMd2ni8TXhrg3rbLVFK3tduVneEGYsivS1ChS7w==
X-Received: by 2002:a17:903:1111:b0:1fd:6529:744c with SMTP id d9443c01a7336-1ff048075b5mr126705075ad.1.1722427334235;
        Wed, 31 Jul 2024 05:02:14 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d4129asm119048315ad.118.2024.07.31.05.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:02:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] llvm: Fix CVE-2023-46049
Date: Wed, 31 Jul 2024 05:02:02 -0700
Message-Id: <9cc4518226488693942ad325d6264e52006bd061.1722427225.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722427225.git.steve@sakoman.com>
References: <cover.1722427225.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 12:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202705

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[Bitcode] Add some missing GetTypeByID failure checks

Print an error instead of crashing.

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../llvm/llvm/CVE-2023-46049.patch            | 34 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/CVE-2023-46049.patch

diff --git a/meta/recipes-devtools/llvm/llvm/CVE-2023-46049.patch b/meta/recipes-devtools/llvm/llvm/CVE-2023-46049.patch
new file mode 100644
index 0000000000..c34e9ae69c
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/CVE-2023-46049.patch
@@ -0,0 +1,34 @@
+commit c2515a8f2be5dd23354c9891f41ad104000f88c4
+Author: Nikita Popov <npopov@redhat.com>
+Date:   Tue Sep 26 16:51:40 2023 +0200
+
+    [Bitcode] Add some missing GetTypeByID failure checks
+
+    Print an error instead of crashing.
+
+    Fixes https://github.com/llvm/llvm-project/issues/67388.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/c2515a8f2be5dd23354c9891f41ad104000f88c4]
+CVE: CVE-2023-46049
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+--- a/llvm/lib/Bitcode/Reader/MetadataLoader.cpp	2022-01-20 13:31:59.000000000 -0800
++++ b/llvm/lib/Bitcode/Reader/MetadataLoader.cpp	2024-07-28 21:35:31.062992219 -0700
+@@ -1235,7 +1235,7 @@
+     }
+ 
+     Type *Ty = getTypeByID(Record[0]);
+-    if (Ty->isMetadataTy() || Ty->isVoidTy()) {
++    if (!Ty || Ty->isMetadataTy() || Ty->isVoidTy()) {
+       dropRecord();
+       break;
+     }
+@@ -1277,7 +1277,7 @@
+       return error("Invalid record");
+ 
+     Type *Ty = getTypeByID(Record[0]);
+-    if (Ty->isMetadataTy() || Ty->isVoidTy())
++    if (!Ty || Ty->isMetadataTy() || Ty->isVoidTy())
+       return error("Invalid record");
+ 
+     MetadataList.assignValue(
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index cedbfb138e..dbf1ff45d4 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -33,6 +33,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://0001-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
+           file://CVE-2023-46049.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


