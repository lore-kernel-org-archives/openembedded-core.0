Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE72C02199
	for <webhook@archiver.kernel.org>; Sat, 14 Sep 2024 14:07:38 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.96026.1726322851758533921
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Sep 2024 07:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vb/55czg;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: colinmca242@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a07bd770e2so17278345ab.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 07:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726322850; x=1726927650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXsa22F3adsM2QNzfJof0Oai/4kAA2TDXfJebUQQs9Y=;
        b=Vb/55czgrviLO2CQtjCWEPgau2A6qCE5ZTZGAPpC7y+XDEDicGNTreS4YJm3Dhr5om
         etfV0EvH0ztStoM0pE1tDJ+Da8qbvehTv+X6v/IgoQGSRZZ76eLoHhX+tzlcBDlbRLdV
         AxH2rXgYRgeTxHGX146+rSZkcsscO4wu6R6XBzQSWxH4zj4hpSXX7dWoqURO4a6iWtyt
         caC4PSc8SUQKW4K0vWci9Hyn62mEoiKJu9V2Vh7QNDfHX2hhpJjc0Mcb6yefWFh4QTGf
         KyRd3Hixt/IgETxjHqL/2/tBiE3FvDoY/lcpQo7SA093i04sTRxw5X5+MXeqht+a9nAG
         k3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726322850; x=1726927650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXsa22F3adsM2QNzfJof0Oai/4kAA2TDXfJebUQQs9Y=;
        b=hlE2n93Im/7slSiaC+w6S9q6m7isdYaJxUFf2gUJ52Pq21c7TZaks2X2Z8TqBp9Rx4
         9Fwk4m+Zy8771nCeRm50zPgVb/rYEB3LiBrnFggpCa2DEvTpAlGHN1s5lUF2V7QNfUID
         +VUqpXTT0mlkRuKCX90sacMKdUiyHXHgUWZ7OAq6t7jNxvxVPaIGtSe4vNchgsffLIWc
         6BKUx1sGkieq2YJeZxIOBcW+OpSKzVSAGAFL6Ye+jeswPcJQYl4gWSa/P6D5kE4LiKNY
         qXRCn+G7+Vie3u384LDvcH8FpcQi+B0A0ir+TVUruvvJyk8HGXx4ggCTuGhlPEUbYvVt
         D9+w==
X-Gm-Message-State: AOJu0YyPIopRCvR1Gdc5RlniJ0iA0Kl5oSG+9E13PJhGWt4JljYhQru8
	2l+NTGBxfNcFa7XQ+N/3TXk8cMBI99i1GrwX7+UwesRaz67WIIwX2zbY0c1V
X-Google-Smtp-Source: AGHT+IGpyObiplgle5m5AN/F9waCGlpSoGDK+ZZKMkO8629rnY3y37FYqJELqCMc7AcJyMowZG5kaQ==
X-Received: by 2002:a05:6e02:13a7:b0:3a0:455a:388c with SMTP id e9e14a558f8ab-3a0848fbfecmr110473665ab.13.1726322849975;
        Sat, 14 Sep 2024 07:07:29 -0700 (PDT)
Received: from rehoboam.localdomain ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a092e1b77bsm4494795ab.45.2024.09.14.07.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 07:07:28 -0700 (PDT)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 2/2] busybox: Fix cut with "-s" flag
Date: Sat, 14 Sep 2024 09:05:16 -0500
Message-ID: <20240914140706.7770-2-colinmca242@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240914140706.7770-1-colinmca242@gmail.com>
References: <20240914140706.7770-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Sep 2024 14:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204493

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
2.43.0


