Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761C5C7EE2C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:39 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.web10.4684.1685500470133333536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=z3h00dBY;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.46, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-54fb7dc3456so2704645eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500469; x=1688092469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtO5TCjMo91JkR+TEFO1aFM2uYII2x192ePvV9eq9lk=;
        b=z3h00dBYZZ2qacuzATvJdoNu7XySV0zWbW2VNvX1u02TWkHay4x//31kayexMQQVZK
         tl11/LDekbADAURVsbt3zedgmRWfcVVwy9pipRJk7K0EaB7hqKpvB9DPND3Uy4Y6gspZ
         +eOmo24whECFuj4gMKUL+43tIvnAsZiJ55lt5i3rOvGRy6uSPrqN8Jx/imorPQ0Pu/T5
         rgGqf3DREQmqG33bND4hcgitWN16OOOuWoyCSr6NhdWcA6ZXup+7cJrPhbVhEfiqYrfw
         wbOjVmoe7RyhD464K3Es2TFzBj+JSXoH9Pn3opzGgCTrC8b9USOd1uYbabe7iHhU3YkV
         LYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500469; x=1688092469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtO5TCjMo91JkR+TEFO1aFM2uYII2x192ePvV9eq9lk=;
        b=MVNgW4eVg+adi7VesQD78LxyqYSh4D39DatGtownnu4D2ogXPWbQcHrfii432EysOO
         c1vQP6ghXUQz/088y7tSZ426LrSP+MwFsmRH8g/od8iolaNUXK72YTVOf1b83kOve/DX
         JkOmnFSPOpkEISYgEsUFU+5Eywj6zgBBEJp0RYeZlVEcOJbDsACpF1rbjEY1wS0jlWqE
         XP/hmnZKVQ/SkTPG0Ilr2eMGv4crmlD2+8zy4WH0VNtz7du4TzjBZCKNhzcqLyuAf5An
         iKddAvbbY43Mzcvb+jbQN/k7P3uz0x4qubPtYXHD6/Bd7n2uFDdMw4RvHQPdepa/6oR3
         atmw==
X-Gm-Message-State: AC+VfDzRDlrqOpllRnMiE4TI5IL6c4MlLEVlgTy8fgL9toAB93ERboo0
	a7pYaP5RHjDZb1h8VFtACwc6yrJzjZwxX4cbK00=
X-Google-Smtp-Source: ACHHUZ5mxDkMhrtUVxZ4kOd488zxUk3BH5z1OkOJLy5TgZlrfATPTLexVG6lO0LSBsItQ4fmUFJNDQ==
X-Received: by 2002:a05:6358:c1d:b0:123:485f:391 with SMTP id f29-20020a0563580c1d00b00123485f0391mr364491rwj.11.1685500468662;
        Tue, 30 May 2023 19:34:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Tue, 30 May 2023 16:34:07 -1000
Message-Id: <cover.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181969

Please review this set of changes for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5365

The following changes since commit 5e26ead1ca016d1691dccba1b58060ac853bf0d2:

  piglit: Add missing glslang dependencies (2023-05-25 05:42:54 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bhabu Bindu (4):
  curl: Fix CVE-2023-28319
  curl: Fix CVE-2023-28320
  curl: Fix CVE-2023-28321
  curl: Fix CVE-2023-28322

Bruce Ashfield (5):
  linux-yocto/5.10: update to v5.10.176
  linux-yocto/5.10: update to v5.10.177
  linux-yocto/5.10: update to v5.10.178
  linux-yocto/5.10: update to v5.10.179
  linux-yocto/5.10: update to v5.10.180

Martin Jansa (1):
  kernel-devicetree: make shell scripts posix compliant

Randolph Sapp (3):
  kernel-devicetree: allow specification of dtb directory
  package: enable recursion on file globs
  kernel-devicetree: recursively search for dtbs

 meta/classes/kernel-devicetree.bbclass        |  22 +-
 meta/classes/kernel.bbclass                   |   2 +
 meta/classes/package.bbclass                  |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 .../curl/curl/CVE-2023-28319.patch            |  33 ++
 .../curl/curl/CVE-2023-28320.patch            |  83 ++++
 .../curl/curl/CVE-2023-28321.patch            | 302 ++++++++++++
 .../curl/curl/CVE-2023-28322-1.patch          |  84 ++++
 .../curl/curl/CVE-2023-28322-2.patch          | 436 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   5 +
 12 files changed, 982 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28319.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28320.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28321.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-28322-2.patch

-- 
2.34.1


