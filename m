Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF859CF9C72
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 13:14:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.36270.1727097254672392798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Sep 2024 06:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DObmfqod;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71923d87be4so3196287b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727097254; x=1727702054; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG4PzEnQF5zWWKWOGpz26B0dPjef/ZvUoq9o7FW4IoQ=;
        b=DObmfqod6nyiym82RZqeZYwkrf+DYmLHSyuy7Tk3NmUUaQoZo2jOmxnexOPktvedab
         JcVVwFF9bW32fLfnBkZYCHtTztcN2ZZlBlCfHz+ZvCdZzgSQq5Mwg3NYOOuDQyLNdNRw
         iTqjfR26aMGycWiztDmN4yhcw5bDp+XaKdG/wEuEqdalsrfUQjpJAXZeLa2KG7zTy8lL
         t5uGolMzjA5itb352yEGD3bjfG8pPIuJaxYoBxn87ukSZmHcltl0AWnpFzTCM/w6mi8o
         sRpOvK0FkcHbNtIiMGLAZSrNiNAlHY55xVs4Mn0G4NrotcyRTLqx+ges0TkDqPG8j4Wk
         rE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727097254; x=1727702054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sG4PzEnQF5zWWKWOGpz26B0dPjef/ZvUoq9o7FW4IoQ=;
        b=Q8O//JOlhOQ1pK12mw/Bv8kqZv6ahLg5N6j4QmVDotejB79GCCLNnRWCbbRTHEZ4M+
         XrKYPk0Zjzw0Sj3Ltsi3WmkbHDAFMLmKePXtBzv1+MSGjV346IRucEwytVngm8UEcG+u
         7LJA5OEuGMQeJzpvABr6DLed3WVXHL98PM0/h/kMg+tWJn/NFFccoC4jTmyr1Q2/DHd7
         pXeq1FohQsaACckAnbBAnCYcHgQTHa78IYhB5xC2nUvAQQ+XlFc71XCWljQhZLW8+0eO
         05VzZddcJN8P//51tEjwXPN+mXApAwoUW79/0XNOLSoznl+h1LrV9U5P92MivgDnYIDZ
         OzKA==
X-Gm-Message-State: AOJu0Yy400m4UBVSoJ3oB8ahDBeFex/t54OVSlMcPciMSJLjOqZt8sPb
	++8PGTr5uatD6ZW26W2wNApp61KYUhQL3eN8xsOclD1MgdiBJA+QX58WSXV7mEfADPaMjKAhVzz
	mndE=
X-Google-Smtp-Source: AGHT+IHEeYq/2QZJBNIlhOP5Df2JowdDGl9ZqmJqT3Z5/frZFW7OcUSE4O5WevYUR1G1/2amZksQjA==
X-Received: by 2002:a05:6a00:124f:b0:717:869c:2c60 with SMTP id d2e1a72fcca58-7199ca3445dmr16537401b3a.26.1727097253789;
        Mon, 23 Sep 2024 06:14:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b7ee58sm13831391b3a.127.2024.09.23.06.14.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 06:14:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/15] busybox: Fix cut with "-s" flag
Date: Mon, 23 Sep 2024 06:13:48 -0700
Message-Id: <5576ff6e7676a09649fdbf0042f5f64a1ec1023b.1726971209.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726971209.git.steve@sakoman.com>
References: <cover.1726971209.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Sep 2024 13:14:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204813

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
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
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
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index dbcefbb274..6bffbbb5a8 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2023-42364_42365-1.patch \
            file://CVE-2023-42364_42365-2.patch \
            file://CVE-2023-42366.patch \
+           file://0001-cut-Fix-s-flag-to-omit-blank-lines.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.34.1


