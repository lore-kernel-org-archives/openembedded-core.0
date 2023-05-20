Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179CCC7EE29
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:35 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.13407.1684598729817408687
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=O9kndrLT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-64d2a87b9daso1788381b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598729; x=1687190729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ug7OGf0yQrJUDGNrvwkfA6LnLbeMWFxvwNYAKh58q10=;
        b=O9kndrLTLTJGj7LpejPZ0QZjmqOk+ZFLE/n3if+u5lZS4U3iJ5sA/gW0ybHmLATibR
         kW4ywCZmO11GWdT44JkUNaTV641V8Hxuz5quwrgUwBiCXIIXE3KIxItrLsfn8MF6/vnb
         PGkjrmJCfslFQs116dK2wHm0Ju5A/EqCE96uycJgZIaTCMGvOZWNSMLfBYFET2OhT4Y/
         8oiovrJEJsuzhbmN93zUrwjlsZyzx65wK+UaHTtdtF7oGUcn9bsX1TQrhX08EgBcXv0I
         vJ1u3ZrIfRHqhWqUsAqAKybHNxX7SGpHtSMkeaskNo5xHIbz2vfVzGZk8ekQoRJTUeDc
         inwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598729; x=1687190729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug7OGf0yQrJUDGNrvwkfA6LnLbeMWFxvwNYAKh58q10=;
        b=keUzU9cwNGqxyeKV2BzneuANIxHHQQhCnyTgmIQysSDlDwM5pESRpibVuzv/oS9R1y
         Jw2tVxTZ/0pOcQdviO8x/SI1mXV3WR0ji2joAQGkslMKch///nOOVeNinr4Y1XYSvFig
         DJ7bVGHqJuLIdStZE/N19civFEA1Q/CYfta9nTE1Jb6ivg0fD1E2zdBTvZh+WzDGaLOq
         oE8ZsAUxl5bUaMtBOqoAeOF5LohHGPUXpQHnDzbvSrUGyvBDRhwnbJKPFoWqABH/b95p
         lWyk8Ob40bYXV3pg1PZByIHvjjs9McZD6G2mvL3d/Z8bTRav/v1V58zNsr3IF6SK94nd
         vxQQ==
X-Gm-Message-State: AC+VfDw1fucv3Owt9wE2Nz3TuC2R3FBVAwQmH3xeuRXeJWq0ktoWt4RN
	Ggx/Vu8y3huzIOQu+G2lAXxnzTF228okbfDoQrQ=
X-Google-Smtp-Source: ACHHUZ6f8X4P77cXHhB6jkgxr0MJ0OMEyON0soTS3Xv1Eyt4U3XioYX17UAqi9sVFobIUKEBubX6ag==
X-Received: by 2002:a05:6a20:e617:b0:106:70af:a5b9 with SMTP id my23-20020a056a20e61700b0010670afa5b9mr6051248pzb.31.1684598728869;
        Sat, 20 May 2023 09:05:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] perf: Depend on native setuptools3
Date: Sat, 20 May 2023 06:05:03 -1000
Message-Id: <cfdaa6afaca28dd91c9738a97bb21eab5dae2817.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684598568.git.steve@sakoman.com>
References: <cover.1684598568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181570

From: Khem Raj <raj.khem@gmail.com>

perf has need for python setuptools when scripting is enabled
from 6.0.0 onwards it seems to throw an explicit error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit da3d00178809bbf7cc453401e0c5937796ebc2c1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 9c9bf1647f..91bf648caa 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -13,7 +13,7 @@ PR = "r9"
 
 PACKAGECONFIG ??= "scripting tui libunwind"
 PACKAGECONFIG[dwarf] = ",NO_DWARF=1"
-PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3"
+PACKAGECONFIG[scripting] = ",NO_LIBPERL=1 NO_LIBPYTHON=1,perl python3 python3-setuptools-native"
 # gui support was added with kernel 3.6.35
 # since 3.10 libnewt was replaced by slang
 # to cover a wide range of kernel we add both dependencies
-- 
2.34.1


