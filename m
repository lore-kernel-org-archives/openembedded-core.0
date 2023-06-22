Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F496EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:31:58 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.14618.1687447914736962326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=itilWaAk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6686a05bc66so3665108b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447914; x=1690039914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eolYXdFZwfB9d5MQNttvE64cgbS+7ZaKlPfW1ig1RMg=;
        b=itilWaAkpsFWSz4py5UZp9yylS4ZTpJUai+a56tGwAaGPLqeGaWUwCvB9aAzVlUOby
         v0n5MqNijLzujz2viqFDMgdf6jUYa607W/qwR5a7/2INiRKCHh2qtPQZAskvOnw68ncq
         kjTctWNLqExcMvnxGe5ZEAE843nFX490mr52CjH0ylUgMD5HuJMtvLSmAO/cFq3eApk5
         Eub7vWdcHqSBbSPuWYgSw9cBmQX0wJIMAGA1wiihFBldIuorlocDkhSYeyAqPXBzpT0s
         CMr9j/WPmTnpGo5OmmLbu0CDURkeiLp9UV8ck751Oexs+vhvMvx5gFON+yk+nAgjo4qf
         w0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447914; x=1690039914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eolYXdFZwfB9d5MQNttvE64cgbS+7ZaKlPfW1ig1RMg=;
        b=g0hX/HQBPtLlW9t9Nb58wKXJ78ZoHqrpuOK3xqs/9ZTh7CupmyTO9iAXHpfANdOuYO
         FYxbZMXblelXhj2GhXQd3BLClrtjGCgQQn3gY/7xYdyEeUcftqYDaeeoomJy1BbmNdNA
         H/T7nFWrceuoid+cqr4B/TwOhuKBc14+LE/HKIdeUeZvMtVCq+UPJYhg3IaWLG8MN1gW
         0xY/Tlr4OHCpjU/j2qJ1E8AvDEf3BVNiVaD+Ea1LtJVt2IYCNztPofFePprWjoSqSo4/
         /B/8l8rs9+6Q4slLdtAxN3m3dXzDVjcKyqb3C0I6M49Ec7h3L6stcywYFxd6dmYLkVyo
         gJVQ==
X-Gm-Message-State: AC+VfDzKOKMywU3cd75VYHa7D/1Q2oyXEM1PM51aNX2QzWFtdtx+Htm4
	7Dtp+LqoRZ2U4bkLxY2yInC4yZ6YsN/jDZeOL7Q=
X-Google-Smtp-Source: ACHHUZ7OdXYg/Tsc4k5CwB5DBCamLCWHV3hxZtAU4VLneRlJK4yVeTkgcOIWbmB8qacR8+94LA4F6Q==
X-Received: by 2002:a05:6a00:2e9b:b0:64d:5b4b:8429 with SMTP id fd27-20020a056a002e9b00b0064d5b4b8429mr21032507pfb.18.1687447913671;
        Thu, 22 Jun 2023 08:31:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.31.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:31:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Patch review
Date: Thu, 22 Jun 2023 05:31:29 -1000
Message-Id: <cover.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:31:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183247

Please review this set of changes for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5493

The following changes since commit 77f6fbfa18b4ad77c3756cfdc45d441a20210781:

  build-appliance-image: Update to dunfell head revision (2023-06-17 09:47:49 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Abdellatif El Khlifi (1):
  kernel-fitimage: adding support for Initramfs bundle and u-boot script

Andrej Valek (1):
  kernel-fitimage: use correct kernel image

Hitendra Prajapati (1):
  openssl: CVE-2023-2650 Possible DoS translating ASN.1 object
    identifiers

Ian Ray (1):
  systemd-systemctl: support instance expansion in WantedBy

Jan Vermaete (1):
  cve-update-nvd2-native: added the missing http import

Marta Rybczynska (1):
  cve-update-nvd2-native: new CVE database fetcher

Martin Siegumfeldt (1):
  systemd-systemctl: fix instance template WantedBy symlink construction

Michael Halstead (4):
  uninative: Upgrade to 3.8.1 to include libgcc
  uninative: Upgrade to 3.9 to include glibc 2.37
  uninative: Upgrade to 3.10 to support gcc 13
  uninative: Upgrade to 4.0 to include latest gcc 13.1.1

Richard Purdie (1):
  uninative: Ensure uninative is enabled in all cases for BuildStarted
    event

Sanjay Chitroda (1):
  cups: Fix CVE-2023-32324

Steve Sakoman (1):
  uninative.bbclass: handle read only files outside of patchelf

 meta/classes/cve-check.bbclass                |   4 +-
 meta/classes/kernel-fitimage.bbclass          | 142 ++++++--
 meta/classes/uninative.bbclass                |   4 +
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 .../openssl/openssl/CVE-2023-2650.patch       | 122 +++++++
 .../openssl/openssl_1.1.1t.bb                 |   1 +
 .../meta/cve-update-nvd2-native.bb            | 334 ++++++++++++++++++
 .../systemd/systemd-systemctl/systemctl       |   8 +-
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2023-32324.patch            |  36 ++
 10 files changed, 629 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch
 create mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch

-- 
2.34.1


