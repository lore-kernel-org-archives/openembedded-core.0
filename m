Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49A1C64EC3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 22:16:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.102.1675289800679034734
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 14:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Vw7OmYKP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 141so35345pgc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 14:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53FCvyfLIkcDD/05rjR9JVUFcBZaXdSGj7jwji5Vi2g=;
        b=Vw7OmYKPSqaSgJDkDd3yPY01asJiFXsf1BE/oVvKMuNtpLIDA8AYj2tvMDhFvzHTX5
         sLNrMFMfGZeoCTQ8gMuaZSYszzazvyvUr2/lN8/kCiSrcVwGQzv7QcUC/v4UtewAhCCa
         YoVP4zWr3TNCcEnpQkUz4hl2HTnKO/Vc60aQp8xINhGD7+nVj0AXNPwHNg20xdYvW7au
         FnVWJ+0rnwKXTIA1gaplP9PAUEaGj7cBoTTmxlRjucJAXMig8dcxwYFdH72nCc7DeALx
         wROdlFEma8bpC3zAP4uJgyCnRML2rOUcrKbXd6opkptaIoS55+KxtUYuAyR9dgiUCBGz
         oCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53FCvyfLIkcDD/05rjR9JVUFcBZaXdSGj7jwji5Vi2g=;
        b=eg/Zs1a8pyFsY8K4/nG4Js/Fh3f9CZrCW4Iwuba3U6BVYNNzeA2pQtZhWBFt8fNBR+
         9Iu954+UvZmXZSmb70qaThgBZ4PzB/TlVXliuEJL5EiS25gZCuiih06caX66uoO8AiNX
         LaXK5W5nWKkjpfAvfvIaL4KZ4UoJGiPo9UTGPnsCzzRzfH1tyIz4Ft70gHmWAuQ4CWD5
         6eK9zr+ptML45vIdy0gzClImJDjdn55LGCRpn3mHp7OrC3HBvYNU3wnnGKfCjDSp65mV
         yvYN+fdr8uzpv2LoAAn+9IyfYvAMA3x6NG7A7a5rV9TFuHNxLdoZY8xLjImahpK+dOsf
         39lw==
X-Gm-Message-State: AO0yUKUXhQLpx3VlTwGgb/CVZBE/DjIQRE9KYYCBirVN1z3xw4HooAOQ
	hBOOHXaT+84PvRM1MCyqoMIu8EffrfOLZaftYhw=
X-Google-Smtp-Source: AK7set9ctk3zj2wAClKP9axJqA04P1Errmf6P79RhcFXdNL1Z3XNke/EJV58Ar2Bdsz29GsYbqIAXA==
X-Received: by 2002:a05:6a00:230c:b0:56c:232e:395e with SMTP id h12-20020a056a00230c00b0056c232e395emr4645262pfh.15.1675289799693;
        Wed, 01 Feb 2023 14:16:39 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h10-20020a056a001a4a00b0058df440d51esm11904810pfv.193.2023.02.01.14.16.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 14:16:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] quilt: use upstreamed faildiff.test fix
Date: Wed,  1 Feb 2023 12:16:05 -1000
Message-Id: <135a9094fc9e2a525b568960a909cb55ec1d25c5.1675289652.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1675289652.git.steve@sakoman.com>
References: <cover.1675289652.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 22:16:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176671

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


