Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9381CD4F3C
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 21:33:30 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.62098.1725485603658890118
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 14:33:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jb8pmr58;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7c691c8f8dcso99467a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1725485603; x=1726090403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZIAXRx5pEh2wU8lQRQ2d2P1fhhOzTLFhVrZtYFclNg=;
        b=jb8pmr58T3FfCBDVPMGCJJMX4u3ghOdMMDSgmYLfxlb39mL32mg3abiPs+MGkSwwcE
         ZAqhPWwDYNmObykbUGpPwShNl3U+jcHNvnTAXuT2fyNT0CcyjZoaM9aqG0DUEbndGLiC
         DMk/vrv2gJgMBnS/fAmFXnhTcHl2b28WNTg7xpDq5Lg7/iDqYdQMYnBfEiRXoZ/xWXRR
         i1NICIdjQmGX/aNmdToSpyqQfS88SH6FcqiNIZjLn/5DAlL9xAh5RRkoD4wY0fgkMlu7
         /enGymVgAHHzSAdx2nSCvadW436G5Fxrj+eExSYtJcv5eOqSlVucG7YSSSLWf9VulpPY
         luDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725485603; x=1726090403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZIAXRx5pEh2wU8lQRQ2d2P1fhhOzTLFhVrZtYFclNg=;
        b=Gqq6F/rjaw5uMjIw39mC94ymy07fvCueVZ2igoapz5u+9syX4qTUKlyAsZlNBA7Gf0
         TKmAcSSdopu1dyFLkeZfXq2wvQ7U+3d+yrto9/H83ijWbzgwJHPb4b4o10kyKN7Y9rEB
         wGsMI+68SkFKZeWWC1qOlcfsETACFH/FZcT9UsH19n6/MvVspfOJQxmsw6T/R1nGgHBY
         afSgCpl9t4zQ5OowhTNURQ9F35w6SDvP9C/PTAwjAzJ0ooChw4POl/IMku2X786b5J6H
         d9xlK+qqS8AFshly+xIlWzfmIfLJpJsAtKYn7kDISyywqlDSPwQjyXUxJHevA8RHKbk4
         fvOg==
X-Gm-Message-State: AOJu0YyCmHkMuqBVvLimSw/00mtdMMgUA5yyuXea9kKYQ2lcsz0e90Yg
	TrhoByp8bd0oQHc4qsgtwPKU+SmJ+lslpYT15OZ0VtBx885fEccPa3azM/6pLt6aBzvPnt0Xa6l
	WqtI=
X-Google-Smtp-Source: AGHT+IHbZRWaMmfcQL5Hmz3IGnEC82Oj3y1G15X3Kf0IQSZJm2YVW1+K13Ob+1BoSPZS1+PALLofCA==
X-Received: by 2002:a17:90b:23c6:b0:2c9:9658:d704 with SMTP id 98e67ed59e1d1-2d890624cfbmr13047808a91.40.1725485602929;
        Wed, 04 Sep 2024 14:33:22 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8e3e8c580sm6693767a91.40.2024.09.04.14.33.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 14:33:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/14] wireless-regdb: upgrade 2024.05.08 -> 2024.07.04
Date: Wed,  4 Sep 2024 14:32:52 -0700
Message-Id: <d2b83ae234668bccd81ae4b53ca06196d398573b.1725456307.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1725456307.git.steve@sakoman.com>
References: <cover.1725456307.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 21:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204223

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b460d2d55a35450564ea04255153b0a3bf715530)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.05.08.bb => wireless-regdb_2024.07.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
index 95e33d9fb1..daf5e6dfcd 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.07.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
+SRC_URI[sha256sum] = "9832a14e1be24abff7be30dee3c9a1afb5fdfcf475a0d91aafef039f8d85f5eb"
 
 inherit bin_package allarch
 
-- 
2.34.1


