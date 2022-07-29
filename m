Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD992C00144
	for <webhook@archiver.kernel.org>; Fri, 29 Jul 2022 15:24:28 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.503.1659108265909132051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oz7SJ1/V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id o12so4910217pfp.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jul 2022 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s++0m/jz9msOeDru2D80+4X2rXlUXUYv553cPMPz44Y=;
        b=oz7SJ1/VOyLd1lTxKDDtfQ3CnonsDDjciyTShtdIeQNzdMc3RQ37GU6j1T9CUYUon+
         DB92SW+/BVegJwJYzM709Rdr/+Q83jA6ZfKLeupy05j4QO1iDmlaYAhtkoFTZQ9f3FsO
         GdllIzhTyx6Aemp01alzAt87+79EdrEDr8faRa/g31Q8z4QbUpm3bh/beCaxtfbN/sR/
         h8Zt4tbYMZweMIgPxJR0WJa+RsvaD642JP4mI0UVIBwtHx1jKvZBMt4DGiroxf/cQw0q
         1Nqwxv59tjz6RPXNWQKsZK/uXVh4HBXX+TG5rBcwlZvEOEqc9Yq2fH/tLcxjWWNxLn3z
         AEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s++0m/jz9msOeDru2D80+4X2rXlUXUYv553cPMPz44Y=;
        b=vaOLmrd8yEnWku5w5xYBc5pOK5s6zZTsY822l946tDO2moc4Z/lQ1n+JSAqA2rQwVZ
         bAfis+udoskEe5JJMJJxxo7relCFB9iGgLu1UpkshcHhX5ma6oguYrU5vLHTSzYd2+lS
         HLJt8lfc4GWlLr+F4C7QaKQIgTQt+J7GeKHD5u+M0g3DhNmxDW3YChR8LkGi0YCn7QcX
         z74vqf1B+DK3AUagZmCWn3hbNwlFGXgmY3DMYoiLf7MHI2qVTgkxDb+j7/Fdo7kFrxRM
         rgbC06iCCI0yuzlfLraZN8gQgeHgiwkWKV2Te9oH7XZrC+cjZNfpgu48dLIhj3p0vAzH
         ka9A==
X-Gm-Message-State: ACgBeo3kO9BCcwkGEAGK1vZjOKdFPpzNZoH+gTOrochGR9sP8BsB9NxJ
	icZ8sft979AtxmIVg/BSL7JWJEDo4XSUKYeV
X-Google-Smtp-Source: 
 AGRyM1siS0zzEc03LdHSUVFDfYCVIMI4Npxw27roqQXBRDXUo27b+7lZlw3xm45o9V66iJGKg1Ujqw==
X-Received: by 2002:a05:6a00:f85:b0:52a:c718:ff9 with SMTP id
 ct5-20020a056a000f8500b0052ac7180ff9mr3942569pfb.85.1659108264638;
        Fri, 29 Jul 2022 08:24:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a17090311d000b0016be6a554b5sm3889808plh.233.2022.07.29.08.24.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 08:24:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Fri, 29 Jul 2022 05:24:04 -1000
Message-Id: <cover.1659108121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Jul 2022 15:24:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168665

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3993

The following changes since commit 3f40d5f095ceb099b604750db96058df00fcd49e:

  build-appliance-image: Update to dunfell head revision (2022-07-25 15:09:15 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Hitendra Prajapati (5):
  gnupg: CVE-2022-34903 possible signature forgery via injection into
    the status line
  grub2: Fix buffer underflow write in the heap
  qemu: CVE-2022-35414 can perform an uninitialized read on the
    translate_fail path, leading to an io_readx or io_writex crash
  libTiff: CVE-2022-2056 CVE-2022-2057 CVE-2022-2058 DoS from Divide By
    Zero Error
  libtirpc: CVE-2021-46828 DoS vulnerability with lots of connections

LUIS ENRIQUEZ (1):
  kernel-fitimage.bbclass: add padding algorithm property in config
    nodes

Sana.Kazi (1):
  libjpeg-turbo: Fix CVE-2021-46822

 meta/classes/kernel-fitimage.bbclass          |   5 +
 .../grub/files/CVE-2021-3695.patch            | 178 +++++++++++++++++
 .../grub/files/CVE-2021-3696.patch            |  46 +++++
 .../grub/files/CVE-2021-3697.patch            |  82 ++++++++
 meta/recipes-bsp/grub/grub2.inc               |   5 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-35414.patch            |  53 +++++
 .../libtirpc/libtirpc/CVE-2021-46828.patch    | 155 +++++++++++++++
 .../libtirpc/libtirpc_1.2.6.bb                |   4 +-
 .../jpeg/files/CVE-2021-46822.patch           | 133 +++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   1 +
 ...022-2056-CVE-2022-2057-CVE-2022-2058.patch | 183 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 .../gnupg/gnupg/CVE-2022-34903.patch          |  44 +++++
 meta/recipes-support/gnupg/gnupg_2.2.27.bb    |   1 +
 15 files changed, 890 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch

-- 
2.25.1


