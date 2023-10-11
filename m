Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE7ACD98DA
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 00:02:07 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web10.5125.1696982526134568628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 17:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aKbis6pR;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177, mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35747150a2aso2559015ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 17:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696982525; x=1697587325; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJzJOr71TgxzYfvUFzzDvgK+S7BRtX0WX2L1oF2xq5o=;
        b=aKbis6pR2b+en3yYSVAujfyhSEbgnMlIxYCovs0PQnyfA1v90g/LIG3Zkkzw4+P0J9
         JjkXk0+hlnhafV1HzTPQCiaZh7ZgmXfmYOCyMsuy5S7/xWefPat3jkRMcyEBM7uHKwQA
         qV8HFa8eNB4xR0ZlQz+dH4woXJickSpExDePfPnfT6rphuJvmTWKWd9IYAY2k3f/FBVw
         soDUAPl38XUS3TjBLaL5yZc7iW01TBtZREyAu24x9X7UDaE26tWk4uI8amAWG+CjjuZe
         ygNQHE7VL2jjnuhJxCIeJGbLsI1qulYM0gXq44U2WKLcq1r6jRxNf7ajE3rMRA+66Lqe
         llrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982525; x=1697587325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJzJOr71TgxzYfvUFzzDvgK+S7BRtX0WX2L1oF2xq5o=;
        b=E15019e4Y/UV0RhCzQ50FaMrd4Q18LKOmZl1NO38ajAF4/GJV4pqGbDQ042Zx/LSsh
         DBGKbbNEj+Ar56O+p6F2a4t0qBmA2MdM97M7zktEa1ol0OZGRMyyaQ/VuwX1Bm4Rd6iM
         MTX7ebiJCMoJwcRDOmSa+B4qlNxCU06wGe+GDu0YhKyO5Nh13X+umf6oo1hjyQNUYS2F
         86SEGsq6z2hJAgQsvfECuFdB3v62BjRoKkjeiL+w5yzHG9S4xIQ8vgd23m5W9gmcVfZY
         /NV7mye3oxUDjzhQbHcseLWA1kdUmI80UbPMAWfvR8r68NP4/v+Xp9baJfFOiYWWlQ+N
         eOhQ==
X-Gm-Message-State: AOJu0YxlzOF12r0O9CUux6heepEeQV2DEQeXlXjpHP3NZzI2swy3d5v9
	WPrzNKNcmzxx3JwlC1TQ0PQ2yKZzGZ9ArqQv5xU=
X-Google-Smtp-Source: AGHT+IFrnH2IjFlt8iZGWzOo/0GQ1xSepCUlYDhkTAG3rb8O1pUiM3PZloJkc5yAp6/Fgpy++J7cLw==
X-Received: by 2002:a05:6e02:1a6f:b0:34f:bac9:f53d with SMTP id w15-20020a056e021a6f00b0034fbac9f53dmr25248960ilv.17.1696982525053;
        Tue, 10 Oct 2023 17:02:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a9-20020a63bd09000000b005891f3af36asm10758222pgf.87.2023.10.10.17.02.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 17:02:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/20] glib-2.0: libelf has a configure option now, specify it
Date: Tue, 10 Oct 2023 14:01:23 -1000
Message-Id: <c5bece42d8e10554a6061872ca0f8f70d7102a79.1696982312.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696982312.git.steve@sakoman.com>
References: <cover.1696982312.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 00:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188928

From: Ross Burton <ross.burton@arm.com>

GLib has had an option to control libelf since 2.67.0, so use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2f028c53a2390c28685b373841c9a600e91819a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 843b6bd29b..878dd107de 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -40,8 +40,7 @@ PACKAGECONFIG ??= "libmount \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
 PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
-# libelf is auto-detected without a configuration option
-PACKAGECONFIG[libelf] = ",,elfutils"
+PACKAGECONFIG[libelf] = "-Dlibelf=enabled,-Dlibelf=disabled,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,"
 PACKAGECONFIG[selinux] = "-Dselinux=enabled,-Dselinux=disabled,libselinux"
 
-- 
2.34.1


