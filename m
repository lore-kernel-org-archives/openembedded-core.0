Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F43FC636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 14:14:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.24062.1675260855272100648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 06:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=H02CpzsM;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id bd15so1083693pfb.8
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 06:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53FCvyfLIkcDD/05rjR9JVUFcBZaXdSGj7jwji5Vi2g=;
        b=H02CpzsMvDR0H3iFCJcwR/lTISL8D6nWo0lAP81F6Jzh3s1Gr0Gv9RROqYuSnljhL7
         rf3135ry1I4PLm44QAfO4iF6X3ulkRoByFj6J7SIjg1Aeh+5UA9MYMMoSHpvKYPDjcyq
         UfPLO/59xfHc1Yt8I0EwtB2qALhb8NogQjiInvNzokx34spUQDnmgmCEp8O2Ddz7BxMV
         HT9v2q4e5mDlx8kQP1bMtECXwSiiUXRKeIhiB/BY1DbND0g5jiSbad0UgYeAJ53yqx5W
         J7/SrYQp+idUwZ1n4Ck3aLzVNqcmmkrb09feWYWOqDAtrt6KcjyoKwcOJXUvUutkLDiv
         ws3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53FCvyfLIkcDD/05rjR9JVUFcBZaXdSGj7jwji5Vi2g=;
        b=bpbOIz17FXNvCUY56GkOxtnU8gq/pXFcK8yNB/N2E+j76VOtSX15g+msB2nR96FGl4
         +y05depAGvWysXRlSMzMSlMnkbPmv63qYmZxOuZ5CgbZEh8yfQWXQcr9nN7RuFzhNGsc
         VRDNAQtcO8V/3zA5qIWDBft0465FJ5AgVK7ipbUA7jWEgLCSBTsPsPzp/qjxFxnIisc7
         hDTQHgCbnhlimZXPEoGuiqXW9X+u0DVeVSsZNTRMJzClIWQXDMPle9OkdIrUJPSkSca+
         +OZifjhoWHezlwLUWvxSJAzIpyTUlJSjqR2furk7ZmgmcxRr5ik9Izk8tiATCvdWhJi4
         9u1g==
X-Gm-Message-State: AO0yUKWjsQ0wo2o8BbSLKwS1lP61gJBmiuLZjXWxlyxcpZQUEQJN+W7H
	gtamSD1ajAU+nxppzZ6gasg63x1YG7Y5arQZTZI=
X-Google-Smtp-Source: AK7set+yIhrkgCa7LHI4toeQxamVn3OPUJVsP7FotgTXTxrY1RpMye2x4fBu35E7qrbxslwsd9Byxw==
X-Received: by 2002:aa7:8004:0:b0:594:1f1c:3d35 with SMTP id j4-20020aa78004000000b005941f1c3d35mr797660pfi.10.1675260865607;
        Wed, 01 Feb 2023 06:14:25 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id n20-20020a62e514000000b00589c467ed88sm11456612pff.69.2023.02.01.06.14.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 06:14:25 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/17] quilt: use upstreamed faildiff.test fix
Date: Wed,  1 Feb 2023 04:13:50 -1000
Message-Id: <05a062c0112788b7c1f819e28bf7e9da47ad7e6a.1675260556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675260556.git.steve@sakoman.com>
References: <cover.1675260556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176547

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
2.25.1


