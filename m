Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B65C64EC3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:32 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.109.1675289790981978689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KSLSEuYw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id a184so13620967pfa.9
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnZY6KZVheVZrvGxrwHQ8jsgZUC2m+rPdd3L7LYmwVo=;
        b=KSLSEuYwGncOKicd8cTY9gqoW9h5hvB4JSHj2zQkTg7auYeEKTnAnFC6tse8bQCda9
         ezkfBPdpzeT6aURf144Lr3KnpUXJOoVOiAC5PC+mIdGvBB9bsVs8NR4HM0+Kvl2TSae3
         9SvPc+fDDW3KP+lroYLH3XjCC49DLfIO4O7QEgLmLkFJpwdcDDBUMoGZ+wVlJr07us/M
         9j8qpxOBcm4+CMIvOEogck0C8AfHUHdl7Cb1gV73tQfwLshiGqA4NBvN9qlDnU+kdUMk
         3HWb1V2Rmg9QcBKkenL5KPmnlSRZBPPB68vtAfM+p/V9EleWlXKKmpk6ukqAvVpWcCcR
         V8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnZY6KZVheVZrvGxrwHQ8jsgZUC2m+rPdd3L7LYmwVo=;
        b=BYBZCwUFg0HGqnHDucftwu9KPHiXfu/J9KOamZ73XcFDnV3U/0cSFbqd5N2ahAj6B2
         U8LpZ/m40TU/YQ33JjptaAVYJp3GmkYme3E4yLJJpqPlLhz0uxIWj0iTvPshHB15PSkx
         zJrJ4orQrdqaKBGblilN8nWBHKrm9JHdKSWFw4YzEzegLan54H+iS+2c0NPsFkAyM62z
         7TzhO/8b985C1RNI3OIM6vI/QRoBQ8oBAphF4A29oMAmxCCVJtfGSHVmPsLE1F9xWmBj
         4BnJs6hgPeswqpmtjLkL4XRuc76LiCeJHLijPuMWM4FQrBuk6ZiduPJMOYJWE0dif3Ve
         /CxA==
X-Gm-Message-State: AO0yUKWzwyswYn85PEcuTcsxvumhqkasxPBpG3/UODgveaDVTF7Isvdk
	Sh6y0/9nA4aCeMLp0k259Y17C+coOcD6I2syLTA=
X-Google-Smtp-Source: AK7set8GU0ZfZk0po6eNsgC5JUn7dF6vwonDnGXGa25ZTY+w1a2qBE4/+IXB+q6qI/MSC8JQ+rNPmA==
X-Received: by 2002:aa7:8a10:0:b0:593:a226:38ee with SMTP id m16-20020aa78a10000000b00593a22638eemr3202489pfa.25.1675289790008;
        Wed, 01 Feb 2023 14:16:30 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:29 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/13] quilt: fix intermittent failure in faildiff.test
Date: Wed,  1 Feb 2023 12:16:00 -1000
Message-Id: <9f72693736a3a7a06a83022d98b389f1218532f1.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176666

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


