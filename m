Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B7EC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 13:25:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6023.1784381119497692061
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 06:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gOLBtntY;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so61045315e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 06:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381118; x=1784985918; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=N6sOEhr4Ol3GKgSAub8PW+nYcXr2Ab18YZp4unbeviM=;
        b=gOLBtntYtV/RZgwtR44oVu5iUs8/dsbCCTHxoy25chjoEgbJG7BFZgNMb5+TGX4vCr
         UXXY0e6BIs49TIitgShmbw/iv6dcNURnNPZbJ3IV0lEdu05cFJRmj5psOgIOw/diH+1N
         5AN9LtxdKv32MFXKrxLb4bq5YTKdnjKG41jKckvmr3VzqdSWcDlNn1ggh/oeLllIOsag
         +zbqYloJ2VmxHQHp6Uv1oD/XL6V8g1eKeN+geBKC4DtUITZA1h48AQ/wlGJc40YV8EB1
         991rvKfvtdkiU1PSJZu7Znd45DUJwayfUVFPBVOPjgNo2mNg7VbtcpHFjgCwQPKiWSmt
         vCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381118; x=1784985918;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N6sOEhr4Ol3GKgSAub8PW+nYcXr2Ab18YZp4unbeviM=;
        b=GyO5Opj6Znn7EvCl/JBJC6drpb5zdnMW2n1K88KMpiwLTtQFDctNoBh0yZJFjfHSVd
         Vo3uzpiGmjv8xS9xCHCSJazqEKNEWTO8CyC058zP414BZZB4wmpRVvX+160I1Yhbc9V+
         degz2d9W7rMtapzMMP3hjDeCyVOefmfjSIKCMN9fktoEcSj0OWSzRAzWFRaBTshzXDSo
         NNYpRRBVuhvim+7NPr29fbMfAxbKTVb3NUXd8LGQzRk834Su50DCjcXPfKAB08XIZ89v
         j8bN/ekv6WHMNSIQN/iOrFlYIdj7kdfF57KploCNfU+K7bC7IBoaOCtrNR/+ROcTO3c7
         14Mg==
X-Gm-Message-State: AOJu0YzmVHJqjeN5BnMah96mS9ycpwu/PUqkJjMSZDtvFCI5G+GdB3dp
	3FkxSQE5pF/LRs34DSYzE/T8OVngy6ogyCkIIN4GnL6mZsq5Xw/3/QtZAqoxeQ==
X-Gm-Gg: AfdE7clHJ+iMJUeOf7gWftBJmBChPghZkU+dKc+9BVOh2m7OepEcwgSWh+/QK5gvCT7
	xHwFSTigmyMbBSbmktQ3T8JW8TsEE9pM00UgC+JRXTwmg3ytTFqC9Em+HD2wdv4NhhWgyz7fa3Y
	v9bhAubfZtJmp1AzsksQtjwJbrH7AN4eTpLiS2KWlj1AOpja3xOlAFYADCYijuKSs1LnpU3KV7/
	yOR1X9l7gLcnAeShAygkH+Tyv4/FvkGGnhW7KyC8IwuEzK3FXfS8azGyMmUSAAZl+9Mr9XJDKRd
	MOHtkFUIgdfkQId4KR6rkWGKyUMy52shAeqDrkaYiV2KtdodlVeMTqEekfxb7CjTbG4QW8SV6Wp
	S2sMXiz680QVE3OvxreWdoc/ACtk7kgkAUvUEZQCeGKdadVdBlIlCzeuwEYoyLLs21zLIBbQ/1X
	hYeE/rp3H8
X-Received: by 2002:a05:600c:c054:b0:493:a976:5c6e with SMTP id 5b1f17b1804b1-4954a3dce22mr45050225e9.16.1784381117565;
        Sat, 18 Jul 2026 06:25:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:689d:c0a3:3de0:7033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm136563175e9.2.2026.07.18.06.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:25:17 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH v2 0/6] Remove 'extend_recipe_sysroot' from
 'BB_HASHEXCLUDE_COMMON'
Date: Sat, 18 Jul 2026 15:25:06 +0200
Message-Id: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJ+W2oC/4WNWwqDMBBFtyLz3ZT4aJv0q/soImMy6kA1kogok
 r03dQP9PAfuuQcE8kwBntkBnlYO7KYExSUDM+DUk2CbGApZ3GWVK0HbQpNtPBmeqQl78M4twuq
 balGbDjVC2s6eOt7O7rtOPHBYnN/PmzX/2X/FNRdSKKS2VGWLj6p89SPy52rcCHWM8Qu6bgUHu
 gAAAA==
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784381116; l=1680;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=6vx7563brppr4pJXmCjqEM9d/e6U7W64ZC/OU4l9w5g=;
 b=Bwq+Rk5YFUvxm3hpMlomQa/cZFcjkKXFeIJ/xnZqQqktRoan19mwip7xpE1f5LfeCFHq+x9HI
 4QO1wdiIuEzD0i82npa48O3wOGiLg6sDtFjKY9P7I1m5Ku9DLxu5TcK
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 13:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241258

It has lain there for a while, obscuring certain aspects of
how task signatures are calculated.

This changeset does not change the current status quo, but
rather changes the way in which it is implemented. It can be
followed by changes which further refine what is excluded and
how, from those tasks which refer to 'extend_recipe_sysroot'.

Related discussion:
https://lore.kernel.org/openembedded-core/aa893eb861bf4dd18e3e84e6bbebdee3b0367d1b.camel@linuxfoundation.org/

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Changes in v2:
- Leave the mechanism in effect, but move it to the staging class
- Link to v1: https://lore.kernel.org/r/20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com

---
Adam Blank (6):
      staging: add 'extend_recipe_sysroot' to 'vardepsexclude'
      cross: add 'extend_recipe_sysroot' to 'vardepsexclude'
      native: add 'extend_recipe_sysroot' to 'vardepsexclude'
      wic-tool: add 'extend_recipe_sysroot' to 'vardepsexclude'
      gcc-runtime: add 'extend_recipe_sysroot' to 'vardepsexclude'
      bitbake.conf: remove 'extend_recipe_sysroot' from BB_HASHEXCLUDE_COMMON

 meta/classes-global/staging.bbclass       | 3 ++-
 meta/classes-recipe/cross.bbclass         | 1 +
 meta/classes-recipe/native.bbclass        | 1 +
 meta/conf/bitbake.conf                    | 2 +-
 meta/recipes-core/meta/wic-tools.bb       | 1 +
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 6 files changed, 7 insertions(+), 2 deletions(-)
---
base-commit: 171af3b2915dd076c8d1b205ff75eac1ebd5a586
change-id: 20260418-extend_recipe_sysroot-d958ba9cfa9a

Best regards,
-- 
Adam Blank <adam.blank.g@gmail.com>


