Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 741E5C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 17:54:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.14420.1664301251556769255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=x7Lk7F5U;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id x1so9758313plv.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=x8GFoa4i2uTfsv/+A95Gih4hinumr6oVOShMK5qY55s=;
        b=x7Lk7F5Uh13ZcRUBm+rL4/2jZnc1ZfM10iwRhcF/kaI3G0b+gzuxCyUVvmcMCaouHe
         VxMxnQRB+jghLF5PfnBAhMGrwhtqlhX+EvakXEkWS5soDC/2STBMX3BhajjOHUWQicV+
         1UWJDZYzxjD4mM+gydrQ1PIXq8hIJic2Yqu749UIC6mXRYBhIofhXNHdb3fLBw1aUpCV
         qBZBLRICQq6/gvTC7qkXqgwRO77boQ5dy174aFokuMIFyeDH8A0/tz+HSJNTd/IBzMIB
         47Y0TConNhm0mg7rhpHCRVzeAuFqA5d4nAy2SbB604NmnzO0JckzeTzmXQtm85xGf2f7
         KC5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=x8GFoa4i2uTfsv/+A95Gih4hinumr6oVOShMK5qY55s=;
        b=zSisSUVTTy3DfrMWKAdgN/tuF9u6to5ZjlyiXU645dIHoXQvtiwAKMUjHv++07j3w4
         VKFOzF06DAH5KYkelxN69peR3MbOgDM1c10JLT6I0v86UIDNjVlXLuAvSRoh+l83D0jW
         lH4J0Rp28NfTrVrM/TblVbQ8f/h1XXdmmJ1ngeSY+pnMr9DqvQd3KxK4s4DaHnhCx/GP
         IUI/kliXXOi9Vs5ygLnDGRKfplYBpNGmzoHMfG9Hji/QRXBkzppTVI1jvJmmVw76ahVY
         192Es3vwpds5p5vLfcBjzkPivK3IyFa9bV11eBf1VOmMqKBybvRYdMHl5lwVab+dH3Bk
         IgpQ==
X-Gm-Message-State: ACrzQf1Y9khKnKstS59hrIoMZgMUc5DWe4P+PatKwlBGjmz8pteB7Kvf
	6nEmJp82gJ3UHCaycLgcLQ6CVdviOztZiL0G
X-Google-Smtp-Source: 
 AMsMyM4eTprUA+wAUrsJzYHXzCyMVVihF9wr744oUMGbnqHhIn0R5gRbTWP99NDhAZ7BnqFYBNnUjw==
X-Received: by 2002:a17:902:d353:b0:178:8976:e78f with SMTP id
 l19-20020a170902d35300b001788976e78fmr28463532plk.68.1664301250295;
        Tue, 27 Sep 2022 10:54:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w189-20020a6262c6000000b0054094544ae7sm2051468pfb.60.2022.09.27.10.54.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:54:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Patch review
Date: Tue, 27 Sep 2022 07:53:53 -1000
Message-Id: <cover.1664301116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 17:54:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171116

Please review this set of patches for dunfell and have comments back by end
of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4272

The following changes since commit ef38f7acee3f0ae400138fa60f4695a86dffc16e:

  linux-yocto/5.4: update to v5.4.213 (2022-09-22 04:40:18 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Dmitry Baryshkov (3):
  linux-firmware: upgrade 20220708 -> 20220913
  linux-firmware: package new Qualcomm firmware
  linux-firmware: package new Qualcomm firmware

Minjae Kim (1):
  inetutils: CVE-2022-39028 - fix remote DoS vulnerability in
    inetutils-telnetd

Richard Purdie (1):
  vim: Upgrade 9.0.453 -> 9.0.541

Robert Joslyn (1):
  tzdata: Update from 2022b to 2022c

 .../inetutils/inetutils/CVE-2022-39028.patch  | 54 +++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb              |  1 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +--
 ...20220708.bb => linux-firmware_20220913.bb} | 39 ++++++++++++--
 meta/recipes-support/vim/vim.inc              |  4 +-
 5 files changed, 95 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220708.bb => linux-firmware_20220913.bb} (94%)

-- 
2.25.1


