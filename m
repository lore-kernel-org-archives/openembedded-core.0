Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF42D33A23
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:54 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.28086.1730832354171523727
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lyeiy/pQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c6f492d2dso63638125ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832353; x=1731437153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHgSRfEPrS6qbRFtmNeKetzbcNp7ENabCVqjtiI3Yzc=;
        b=lyeiy/pQCspPswGlWH4nkkKD6PkQcf0Gmt0DV6In90Yp4zrQAFXF1FgWeddklrU+vs
         zQRYhHEBkvwGtvUyTHi8bTxm7882EO6xjjTkJmT+mHCIAJER5fXKFZyKGjvzUkCJbx0D
         3UAixNSwSYuR6ZYrvxd7ae3cjbWe289A/glEpNh7v2k2264vgnsWOlsMFylS+Jj5vrhO
         tL7iSBbr36+AvbohzgULWN0G34q0dp3DZlsOf1UWCw2WsAlj0N0LnT9dQvUwRQiuYFur
         tq0fUzXLrOqJ8Yp3iRGf8Cx9myB4idxQATmcUikj0banUq3oDuNWDZUPQ+MOHmrL2IyE
         A82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832353; x=1731437153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHgSRfEPrS6qbRFtmNeKetzbcNp7ENabCVqjtiI3Yzc=;
        b=YjP76pW1LjZuzCtd+fEzFRU8kiiQ4KP+ZfPphGQvy0QBAyjaAMDKolUbIJOxz7kOdv
         uK3gsqLgQH7ySK6j2bCWRQTsaKbY4eG/iW5PhK3KWnNQTApICh27atyGp53TzBAZ+mlS
         cQyND7Ydsl8jZOciDXQgYttfqgvqZoOURZ1ApryRk9TeHj7QL+OIDhdq7aWj33YMaxxL
         NXTj6ndxP4uSpef7NWZOHFLx+swyMuQnNKFCaVlmD0SbytYZdJJ5iyeSGiPQ3nA+dFkM
         KrhGdTJM+d3tabjlMQxHd0oWYqajTzVR+20Td23LoALzpPAxgbe1hV5kmJCVIGv9WOlE
         tx2g==
X-Gm-Message-State: AOJu0Yxva3sYiR2YWM8KWgsfaYY9s59N9xQKmMTkORkcUPOwO+A45AdW
	yahwZ/l0dQxxSn9/sMEfzcW0TAUG2aC0fr5QARy3oiZCOlQDg7nwSNh04w==
X-Google-Smtp-Source: AGHT+IFVgrYyKOizBdlK295y1KJxQZpCgzVRQOn+PAn0atpF//5LOxkSVeLgiZiSnnzxop3z3zcQIQ==
X-Received: by 2002:a17:90b:52cd:b0:2e2:f04d:9f0d with SMTP id 98e67ed59e1d1-2e94c2c3643mr24427727a91.16.1730832353438;
        Tue, 05 Nov 2024 10:45:53 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 11/19] multilib.conf: Add llvm-project-source recipe to NON_MULTILIB_RECIPES
Date: Tue,  5 Nov 2024 10:45:30 -0800
Message-ID: <20241105184540.3450302-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206739

llvm sourcebase is large and like gcc, it reuses same source tree to
build all recipes using clang+llvm sourcebase

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 7bdfcd56aaa..a47eb27458b 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -24,4 +24,4 @@ OPKG_ARGS:append = " --force-maintainer --force-overwrite"
 
 # These recipes don't need multilib variants, the ${BPN} PROVDES/RPROVDES
 # ${MLPREFIX}${BPN}
-NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source"
+NON_MULTILIB_RECIPES = "grub grub-efi make-mod-scripts ovmf u-boot gcc-source llvm-project-source"

