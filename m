Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7464EC7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 02:22:49 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.3373.1685672561062840758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 19:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=GacesFKd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64d18d772bdso1821117b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 19:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685672560; x=1688264560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/ehU33ZEheEfa6czVcBBLJIW1eMDAPlHbslHyfbV/g=;
        b=GacesFKdeRYCs46J/HWe5CUjFHfL0+HUFbBqnDndbkV00dyFQgiS36vT+U7NX6r9in
         EzfZQjFfSuj/z2c3/S+w3LO3HE4QBXRvMOW+HuZWyo0UdheNGIxdvSbhVYmLbEpT0GCQ
         iJy/KRcIOEBnCkL64h12bw46pE46yq6WVLKayVsqPiXoXjLJiL1yj/u3Cy64sW3IZrgV
         1MEKeiFHQG48ys9mqrOhbi4UHdOtF1ilcyD/Qh2y9F9Qftd21/slvADFv9CaRIXWmLxA
         GsOHu6XCBmSgwSZXpodCD+tgnzHVL+U3Iah/8Hi6oMko0GMoyW5oy4nqSUuZ34oSpRAs
         lV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685672560; x=1688264560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/ehU33ZEheEfa6czVcBBLJIW1eMDAPlHbslHyfbV/g=;
        b=gd8JvDLEn90nD0VoYK49B+OlSDnjqDGY+nyDtHc/7qPJAA9PdnovfZtLL9WxTbWH1D
         GM4PLMxC3vK34cUkmG32b7QbPGXYhCGrBjFpZ06BC0SxS3HP1hEEtOEOrMs/N+QM6XV3
         rRDYhxXxpsD/Ajn1fntUIz2bJMma8q0alSojB7D9JZ5WBEC7ARI1AV42RqWYo5/eVBrz
         34K89a3vFduro3hPCopANCx5Tr6dUouxsGoE6MWPeHUepYJOhHx1koLzLmlN9zbu5/rH
         q2j45+A7Dcu+Jsx35U9QzGbEeHE8WYwQ/aFVfHm5JmePIo1TxIXm4nBMREYpNzZctPs0
         esNg==
X-Gm-Message-State: AC+VfDwrGCGlneFJGcWDQ8arWc53M9ITISygxRFS9sihBduU3y7xd0yK
	hciKqcSRKAxgzi/J45X1GbWbgNCa4b1VDS7siGI=
X-Google-Smtp-Source: ACHHUZ5PMH2mxAHMNZ/a7gmd10fHgWu7UIRyNkUlmRMRt6k79CSHWbfgT6xhoxqOkZC922E/8qDR7Q==
X-Received: by 2002:a05:6a00:9a5:b0:641:39cb:1716 with SMTP id u37-20020a056a0009a500b0064139cb1716mr14485012pfg.20.1685672560104;
        Thu, 01 Jun 2023 19:22:40 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0064fc715b380sm5850234pfn.176.2023.06.01.19.22.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 19:22:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/13] populate_sdk_base.bbclass: respect MLPREFIX for ptest-pkgs's ptest-runner
Date: Thu,  1 Jun 2023 16:22:09 -1000
Message-Id: <3cdfdeb8f18dd467e2c5c6e9d6e3739aaf5c0c3d.1685672395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685672395.git.steve@sakoman.com>
References: <cover.1685672395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 02:22:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182133

From: Martin Jansa <Martin.Jansa@gmail.com>

* since "populate_sdk_base: ensure ptest-pkgs pulls in ptest-runner" change:
  https://git.openembedded.org/openembedded-core/commit/?id=ecff0642be5781f7f6cca617158b04ac9a0e85f0
  in multilib build when building lib32-foo-image it can pick wrong
  ptest-runner package if it was built in the same TMPDIR before the
  image, do_rootfs then fails to find it, if the package manager config
  doesn't have 64-bit feed enabled:

  opkg_prepare_url_for_install: Couldn't find anything to satisfy 'ptest-runner'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 4d24749e7e94881bb952f5c927f0012eb70d4390)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index 1c619ef3cf..b23ea26d40 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -15,7 +15,7 @@ COMPLEMENTARY_GLOB[staticdev-pkgs] = '*-staticdev'
 COMPLEMENTARY_GLOB[doc-pkgs] = '*-doc'
 COMPLEMENTARY_GLOB[dbg-pkgs] = '*-dbg'
 COMPLEMENTARY_GLOB[src-pkgs] = '*-src'
-COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest ptest-runner'
+COMPLEMENTARY_GLOB[ptest-pkgs] = '*-ptest ${MLPREFIX}ptest-runner'
 COMPLEMENTARY_GLOB[bash-completion-pkgs] = '*-bash-completion'
 
 def complementary_globs(featurevar, d):
-- 
2.34.1


