Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD42C78855
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 13:39:50 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.18452.1726839583381018310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Sep 2024 06:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XtZB5ZW2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718e3c98b5aso1489068b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726839583; x=1727444383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1U/qfF+QMPQgxpyxojf8ND9EuZHsbLWCN5UoZyTD6GA=;
        b=XtZB5ZW28rKEVGOGZVziw96shRfz8S6ztOBqggDaGbcr7kcRqQtRKuhqrJNDPBM8Gt
         xqvFgKdtKiZyxU8qMD4GGnH5V6ypWor3xMoA/g6aT5RReorOM6o3n1l0iLwf2gDSBMai
         PLeRRlwWJy6bkWHEbuuHdFVMrWL95SUNj2DWGN22BDaDIlPpHkbxR4eKJ/v9pD0XSvPW
         JGLkXZjGz+ep0V/BLJ3395UNgmNc62acpooYzG2wNhCt1HVdhs56os4l4FEsq5qo4W5C
         zHIpxRB9LrFhcNlS6Fo5KOEvPHUKFHCGAOp6nsnlyRaXNdT+Wc9zlsIMZhMGh2iMqA8S
         uPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726839583; x=1727444383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1U/qfF+QMPQgxpyxojf8ND9EuZHsbLWCN5UoZyTD6GA=;
        b=qwXgPfwDZkVu9hxoOmHRbBZZFSygmZeN9vEafW+mGHUTmzIsTfYkpCMaDboVjo9ueQ
         91vGeeavhgO/p5HVK3LUwj+MWI8c2ojQqPqSCBc0x8/2Sw/ULFWB3sdM6cojWT/ptWwi
         GQF1ZYNUiZTs4BI/LZ+pLldxtQNlZD+Y9+awcMK4MQRIMRGpVCkqbvXXwtDXoqhJzB/g
         836mJovmu+mdRPSYt8cc0hYisjG8Ok7ZsBGq4wK3xRyzdnh5HPjMTN8heLVlP2GYargG
         Py+pfe0xa9t2tTbNnFlm92W7w3W1zRe4r/Hs/7utRsg4GA4K4/pt92EDDz185VgDdpzH
         PGxg==
X-Gm-Message-State: AOJu0Yw+4SvMzQuWouTQ3MVujvBNypSHDmQxnM4MmWa+WkxDJRWnFVpF
	qYTpYhca4mVihE5CH1Eik+5zttOfLUAndFpYFsBAVvNWsS26yDWwiUiCqDVVTcymXkbCr4JpjEl
	t
X-Google-Smtp-Source: AGHT+IEVevAYSLR44D+GihSjtH4oL9qYSLonjNWYm2pjRCOzVNPL9m1Va4v1qdENSADfoK74QoUiag==
X-Received: by 2002:a05:6a00:13a4:b0:714:3acb:9d4b with SMTP id d2e1a72fcca58-7199ce207bcmr3886090b3a.18.1726839582458;
        Fri, 20 Sep 2024 06:39:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b97e45sm9811846b3a.164.2024.09.20.06.39.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 06:39:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/16] busybox: Fix cut with "-s" flag
Date: Fri, 20 Sep 2024 06:39:11 -0700
Message-Id: <5f75aaf0489f40bd35cdd27322e4d1189e30a9e4.1726839438.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726839438.git.steve@sakoman.com>
References: <cover.1726839438.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Sep 2024 13:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204752

From: Colin McAllister <colinmca242@gmail.com>

This fixes and issue that allows blank lines to be incorrectly output
when the "-s" flag is included. This issue propogates into the
populate-volatile.sh script in initscripts. If a volatiles drop file
contains blank lines, a blank line will be included in combined users,
which will incorrectly result in a difference in the number of combined
users versus defined users. If this happens, the volatiles file will not
be executed.

(From OE-Core rev: dfbcf0581ab3dd47037726a7b8aa06f777792473)

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-cut-Fix-s-flag-to-omit-blank-lines.patch | 66 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch b/meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch
new file mode 100644
index 0000000000..a0a8607b23
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-cut-Fix-s-flag-to-omit-blank-lines.patch
@@ -0,0 +1,66 @@
+From 199606e960942c29fd8085be812edd3d3697825c Mon Sep 17 00:00:00 2001
+From: Colin McAllister <colinmca242@gmail.com>
+Date: Wed, 17 Jul 2024 07:58:52 -0500
+Subject: [PATCH 1/1] cut: Fix "-s" flag to omit blank lines
+
+Using cut with the delimiter flag ("-d") with the "-s" flag to only
+output lines containing the delimiter will print blank lines. This is
+deviant behavior from cut provided by GNU Coreutils. Blank lines should
+be omitted if "-s" is used with "-d".
+
+This change introduces a somewhat naiive, yet efficient solution, where
+line length is checked before looping though bytes. If line length is
+zero and the "-s" flag is used, the code will jump to parsing the next
+line to avoid printing a newline character.
+
+In addition, a test to cut.tests has been added to ensure that this
+regression is fixed and will not happen again in the future.
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-July/090834.html]
+
+Signed-off-by: Colin McAllister <colinmca242@gmail.com>
+---
+ coreutils/cut.c     | 6 ++++++
+ testsuite/cut.tests | 9 +++++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/coreutils/cut.c b/coreutils/cut.c
+index 55bdd9386..b7f986f26 100644
+--- a/coreutils/cut.c
++++ b/coreutils/cut.c
+@@ -152,6 +152,12 @@ static void cut_file(FILE *file, const char *delim, const char *odelim,
+ 			unsigned uu = 0, start = 0, end = 0, out = 0;
+ 			int dcount = 0;
+ 
++			/* Blank line? */
++			if (!linelen) {
++				if (option_mask32 & CUT_OPT_SUPPRESS_FLGS)
++					goto next_line;
++			}
++
+ 			/* Loop through bytes, finding next delimiter */
+ 			for (;;) {
+ 				/* End of current range? */
+diff --git a/testsuite/cut.tests b/testsuite/cut.tests
+index 2458c019c..0b401bc00 100755
+--- a/testsuite/cut.tests
++++ b/testsuite/cut.tests
+@@ -65,6 +65,15 @@ testing "cut with -d -f( ) -s" "cut -d' ' -f3 -s input && echo yes" "yes\n" "$in
+ testing "cut with -d -f(a) -s" "cut -da -f3 -s input" "n\nsium:Jim\n\ncion:Ed\n" "$input" ""
+ testing "cut with -d -f(a) -s -n" "cut -da -f3 -s -n input" "n\nsium:Jim\n\ncion:Ed\n" "$input" ""
+ 
++input="\
++
++foo bar baz
++
++bing bong boop
++
++"
++testing "cut with -d -s omits blank lines" "cut -d' ' -f2 -s input" "bar\nbong\n" "$input" ""
++
+ # substitute for awk
+ optional FEATURE_CUT_REGEX
+ testing "cut -DF" "cut -DF 2,7,5" \
+-- 
+2.43.0
+
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index bc1619d1a8..42dd5f71eb 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -56,6 +56,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-awk-fix-precedence-of-relative-to.patch \
            file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
            file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
+           file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-- 
2.34.1


