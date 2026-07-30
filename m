Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC7CC55167
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 23:17:57 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.158.1785453471890242965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 16:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UIRfrox4;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so2447855e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 16:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785453470; x=1786058270; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Fu28y7qdec6GgbcvfKSt1+Gl6J83I/3zYjNEasYp7I=;
        b=UIRfrox4pnFc2TGOoD/lJ1FbVJhSX1QYSucg8QH61nPVhPwVm31j4EGVAVdwTivLAb
         tvFNsnT5DVEWue8A/mXvS2fUOfN8wPvUUzEMsehBL0K25PlnUzPq8awwCcsda10JFuns
         cyHEnolXmLj/hk7uGlQjmWXBG+fSLuMX9rFm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453470; x=1786058270;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Fu28y7qdec6GgbcvfKSt1+Gl6J83I/3zYjNEasYp7I=;
        b=QIuuEUn6VQiD7gK8Oibf1lfOfpKAN/mpkLp7xxbIKYOMvbRbN2gtn972USmt9pUKGD
         b659W2AxycmI/MNN0YL6HArDHcD6RBrANcuFJVGMtxTa4CdAxPTh+rpUvO2ZxtvC4E4U
         6KuP/kdU1szvqEMOc0n1RrBCROif+CnOj0ovGXRbi4nVVEyT5k98+OQFZFLJDJzXcsJI
         K8F18lNpJaDWBj64F4cNUUUImvlAKQTFcEaPECcOYxa/yvo6E65qcdiLjVuX249ej/i7
         E8K4bQK7RqsOd3327LiX9WiKtmlh+hYShsmqExCG0rMkVXX/L/K/kk11JW8cHf2SadOu
         A9TA==
X-Gm-Message-State: AOJu0YyQlRD6AaihPQrhvqmWmeRflv6TwdVLwS+dvp/27Yg6hTKMDXof
	S0YX9aNq7KqNuE8TcPIk2ESPi8nka2T0Eo0CqkgMqokNz3dOSoDpHYnmgahbwo6G3oLjmEL5iyN
	N1avlpE0=
X-Gm-Gg: AR+sD115CBi1PXFSGtyc/PL6ojSSfYbaHw5JNdJTISOF311ZI99p/v+Y7ibEqVRmT+7
	y/Obr8Tyx0KtLwXqxMKHzWrvZxTB3AL10Vwdb5pu96u93aiZLPr0vmVLxBxbrjsBR5ut7RXPh7d
	iFXq4Y6cDI1h8Kg9dxrLK18M9MtAJinjeAdbF1Pvk5NcoWjNjZgIfBd3Sfbt9TIKGj7UFS4n2Bx
	NOHUSiXHobwLkj9quUpex9/fw0fibvS+0UX9Xqq3LiMhKaUIoFgeaVXjWwZICH/5K9S4Jx2C7Ys
	g+XNLZYx5eVAwsOnGRiagHGo/cC8zVvbOjmEOOplEALsL72tzpGCux0R/x52+9sCnfyc4TwSjTG
	a8HVrMo1vfe1AIKrDfqNh0LZ77mOIjiiPKw8Xquz8Fl6NW+gRWCtREfd104tlNV9QVo0GlOGkFw
	FvcawjWF56fozJGj7LOsv4a+3VJD5pIhJVYCei1fjFfDrwcqgsNPnMLgo45K9Rm2DOkwlAASmhB
	3YZyxKNrZtuHiI1xc22tBgLIZrziLRtqcr89HHhKvEst+SMseGAAyKCbDjjsWkk
X-Received: by 2002:a05:600c:4ed1:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-49800e93cb3mr62377435e9.12.1785453470037;
        Thu, 30 Jul 2026 16:17:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a0ae3sm100670755e9.9.2026.07.30.16.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:17:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone 0/1] Pull request
Date: Fri, 31 Jul 2026 01:17:43 +0200
Message-ID: <cover.1785453214.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 23:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242385

Fixes to improve the local CVE database reliability. Even if the branch
is EOL, the CVE metrics is the only part we maintain.
Should fix 15660 – [kirkstone, scarthgap] AB-INT: cve-update-nvd2-native-1.0-r0 do_fetch: CVE database update failed
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15660

The following changes since commit 51259c7e933a2ac8ebc01604d6e65607b76b7b56:

  build-appliance-image: Update to kirkstone head revision (2026-04-10 14:14:10 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

for you to fetch changes up to 9687b9409d3a1e121f0f04de856055764d0a392e:

  cve-update: Avoid NFS caching issues (2026-07-31 01:06:35 +0200)

----------------------------------------------------------------

Paul Barker (1):
  cve-update: Avoid NFS caching issues

 meta/recipes-core/meta/cve-update-db-native.bb   | 9 +++++++--
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)


