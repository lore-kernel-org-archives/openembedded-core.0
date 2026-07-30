Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF12C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 23:16:57 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146.1785453413639253091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 16:16:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2l9o9ZHu;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954d29264cso1192285e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785453412; x=1786058212; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nR8lUHf/AT0zS1emgbNmWF0ZH8Z5niJc6oiWoR53sC8=;
        b=2l9o9ZHuhJaKG9t4XSx2xcUzhKVaL4PTA0M7zWrCiOl1v49Zobcl7cb5YkxzmWbZDJ
         VsmvLGwGDOsK++yMZjJ6zITUl+tX5g+8MuslN0nKLmtAVxqQ365H/HqkR+/qA/TGzuod
         US3umoWc01hNCd1NBCRp6E+tbD8g/RGdgriWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453412; x=1786058212;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nR8lUHf/AT0zS1emgbNmWF0ZH8Z5niJc6oiWoR53sC8=;
        b=jY9qJAolK3NAWFFa2qBrsTj2uouvEhz+S9yE+3LBJj6ttgm+cSOV4WTJgWQFXfHr0d
         kiBWW6IUlXkfqKe8taKzTVHch/w8rT25VK6A/hcH6HHlwh0uh1u4JSW/v3CsX/wq8HMV
         9ZjMzGkzAnO7LvC4xNjnu1C+aI8wgO6Wu1IqO64WIjVPVUO/MHm0fL/ZznulaSUqlxSM
         k2ZmJx5JDCP5tAnvzUvL92fyYbbXQARhgCW2zZ9UUcPSVyvgQ2SfmIJsU97Bu4/p09Nq
         dwlNnyBkgMLE7Sd8DcM9wSSv/NIBL+yLal5BUfUktw5AHvdKbrMOow8Wa4SHwQstTZjx
         o/Dg==
X-Gm-Message-State: AOJu0YzXNbsivGrmhIyTz96hhgnFTuSkcoRapJSs1zPT8GSoHul6Rbm9
	pPBOpKF8PmnhXDhFXVFHv5OYflbdr4YHafegzj0tCN4+mlnfmIFCtMKoZqFIwmboUPSvv6zsfgy
	a47a/M5c=
X-Gm-Gg: AR+sD13p0lAlVWi9zTca3jw3ave+NX7xxu5iL45WtO2tBTs5ZLmhyQoeR2m4rDCqHIf
	srPEM7ijXUdIVmXsSh413CZ46xcEGjHqtA8KPMSptx6FPu+B4LraWgrRT/9NvIO/nlkbLxQ6WWj
	SdN4CmX6rt4YaUQ5FEwr1w/iy4Ki+LesN+sixORPwOUgBk/9LA6LiNZYhPU8ysnxBVvlfWR+DCs
	2TGCNueG1XT5oi4lUjebsCt+xOgL7toZ8mRbtxs3Ino2krcKWYK0/3JFBy7/jhUr8wFFPDPOSJP
	YlQdwtuP0ZTU4dr+6kkMpprhecYXfWypQRcG//fUAGptkAN6JXaFwOh1u9L8Hc/v76QT07rjDeJ
	5rcU0zs6SG45Q2h7Wqja7wh+82hzIeCzJOGeu/8NezQ7DA/vxKhhWqHnUVUPwMWhMAlYCYsbxv9
	EV/6HsHf2GAUYvq1SzETmYRFC8W0wcEzGL3D11DjWXfnKarqnOZXw2kAKS4SrZp7Uvd+reaNBD1
	eo7VInx5cgaN1SVu4qBMscbnyAlO7YEF0pBTh69dfJ4mLtJbz1pNpsV9+gTe0vQ
X-Received: by 2002:a05:600c:4584:b0:498:3ba:6318 with SMTP id 5b1f17b1804b1-49804c6cd82mr35497015e9.34.1785453411672;
        Thu, 30 Jul 2026 16:16:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498062fb5a1sm6423525e9.3.2026.07.30.16.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:16:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][dunfell 0/2] Pull request
Date: Fri, 31 Jul 2026 01:16:21 +0200
Message-ID: <cover.1785450470.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 23:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242382

Fixes to improve the local CVE database reliability. Even if the branch
is EOL, the CVE metrics is the only part we maintain.
Should fix 15660 – [kirkstone, scarthgap] AB-INT: cve-update-nvd2-native-1.0-r0 do_fetch: CVE database update failed
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15660

The following changes since commit c4fb7d1f0f157ffafd9f907f49ea74b93b2c1d40:

  build-appliance-image: Update to dunfell head revision (2024-04-15 19:14:34 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Paul Barker (1):
  cve-update: Avoid NFS caching issues

Richard Purdie (1):
  cve_check: Use a local copy of the database during builds

 meta/classes/cve-check.bbclass                |  7 ++---
 .../recipes-core/meta/cve-update-db-native.bb |  9 +++++--
 .../meta/cve-update-nvd2-native.bb            | 27 ++++++++++++++-----
 3 files changed, 31 insertions(+), 12 deletions(-)


