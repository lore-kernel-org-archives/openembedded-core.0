Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4548C0218C
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 03:00:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.3132.1737601218332035584
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 19:00:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dyhXkIga;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21675fd60feso7703575ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 19:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737601217; x=1738206017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YYE2dLd40hMPK6IAhJZCvW3ZdwtT/6qnYWxPPmc2fh0=;
        b=dyhXkIgauWf12l6vfbP3jqC3AMME8smcS2aiVfAvdfk7WaqCrmQgSNnenq+JrObY7A
         seh2rKmkyxzHgChlCMi7HD+scb4qkOfT3vXdPAcBnDu4pC6QxYvulrwlUBfnEpB+sCie
         PrfVXsCCSGxHpjvJCKu+pNGdeBZDjXntoGDoprETqGi7lG2zNPgICXoy4SPbcdayn6Rr
         qp1ph8YZc4Tax0/+TK2N65hvpLB7r6JKilQFS1HKDLsWgTLyghnsbt5rtteFLRIJG59h
         C2DL2mso8/rbcygrIe0UuCGysIYnymafPcMkqmj3s7m6/mz+GmyeV/vAWUVjf6f+Q14K
         KbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737601217; x=1738206017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYE2dLd40hMPK6IAhJZCvW3ZdwtT/6qnYWxPPmc2fh0=;
        b=WMK0nL0JeJJhw3qUyE+Y8Z1/ASfX4X/SM3/eRD3JQbdGMZ7h3EmKqxPVUy7X0qM+2S
         OVHU2MPiEuhaFLLd7Cf3ig84Rwv41VASznH5qGc0UGYxBznykEmBeM4I8Q0Sb716Vhgj
         AsLHXVizbS3UMFPH+RSdVdlMzfob9qMmUqvEy86t0VklONvyih+g5iObXDf+QpZn9tlU
         o6HtL0xKP1Q4SpcSNVfYM7zTqhvcs8EK8cXA0cCkVHdAL5ZicAGIipFSd4b3HVcnEyOn
         loPo6JfP3NvjhV+uEz/SvdGEdTwZMFNshdlkqkhO8wG0uGBtNUfhEalf9vueoStaQs6e
         4rUw==
X-Gm-Message-State: AOJu0YyArY4memySRNFuSAc+OY5OlwWMZnGm7Xga94BdOkhnOJW9a34L
	rTZnRrnzqf8Wx18ZLgJ0bgWJ2wgDgVL4w6dImpdSuW5wi1pz5aGKjg7duFxry3Eof9BIp70dcVl
	+D9o=
X-Gm-Gg: ASbGncstOM4VWfY8BbmzZKrxVYNYvjEAFDgVmOjfis23hkrEglyxWHadAdp4Un4fUkt
	hgMR2MC8XnZfVFs6rvznI+PzTBORKxxHkQxCnnaGBxhocXQhzwmHV5lCOjRV15sj0Q9Po/AeRnk
	zxKaqliNK0SZQE2ppDdKLvxbbqiba12yQ667r7RmxtezlYHEGUc6belUI+28ZrJ8Ggl+Hpm92HN
	GcXRIV7/7fHAeKZaINNNNqdFlQkLf2lePP1jgF1HXsgYARADzY/T7XOtCKBQyC/OTsTaQ==
X-Google-Smtp-Source: AGHT+IGL8+L7XpjK3LF5fGGdSDmMKkH77toGFFq5nuieuNpoo03Vp7HJSvqB604W/ylKDEB2S8Fiuw==
X-Received: by 2002:a05:6a20:748c:b0:1e0:d848:9e8f with SMTP id adf61e73a8af0-1eb2147dd69mr39536627637.13.1737601217560;
        Wed, 22 Jan 2025 19:00:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab816accsm12048389b3a.69.2025.01.22.19.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 19:00:17 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 5/8] rsync: fix CVE-2024-12088
Date: Wed, 22 Jan 2025 18:59:55 -0800
Message-ID: <dad4a83c011310872cce07fc4141e66a98439cb1.1737601063.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737601063.git.steve@sakoman.com>
References: <cover.1737601063.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 03:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210170

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in rsync. When using the `--safe-links` option, rsync fails to
properly verify if a symbolic link destination contains another symbolic link within it.
This results in a path traversal vulnerability, which may lead to arbitrary file write
outside the desired directory.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rsync/files/CVE-2024-12088.patch          | 141 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   1 +
 2 files changed, 142 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12088.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
new file mode 100644
index 0000000000..b2a3a86e1a
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12088.patch
@@ -0,0 +1,141 @@
+From 407c71c7ce562137230e8ba19149c81ccc47c387 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Sat, 23 Nov 2024 15:15:53 +1100
+Subject: [PATCH] make --safe-links stricter
+
+when --safe-links is used also reject links where a '../' component is
+included in the destination as other than the leading part of the
+filename
+
+CVE: CVE-2024-12088
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=407c71c7ce562137230e8ba19149c81ccc47c387]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ testsuite/safe-links.test    | 55 ++++++++++++++++++++++++++++++++++++
+ testsuite/unsafe-byname.test |  2 +-
+ util1.c                      | 26 ++++++++++++++++-
+ 3 files changed, 81 insertions(+), 2 deletions(-)
+ create mode 100644 testsuite/safe-links.test
+
+diff --git a/testsuite/safe-links.test b/testsuite/safe-links.test
+new file mode 100644
+index 00000000..6e95a4b9
+--- /dev/null
++++ b/testsuite/safe-links.test
+@@ -0,0 +1,55 @@
++#!/bin/sh
++
++. "$suitedir/rsync.fns"
++
++test_symlink() {
++	is_a_link "$1" || test_fail "File $1 is not a symlink"
++}
++
++test_regular() {
++	if [ ! -f "$1" ]; then
++		test_fail "File $1 is not regular file or not exists"
++	fi
++}
++
++test_notexist() {
++        if [ -e "$1" ]; then
++                test_fail "File $1 exists"
++	fi
++        if [ -h "$1" ]; then
++                test_fail "File $1 exists as a symlink"
++	fi
++}
++
++cd "$tmpdir"
++
++mkdir from
++
++mkdir "from/safe"
++mkdir "from/unsafe"
++
++mkdir "from/safe/files"
++mkdir "from/safe/links"
++
++touch "from/safe/files/file1"
++touch "from/safe/files/file2"
++touch "from/unsafe/unsafefile"
++
++ln -s ../files/file1 "from/safe/links/"
++ln -s ../files/file2 "from/safe/links/"
++ln -s ../../unsafe/unsafefile "from/safe/links/"
++ln -s a/a/a/../../../unsafe2 "from/safe/links/"
++
++#echo "LISTING FROM"
++#ls -lR from
++
++echo "rsync with relative path and just -a"
++$RSYNC -avv --safe-links from/safe/ to
++
++#echo "LISTING TO"
++#ls -lR to
++
++test_symlink to/links/file1
++test_symlink to/links/file2
++test_notexist to/links/unsafefile
++test_notexist to/links/unsafe2
+diff --git a/testsuite/unsafe-byname.test b/testsuite/unsafe-byname.test
+index 75e72014..d2e318ef 100644
+--- a/testsuite/unsafe-byname.test
++++ b/testsuite/unsafe-byname.test
+@@ -40,7 +40,7 @@ test_unsafe ..//../dest 		from/dir			unsafe
+ test_unsafe ..				from/file			safe
+ test_unsafe ../..			from/file			unsafe
+ test_unsafe ..//..			from//file			unsafe
+-test_unsafe dir/..			from				safe
++test_unsafe dir/..			from				unsafe
+ test_unsafe dir/../..			from				unsafe
+ test_unsafe dir/..//..			from				unsafe
+
+diff --git a/util1.c b/util1.c
+index da50ff1e..f260d398 100644
+--- a/util1.c
++++ b/util1.c
+@@ -1318,7 +1318,14 @@ int handle_partial_dir(const char *fname, int create)
+  *
+  * "src" is the top source directory currently applicable at the level
+  * of the referenced symlink.  This is usually the symlink's full path
+- * (including its name), as referenced from the root of the transfer. */
++ * (including its name), as referenced from the root of the transfer.
++ *
++ * NOTE: this also rejects dest names with a .. component in other
++ * than the first component of the name ie. it rejects names such as
++ * a/b/../x/y. This needs to be done as the leading subpaths 'a' or
++ * 'b' could later be replaced with symlinks such as a link to '.'
++ * resulting in the link being transferred now becoming unsafe
++ */
+ int unsafe_symlink(const char *dest, const char *src)
+ {
+	const char *name, *slash;
+@@ -1328,6 +1335,23 @@ int unsafe_symlink(const char *dest, const char *src)
+	if (!dest || !*dest || *dest == '/')
+		return 1;
+
++	// reject destinations with /../ in the name other than at the start of the name
++	const char *dest2 = dest;
++	while (strncmp(dest2, "../", 3) == 0) {
++	    dest2 += 3;
++	    while (*dest2 == '/') {
++		// allow for ..//..///../foo
++		dest2++;
++	    }
++	}
++	if (strstr(dest2, "/../"))
++	    return 1;
++
++	// reject if the destination ends in /..
++	const size_t dlen = strlen(dest);
++	if (dlen > 3 && strcmp(&dest[dlen-3], "/..") == 0)
++	    return 1;
++
+	/* find out what our safety margin is */
+	for (name = src; (slash = strchr(name, '/')) != 0; name = slash+1) {
+		/* ".." segment starts the count over.  "." segment is ignored. */
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index d6942dc595..169650fe91 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2024-12087-0001.patch \
            file://CVE-2024-12087-0002.patch \
            file://CVE-2024-12087-0003.patch \
+           file://CVE-2024-12088.patch \
            "
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
 
-- 
2.43.0


