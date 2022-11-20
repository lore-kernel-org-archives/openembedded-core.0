Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD80C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:50 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.13235.1668953802137056149
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZIPX++GF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so7024376pjh.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGbIHVMWTYsG58trt2y5xO8zgQRB+Oj6CaRfibTparE=;
        b=ZIPX++GFzz9hrkOwE59Y/7WGU8/f9iNpVLA9hJ28M0U6b4WozleWs1iITwwC4qnQTl
         mFgO2Y81CX6O2Py4tHn0hucEHKu+/Kw7l604Lmo7DpKFecSCFI1HBk4TORRIHb6rS3lZ
         VOMMndg3LCTdpYxS2aMsv+vCN3SSg/fwwM7f3NGj6PL/xYvC/vbfN0LhW9YWdkpDBdZv
         oZ+rcrZhOLS+tcA4U5scR0MojP/YzH7wKtzX4e+TkD4JaIrYmjcThh5k804cKH1xVRxN
         HWU0EEOKy7pt0KoDPbsmpEeD9WRxorqNmiqNSgczvG0c7+DNREdoy5eNmlN4dudODllI
         GK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WGbIHVMWTYsG58trt2y5xO8zgQRB+Oj6CaRfibTparE=;
        b=4c6TGfiTsXJkkNiFZDQV6n4QRCdpz0jm9oQQtT9uS6+yTKwfbcU8dlQtKjl75SrqYp
         1NNs5Fu110WXsM00DDNYz+9zPczhLUHtgLTTBQaHR247Qf02+H1S2y2qQEiS987W5zyP
         4CQikrojCRVmDfedqnQwgIFj2y37O2cy0Uqd3RVUhjw2Q2iTshKO2KSvwa6zFom781/v
         uwrTBV8Jp10h2+xaVh7sa/i6bAju2RhnZsoMf1KrLESNhVN32KuJySe7tXv8q8JvJTLo
         uNDcfWIoNxk1gWBGAs9B/AhhCw0hcrLw/FPEXIHExG2wFEY0RUjut8UDQkYX8I8oQx0h
         vzYA==
X-Gm-Message-State: ANoB5pn10Fxjzyr98+JIcuPAEDXi0kksdEyN7FF2+T8ZhMoBapGdVnAC
	5NXGYb0giKxtzfisVj7fu2U16IChJVYLIA4mqyw=
X-Google-Smtp-Source: AA0mqf6CJ0lrfaImnataZyPC9Ovv7NXieK1a0sJ5xUmf1qKVgHy6o2nVCCfpFrd7k7Qe6eX9dMLzuw==
X-Received: by 2002:a17:90a:5d08:b0:218:770c:9a40 with SMTP id s8-20020a17090a5d0800b00218770c9a40mr16081877pji.158.1668953801058;
        Sun, 20 Nov 2022 06:16:41 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 34/35] gcc-source: Ensure deploy_source_date_epoch sstate hash doesn't change
Date: Sun, 20 Nov 2022 04:15:23 -1000
Message-Id: <1511cb3bae2d6e2dad48269108e68967ae302efc.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173634

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently if you switch machines, gcc-source do_deploy_source_date_epoch
would re-run as the stamps are tune specific. This hasn't caused much
of an issue until now, however if we fix the gcc recipes to reuse the
timestamp from this task, it does then create problems.

Copy code from allarch to ensure this task hash doesn't change between
machines/tunes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7e052d03464ba5e880a6c5a0e45ff2f467ef97e8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index bf33a4b31f..265bcf4bef 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -17,6 +17,13 @@ STAMPCLEAN = "${STAMPS_DIR}/work-shared/gcc-${PV}-*"
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = ""
 PACKAGES = ""
+TARGET_ARCH = "allarch"
+TARGET_AS_ARCH = "none"
+TARGET_CC_ARCH = "none"
+TARGET_LD_ARCH = "none"
+TARGET_OS = "linux"
+baselib = "lib"
+PACKAGE_ARCH = "all"
 
 B = "${WORKDIR}/build"
 
-- 
2.25.1


