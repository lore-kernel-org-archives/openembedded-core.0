Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8839C6379F
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.27674.1676931643766749361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=CRgUgQP1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id u17so3062988plh.6
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GXGSp4f/rTrjJ5kWIbKpL8tGIcvDBuOj/JHmbmWINIw=;
        b=CRgUgQP1jogCP3E2YxG0rHytfw1331RDSzFBHwXcbOfRUGyMJm7Aauyd+RXChXuy/N
         V8HnYuVfCu4is/wdNLxUeqiNCDQg/qb0egbNc2uybKfZ0aceAIpTOrmVUHQSdjisy35q
         zQiSBa9AGtUEqovGcb2wBs8O/uZDHOxOtgow5nKWoW1BQeHUIZpKkIip3b4shTrLIL3V
         gk6iHH+OaboBmH67PZ1BgA1xB1YsUPu0Yq0gDXICScRAET7rmw5Md254wdjIEbfCgksj
         FSTFGjDgbpsenXhaoMdiyTQ+YmzYucJ9vuTaEbwKA8Y1BQl++G8Cmkldv908q60T8QFq
         TqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXGSp4f/rTrjJ5kWIbKpL8tGIcvDBuOj/JHmbmWINIw=;
        b=b46IV2RuEmbnB35L1VnZvLlEMGZafk6ggELmA4THtHKguKJFqWiKVA6Y8tYeJw4a/D
         U/hacHdXXx3Hgvm+XdysaOT3Bxnu7i319RUe12l02HKgjUO9JcFNijU80YMkaJbAyJC7
         kU9PsOYy47THdyric1p5SgqU5EbTR6QE0vEiPsi4h9BUcABVSAI3daQfJDZZXjupQrCi
         5/Z+6nqaiFcvAo1bI9uZzegYWrR7Zl4LylBnboUSn12Dvgbl5nwiEQF4wI95cMMLJSJM
         mkGvV7sgA6FAadDRARfHm2/NCB5ZmQmEmbOYC5BIWagLMm6nCw3zt8DK9Yv0ucWehP50
         V/yw==
X-Gm-Message-State: AO0yUKUkjhpDIRN08N3LznRLUF+BewEanOBXhhSwtU/Ifp9II6gtYTrl
	a2OBMURTXCn61BYmNQPt8XPRtGAvqzpJqRydo0o=
X-Google-Smtp-Source: AK7set8DPlYFNgpWyrlhX7bVHIgs8Lbv+tHZP9rUPdgRg/ELVZmPrqkUXix9aGp48cG1E7y3L+G+VA==
X-Received: by 2002:a05:6a20:6a0e:b0:be:b137:9d2d with SMTP id p14-20020a056a206a0e00b000beb1379d2dmr3130964pzk.58.1676931642699;
        Mon, 20 Feb 2023 14:20:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/16] quilt: use upstreamed faildiff.test fix
Date: Mon, 20 Feb 2023 12:20:14 -1000
Message-Id: <444494290c349d481a164b865ef97db7f84ffd44.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177467

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50b81a263187af4452d3b99967bffd01c6ddb476)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../quilt/quilt/faildiff-order.patch          | 47 ++++++++++++-------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch b/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
index 40f3c2636a..f22065a250 100644
--- a/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
+++ b/meta/recipes-devtools/quilt/quilt/faildiff-order.patch
@@ -1,28 +1,41 @@
-This test assumes that two lines that are output on different streams (stdout
-and stderr) will be read in the same order, but thanks to buffering that may not
-be the case.
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
 
-Change the expected lines to be regexs that each match both expected lines, so
-the test always works no matter the actual order the lines are read in.
+From 4dfe7f9e702c85243a71e4de267a13e434b6d6c2 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <jdelvare@suse.de>
+Date: Fri, 20 Jan 2023 12:56:08 +0100
+Subject: [PATCH] test: Fix a race condition
 
-Bug filed at https://savannah.nongnu.org/bugs/index.php?63651 to discuss a
-proper solution.
+The test suite does not differentiate between stdout and stderr. When
+messages are printed to both, the order in which they will reach us
+is apparently not guaranteed. Ideally this would be deterministic, but
+until then, explicitly test stdout and stderr separately in the test
+case itself. Otherwise the test suite fails randomly, which is a pain
+for distribution package maintainers.
 
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
+This fixes bug #63651 reported by Ross Burton:
+https://savannah.nongnu.org/bugs/index.php?63651
+
+Signed-off-by: Jean Delvare <jdelvare@suse.de>
+---
+ test/faildiff.test | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/test/faildiff.test b/test/faildiff.test
-index 5afb8e3..5f32f71 100644
+index 5afb8e3..0444c15 100644
 --- a/test/faildiff.test
 +++ b/test/faildiff.test
-@@ -28,8 +28,8 @@ What happens on binary files?
+@@ -27,8 +27,9 @@ What happens on binary files?
+ 	> File test.bin added to patch %{P}test.diff
  
  	$ printf "\\003\\000\\001" > test.bin
- 	$ quilt diff -pab --no-index
--	>~ (Files|Binary files) a/test\.bin and b/test\.bin differ
--	> Diff failed on file 'test.bin', aborting
-+	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file 'test.bin', aborting)
-+	>~ (.*[Ff]iles a/test\.bin and b/test\.bin differ|Diff failed on file 'test.bin', aborting)
+-	$ quilt diff -pab --no-index
++	$ quilt diff -pab --no-index 2>/dev/null
+ 	>~ (Files|Binary files) a/test\.bin and b/test\.bin differ
++	$ quilt diff -pab --no-index >/dev/null
+ 	> Diff failed on file 'test.bin', aborting
  	$ echo %{?}
  	> 1
- 
+-- 
+2.34.1
+
-- 
2.34.1


