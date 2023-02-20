Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D69D7C677F1
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.28058.1676931634468030927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=J4S/Sbuw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id b14-20020a17090a8c8e00b002349579949aso2732670pjo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95Ik5+cDxOifQ/8Owt9McQ0F/wzmUTihLozPtc7nhKQ=;
        b=J4S/SbuwqhLNUzRqzunLHhWMbKu1Xmsie6h+ESAfgk4bBIUSLp00Tw38MPCq8esJUB
         7mC8uSeiJ7OqtG+HP84LITIVmcNu0DS5N3Hwsb9pDLGX0Gt89WTelUhyv9iDW5iIx8FR
         EOqXe1Ql/gHFgcfCYkTPZykY3RCnYqoiMZxUN/HAR5hdQy1INgkrbaxLHWIw1m/E/jIp
         E3ZJih6c+18t3ryO8rcJE+cWUOgTbUDx+uiTJEmZLejnbtzyaIUUYlPlH6T18GK0KEOh
         mM1p9V2lQ/HsjcVaPS/tTZiP0oymo+hu6wt0Io1qZBgis4vzY+kzbMEG+tLKevmL1eDt
         uDNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=95Ik5+cDxOifQ/8Owt9McQ0F/wzmUTihLozPtc7nhKQ=;
        b=5wZuyILCLD+S3Mqsklywt8Mjbj8SdFUHG4vO/XYqSFOFl2iUUimvdsDefN5PCNxvEv
         4+8r9+6Ec9OT8z42hvSlflKLPK8fEwpTEocmmP2/+hPwOHb/OmQXqlrCrrabpu1nTbhT
         qLGBQqvkktEYxSuBSUxmrXk+MScCcg05md9kx/eTazidpK0JoSq+pOFoB18k+BtMRINX
         sSQTZK0C0wnZK1xwOjzbXj050oQe7qAdX1zTkpFnmUQ3rLcFpz4bCx9XFqC3II3iRi9W
         pjAgWh1IsbXDzoW/c4qSmbuN4ain2otpWUBN0RJSz4jNx1FoyUYZ4fQ4q0va2JnAmPvn
         cnZA==
X-Gm-Message-State: AO0yUKWcDWi+/ckgnlBDCMIurcibNyZGWrYEg/lu07V5S0/b/c/0PKpi
	p+NV81bflYPbWJXHvWp01ign5YsKn2bpRlHDTEo=
X-Google-Smtp-Source: AK7set/OWLjw3zc0Y76N8L8bt5xnrxBXo/J8a39mTyj6rFzqtHiZvqX6etZTPCD2PQxceQXckfHDiQ==
X-Received: by 2002:a17:903:244c:b0:19a:95ab:6b63 with SMTP id l12-20020a170903244c00b0019a95ab6b63mr2787573pls.66.1676931640934;
        Mon, 20 Feb 2023 14:20:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/16] quilt: fix intermittent failure in faildiff.test
Date: Mon, 20 Feb 2023 12:20:13 -1000
Message-Id: <2c9fe8c3bb1cc1883c7bd445d019b2107e85ab2b.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177466

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
index d7ecda7aaa..ad23b8d922 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -12,6 +12,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quilt/quilt-${PV}.tar.gz \
         file://Makefile \
         file://test.sh \
         file://0001-tests-Allow-different-output-from-mv.patch \
+        file://faildiff-order.patch \
 "
 
 SRC_URI_append_class-target = " file://gnu_patch_test_fix_target.patch"
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
2.34.1


