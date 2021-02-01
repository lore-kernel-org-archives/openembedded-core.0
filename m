Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.36737.1612196764083907798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=b4rAgc1Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id h14so16858182otr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xG5ytvnV5G1CBSsicilE+d6KpYaZ+Zeh/qe8AqI4JCg=;
        b=b4rAgc1YxARKQBJlXI7oIuSri56op5qCj85wM3AWAHI5H2UMKtKjMKXjsvcgIB/zHQ
         npn2FMG+eWlwBZ+iin9aoYSjdp1rjYiUZJhIpr9O6yNVUoAkfJyfxxZFMvE3LX1PRE2L
         Nh0r8CzF7dd6E3aSW2g8Nxv5oCJcN15W1GJVKpB90ncVz0ibA9Fesd5IUrlfop5mwKJL
         cpK4BCPGvHmksNylzfr+frzZaQ84p60ua48r6lyy5BpesJb4gYYR+wkZL49FmrnPfO1+
         edYhvAnvuYpVzbchgr/6b+dh/P7KSoDnHc/MMSF/7NBtkRQ7us0T4ImvY0mvhrA7sBGg
         dfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xG5ytvnV5G1CBSsicilE+d6KpYaZ+Zeh/qe8AqI4JCg=;
        b=XKoPYcgSnt8O4o1DzVx0Ar3YFujCPwyg6QKfR2g6kojVMeXtfmSlmFL57vp6wei67A
         iJZ4wt2CfETdFElQg9quv1oDabV85cCe0ljlQDBfJJbU2Zhv3VaUvt5tkI8pVEHuZsi3
         oIH6T6SmbextFx9x0oxf+BhCaD0q7PAJB1fR86lCxkbV+8IWq7ydyz6BvSiXBosublkZ
         uxuhWP9Odts7aeUG6MFdj7Y46+WUHnskK07MG0bbKSpyPYBOrgQLOc/5HZDHXRaoJaSJ
         V1LI9aGUb+/X3O3DOlmlzceQ9/U3XEYuyOq1h4/j6fFn6PLlW9L81cSZ87nBG2E0rSC5
         BIcA==
X-Gm-Message-State: AOAM5335+khRPSAoSy0yGYmRQYUahCpGh4X7+WMxVzSFs7Uoj5FfGJw9
	cGbfGrQRNlqeXUYRpqWRqjC5D5b/rCgTdgBXLr4=
X-Google-Smtp-Source: ABdhPJzLABJizXPGxl+iAIXdymL1HmpTxdeieUxViq9W1uv5XSO7nzJCMIWIBBQnoAVBjAGf6qoR/w==
X-Received: by 2002:a9d:66d1:: with SMTP id t17mr11780010otm.163.1612196762959;
        Mon, 01 Feb 2021 08:26:02 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.25.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:02 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/21] flex: Fix --noline option behavior
Date: Mon,  1 Feb 2021 06:24:37 -1000
Message-Id: <2c000cb19aa605c1578afc0b5a445163a2387089.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksiy Obitotskyy <oobitots@cisco.com>

Option --noline or -L does not handled properly.
So generated code contains #line directives with
file absolute path and prevents to create
reproducible builds.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0bf2cb7dc2123f220accf1542c2ae4c4b4b8275a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...directives-if-gen_line_dirs-is-false.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch

diff --git a/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch b/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
new file mode 100644
index 0000000000..c8202b6bd5
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
@@ -0,0 +1,32 @@
+From 440f3f55739468cd26e22f31871eca8cbbd53294 Mon Sep 17 00:00:00 2001
+From: Oleksiy Obitotskyy <oobitots@cisco.com>
+Date: Wed, 6 Jan 2021 06:12:14 -0800
+Subject: [PATCH] Emit no #line directives if gen_line_dirs is false
+
+If we set --noline we should not print line directives.
+But setting --noline means gen_line_dirs is false.
+
+Upstream-Status: Submitted
+Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
+---
+ src/buf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/buf.c b/src/buf.c
+index 185083c..4439e28 100644
+--- a/src/buf.c
++++ b/src/buf.c
+@@ -95,8 +95,8 @@ struct Buf *buf_linedir (struct Buf *buf, const char* filename, int lineno)
+     const char *src;
+     size_t tsz;
+ 
+-    if (gen_line_dirs)
+-	return buf;
++    if (!gen_line_dirs)
++        return buf;
+ 
+     tsz = strlen("#line \"\"\n")                +   /* constant parts */
+                2 * strlen (filename)            +   /* filename with possibly all backslashes escaped */
+-- 
+2.26.2.Cisco
+
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 3d57572865..1d43d2228a 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.ta
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
            file://check-funcs.patch \
+           file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch \
            "
 
 SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
-- 
2.25.1

