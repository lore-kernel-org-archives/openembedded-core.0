Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1FCC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Sep 2021 11:02:40 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.5567.1632567759272109058
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 04:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=VnvSv2GE;
 spf=pass (domain: madison.systems, ip: 209.85.160.182,
 mailfrom: matt@madison.systems)
Received: by mail-qt1-f182.google.com with SMTP id r1so11958468qta.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Sep 2021 04:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cRW+NuZDcAs+35jLcK4H2zqRr5pVVRnOTEN01A7sUT4=;
        b=VnvSv2GE3jHVql+nDZptGtuJ81uzzRShouugmWRib4pihm6qOOxg9J+9oGGB0SO0pr
         qxp9VYZaOYL4xLfc1l2wvNcZeqNPJ7X9Qz819QeTv/SFitOlQOCLmEPyftzSe6rwN4Q5
         qUXrzqKM7M2yjvHhXUVbieTCYSIHdq2h79vYQP8lg5bskarrtQ2coX2Zennkpb2RJuAr
         bic8PRhWg+XcPwWkCRVl4DX5J9dVMoTAieSJOf60D+Slyy38ssR0lXq73u1u2ZRXSLlT
         24ai+yl882dmHYuTOizrICUaMNHAr1MD9s6n+/Fr/0O8SVN9bOBqx58BrJvDELDJLF0u
         aNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cRW+NuZDcAs+35jLcK4H2zqRr5pVVRnOTEN01A7sUT4=;
        b=YE4ZNpHxetgZOE8O6n3zB2toU4kQoGzriOfEhRMpcjGAYzU6FhfI2ZfmQd2F30IjU8
         KSHTYj+YIqmLqanBxmpmK6rm7rjOxLMd9dmuOYoPLeSpu9vZY2VdIoQr5mLnmBpkTH7j
         Vsr3Z29RcWqhUl+G47wXlTFozlMSSAi1j+KcK+CsDO1OE/sHdEfDGVGFJ9eAC0Gt/m74
         tt4gtajFCNhOi1Lr3nyn6u2ZDqPFwTP/Yf7N6nEBHB4g5SlDQOBsf+HNk0BKKprDW2RE
         09YlSD9w2GCJpSH46KDwr1YLDcTbqeJTRDVrLefeGvSXFaM/9kFJaEqV27eYpNnTRTZX
         pqJg==
X-Gm-Message-State: AOAM532ga1WWzfJO6Oud3gJNOZ3dWFmT/6db3fitFgMA7wmIJkT/qsH8
	jRkk6HE7/nPYab9dHhdNu5aWV+wV4tINjPDE
X-Google-Smtp-Source: 
 ABdhPJyMFNKMX9lZpo2tv+gTeKIwLeh2tnLCQxwTE1i3C09QVhBndThwIxHmm5T1qKU949T6x0PnMA==
X-Received: by 2002:a05:622a:1a86:: with SMTP id
 s6mr9128482qtc.43.1632567758042;
        Sat, 25 Sep 2021 04:02:38 -0700 (PDT)
Received: from visar.local ([76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 f83sm8453258qke.79.2021.09.25.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 04:02:37 -0700 (PDT)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Matt Madison <matt@madison.systems>
Subject: [PATCH 0/1] autotools.bbclass: use ordinary append for file-checksums
 update
Date: Sat, 25 Sep 2021 04:00:37 -0700
Message-Id: <20210925110038.50118-1-matt@madison.systems>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Sep 2021 11:02:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156346

After the recent site files dependency changes, my automated yocto-check-layer
runs started failing the test_machine_signatures check with a bunch of
allarch recipes unexpectedly getting different signatures:

AssertionError: The machines have conflicting signatures for some shared tasks:
   allarch autoconf-archive:do_configure: 21d06fd9f0dd31138c6c31913d7960850c2cf0b5907abbcd429c4dd1d0a9ee61 (jetson-tx2-devkit) != b36889a1bb652c06672a6586443ae344af48d9eb1c20b4ec0b13a0447126e6ac (qemux86)
   allarch cantarell-fonts:do_configure: 724242c45694e894841f68bcd51bef4938672ebff2feaa1d32e28225aaf464dd (jetson-tx2-devkit) != d8c5180facd27e338ff681b92b4d210ced91b8aaa813def22d7736d4539b16cc (qemux86)
   allarch encodings:do_configure: 7948ef565be1538ab0f65a455ad51447cd221e298543188781e74011be2c8720 (jetson-tx2-devkit) != 2a88d5544e64906afb4c0ee41c0cf0a579618218dbea79d4e6b749e279d95f22 (qemux86)
   allarch font-alias:do_configure: 7fcd9e484e364ec480557c72436b91cbff77b2f9b43696f0a2e3e85b7e5738e2 (jetson-tx2-devkit) != 4067157233d63873d706aa1c11406300889f2ba980ac033db1eb8cbca643942d (qemux86)
   allarch xcursor-transparent-theme:do_configure: eb46377c6b4d62a61f89cb993e78dcd67b356794fadcc38a8251cb299396ed59 (jetson-tx2-devkit) != 2caf4c7817e7c1770229b9970b9554efad133f4131c994196de5d61405aff63a (qemux86)
   allarch xorg-minimal-fonts:do_package_write_rpm: a8b8d86a7c315fda9e44fcbc6a00d150f9b9a8617f43279a1bcec08a1debb941 (jetson-tx2-devkit) != dc2ecf9029a051f391760e3317c8fc538d8640f2145af4dd1740db5a227b571a (qemux86)

Switching to a regular assignment, instead of using anonymous python, looks like the
right solution.

Matt Madison (1):
  autotools.bbclass: use ordinary append for file-checksums update

 meta/classes/autotools.bbclass | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.30.2


