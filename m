Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC38BC25B5C
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:24:28 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.260.1714512263220700380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2jUXrwb/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e86d56b3bcso57020055ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 14:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714512262; x=1715117062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXxYIapQS7YdvJQlagQYJvDP6k+qGD59TQ15aMtzxY8=;
        b=2jUXrwb//nkJhKMK/6sBbeiOgGFioxm/rxXDQmHbdCsXOnrm0QOxPdTCRV3gmULJYK
         V24QX2pMzLxk+dPGDHQR+HP4lhBwxH2Vl0TqooxdFr05FxgDLwZPIQPASuFCrVmGMir3
         m3jwc2vjPfVW5467opTlLUuR1iZkD5NN9j8OLf0NGruKTIp+oA60jkdqiQuKgYxRzkvI
         0XVRAW//PM6JcQzSAvZnvArtNdC3n5OuUb0DZ/os5aAe5dkpvCMD2yDKkW7pLCDeSO4W
         5qXu8xuS00peDAr49HOWNXbDex4I6AN/2BRK+34mvA3zVSl9znHtWei3GP+axkNZHogn
         215g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714512262; x=1715117062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXxYIapQS7YdvJQlagQYJvDP6k+qGD59TQ15aMtzxY8=;
        b=BNpT6S75n+L+5xNd2jZFMGuPW6REtLvAk1Yb6mq03yuvE7nmpnSvZlkitrLHCr/Tr4
         uNYMbyDVvr2pRBFWlhVy2xMhLJxbiHSBpWnSzMBpxC6OYKU0jH7IRqpn8p6+vdvIws18
         0DEgkPdhCUXmUR8btf90cOGc0FB02sC7GE35yVKpj9E+XcrH5jv1ukU8ksEMZQTydqF8
         ol/pPo5CJwCTG9zMw91JaXI0Bm4xczQdl77/bfvIQM9pIPxlV7+CTlTPNYtu+Z7Cr27d
         8q87yXza43SV5i37dz/+LjFOy6b4fBaVldVjnHX5jNSIrLgI4EVMtZ1crkQiImrDH94W
         WOpA==
X-Gm-Message-State: AOJu0YzQ7yIBaI7biHDDlFcHE7F5nOq+RA9+GM/9oKSG7yyYSNV3cPhL
	ZclWXpDuekVmkazH+BNkCBrCRQgirT7SJ/ypNkxRQewa6hezLXR5jKrmSvQHewr5HpHYLnV+SnV
	WZNE=
X-Google-Smtp-Source: AGHT+IFEgxdN8DFUdPkLfZob3+4iutB3TAAYXMouJl6WTuxRdv/PNR8pEpeZZbSVjN48UB4Lqx0e+g==
X-Received: by 2002:a17:903:2291:b0:1e2:817b:460a with SMTP id b17-20020a170903229100b001e2817b460amr786169plh.34.1714512262432;
        Tue, 30 Apr 2024 14:24:22 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id l8-20020a170903244800b001ea9580e6a0sm11193133pls.20.2024.04.30.14.24.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 14:24:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/17] libxcursor: upgrade 1.2.1 -> 1.2.2
Date: Tue, 30 Apr 2024 14:23:51 -0700
Message-Id: <21be5356da5f842848241aa9c17d9d2126bfdc31.1714511660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714511660.git.steve@sakoman.com>
References: <cover.1714511660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 21:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198770

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Remove superfluous and unguarded config.h include
-XcursorXcFileLoad: plug memory leak in error paths
-Add comment about keeping libxcb-cursor copy of code in sync
-If O_CLOEXEC is defined, add "e" to fopen modes
-configure: Use LT_INIT from libtool 2 instead of deprecated AC_PROG_LIBTOOL
-gitlab CI: stop requiring Signed-off-by in commits

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b56224f31ac4df426418ffe9fa48f4d2dea3f148)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxcursor_1.2.1.bb => libxcursor_1.2.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.2.1.bb => libxcursor_1.2.2.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
index 4fd7e949c4..159ac4f7fa 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.2.2.bb
@@ -18,6 +18,6 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[sha256sum] = "46c143731610bafd2070159a844571b287ac26192537d047a39df06155492104"
+SRC_URI[sha256sum] = "53d071bd2cc56e517a30998d5e685c8a74556ddada43c6985d14da9a023a88ee"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


