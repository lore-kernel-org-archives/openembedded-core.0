Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F315BC54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:46:24 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.80669.1674755178373397143
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aWuq8GsC;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id be8so2506871plb.7
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 09:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnLvITPeoN6gJ61E51hmDto/4lqzR7p+AmMotUmNmq8=;
        b=aWuq8GsCN7DJ/FRfD/js3FMecr+56YxHJfOaKrRUA+JyxMeRpWoSWMw64NMebrjyEw
         U4n40GswdnUK8lkjPYhV0EGTVa7F/VK8lQywJg8kX7Qo3PRehk7CA0F3iZO93yI30UmX
         eI+v7m53TiXv9cb2ON5rOERjYq3jav2knpqtuRMdq+laJOSVTX0xyliNMuKvSbuscatS
         lwBFTanZ1PRiKRxjqjFIwnvDFe7liJ1BLiRSw+lQF0rwAm7e1IO85mgBeHlayuGgTmt3
         17ZzwfUG/rVJthvk92W6OZzarjxhVIBxrbbZEF/6+rMSTRB+TnMwGlXbihw7OWU8xaAw
         agCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnLvITPeoN6gJ61E51hmDto/4lqzR7p+AmMotUmNmq8=;
        b=aruL0Y2fAIH3eZk5YvgBcBhdLCn88Zerz457FFkmx/QeKM93MFE6Rfz4Rr1sbA1P7d
         grokpxLeRMIVfBHYTXJW48ilX2MptNED6wfazCkAdY5u6c8KuYituvNR771217TkVHyy
         sQwhy396HdRa3c1wnLj9uy7oGsVg7XL+oo/Y5QKHoWjBQQr/y3kn68zt6t3lNJITYdNr
         ANJPiGMXg8Cn+u1diOSQhFUAroq/fGOyIoMOrjBFPW7sXjHaCgPAPgJ9U812q4Q5jRry
         JF10DJ6DwqzptZSUFLgdPBrImRBW4IgYJ7rOFG5hKJe5HNhv1Dw16ey7gErzWIRUX+HH
         TBcg==
X-Gm-Message-State: AO0yUKX636YnqMgEhS5DT+BSvFMjrPFWb8pMv1ZhVtlNVjRxgi4mbd5L
	3yPjqe6nR5HnnKV3luHubNjptNQNSGZR7w==
X-Google-Smtp-Source: AK7set+HWPLUjpQcMvUH0wE+aTLVFI/3mh/hX4ZrRTSZTXp/AtGXUHVEl/0yVnYEfOwtW3j118n3JQ==
X-Received: by 2002:a17:902:ec85:b0:196:25b1:a041 with SMTP id x5-20020a170902ec8500b0019625b1a041mr8229648plg.63.1674755177527;
        Thu, 26 Jan 2023 09:46:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id ja15-20020a170902efcf00b001929dff50a9sm1273299plb.87.2023.01.26.09.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 09:46:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Fix build with gcc 13
Date: Thu, 26 Jan 2023 09:46:14 -0800
Message-Id: <20230126174614.2427414-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126174614.2427414-1-raj.khem@gmail.com>
References: <20230126174614.2427414-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176416

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.38.3.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
new file mode 100644
index 0000000000..1ff9dcea7e
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/d318bb461f040b90453bc4e100dcf967243ecd98.patch
@@ -0,0 +1,30 @@
+From d318bb461f040b90453bc4e100dcf967243ecd98 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Mon, 16 Jan 2023 16:55:26 -0800
+Subject: [PATCH] WebKitGTK 2.39.4 does not build due to missing #include in
+ ANGLE https://bugs.webkit.org/show_bug.cgi?id=250689
+
+Unreviewed build fix.
+
+* Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h:
+
+Canonical link: https://commits.webkit.org/258968@main
+
+Upstream-Status: Backport [https://bugs.webkit.org/show_bug.cgi?id=250689]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
+index 94cb93e01fc0..ec7bda372f30 100644
+--- a/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
++++ b/Source/ThirdParty/ANGLE/include/GLSLANG/ShaderVars.h
+@@ -12,6 +12,7 @@
+ 
+ #include <algorithm>
+ #include <array>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
index f076fb0498..5d8d212871 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
+           file://d318bb461f040b90453bc4e100dcf967243ecd98.patch \
            "
 SRC_URI[sha256sum] = "41f001d1ed448c6936b394a9f20e4640eebf83a7f08262df28504f7410604a5a"
 
-- 
2.39.1


