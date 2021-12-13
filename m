Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1153FC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 15:37:10 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.12597.1639409829748093130
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gfid/h9S;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id y9so1725407pgj.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 07:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aEExQrmiTrG7i/ns7RcwWHVqSh+3vJZDHyhJJVvvNfU=;
        b=gfid/h9SBi8HeTTI90qDTb/K+P9FxiiCEXij6o1oF4qjxWAemVAvBq6GRhi9gMrgYC
         6kr/a65RnUkA7ygWOZH1qEZBkKAYParBO1rJgC+/nJx2P/igi2K6BMszcieW/u4op1HV
         zoqmeNaf3p+gHbXOVHKkcQIx10yM/76p503O3StswGfgkBzl4ce+pRVJy2rWAlnl+5fQ
         rZwTdknVp5cVFHVyjiVTCNvzlKYexJjmn8TSoEzlowvspsqBTDa+38hdqz1G6Q9efOG9
         0Bp5bJUwfXI379LU4a3K8x2T9mlCR3D5qNchnD7cGSD3k9nBvrXGNKkCYbRujmDArnVJ
         2a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aEExQrmiTrG7i/ns7RcwWHVqSh+3vJZDHyhJJVvvNfU=;
        b=wvopAyVOGGDTE/+mDQVKHXUN/gpnt6amaiuTa5+LfnStCF4b7VN7aC7Gcs/5uH4dYs
         SsGSgX/2PvLKVEPMWtwibMiInbhHUm3AS5gz4QBNbovWhxFR6agSp4k26WwiF8oJ0h9A
         klUoRGoSysVX2+ZQQ2yVSPlTZP/R5uT6Vt6iF2RnlplHba9e8ldJINnRaFHve8ASiuen
         TIkJVEIUQhVbGBsitooa8VV1bv7Vsos2rDMp4FXyN0E0VkZD/g9jmNSybkIFpYYdRGaH
         HXBxMFvNDbccbry0P+yPZa+MeO9j2IyRC6DBJ47Arjp/J+WVAIke7kdDrn2Uq5ge0/e+
         aK7w==
X-Gm-Message-State: AOAM5328ZzjUpaPtMDeu5jAZ5Wgto8LgnhZbCAeIhmBoAPgXXDeM9hX5
	Wy30JXfoxslrb7bTC0vRm0TO0sQ8j4xF3s3/
X-Google-Smtp-Source: 
 ABdhPJwwoWjrS218c3bVQU/KKIdCZW4TW44zfxnnOSbp9LzY33Jg2TAXGx+Oe0hSDtlxghjqLYtmHA==
X-Received: by 2002:a63:5b13:: with SMTP id
 p19mr34822943pgb.613.1639409828699;
        Mon, 13 Dec 2021 07:37:08 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y28sm12850297pfa.208.2021.12.13.07.37.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 07:37:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/10] selftest/devtool: Check branch in git fetch
Date: Mon, 13 Dec 2021 05:36:27 -1000
Message-Id: 
 <7d26bdcfef6473f64c73e8507bce334e010c3cad.1639409496.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639409496.git.steve@sakoman.com>
References: <cover.1639409496.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 15:37:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159652

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
forget the url branch= parameter in the devtool git fetch test.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1419168a58a5caf99e24ada08c9ab639344a78b4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 713efd71bd..87e71632ab 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -442,6 +442,7 @@ class DevtoolAddTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
         url = 'gitsm://git.yoctoproject.org/mraa'
+        url_branch = '%s;branch=master' % url
         checkrev = 'ae127b19a50aa54255e4330ccfdd9a5d058e581d'
         testrecipe = 'mraa'
         srcdir = os.path.join(tempdir, testrecipe)
@@ -462,7 +463,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.0+git${SRCPV}'
-        checkvars['SRC_URI'] = url
+        checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with revision and version specified
@@ -481,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):
         checkvars = {}
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.5+git${SRCPV}'
-        checkvars['SRC_URI'] = url
+        checkvars['SRC_URI'] = url_branch
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
-- 
2.25.1


