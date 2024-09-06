Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634DBE6FE2D
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:48:06 +0000 (UTC)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web11.2233.1725637679739603629
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HTOCkG1s;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: colinmca242@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-37636c3872bso8214895ab.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725637678; x=1726242478; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MILHDirMWDMKds44wEX92rzhYKvsZICnSLKn/DxZHbU=;
        b=HTOCkG1sMkjPCJA4Iv1OLNJewc8eGOHfKzH0OLLxzTrTpCHJbLQ/EQPsq/sGq0tlxi
         8/sO7QHyeKNQMGlGbsbMBGeKPAG9QIIaLWs7zpvd8/eO2822tKNLMqvL/16qmnMNWRye
         hSfTnSIVzUERseaKW9X2GKAGY8XoF9qB8K6oxf7A2XZWu9QdL8qRL8+sNC+Gm5Zr7HvF
         zWpMzMAw9JFbuJ1grKUmMWE0jDm+6JFIuow95P0G9H12s2n75e2Osx3D8verXJrMZJZs
         yl9IIcEabme22dXY2d+FxLSjqhbOuuw9tFADej2fHDZpbkHnpdLYdspn8mspce09xPyu
         NZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725637678; x=1726242478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MILHDirMWDMKds44wEX92rzhYKvsZICnSLKn/DxZHbU=;
        b=VeLFMSSA7wNOBkjWW/sdhGb5Krz3mq9EvilQ/k5zJv8BT7oCLCkK1z8s3dxEtElds9
         SNyEa58zwO9tovc80PRPU3iMbA/i37+LXsBjsTGhP0Kw1rw8cDSeA+qOPCfAvGJEpSFH
         SQjbtHt9RKHTCw66UXzItFhOf40VczoYMyf8h9OZIiB04M9BWwJrnK+BL8NLO1IH41DR
         nm5CeYBSdLE3OZdJhGmgDyrF/8x+Wmnn29CNM7gRqb0fqcm8YBPWc4P3c2DDJtZoru48
         u1rAdPYsX5+tdlgX6BDNYnW6aQYlCNGMRu02FVJ1V1QnKUliy+ItKRrdDlzYejmr+Nyp
         l5cQ==
X-Gm-Message-State: AOJu0YwD8PoCUbUXC68WlXEDPF3ezsdpkOCjMYbpnj81kV5he+horjUe
	q9S4ssppsobNaN2GyIVAvrmZxfHqghGqH/YZ5AG0zl/Os+wwx7XdZKNgrA==
X-Google-Smtp-Source: AGHT+IGDzL9PECng5iBsohlfHYfAHWWqhgWH9xien4LW7yXUPd4QpklmZe7zNSJhUeBaOKSTk/JsiQ==
X-Received: by 2002:a05:6e02:1aa4:b0:397:6dfc:993a with SMTP id e9e14a558f8ab-3a04f0fdd80mr36667155ab.21.1725637678387;
        Fri, 06 Sep 2024 08:47:58 -0700 (PDT)
Received: from rehoboam.tailfd8bbe.ts.net ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39f6ebe5ba6sm18385535ab.13.2024.09.06.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 08:47:57 -0700 (PDT)
From: Colin McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin McAllister <colinmca242@gmail.com>
Subject: [PATCH 1/1] busybox: Fix cut with "-s" flag
Date: Fri,  6 Sep 2024 10:47:39 -0500
Message-ID: <20240906154754.15505-1-colinmca242@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204277

This fixes and issue that allows blank lines to be incorrectly output
when the "-s" flag is included. This issue propogates into the
populate-volatile.sh script in initscripts. If a volatiles drop file
contains blank lines, a blank line will be included in combined users,
which will incorrectly result in a difference in the number of combined
users versus defined users. If this happens, the volatiles file will not
be executed.

Signed-off-by: Colin McAllister <colinmca242@gmail.com>
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
index 980a96b88a..f7c3eff29e 100644
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


