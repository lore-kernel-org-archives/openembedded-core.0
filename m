Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD54C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 17:51:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.42132.1737395485818586029
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 09:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DJ6IsQvD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2164b1f05caso85816805ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 09:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1737395485; x=1738000285; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sqzcdHiKPCMe6V21jdHMT1VWdvGkO6G2gfjMwG2C5u8=;
        b=DJ6IsQvDtf5qEJ4gaBNI4Lcz4R3aliCMAZpn9ZSqv1+i48WYdGBTk8Bgaib6IEoUAe
         B5dOzT0+rQaNwRxh2DniByV6hR6GFFmkuTSf05ZhgIkDgVGx8Pq+4YzGTViccdXhXGt7
         /euBrKu45e3HgYcZ1Bdu1ad9nTb5mwGN5K6nZc9/ywI//iRJfVg6p7QPyHCoYzbXvaGw
         XD1aBA1k0i82O92nlgyDQiKh+BQs49jTzc8fThUEl7XObgiJlDVUdKK4PuFblI0ko14i
         dJdP4QXfSzh3sKBHv/FkW4pR3u/WTbrTlgrNW9+T8VHn3u+jtYj77OKWVfsgkRBk5BzG
         ppDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737395485; x=1738000285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqzcdHiKPCMe6V21jdHMT1VWdvGkO6G2gfjMwG2C5u8=;
        b=gUz84YahD2EcBJ8CSEcNkffgRrAagbd+svwuniK3tRfeNwOs5YceUSHlJwjrL9eZNo
         kzBoheLu/XrjQAU9354ln8OkuLNkOu8IXQ08B0Qe4mSSnN6FmDphALIdrPijlFAUf9Sb
         TexzTcvKpqoW71UfPiqEyyfg0ytQvsTpoXjyYgFnt8E2jKQefZDvPQsI4euTOxHafH2d
         OGPbJnVg0DU/sBOMsex+clGhfxlelbaBRO+wqkn4MQnuP8P1LTfDgcE6In/BWytHb7kv
         QyETyRoYJ4j4s1iaJNjY5HpqSAZmbfQyC6fRLCWP/jYvtJWUOAUyQcalJiCC8ga/b/LT
         e6yQ==
X-Gm-Message-State: AOJu0YwGeS/ee5Yn8fPvvPPrWLLm6CO9mH0hnd9bliiWhyQxqFyr7LOE
	c6iNRDHjnthb2cTgDJc9hlgo4fQJj9oQCn/Bs26qmrWHQRgPCbaTL4Pi8Q1t1pKynMqHprN/wSP
	tp8U=
X-Gm-Gg: ASbGnctHIH4ISIHUVskprIgFr/rnyJ0yGOSydnKAsuxnXrmZ9uKxP8EvGnwc+E/HnXC
	sqCKPyeavyDyBQddVMCbwMKHd7qnM4JgrIki/nGDoJtoRlehp8Rm5PIBlyQB5reP8nVceF8+59m
	ezryka+NLT0Pe4Sn0caGiDkVv2NnVBKCG+oIrIpq82MgBi1kNVT1zWb1OZv0yX3A0MkV+zW0xUY
	zFCwfO7RXw1nvcx/LeHVHITWS+v1UWqIFLK5ewJI4OTUejW51wONtyPUPM=
X-Google-Smtp-Source: AGHT+IEl8AIHqeF2eNUDIFFUZTa085V3flStGogaa6yDK4ztiPCI1mHfK2f6DvfbLuDIyTC/P8aPSw==
X-Received: by 2002:a05:6a21:7882:b0:1ea:ddd1:2fda with SMTP id adf61e73a8af0-1eb215683b7mr22668480637.26.1737395485044;
        Mon, 20 Jan 2025 09:51:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcdcf643esm6155565a12.38.2025.01.20.09.51.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:51:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/16] rsync: fix CVE-2024-12088
Date: Mon, 20 Jan 2025 09:50:55 -0800
Message-ID: <741200c41a19ef5b4876d9a80667dfde2e5f4a9d.1737395091.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1737395091.git.steve@sakoman.com>
References: <cover.1737395091.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 17:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210055

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in rsync. When using the `--safe-links` option, rsync fails to
properly verify if a symbolic link destination contains another symbolic link within it.
This results in a path traversal vulnerability, which may lead to arbitrary file write
outside the desired directory

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
index bfbe97c57d..df3627ed53 100644
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


