Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18701C54EBF
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9388.1672830376764924673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R1sF+iMC;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id az7so8167537wrb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pjveW3oD3gD70dhmT8Lz+ZC1k4t4B+Y91K4Ju+rOX0=;
        b=R1sF+iMCAZoZc0HUXiBoZZ8OZSWkvN/llh0OufkYLbSklTKvpwbb4TJFfeuZ+foJrq
         wzy9sd7XgBMJD+Jv4pal8vxjyqX1ywfBP40kabz3LpDeS3RMwXeDc9O6NJLRdoAD9sUB
         pVWBdTp2K24O32PEkjae0CGcOK0OdwhSZtFhLMitxltRQU7VAagO/aZ6DCT+SWXzPfz5
         liZQ1lN+UdFEzl5WD2uYhoFXJ0xTrJOraINxtsu6P1gawb2Un54CaK46NDDhnu9Ix+rl
         6qebB8whPlI2zFvs+xYnbkJ/A94beIpTjrPIavh5Bu+Bx3zYPsIqXKjDKLIwxTmKqcue
         iaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/pjveW3oD3gD70dhmT8Lz+ZC1k4t4B+Y91K4Ju+rOX0=;
        b=EP78IECpb5LIc8Fks/8R+AGo1TqdXFSdeaE7qHGhGt/CSyvn/3ghu5pKbdUFo7+LIH
         9mSDHdgKUfN7P2BAgHVhAoZceK7nXZlV8WKccKMzt5gS8WH3x3CHH4X2qvv5JpezTGt2
         P67AxfORFlgaZUdix8rtBGHIdGm26IO7ip5T+PiedNOaoLX1c1/gorO+tHQDHfpG6Mka
         ZNS9p7LotECd7wkmiMz8qzRsC8GrWI15CXkiFHitfb8sCDPh0zXED07ghVzab76xf6De
         BNS0b2sZ6k+KhFMvmWUyVWfbsutV/5NnOtr0FYbnwel/ndrwEHC7p3s7QEp6HIHHSmV3
         xc3A==
X-Gm-Message-State: AFqh2kpJgqesGtJBYXjikdrxzY/RaGCE38XsQOdkXEHrpQIhVJjdW+rk
	7ney5HQuKhzlQRWhmAPEyRYIVsp3UTU=
X-Google-Smtp-Source: AMrXdXuzIy2rd6GwbuDB4w6Ur2H1UWsPb0iFLrGXWFWlLX59q9fAqqSyyDLOu+bje0Z29GCnc9iDmg==
X-Received: by 2002:adf:eb87:0:b0:263:56a0:4fde with SMTP id t7-20020adfeb87000000b0026356a04fdemr24794096wrn.14.1672830389165;
        Wed, 04 Jan 2023 03:06:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 48/77] diffoscope: upgrade 224 -> 230
Date: Wed,  4 Jan 2023 12:05:19 +0100
Message-Id: <20230104110548.2537259-48-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175433

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../diffoscope/{diffoscope_224.bb => diffoscope_230.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_224.bb => diffoscope_230.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_224.bb b/meta/recipes-support/diffoscope/diffoscope_230.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_224.bb
rename to meta/recipes-support/diffoscope/diffoscope_230.bb
index 5d634b8073..496ed9e602 100644
--- a/meta/recipes-support/diffoscope/diffoscope_224.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_230.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1920ebdca40e85f019a84e0220e4a79f00ffdafc0f78e1f1e2219123d5c08dfb"
+SRC_URI[sha256sum] = "a35908c15bb006058f74c2d4f2be3b1ac7cf62c872cfbd2950114a8a705d8108"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.30.2


