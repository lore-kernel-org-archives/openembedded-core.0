Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1AAC0219E
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 14:09:58 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.96073.1726322992320760718
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Sep 2024 07:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DmQ8ofdg;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: colinmca242@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-82aac438539so65807839f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726322991; x=1726927791; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eoxO7BhyCSEwq8mWKJJf/dN4z1gffSmughf3nGzUN+E=;
        b=DmQ8ofdglNVIbhYCdosudGNAEC9RLyH3FSgvTTKqbWT+B7JXe22hw8q59FTsfIWIpU
         v+G4TEflf7fYEodjgQtpTotxXvR/WK2aUh4N0X/lN/bHeTXlLQsjOT772Pd/8y6J3AWm
         HSo8pqztnxJ4gyxvGzaVucvjj4/wwF7bEF7yqDxhV64WEzPGP9WMyRYZrOkz98e8wu2p
         fkPkHwknFAjlCwnaDiEDnAgI4YX/WfWIxXrsb6feHWL7tpFjydfYB3XeGwFa8oQrgfS+
         w5nS7cNVIT9INHHRkqxIwEuxAIuVprgwne6gr18poKR7Iv77pxa0RPNLHtHHZeAXCdwl
         nk+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726322991; x=1726927791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eoxO7BhyCSEwq8mWKJJf/dN4z1gffSmughf3nGzUN+E=;
        b=IEzxWVsXJbyGRlmnekdgS3aCoJ0++wQZvJmpNymrMG15am7WY3LC8PiLN2Go/l183i
         UxnTmYCClhTOysm+qfyXSLiqs64qP6IGuMcl91mSyuvXfNmN7TBac5JeWykCUELzlDgh
         KuCrRQHlvg1q7iFgpch1uBJwaNc87GXIWYNoBNCZiiY5l30yBmqIqZPDQvSHXyBHAxPW
         4YhCSOfhl6lmOO5MAuGwZ44pU6C7dMgMDIUcWxiTwXQCnEzgJFuNFp5N3ucBAACP92HD
         uZ3Sc+Clb3N9Phqo7YSQphlRSIkeg7xPD/3brcBJZf/pR8uXdKVKBYRuoOALIig7wBAL
         m/Cg==
X-Gm-Message-State: AOJu0Yz256146VTxlJ9bTIH7i8G3Nv84mUdvNj1sriHvD+L8TdKQ2FTO
	V2zojXhDy1ii3lMgSY/z2dqiCmOcj9iXtbSBO+hmmR0s8cFs4RKFAM53akeE
X-Google-Smtp-Source: AGHT+IF5uuxqZvmX4UMCgmCMB6noJdzOCD86b6gYT+Y5XDVn2EpT/Gp4JJqgetnsAC7rsFTivcNUQA==
X-Received: by 2002:a05:6e02:219b:b0:3a0:4bd1:c1d6 with SMTP id e9e14a558f8ab-3a08b710dccmr55516035ab.9.1726322990696;
        Sat, 14 Sep 2024 07:09:50 -0700 (PDT)
Received: from rehoboam.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d37ed1904dsm417230173.108.2024.09.14.07.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 07:09:49 -0700 (PDT)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/2] busybox: Fix cut with "-s" flag
Date: Sat, 14 Sep 2024 09:09:34 -0500
Message-ID: <20240914140943.8349-2-colinmca242@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240914140943.8349-1-colinmca242@gmail.com>
References: <20240914140943.8349-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 14:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204495

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
2.43.0


