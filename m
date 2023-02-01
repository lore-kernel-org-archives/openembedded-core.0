Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D6FC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:22 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.24062.1675260855272100648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NUN39OIY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id bd15so1083293pfb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnZY6KZVheVZrvGxrwHQ8jsgZUC2m+rPdd3L7LYmwVo=;
        b=NUN39OIYENuIhIxzCM1ho/lZX6QzEmgmU1JIOUKBdeZLwDqY2tCeJal3ggrQR8Jx+i
         7y+bKqgJFLmo7ZKi0jL/xeykI/UNqPmipM6qvcI/ljGpLFmxW/5h3M1aQ2SpzU73u/og
         KIQpMpSEZBQXU4HuJXhqXkVnN46LoZLyPHqRUQVNq+F2ACFmT6tNefJvW8fmXS9XZJ+z
         b1mMaovb1m+QD97/kNBJB1/zwmjYiO77t8hAIv523v5wNzQAoPfF9s4oq1NlhI3teAi1
         +d76jw78P71GASGFrQpWnwWddD1DWGB2MwjtkmQv6WcFVIh8Tf0f0yGnlqKWVUXAw0Db
         rW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnZY6KZVheVZrvGxrwHQ8jsgZUC2m+rPdd3L7LYmwVo=;
        b=Qzob4+9oWsUXHaMKQUgI1MSjI5xNKWV7SEn3RjVofri/5W/omq8uRzAlhEUGz1H4Qs
         adQr3nFa7CbBaTcyUbLDuUYZZ5T7hdcEs3wdy+6RP1sAvsUyqJK2DD++dWS+7HUg7ow+
         QD8vIhRgF3XlytOgIIZl3bVQ+j3+kB/f5HHjRDHa2AwVeTV9aIxU4fXI8+KWmOQWL0Zw
         AyEg80qqRnYrPiTu8qjmBieXh5H+sDDkwzNB48cd7/arq2DzW1dSdvxGFoP1EQbe9ekS
         jWxDV2rxX5aNzqSFXJvxliHcYFI/OjIy0x4eYULhLVonlCy4MJmQsRNHHqX+0JDioOT5
         dfxA==
X-Gm-Message-State: AO0yUKXA7V34oPr2mPiA/jS352Hn9nkYFplKGADYKQs14AbC+xWpimBE
	VteDU/XdQpRkSA1RQzYw9oe+tdP5esr95pMZvmE=
X-Google-Smtp-Source: AK7set/wpgQe85wONU8ibSafYouKDjRaLdCBzeyaKzYAOnlWuVdYWa++eksJ18is2J5BXrsLr7uziQ==
X-Received: by 2002:a05:6a00:1581:b0:590:22b:c29d with SMTP id u1-20020a056a00158100b00590022bc29dmr2984092pfk.10.1675260854263;
        Wed, 01 Feb 2023 06:14:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 06/17] quilt: fix intermittent failure in faildiff.test
Date: Wed,  1 Feb 2023 04:13:44 -1000
Message-Id: <199df863c16044875709b9bc0221941cd24edc70.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176541

From: Ross Burton <ross.burton@arm.com>

This test assumes that if a child process writes one line to stderr and
then another line to stdout, and stderr is redirected to stdout, that
the order the lines will be read is stable.

This isn't the case and occasionally the lines will be read in a
different order.  Change the test to ignore line ordering.

[ YOCTO #14469 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1ddbe4d2bd8d8da10dac8a054f130fcd1d242219)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/quilt/quilt.inc         |  1 +
 .../quilt/quilt/faildiff-order.patch          | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index ec69705093..fce81016d8 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -13,6 +13,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://test.sh \
         file://0001-tests-Allow-different-output-from-mv.patch \
         file://fix-grep-3.8.patch \
+        file://faildiff-order.patch \
 "
 
 SRC_URI:append:class-target = " file://gnu_patch_test_fix_target.patch"
diff --git a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch b/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
new file mode 100644
index 0000000000..40f3c2636a
--- /dev/null
+++ b/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
@@ -0,0 +1,28 @@
+This test assumes that two lines that are output on different streams (stdout
+and stderr) will be read in the same order, but thanks to buffering that may not
+be the case.
+
+Change the expected lines to be regexs that each match both expected lines, so
+the test always works no matter the actual order the lines are read in.
+
+Bug filed at https://savannah.nongnu.org/bugs/index.php?63651 to discuss a
+proper solution.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/test/faildiff.test b/test/faildiff.test
+index 5afb8e3..5f32f71 100644
+--- a/test/faildiff.test
++++ b/test/faildiff.test
+@@ -28,8 +28,8 @@ What happens on binary files?
+ 
+ 	$ printf "\\003\\000\\001" > test.bin
+ 	$ quilt diff -pab --no-index
+-	>~ (Files|Binary files) a/test\.bin and b/test\.bin differ
+-	> Diff failed on file 'test.bin', aborting
++	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file 'test.bin', aborting)
++	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file 'test.bin', aborting)
+ 	$ echo %{?}
+ 	> 1
+ 
-- 
2.25.1


