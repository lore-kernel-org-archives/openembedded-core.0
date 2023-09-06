Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683CCEB8FC6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:52 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.7688.1694004523249207616
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TBegSGSW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bdbf10333bso28353015ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004522; x=1694609322; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLrNyeroIPqi3KD61BRFY8WqL1PbUMYKdvP2jWqyqmM=;
        b=TBegSGSW//ErxO8tiQz9QGsEyo7o0MI3BdGbSGrVZrWxt1oGOnNhtqKsiVNr4oKFE7
         Q14DADFo7vtNQpJmdglXV+8RuM4EJOhHzGoZYWFWDWzDwlf0l6oDzImHx1T36qG5m+di
         6RkZU+UTBM/XycHSGktOH1JJ2FqEAy2JoLeICZLwLZWU63kkZ66vWyHaTrR8olGmKUAr
         cHlWCQX7i618sTKw3H5C7wEzk2TkpU8eJQ5j6JpUPmDZYAqTLKMJ+bE3WF/tE5K/OLkn
         rxinz18yjqFoOOsIv5MNedzUdZuGRVZWOup7aHy67M8q43JsTWjKiqmF9ABh1teTFnNE
         iW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004522; x=1694609322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLrNyeroIPqi3KD61BRFY8WqL1PbUMYKdvP2jWqyqmM=;
        b=O3OuhWN4ELFsKv3buUcD5Io6V05amloJ5KAYOCd1+hM4cs9vM9UCVHWmq7GF1/oN10
         KHPmqBwvv3rUKELGP8uB66wzDucrxOl7k3csXSJrg3/EE7zxV5h9+QjNPgF1jbP/XVgG
         egHYgJUPia/dGBR8UVfFW+rHYgP2z75ofXmgJjRAwmOc6HVBUxXh0H3ZhgVWf1s4XMJi
         PtS0H2dTOuuPCR5kOuowzjYHUrx8qYdPa7KAld60neUu4x5SwA7Grp8kiF3PkTYe3bBj
         DO41xSc33wD8ugJfYnZQ7auEg3xk7qiWrsth/D3tGDLgyTg/j0c3FdNeymfSZj9OMLZR
         DeFQ==
X-Gm-Message-State: AOJu0YzttvYbYY5eTGhOVfzRIAj+PqxdsR/LJWiWI5DCnhqgNiI8QJrq
	rtjNsIEkeYe/sKKJ2eFDj4BRq4GQ8pS2cOnQ8GA=
X-Google-Smtp-Source: AGHT+IET264M94CcCkVXkm7YohUBI7eDDDxjg7g7/ZSL5mub2ge+HH7Po0XAOOpe44us+BG8oynX3g==
X-Received: by 2002:a17:90b:17cd:b0:26f:6400:d699 with SMTP id me13-20020a17090b17cd00b0026f6400d699mr14533434pjb.42.1694004522221;
        Wed, 06 Sep 2023 05:48:42 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/14] webkitgtk: fix CVE-2023-23529
Date: Wed,  6 Sep 2023 02:48:14 -1000
Message-Id: <f8bce477ad88da70c3a4196912ba72049b2aa765.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187303

From: Kai Kang <kai.kang@windriver.com>

Backport and rebase patch to fix CVE-2023-23529.

CVE: CVE-2023-23529

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2023-23529.patch     | 65 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch
new file mode 100644
index 0000000000..f2e9808ab4
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch
@@ -0,0 +1,65 @@
+CVE: CVE-2023-23529
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/6cc943c]
+
+With the help from webkit maillist, backport and rebase patch to fix
+CVE-2023-23529.
+
+https://lists.webkit.org/pipermail/webkit-gtk/2023-August/003931.html
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 6cc943c3323a1a1368934c812e5e8ec08f54dcd4 Mon Sep 17 00:00:00 2001
+From: Yusuke Suzuki <ysuzuki@apple.com>
+Date: Fri, 17 Feb 2023 10:39:19 -0800
+Subject: [PATCH] Cherry-pick 259548.63@safari-7615-branch (1b2eb138ef92).
+ rdar://105598149
+
+    [JSC] ToThis object folding should check if AbstractValue is always an object
+    https://bugs.webkit.org/show_bug.cgi?id=251944
+    rdar://105175786
+
+    Reviewed by Geoffrey Garen and Mark Lam.
+
+    ToThis can become Identity for strict mode if it is just primitive values or its object does not have toThis function overriding.
+    This is correct, but folding ToThis to Undefined etc. (not Identity) needs to check that an input only contains objects.
+    This patch adds appropriate checks to prevent from converting ToThis(GlobalObject | Int32) to Undefined for example.
+
+    * Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h:
+    (JSC::DFG::isToThisAnIdentity):
+
+    Canonical link: https://commits.webkit.org/259548.63@safari-7615-branch
+
+Canonical link: https://commits.webkit.org/260455@main
+---
+ .../JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h   | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h b/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h
+index 928328ffab826..82481455e651d 100644
+--- a/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h
++++ b/Source/JavaScriptCore/dfg/DFGAbstractInterpreterInlines.h
+@@ -209,7 +209,8 @@ inline ToThisResult isToThisAnIdentity(VM& vm, ECMAMode ecmaMode, AbstractValue&
+         }
+     }
+ 
+-    if ((ecmaMode.isStrict() || (valueForNode.m_type && !(valueForNode.m_type & ~SpecObject))) && valueForNode.m_structure.isFinite()) {
++    bool onlyObjects = valueForNode.m_type && !(valueForNode.m_type & ~SpecObject);
++    if ((ecmaMode.isStrict() || onlyObjects) && valueForNode.m_structure.isFinite()) {
+         bool allStructuresAreJSScope = !valueForNode.m_structure.isClear();
+         bool overridesToThis = false;
+         valueForNode.m_structure.forEach([&](RegisteredStructure structure) {
+@@ -226,9 +227,13 @@ inline ToThisResult isToThisAnIdentity(VM& vm, ECMAMode ecmaMode, AbstractValue&
+             // If all the structures are JSScope's ones, we know the details of JSScope::toThis() operation.
+             allStructuresAreJSScope &= structure->classInfo()->methodTable.toThis == JSScope::info()->methodTable.toThis;
+         });
++
++        // This is correct for strict mode even if this can have non objects, since the right semantics is Identity.
+         if (!overridesToThis)
+             return ToThisResult::Identity;
+-        if (allStructuresAreJSScope) {
++
++        // But this folding is available only if input is always an object.
++        if (onlyObjects && allStructuresAreJSScope) {
+             if (ecmaMode.isStrict())
+                 return ToThisResult::Undefined;
+             return ToThisResult::GlobalThis;
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
index edd64b7b11..20f475bebd 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.36.8.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BP}.tar.xz \
            file://CVE-2022-46699.patch \
            file://CVE-2022-42867.patch \
            file://CVE-2022-46700.patch \
+           file://CVE-2023-23529.patch \
            "
 SRC_URI[sha256sum] = "0ad9fb6bf28308fe3889faf184bd179d13ac1b46835d2136edbab2c133d00437"
 
-- 
2.34.1


