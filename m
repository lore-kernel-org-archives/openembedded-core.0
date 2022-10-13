Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70CAC433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 16:37:17 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.113.1665679029514518635
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 09:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4Szz2xl4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id m6so2479503pfb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5yNCwnV2/SCbfbvI8eWkVMKoLVxMtt1BqZrgOHJbeEY=;
        b=4Szz2xl4NQ9Es4J00RK+HqzwLasbwyl4BGjm6pmewHS2hJwNgPaopaRBECqgeGzGF0
         zl8akNBbjd2yAV71Wtn4lrTMewkY2n53Yeq9LvBJeRbMCu72qIFlLvf8HOo4iLh2Id0g
         qXO+TeVKsSxWsi4N8a8vqpApSJ5b8mIWWx/cJWQlf9M8Wxfba91EBsmMEmmpJT+FqqV0
         o8+gmbRFFLt+MQ2/c3j5kDdJq32OyUxZEBOLTBt6X0NfBFI0s/tt4Sdqp9DsMa76MdN8
         wnC7Ewr2eSRpT4nefh548cDjzEDOcmJYcH8sog9GOTkuamcuBeWPZJxK80UZV8jnVKvQ
         WDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yNCwnV2/SCbfbvI8eWkVMKoLVxMtt1BqZrgOHJbeEY=;
        b=jaVQ24hrFqqkjofnbXroPlVBb59p8WRwZS/bZRN4AnRo6rOTIECPPcaYobyScxxVBy
         XooUvG5kfNUzC07LYHvCeYgQvAvnZ9KAeAZXIq6TJBVqZqFrQ6IOEBE2Ytuj+R/aWP/b
         0mvOZnVDK3c/umIdNvak1+gFL1Ceqcbr15j9Np5gt3CHjJzi8GygWt6SsHQhqP48B+ja
         qyVMmscjibuHMyhRRCPR1YGVe6JQMaUNRcF2pfWsOk2Tt7XyoJVwy1JsT74EMLq8qJIJ
         MlHa6apricoJygK1gtULhYm31j8Mjn+a+koPG5mCD2qn4aBRjhxIpK6KY9nRZReLq6I7
         dKIw==
X-Gm-Message-State: ACrzQf1WWosz/01CTAdCaamCHO9uuzdRxu0YjhRDKV0xOJh4AkFX0UGL
	huBN2OT8N49dh2bTfBEzJ3LH4oCQDNFsbMDq
X-Google-Smtp-Source: AMsMyM4Eh30g4g2aQd29JZjLH0oBmaiGPFNbjrqPevPP7OglZlvfw9tkUeh4+fvn1b0wvODrQySRyg==
X-Received: by 2002:a63:fd58:0:b0:46b:41d:9d33 with SMTP id m24-20020a63fd58000000b0046b041d9d33mr608667pgj.399.1665679028222;
        Thu, 13 Oct 2022 09:37:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d29-20020a634f1d000000b0043a09d5c32bsm3460615pgb.74.2022.10.13.09.37.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 09:37:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Thu, 13 Oct 2022 06:36:47 -1000
Message-Id: <cover.1665678874.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 16:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171708

Please review this set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4330

The following changes since commit dbad46a0079843b380cf3dda6008b12ab9526688:

  build-appliance-image: Update to dunfell head revision (2022-10-06 23:23:20 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Hitendra Prajapati (2):
  dhcp: Fix CVE-2022-2928 & CVE-2022-2929
  qemu: CVE-2021-3750 hcd-ehci: DMA reentrancy issue leads to
    use-after-free

John Edward Broadbent (1):
  externalsrc: git submodule--helper list unsupported

Michael Halstead (1):
  uninative: Upgrade to 3.7 to work with glibc 2.36

Richard Purdie (1):
  qemu: Avoid accidental librdmacm linkage

Steve Sakoman (3):
  selftest: skip virgl test on ubuntu 22.04
  qemu: Avoid accidental libvdeplug linkage
  qemu: Add PACKAGECONFIG for rbd

Tim Orling (1):
  python3: upgrade 3.8.13 -> 3.8.14

 meta/classes/externalsrc.bbclass              |  19 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 .../dhcp/dhcp/CVE-2022-2928.patch             | 120 ++++++++++++
 .../dhcp/dhcp/CVE-2022-2929.patch             |  40 ++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |   2 +
 .../python/python3/CVE-2021-28861.patch       | 135 -------------
 .../{python3_3.8.13.bb => python3_3.8.14.bb}  |   5 +-
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2021-3750.patch             | 180 ++++++++++++++++++
 10 files changed, 365 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2928.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2929.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-28861.patch
 rename meta/recipes-devtools/python/{python3_3.8.13.bb => python3_3.8.14.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750.patch

-- 
2.25.1


