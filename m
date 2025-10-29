Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D03DCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 02:55:04 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.37.1761706495014494952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 19:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e/TZz4FC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-269639879c3so57358765ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 19:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761706494; x=1762311294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=whOf5Lmr8UtE3CconDCP2va6ovDY1BLs0iQxq0agSSQ=;
        b=e/TZz4FCUckp1yY5/JU/qsu8bvIMIFJTx8eLAKPA5k3JsB40v7wrgnkOXH3VM9qddG
         WmnIgIZDvdPf16Se2m1QEjGkc66Ucg+3W2AXNR7jcTx3dqDsdzkZdwl5gPfA/BNLGpaI
         0RfyMNbZMTXTgjsPgG2d9hOihrX3G4P9W0Kd2vlIGjUXmYS7bsZ4vZfx0ZuWn5wc1FdI
         U79MXhlcIxEEUCChrlXNlNDWfFUSywTnMpkd9wPRcc1QfsejO0atMKCr6cCoH+nwVkLt
         FS/6xHIkwbl8QuADl7cBnO9O/8yGE1ec95UdJr+qGKfXJyvts8of+oW/hVaidcIS6RKi
         mebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761706494; x=1762311294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whOf5Lmr8UtE3CconDCP2va6ovDY1BLs0iQxq0agSSQ=;
        b=IQtvtBEpeFERHirV2LemXe8WGRaNxxOsPu3RwlOq/wbHIOLHG+ZTdLF4xNgUaZoCmQ
         LDxXiWzAAPh0Cf/PA/2L9QCkAwPcVEszILaJmFrUO3r/UUhJrrkd8g7zlhZK4s3+OAJ0
         TF7tA7i9aQ7Cu8SH3Yu3O4/DiR8gT5bvYXpiGJWG9HmXg7Pd5cNXn2yOgZlxPJ1YMJrB
         Bfg1eL9XLGUuKun5WXgvYK7BWFKRSQkdzrR2k6uyYvDNk9/2xw5YZAwiOI+HXdUw5wfM
         +sEZa5Rrz26y+0dJxsmRAdM/uqdZt5UzmwhjHw3vAYZ+8L4hs1Kscp4ACiOUlXB9uSbA
         iiMQ==
X-Gm-Message-State: AOJu0YzBW5bHiCDquXEBBLuxRZKVVZzTYxZpYHhSsM5I3wGrXAsHSPt4
	drzdndxE89Q01av4a5wRKcK4kmvQXvnLOs81Gv54cfAjReaGWRMbeuICPpumqcP4KXa4xCFAIe7
	YCdCYIWY=
X-Gm-Gg: ASbGncuVkd1WNtLx2e7qbIyXFBnAuqNGyfuErBzif3tPCUQyRv6Jn7G+7UGA2C1UuFQ
	IhtxaDUsAsFmQSrFCo1OedEP8sJUhvzUYkli+TF0iRenrNyev35n4ylVIraaBUhi2j3I/D09d3W
	BpYUKSSvnlQ6DGwe/9oL7VlZt2VgoOxHabTqt4MFwzItNT2idT3W8uYj70SwWGTbegT5SSPKwea
	L6hA1efO7vxndApdJMf3j6rVuq4jwASQA10w7vb8n/YlABvZwKSedjjxfr90Prw22CoodVSF0Wu
	cRkACBWJ0BAhJlMc66aMPJgshpwSN9KZRKCu/coiW0PbKSTeFFHW0A3g6PrDqdr43Gb1ffmeyh4
	KsEWt4EhqaKmOmVf86FnPPQQf4yu2JncjMZ0Yx8i2UIs7XbzfsYVEJ0hva8yDWSqXNpM=
X-Google-Smtp-Source: AGHT+IFA1+q8l4upCcO7yqzWX4c+CsD4f9oujNQUqQmToAA6e/hnRLUXAIB6zJpqyCxoPx9Fj/x0bw==
X-Received: by 2002:a17:903:2348:b0:25d:37fc:32df with SMTP id d9443c01a7336-294deedb5c6mr16629595ad.47.1761706493893;
        Tue, 28 Oct 2025 19:54:53 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d27345sm131058945ad.54.2025.10.28.19.54.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 19:54:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] git: fix CVE-2025-48386
Date: Tue, 28 Oct 2025 19:54:29 -0700
Message-ID: <3f2fce1ababbf6c94a9e4995d133d5338913b2ce.1761692326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761692326.git.steve@sakoman.com>
References: <cover.1761692326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225425

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/git/git/commit/9de345cb273cc7faaeda279c7e07149d8a15a319

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/git/CVE-2025-48386.patch              | 97 +++++++++++++++++++
 meta/recipes-devtools/git/git_2.35.7.bb       |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/CVE-2025-48386.patch

diff --git a/meta/recipes-devtools/git/git/CVE-2025-48386.patch b/meta/recipes-devtools/git/git/CVE-2025-48386.patch
new file mode 100644
index 0000000000..e78e95dbea
--- /dev/null
+++ b/meta/recipes-devtools/git/git/CVE-2025-48386.patch
@@ -0,0 +1,97 @@
+From 9de345cb273cc7faaeda279c7e07149d8a15a319 Mon Sep 17 00:00:00 2001
+From: Taylor Blau <me@ttaylorr.com>
+Date: Mon, 19 May 2025 18:30:29 -0400
+Subject: [PATCH] wincred: avoid buffer overflow in wcsncat()
+
+The wincred credential helper uses a static buffer ("target") as a
+unique key for storing and comparing against internal storage. It does
+this by building up a string is supposed to look like:
+
+    git:$PROTOCOL://$USERNAME@$HOST/@path
+
+However, the static "target" buffer is declared as a wide string with no
+more than 1,024 wide characters. The first call to wcsncat() is almost
+correct (it copies no more than ARRAY_SIZE(target) wchar_t's), but does
+not account for the trailing NUL, introducing an off-by-one error.
+
+But subsequent calls to wcsncat() have an additional problem on top of
+the off-by-one. They do not account for the length of the existing
+wide string being built up in 'target'. So the following:
+
+    $ perl -e '
+        my $x = "x" x 1_000;
+        print "protocol=$x\nhost=$x\nusername=$x\npath=$x\n"
+      ' |
+      C\:/Program\ Files/Git/mingw64/libexec/git-core/git-credential-wincred.exe get
+
+will result in a segmentation fault from over-filling buffer.
+
+This bug is as old as the wincred helper itself, dating back to
+a6253da (contrib: add win32 credential-helper, 2012-07-27). Commit
+8b2d219 (wincred: improve compatibility with windows versions,
+2013-01-10) replaced the use of strncat() with wcsncat(), but retained
+the buggy behavior.
+
+Fix this by using a "target_append()" helper which accounts for both the
+length of the existing string within the buffer, as well as the trailing
+NUL character.
+
+Reported-by: David Leadbeater <dgl@dgl.cx>
+Helped-by: David Leadbeater <dgl@dgl.cx>
+Helped-by: Jeff King <peff@peff.net>
+Signed-off-by: Taylor Blau <me@ttaylorr.com>
+
+CVE: CVE-2025-48386
+Upstream-Status: Backport [https://github.com/git/git/commit/9de345cb273cc7faaeda279c7e07149d8a15a319]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ .../wincred/git-credential-wincred.c          | 22 +++++++++++++------
+ 1 file changed, 15 insertions(+), 7 deletions(-)
+
+diff --git a/contrib/credential/wincred/git-credential-wincred.c b/contrib/credential/wincred/git-credential-wincred.c
+index 5091048..00ecd87 100644
+--- a/contrib/credential/wincred/git-credential-wincred.c
++++ b/contrib/credential/wincred/git-credential-wincred.c
+@@ -93,6 +93,14 @@ static void load_cred_funcs(void)
+ 
+ static WCHAR *wusername, *password, *protocol, *host, *path, target[1024];
+ 
++static void target_append(const WCHAR *src)
++{
++	size_t avail = ARRAY_SIZE(target) - wcslen(target) - 1; /* -1 for NUL */
++	if (avail < wcslen(src))
++		die("target buffer overflow");
++	wcsncat(target, src, avail);
++}
++
+ static void write_item(const char *what, LPCWSTR wbuf, int wlen)
+ {
+ 	char *buf;
+@@ -304,17 +312,17 @@ int main(int argc, char *argv[])
+ 
+ 	/* prepare 'target', the unique key for the credential */
+ 	wcscpy(target, L"git:");
+-	wcsncat(target, protocol, ARRAY_SIZE(target));
+-	wcsncat(target, L"://", ARRAY_SIZE(target));
++	target_append(protocol);
++	target_append(L"://");
+ 	if (wusername) {
+-		wcsncat(target, wusername, ARRAY_SIZE(target));
+-		wcsncat(target, L"@", ARRAY_SIZE(target));
++		target_append(wusername);
++		target_append(L"@");
+ 	}
+ 	if (host)
+-		wcsncat(target, host, ARRAY_SIZE(target));
++		target_append(host);
+ 	if (path) {
+-		wcsncat(target, L"/", ARRAY_SIZE(target));
+-		wcsncat(target, path, ARRAY_SIZE(target));
++		target_append(L"/");
++		target_append(path);
+ 	}
+ 
+ 	if (!strcmp(argv[1], "get"))
+-- 
+2.50.1
+
diff --git a/meta/recipes-devtools/git/git_2.35.7.bb b/meta/recipes-devtools/git/git_2.35.7.bb
index 2079c3ddc8..063446645e 100644
--- a/meta/recipes-devtools/git/git_2.35.7.bb
+++ b/meta/recipes-devtools/git/git_2.35.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://CVE-2024-52006.patch \
            file://CVE-2025-27614-CVE-2025-27613-CVE-2025-46334-CVE-2025-46835.patch \
            file://CVE-2025-48384.patch \
+           file://CVE-2025-48386.patch \
            "
 
 S = "${WORKDIR}/git-${PV}"
-- 
2.43.0


