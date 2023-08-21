Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A921EE49AA
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 14:36:51 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.960.1692628604692816963
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 07:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gx42Ob6H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-31adc5c899fso3207649f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 07:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692628603; x=1693233403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkw+ovA976LFrU5BBibVHH4P/ZFypCN/zLZfuEeUSLw=;
        b=gx42Ob6Hh0nu/MXwtb6Y34ZUSh1eE5RDy+K8bYjMflyolYB2Gttz0YZT3Bn/EF8zTY
         aCGQzhSRaG7gFts9MFDGG5ocyQH1yaDEdOit0Qwk86NPGP6UlAOh2yIQjo2q2LfOj6VY
         DvGDFZ/CWJ9RpPbYV2olcBvGnwB34TWgl733g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692628603; x=1693233403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pkw+ovA976LFrU5BBibVHH4P/ZFypCN/zLZfuEeUSLw=;
        b=gX20h8unnXwQbVCNJUAH52wBPhSHqoQleWasHFullWQQVfMRjpuEoAp91llvvzfvGd
         kQJ2uNMEW3Kk2JY04Cr4f+38XiXWP9aUVpcrdWpt0V9uyukf6t4DEJRJJdpVAicEFED4
         6d/iXUjCJF/IwE/OReJ1V9WcckR1Y71ASEoReRDi3JQXBr5jmsPIA7S3YGsPjMkNjm3P
         VZmfi1WojObJBzcaGe/leIMT1ymQhIJYA9+XjUnMKaoyXv6Ui6lIZJAd2kxPths84jc8
         QdkgpJ461uA5rxKuEJ64mrub7nNFsEc3Hjny0MG1l0rZiKOUsFqtWbG9jkuzjplj5O9k
         NxJQ==
X-Gm-Message-State: AOJu0YyB8cPp8509uHfw8WAuLhHXh6I/g0/HBsNxXtUf87iFHEmEAa5l
	cQS+YTGHlHivmJIBBXJBleibXDWMJ6Mk1yv3og4=
X-Google-Smtp-Source: AGHT+IHgXzKI7sOrTvRYuuOFSX6gNRRudtVumQdSlo9qEUmBomtInveZC9PLn+iS1sCagz4PMmSA7A==
X-Received: by 2002:adf:fc88:0:b0:314:44c8:aa98 with SMTP id g8-20020adffc88000000b0031444c8aa98mr4843958wrr.67.1692628602786;
        Mon, 21 Aug 2023 07:36:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d0e2:cd7d:2223:a8d7])
        by smtp.gmail.com with ESMTPSA id a2-20020adffac2000000b0031753073abcsm12732979wrs.36.2023.08.21.07.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:36:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] binutils: Add missing DEPENDS on pod2man
Date: Mon, 21 Aug 2023 15:36:41 +0100
Message-Id: <20230821143641.1067081-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 14:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186445

Otherwise this can be used from the host leading to output determinism issues
where the output may have zero length files for man pages without it.

Limit it to target only since we don't need this for native/cross.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils_2.41.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils_2.41.bb b/meta/recipes-devtools/binutils/binutils_2.41.bb
index 4ce1b4bec2f..2cce40f1ef9 100644
--- a/meta/recipes-devtools/binutils/binutils_2.41.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.41.bb
@@ -1,7 +1,8 @@
 require binutils.inc
 require binutils-${PV}.inc
 
-DEPENDS += "zlib"
+# perl-native for pod2man for man page generation
+DEPENDS += "zlib perl-native"
 
 EXTRA_OECONF += "--with-sysroot=/ \
                 --enable-install-libbfd \
-- 
2.39.2


