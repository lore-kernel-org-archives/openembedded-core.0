Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21831EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 20:45:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.168.1687985098838142947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 13:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LBZtqZ90;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b80ddce748so2893405ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 13:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687985098; x=1690577098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uTjI1+In6Z9hCYSQqBN5e+guBpxP4XfnGttybveIgpU=;
        b=LBZtqZ90chGwsKB328rAQpbBbY67ZwZRPXzBvk/y46M0L+rhcwgRT4tGTa7nxZZxl5
         0uWWBBpJNCE54muoE8ufma1cySeqVkAbxE2vUFBElEllXxF2jM3AT3yKBIkuHgUlMZte
         GrcUtOIM4sCfU6s7n8ugyOGKtxE/Z8pAiIaE6y60KYcBC+5/e5OVLiT6v8UlUrLC/Krf
         F18NUdgGIqoxd+DBNWo3j0xbPttJpHp2p0ABuG84xa3DGeRs2P1Ytc2/Ewp45MugDmmp
         1jjLPab6DMDyqc/53O9J4HVwOwdjB0Xbs7a+0paQnYnlcywKQtdlh0OoQklWEAA1QPIO
         0qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985098; x=1690577098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTjI1+In6Z9hCYSQqBN5e+guBpxP4XfnGttybveIgpU=;
        b=hOWuLAhSyogbpHhWusnR+j8XpjIs1Iu2eqNUMeeWSzfKDNCRobNlrNkoh9R+Amgkg4
         99ysfEM/PAcVsxG5sfSVSEElUaDFL5MPfwD/MSfaYCeYzIQSB16LGTYzbsSVsUSfjrP1
         //hQZtUNaHb24PBSQ1F6EaEGXkPZWgSwTc/OCI5EEYlTB89hPK+TgpKbTTDuh4G14wNS
         qXAf1cVaZ3EIatZksBcYqz5DsqM4CPFs/FkXce6NM5cBeTccie57OCKY3yHDnxNW07Es
         yYXGXOzkO4OdHMSsmNWGKp6ZXbFVaOHleCY9nikcceSCtsL/3H/LVcTyrsMiEQdl7hqZ
         usZA==
X-Gm-Message-State: ABy/qLbVNJ599t+jfqmzcOXHQIGigtnVfdiQbWdSZKP76NzPfGJiIBEl
	85hH810Aub3I8JfKDtPGe0Bj3rbCWzaJHg==
X-Google-Smtp-Source: APBJJlHKUqBPQ9AX+tmKcjcXVzNAPIvaAEouCXc1NhJ39WkqS4DacO4E6vUCvxyhVHPdv/yxjqK/qA==
X-Received: by 2002:a17:902:c941:b0:1b8:5541:9d5b with SMTP id i1-20020a170902c94100b001b855419d5bmr71094pla.17.1687985097897;
        Wed, 28 Jun 2023 13:44:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::fd9d])
        by smtp.gmail.com with ESMTPSA id jw19-20020a170903279300b001b7ed16c7ffsm7270299plb.306.2023.06.28.13.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 13:44:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Guard fallocate64 with _LARGEFILE64_SOURCE
Date: Wed, 28 Jun 2023 13:44:54 -0700
Message-ID: <20230628204454.2251485-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 20:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183600

Gets this fix

* 718f363b move fallocate64 declaration under _LARGEFILE64_SOURCE feature test

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 7c8434f23f1..b4c2b1f8980 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "f5f55d6589940fd2c2188d76686efe3a530e64e0"
+SRCREV = "718f363bc2067b6487900eddc9180c84e7739f80"
 
 BASEVER = "1.2.4"
 
-- 
2.41.0


