Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.3607.1610801714750719948
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 04:55:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g7Hnqxfn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id v15so8277899wrx.4
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 04:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zNIrvzto/pofcKVplCqhJFd6arNcKAUQHU/vfehSQ8c=;
        b=g7HnqxfnoDJ8ELh2pcMJX56r2t5f2jNOKZworl9v9vh8friyNU9fOZg5gfdDPxTziU
         qr+zCMLSLfaFnD6PifCYKuekkB7m5UfBXj294aZAtyE+T4rOdlz0DJP2MDP11ETw9Xqb
         Mw2wHmJ/umTfUxuWwjlNWOkolBhxMAGIX6W2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zNIrvzto/pofcKVplCqhJFd6arNcKAUQHU/vfehSQ8c=;
        b=CfqDhYu2qJrv1RXgTV6TwnlAlReYHbkPdefM34ATeJRzPJUa4Aeua8/aBRKufAiO50
         5lhX7DxtdkYS26K1bBXhLxqwKD4MWMcCIzrtivwxhpzekaOsSm7foQr9ZIwz5cpUgID1
         n/Md75uT2ZlM3Bcw4ywvYZtfVGsOnSZcERryqafoHGEPb1w+TcyMhTAqFKuXR4f75+j9
         RAColi+j5WDJbPx/imW70dsgO8zO3Rw2gHQWILa5cTYj8wCKqldnLncKno98DGmI86Pm
         cYfpZ0nGti0u7QdC9MvaYvlWTuQhXbUECvy5XjXsdN7eq7g9zEse0OEI0DY47IIk+8lF
         yFxg==
X-Gm-Message-State: AOAM533CTWXu6JxBYV5v5OLX4riKVpGLaSM3KHEKq48p7pB6DZAwhhLe
	PWT12ZbNskObLG5f9bO9AyPXWlrFz58f2g==
X-Google-Smtp-Source: ABdhPJzhVSlus+D0oa9qvlM9fFFhkwuwYyxxrH7i1eSjXcq0ep8WLrJgz7sb/BjN7dscP69FPKAiOw==
X-Received: by 2002:a5d:5385:: with SMTP id d5mr17773372wrv.384.1610801713208;
        Sat, 16 Jan 2021 04:55:13 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b202:f78f:5317:247f])
        by smtp.gmail.com with ESMTPSA id k18sm20762050wrd.45.2021.01.16.04.55.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 04:55:12 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] lttng-modules: Drop gcc7 related patch
Date: Sat, 16 Jan 2021 12:55:11 +0000
Message-Id: <20210116125511.886681-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210116125511.886681-1-richard.purdie@linuxfoundation.org>
References: <20210116125511.886681-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We'd appear to be past the need for a gcc7 patch from 3 years ago now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../BUILD_RUNTIME_BUG_ON-vs-gcc7.patch        | 43 -------------------
 .../lttng/lttng-modules_2.12.4.bb             |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch b/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch
deleted file mode 100644
index 76063607a83..00000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/BUILD_RUNTIME_BUG_ON-vs-gcc7.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ab07574ef90fa510f293c37897d577066a88fe0d Mon Sep 17 00:00:00 2001
-From: Nathan Lynch <nathan_lynch@mentor.com>
-Date: Tue, 25 Apr 2017 16:26:57 -0500
-Subject: [PATCH] BUILD_RUNTIME_BUG_ON vs gcc7
-
-Avoid using LTTng's BUILD_RUNTIME_BUG_ON macro, as it appears to run
-into a similar problem as Linux experienced with ilog2.
-
-See:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=474c90156c8dcc2fa815e6716cc9394d7930cb9c
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=72785
-
-Upstream-Status: Pending
-Signed-off-by: Nathan Lynch <nathan_lynch@mentor.com>
----
- lib/align.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lib/align.h b/lib/align.h
-index 5b91ae87410b..5e134cd485fe 100644
---- a/lib/align.h
-+++ b/lib/align.h
-@@ -48,7 +48,7 @@
-  */
- #define offset_align(align_drift, alignment)				       \
- 	({								       \
--		BUILD_RUNTIME_BUG_ON((alignment) == 0			       \
-+		BUG_ON((alignment) == 0					       \
- 				   || ((alignment) & ((alignment) - 1)));      \
- 		(((alignment) - (align_drift)) & ((alignment) - 1));	       \
- 	})
-@@ -63,7 +63,7 @@
-  */
- #define offset_align_floor(align_drift, alignment)			       \
- 	({								       \
--		BUILD_RUNTIME_BUG_ON((alignment) == 0			       \
-+		BUG_ON((alignment) == 0					       \
- 				   || ((alignment) & ((alignment) - 1)));      \
- 		(((align_drift) - (alignment)) & ((alignment) - 1));	       \
- 	})
--- 
-2.9.3
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb
index 3d4e5f5c752..190b70a4400 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.4.bb
@@ -10,7 +10,6 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
-           file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
            "
 
 SRC_URI[sha256sum] = "fe66400fa1b85bff1b9ae24419c74e3bb7d358d643eade0594d81b48bd190688"
-- 
2.27.0

