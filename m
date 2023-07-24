Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E18C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:58 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.39384.1690166034990545033
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=H9ILo603;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.180, mailfrom: steve@sakoman.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-34884a8f285so23130755ab.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166034; x=1690770834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNLxap/hBjr6Jmuwpr18Eb7WCBTH5tAE00EAwGjeQBg=;
        b=H9ILo603WMkJFVX2HrqxbvRGT6YlVHDQSdcMeCTuc4PpGa6leISUHcK+F+RWNDoEfH
         HoG2fWvDpGGiQtWva7WtmKXMOFJOlx6uNBY9yhjpZbrVDeeqLk+Onqk/9k26ZxCafIKw
         DNYIYH+NTuHgL2uNFKdKvhZorwhB8ms0N2MCg1KTNC1eb5O2w9lsc7KkREBCftNwaiR5
         TIwiPSmeJMX88ztpoGz2CRjRo8OiqnB0DD2HS6DQ97XgE7h/fkDnCXPtxq08r/92TI10
         HNmPnxTA8PbkXVwBsQX1oEiApaS9yz556NFVc6RuRKpBL5AgPXA6SdOm+ARwN8b+0wMh
         KbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166034; x=1690770834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNLxap/hBjr6Jmuwpr18Eb7WCBTH5tAE00EAwGjeQBg=;
        b=GalLsH6U5K4boiU3tBRbBSDx9FclBDVhSIGz21f8LTExCdTEkY2T7Yauoag99HmPiT
         w53yFoiK/AU8veMn2DzWJWEby1X4AQlJPxYwU/0UYKk1yfnFByw2eS2FW0QpscDqMxa2
         PBbchFetileGtdAUaawMQdtF6GTNIpVZPyJrhfxqlevEz22Q01ZSOPNwrxVQIe5MlPY6
         chav/zKeWpMiG8/zaQSNlUT5kKZ72SH48aODjjkxSk+sjAeHQTY+iyy+Mcwz0vo4Gq1B
         Nt+Vm3cZikZyNnKu5LbG9/0kz2Gop57I6X+gupvmmjcZqCEiHE+x/aCD6D6Sj3qNEVu4
         Rukw==
X-Gm-Message-State: ABy/qLY49zXP/tKmSdTg2sjUlSf9d2IJ24JyFzj5FxugTGD77VH3upOE
	nCNaMrwUvIV1fKVF3rfPwZLItFDp1dTTWAk6S3DuUg==
X-Google-Smtp-Source: APBJJlH9QdQAT7hsBnLr/JiCcZW8sZC5I9iUx69k90ov8E9dA0MZ89IZy283nsJ3lkqb3+XXX/VHnQ==
X-Received: by 2002:a05:6e02:1290:b0:346:66f6:4da2 with SMTP id y16-20020a056e02129000b0034666f64da2mr7201646ilq.10.1690166033892;
        Sun, 23 Jul 2023 19:33:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] gcc-testsuite: Fix ppc cpu specification
Date: Sun, 23 Jul 2023 16:33:32 -1000
Message-Id: <3a1b9f300a796e1216d0094043dba7b0f39ec869.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690165924.git.steve@sakoman.com>
References: <cover.1690165924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184776

From: Richard Purdie <richard.purdie@linuxfoundation.org>

After this change in qemu:

https://gitlab.com/qemu-project/qemu/-/commit/c7e89de13224c1e6409152602ac760ac91f606b4

there is no 'max' cpu model on ppc. Drop it to clean up ppc gcc testsuite failures.

In order for this to work we do need to pull in the alternative cpu option from
QEMU_EXTRAOPTIONS on powerpc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c447f2b21b20fb2b1829d540af2cc0bf8242700c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index f68fec58ed..64f60c730f 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -51,9 +51,10 @@ python check_prepare() {
         # enable all valid instructions, since the test suite itself does not
         # limit itself to the target cpu options.
         #   - valid for x86*, powerpc, arm, arm64
-        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "ppc", "arm", "aarch64"]:
+        if qemu_binary.lstrip("qemu-") in ["x86_64", "i386", "arm", "aarch64"]:
             args += ["-cpu", "max"]
-
+        elif qemu_binary.lstrip("qemu-") in ["ppc"]:
+            args += d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')).split()
         sysroot = d.getVar("RECIPE_SYSROOT")
         args += ["-L", sysroot]
         # lib paths are static here instead of using $libdir since this is used by a -cross recipe
-- 
2.34.1


