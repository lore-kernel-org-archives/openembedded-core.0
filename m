Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E508C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:53:29 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.13399.1714744402503209521
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pTbMdk5+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f450f43971so261345b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714744402; x=1715349202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GniysFs84OvndNQCJFhGdatMLFJO7KbwSNoWhI3wkec=;
        b=pTbMdk5+G5ekJaR9qVHH/p3Vt1b2mU4+35x9p/xFttglXppDXaCYse8ZP5LjPuyzVl
         gGBDsiyUivLih6RbuhMX+kX+LH5BdMj6U7PCG6i7GzRjpnZwUxfuPns9fAVhIawTvNZi
         KZoEkpGSyeVSqHHHRSTo6Z4cP55gHa9ywNObswKSZTNN/ncS9sjdNljj/0SxxaViqCvy
         XU/z120Hm6jipEFcaoBKI/9qq0jAnVIzwrqCCBJlNI2e5I9+xDLrZ9M0IK7/DZwlXnwc
         CXP6zKcSBWsEy3MHKjS3X8XYiisT0hOm2jPyZdAH41+9GOLWiaNc0yBNJUaUJKtAX21I
         bfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714744402; x=1715349202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GniysFs84OvndNQCJFhGdatMLFJO7KbwSNoWhI3wkec=;
        b=Y35zxJjJqdsRya/qywCIEGL7wVibov2IsvvBiqMqN4tc1LJK/hgfVU3mLbHkvUNP45
         QdUtKxGZqOkOuviqAqdCKFoDB2NenziBlWpuLHP4tAHX83PxqlNrsKYpQORrPU/cSsI7
         6mJ+NFGtjhVg7+UF5jLY9DAsDW/Fzm+UAiBdoEX0R0DMrrNsRm4VUMNukHk1a46cuMad
         eFuZdv4MSjhlyITfrigzQXuKhibS71hafLCT2wzpNChzNZw1P2u2lurKvE06v87qUiem
         LTt3J72nOk2q1brJG4e89aU6yuibS9Hl+SCNjfgLvr04eNLkcPcUGv4A1rApozFYQrMp
         XWPw==
X-Gm-Message-State: AOJu0Yy85YlVJir4v5S9OuA3wvjyHOWSexMS79hrBN3uIR3hVzgMQpn+
	9GVRT+IptVSG9KgiS8cG6NIp5/qi6ggXSshHjFMVJJoTtyOeoNEvrFb3u2ZUCd6Cl/vhNgFlonu
	P
X-Google-Smtp-Source: AGHT+IHGiOCkqoAJyO2XJ9WB4NVXxjNWBUcnHeAcaOqCsJD6RI+TE+54wHNUcesn5eCP1BqQLF8kTQ==
X-Received: by 2002:a05:6a00:4656:b0:6ea:c3bc:2031 with SMTP id kp22-20020a056a00465600b006eac3bc2031mr3002515pfb.7.1714744401360;
        Fri, 03 May 2024 06:53:21 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id e2-20020a056a0000c200b006ecee611c05sm3044941pfj.182.2024.05.03.06.53.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:53:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/3] Patch review
Date: Fri,  3 May 2024 06:53:11 -0700
Message-Id: <cover.1714744247.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198992

Please review this set of changes for scarthgap and have comments back by
end of day Monday, May 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6873

The following changes since commit e38a0f1a5e515651173b1aa21d38f2b3924de8b2:

  mpg123: upgrade 1.32.5 -> 1.32.6 (2024-04-30 05:57:43 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Alexander Kanavin (1):
  scripts/oe-setup-build: write a build environment initialization
    one-liner into the build directory

Christian Bräuner Sørensen (1):
  systemd: sed ROOT_HOME only if sysusers PACKAGECONFIG is set

Mark Hatle (1):
  sstate.bbclass: Add _SSTATE_EXCLUDEDEPS_SYSROOT to vardepsexclude

 meta/classes-global/sstate.bbclass         |  2 +-
 meta/recipes-core/systemd/systemd_255.4.bb | 18 ++++++++++--------
 scripts/oe-setup-build                     | 11 ++++++++++-
 3 files changed, 21 insertions(+), 10 deletions(-)

-- 
2.34.1


