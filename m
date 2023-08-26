Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7CBFC83F01
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:16 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.10489.1693064355048459195
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pF3eax35;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68c3b9f85b7so567984b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064354; x=1693669154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRMtmoXTw/6drx9felr5cmEHL2IvoeTt7VCAblvGah0=;
        b=pF3eax35Ix+VIwQdhOJru6+fJWTQGGPSEJuQq1DUYVGIuknovCvQZNPT1kY0qCOh01
         DzipAS2AwaYbKfN2nb0KW8o57GuT3CQFjaTVCpiI/+lOk25J36h0jLHUIuUNE0zZMSLC
         9tLPuKZkfNjiGgbGoOxFprps5PsUI0Za91SGche9PnIBzY4DKHlVnyJB+jwY/CJ5i+o3
         qrZDrtXLnp9kb7Fm9R53gOmqHtRoVlIBr18M3JN2Jh1VEAyrmCHNeMVln6f6R4HuoHLa
         NVmDMnvrwDJuM8UMbeeAoY+cdym4YdTXbcz7bPgVSVlJkcuyYyehxxCgI4ULRilJcLmb
         UQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064354; x=1693669154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRMtmoXTw/6drx9felr5cmEHL2IvoeTt7VCAblvGah0=;
        b=CZAvqXXYSjsIVi6uVxrRJBSRW+W1UBTKfJgz0DvjNxVOn0pliHTd3m2dlKjzGxfpfJ
         GETkAlgstawleVlzOMrNBJq/krsAWgmVlgX5KUtMZa2LWK33/AeR66NnR0xPuVasNMkU
         +zdeBDs4/Srs8TOOnxooYHdHmAn/ks7tEeNwen0w1Q4SezKGA/V/j39EM14rMgcHxs9p
         mJtQkyJG9pIDN5jz70SGbmUrfKVSKE36qefw7nnuiDH+sRn18PZYFz+IEFvS+QPEFsAd
         kYNg+zlDsg8+eYp+zSv+P2EgbYWcah5GlFAwAJoUuYzN2l5ImnbX8A4ZGx1vxHKKeJmy
         CFug==
X-Gm-Message-State: AOJu0YyiIxQvIg1B2SWvXTPwKpK8/jMJ1yZQeX2TdjdmdLb+otMeZGIz
	8S45wUah4DLUQDOHpqO8npv1n9OOT9AwQTfCQEU=
X-Google-Smtp-Source: AGHT+IH5Jl25xtBSW1UQWBmwpbmkC01a9KNmPGZ4sevOlrXOqwCINN6iU5naxRXACiP8Gwp/ecbVhw==
X-Received: by 2002:a05:6a21:790b:b0:14b:f365:288a with SMTP id bg11-20020a056a21790b00b0014bf365288amr7868240pzc.47.1693064353985;
        Sat, 26 Aug 2023 08:39:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/20] file: upgrade 5.44 -> 5.45
Date: Sat, 26 Aug 2023 05:38:40 -1000
Message-Id: <6f1caa944982e265c394a554bfcfa8a105b1d698.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186753

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-PR/465: psrok1: Avoid muslc asctime_r crash
-add SIMH tape format support
-bump the max size of the elf section notes to be read to 128K
 and make it configurable
-PR/415: Fix decompression with program returning empty
-PR/408: fix -p with seccomp
-PR/412: fix MinGW compilation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit facef006da35e22394a4cbb13243769586d10f31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/file/{file_5.44.bb => file_5.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.44.bb => file_5.45.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.45.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.44.bb
rename to meta/recipes-devtools/file/file_5.45.bb
index 3ce266475b..a7127023cb 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.45.bb
@@ -13,7 +13,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
-SRCREV = "b92eed41b1bc0739c5c5d70c444e0c574429321b"
+SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.34.1


