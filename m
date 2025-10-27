Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F25CCCF9EB
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 06:22:21 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.25885.1761546135919866288
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 23:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fNrxv0cb;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-290c2b6a6c2so45025435ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Oct 2025 23:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1761546135; x=1762150935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z37Zn4tDbLtR0LWY4NbUrnnw7+2FVRHQeKGf0GPiSOQ=;
        b=fNrxv0cbrbdookWnllMGFLCBqp52WTHPX/HtzS9PzU/Nct9CtYs8CZG7DEyRHlHhNl
         hJTtv/mnvF3k1RlKgzKc8MPweHPnVg4+d2zCKX57r/jwv0pkgpiao/5Mw8E4VQiTFPT2
         tresKwHNs2wqxgV9lO5yNXBDzS5AiX9POo5fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761546135; x=1762150935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z37Zn4tDbLtR0LWY4NbUrnnw7+2FVRHQeKGf0GPiSOQ=;
        b=WGkJrwEnHDAObCycmFZcPgrqkyljTkSC8OP+C7l2vHQHnLi0we+FKEiAfozba38b5Y
         Ab2DgkyzM2kluxCKRQt+bvh3BNaCAjCkpG0oRRJADx07N8vxLi6HIszlE5iHiZBIovf2
         XVVsDRmAyEq+v5b7wJMXnh2iAhh9lB5MZgof5jJs7Ii8vYv3EoFalWmIMjymMrf1JRBx
         DdpNwsU7o8KE9Y2cgkhUraK16VRdev0dTBRWk/okoGMj3mH1CSuIuPyrzApnjhkoxpH5
         /NOrJFXluKMOMjZHycUAg7QRo0GGa8s6vjq7ofgLpXlc9u2VLIg8t9YZGHv40Oua5I06
         G1lw==
X-Gm-Message-State: AOJu0Yzt8fZmVfXqNu/jV3Su7S53jRhmoayh5X+yQfTm904NvPxwVKW/
	TU5x11FE9x8b+7LsI6pqelPm8qSxTg8BlUQqwzWD3PsZ2DIYHic03N+rDiu57jZNwyKSmZbl4EW
	aXyZdzjQ=
X-Gm-Gg: ASbGncup4E7GQUFQ4yrPJQ3wFqOi5FWCdgNddM8GwVHE6ci/CVps0PH/B/RYgNd4bbE
	No9NA0aljDujDJ+ZMnhC+lHQtDiRSUrjbrFNQm0wXm5sj3YjCDRwA4mbjdh4MwOePr0vG3UUddg
	5OUVb90GkpISzdPSo1jM6nNo3sfUr3Ojua9ehippJ0rAV6U/SsW08NS1AcKGnyuWQq8fsFz5iBE
	AkbJv89efzxr8R3maVY581KA3VJjaqJxDio3ivKAsem5g9CI33qW/KNF94vQawPm3LANbwjtJm0
	9rjgLYVCkOZ1K/rZlLBzyfQ4WufWiKTkWDFU4PjwSrn710rJltdDpCJ0zdGVzWDlT5y5G5o1jVu
	yYEErZaqWAXgMa2nV/ViFFKLe0kZh9O+DRgQyWw3jVAEGMJTGwlJE729HFY5xrunjzlh/5kzT0w
	6um0r/v087K1MvVQ==
X-Google-Smtp-Source: AGHT+IHfr4IqwFvbp8F4f+tEjao6OdoDcU81vdTmO6hiQ0dBL0Zudyr2tGq8ABL7bk91YC2P7PRpVw==
X-Received: by 2002:a17:903:1a4c:b0:27e:ef09:4ab6 with SMTP id d9443c01a7336-290c99ad18bmr456617925ad.0.1761546135094;
        Sun, 26 Oct 2025 23:22:15 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d0a60fsm68857505ad.39.2025.10.26.23.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 23:22:14 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] git: fix CVE-2025-48386
Date: Mon, 27 Oct 2025 11:52:00 +0530
Message-ID: <20251027062200.83618-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225323

Upstream-Status: Backport from https://github.com/git/git/commit/9de345cb273cc7faaeda279c7e07149d8a15a319

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.50.1


