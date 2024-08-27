Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF78C5473E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:20 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.70881.1724736252626175913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mqk762zK;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86b46c4831so330568266b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736251; x=1725341051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ww9RQXFeh0RKHr8zfKRSj9KuNXkpKtw8LHdnyxbrrg=;
        b=Mqk762zKwen3EEMdvOoo7FLj+16JM+bz1gygAy4U1WmzxX15GvKZ+tH7T54z519RMZ
         2md+Iz1au+UTE/vJiyWmBZZgbh9CU1/z5ZdckY1xjX18YAAkSQUDDYc9VsT+fC68FPuE
         ffDK989kkR+tIZDbYmVsa5RebM4BAQa9RCnhGbVOOqRufkQcA6qkTgpxP4jixy/UFmWa
         Mmnns12QJpsJ0kOxAKvgRPVzLszSXmaYqCjx2wUqCWccIKwmGDJ87tqHHUKfQ/9pIgxZ
         bBN12kSEZ0rM/QAelq6ahIbiK8KvF6a4VA/1iM6B0hSJAzG4df6wgD7k6rPBDdOC/G93
         Wz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736251; x=1725341051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ww9RQXFeh0RKHr8zfKRSj9KuNXkpKtw8LHdnyxbrrg=;
        b=NKbUxa2YGJe27CBua/+d4C5dCfypn4thtzZh8YR38RWy6nQeoevKLA7oONv7sEbSWe
         4np+Fo6orCTDKs/BbSE8kJn43XEEulWcD8Kg3bW4v6G7Iw0Elwr9M3jhU5HscxllrWdG
         NG2Xu7bXXnoas7PX/+7LmpsSiw9E+gFSVqhZo11PlfLTY2jvyK0xEM/Uk6taSskl4RE5
         JSkh+hmtHafOUNOEs9Y7p3LpZh7Y2OxRYUxrSfxMVN8+oOLshSLa3lwB5MnaFW1ku5pk
         0XJ6NAPQjEGpwshSqtsdclOJVp97FuauC4BVKWgY9BypdmMlg5uVJog5G/4fHb10oYoz
         iSFA==
X-Gm-Message-State: AOJu0YwO1TRMcpWadIxaWOQSVCIqfiOgRgKymWRcVWzwoNSAYXayIMEW
	GqJFkyw0VthZHN5lRudzphsDGgnNZ8S2tYvMYs4OICvYGvI/bykzECFZ0w==
X-Google-Smtp-Source: AGHT+IGSUDehSBdwWx24O+R7MxD5ym5RvyCHcj14PQdU0h34e4Xubty0nkgY1uB2meVJ0bQihFNvfQ==
X-Received: by 2002:a17:907:da4:b0:a7d:e98c:5bd1 with SMTP id a640c23a62f3a-a86a52b1607mr952652166b.26.1724736250687;
        Mon, 26 Aug 2024 22:24:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/34] p11-kit: update 0.25.3 -> 0.25.5
Date: Tue, 27 Aug 2024 07:23:42 +0200
Message-Id: <20240827052354.1319810-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203798

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/fix-parallel-build-failures.patch   | 33 -------------------
 .../{p11-kit_0.25.3.bb => p11-kit_0.25.5.bb}  |  3 +-
 2 files changed, 1 insertion(+), 35 deletions(-)
 delete mode 100644 meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.3.bb => p11-kit_0.25.5.bb} (95%)

diff --git a/meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch b/meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch
deleted file mode 100644
index 47df0271064..00000000000
--- a/meta/recipes-support/p11-kit/files/fix-parallel-build-failures.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-It fails occasionally with missing generated header files:
-
-| ../git/common/asn1.c:42:10: fatal error: openssl.asn.h: No such file or directory
-|    42 | #include "openssl.asn.h"
-|       |          ^~~~~~~~~~~~~~~
-| compilation terminated.
-
-According to meson manual page:
-
-https://mesonbuild.com/Wrap-best-practices-and-tips.html#declare-generated-headers-explicitly
-
-'asn_h_dep' should be a dependency of static_library target 'libp11_asn1' to
-make sure that required header files generated before compile common/asn1.c.
-
-Upstream-Status: Submitted [https://github.com/p11-glue/p11-kit/pull/619]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- common/meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/common/meson.build b/common/meson.build
-index dc86d7b..cc3ec48 100644
---- a/common/meson.build
-+++ b/common/meson.build
-@@ -113,6 +113,7 @@ if with_asn1
-     'p11-asn1', libp11_asn1_sources,
-     gnu_symbol_visibility: 'hidden',
-     include_directories: configinc,
-+    dependencies: asn_h_dep,
-   )
- 
-   libp11_asn1_dep = declare_dependency(
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb b/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
similarity index 95%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
index 2ede38deba2..8c2f56be44d 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.3.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.25.5.bb
@@ -11,9 +11,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https \
-           file://fix-parallel-build-failures.patch \
            "
-SRCREV = "917e02a3211dabbdea4b079cb598581dce84fda1"
+SRCREV = "0dd113361057e477f40ff4d8788f3e7e400af5f9"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.39.2


