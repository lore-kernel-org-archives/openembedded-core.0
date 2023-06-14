Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B79CEB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:05:16 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.12929.1686751508789623508
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 07:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=4z5d4Zyo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-652328c18d5so5047258b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 07:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686751508; x=1689343508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Opjdpe0afu+SzPwmJTh6GdL1tRCiJzksEdo9V0Ppe4A=;
        b=4z5d4ZyoFBRqSm/K//khoxNp43TKGXrMh3Hb/sT01nkRl2mNUw59CohgYIoVvykp9a
         m/Ma2smFF5OPsnapbKx9Anv584HAAL5KrEo03QncsEFBZLmTCnFsmL93ZC0YaWIxv+qN
         wPxfwHI/igevmNbElsRlxZ0HDfPXG9piuI+H6PI+vwVfUhLrYMX8AKeprC4u3wgq5mda
         j+K7i9rq/cB+w+EtZ9wdI0LT+hXkRZxiUoXxUQRQ8DMu/D+7Reti+2NwIHLwySXwMGQt
         tOIcIivbVoTnYHSejU0PrPRz9D8kUoj21hE+8Tzu5Tmm8O7zWULoa3kprcV6I7g0x6Zq
         hP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686751508; x=1689343508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Opjdpe0afu+SzPwmJTh6GdL1tRCiJzksEdo9V0Ppe4A=;
        b=GNfOByriCA1ssYDFm5o+3qZsBKv9js+w0dyidOgyEfm3ahr7Ttn9VKMMFybfeq9ZMo
         8v3aUc6iYTVHs7GToh+tc45VOlZpadPHamj/etDS0A1rvMroW2PqzVIbyxx3v8Vl/4oh
         6Ml7eJ3BGyCgweOC/XKBTFLVuF5RusSlMAO9AXnRhzfooKU3VODV7V64W/Fz8IVo2+ws
         jpYXaKBy2TFdrUhFc32R7fhA6Q/bd/r+7UdRINKGV7a7VmBNeNkNCilcYQDLwpMnQcqm
         BV3hVCcMJPPi52zc9Egl2kBPBovl7clnJIcq7jfGscdZeilOgRnZTOo5sj0z4CFykV+e
         RUfg==
X-Gm-Message-State: AC+VfDwDEWX8oA+1UIPgD2Zfyx1uBo88UUx3Eo8cYXE/nXlhVU8rPEmg
	pv0L4Qhbk9XVFIFtyu8LtC/TyObfTSy/0SizGLE=
X-Google-Smtp-Source: ACHHUZ63g0aS8rFcKk9uwO5E7UN5i9sDJBTcq723/PXIKA6z/VSsOQJn7agJhVrOmXDUweByVluUgw==
X-Received: by 2002:a05:6a00:2192:b0:648:8c0d:6e4e with SMTP id h18-20020a056a00219200b006488c0d6e4emr1864343pfi.19.1686751506952;
        Wed, 14 Jun 2023 07:05:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 187-20020a6306c4000000b005439aaf0301sm703757pgg.64.2023.06.14.07.05.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:05:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Patch review
Date: Wed, 14 Jun 2023 04:04:51 -1000
Message-Id: <cover.1686751371.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 14:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182808

Please review this set of changes for dunfell and have comments back by 
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5460

The following changes since commit 96798603273bbab40a7e19bbb67a9a5398648c21:

  openssh: Move sshdgenkeys.service to sshd.socket (2023-06-07 05:49:27 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Martin Siegumfeldt (1):
  systemd-systemctl: fix instance template WantedBy symlink construction

Nikhil R (1):
  libwebp: Fix CVE-2023-1999

Qiu Tingting (1):
  e2fsprogs: fix ptest bug for second running

Randy MacLeod (1):
  vim: upgrade 9.0.1429 -> 9.0.1527

Richard Purdie (1):
  selftest/reproducible: Allow native/cross reuse in test

 meta/lib/oeqa/selftest/cases/reproducible.py  |  4 +-
 .../systemd/systemd-systemctl/systemctl       | 13 ++++-
 .../e2fsprogs/e2fsprogs/run-ptest             |  1 +
 .../e2fsprogs/e2fsprogs_1.45.7.bb             |  3 +
 .../webp/files/CVE-2023-1999.patch            | 55 +++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |  4 ++
 meta/recipes-support/vim/vim.inc              |  4 +-
 7 files changed, 77 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch

-- 
2.34.1


