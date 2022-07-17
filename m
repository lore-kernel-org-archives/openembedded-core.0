Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506C6C43334
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:05 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.15409.1658062620571114099
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RtGluUW7;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id bp17so15213491lfb.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hRG6uI0+sJxCgfDQS28MG8+BtHIrqjBPP9cxS3wHyWE=;
        b=RtGluUW7WljXn2rJDBTtY+NfEy/yAQ+78D7TjQKYaCRVHWAFe/6NWSAtzAQl8A8eOC
         zJdidH/6qiWdtDT6GuF8ygMTjfHq+neLf4/EZkOjCBXDl1nQ0QJhyLMrL8BrOOzNHKGO
         osZPBX5yE8uSr5+epoMUZf8LaJZaurRYYJiHOI4u90yCrKVoqBiT9l+P4GpWW+VgEfTc
         AImbe6HHR+JIXgaYgxQWarkMc12dXOy9EXZp7QV0+8ytem+mbWCBmTDkWju1q7z+AG94
         5laOFlbB6JbhfS88WAQmGwTThhJLEPb/SyP59hDF/ldwvpydm+xJCzLoPyZGDTPps4ns
         CoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hRG6uI0+sJxCgfDQS28MG8+BtHIrqjBPP9cxS3wHyWE=;
        b=QVtF2T2eEnwpl3SbJnFJjJb7Ot4g6nGoPIyqCZGyHzEYwBBknnB5VXLBuh1J2XP79B
         RpdLaarHlp9ICgNUtbuon6/Jwa232Mq4qEZJDSsMFnM6QCTasYpWBWi5IlHkZLcsIrE6
         uCjwiQKeAHn+djKaVsCqVVga9X0xW9byFCA+erYYIfONhHDVI6Wxy7ZTUSjkeKs60GYP
         vuGsjCjNqRxwdBU42RPiKvjBiqYRGsEicWGZ/RjeBfNMSCVfXpmfG3NOGIOH+2Zdrvi9
         ZbSjM8itGB0R6+4b1lZhaq91WvuF+761rz4QYPrH0v9x4GvapHdDiGfBIkKlzOO+EifB
         N4sQ==
X-Gm-Message-State: AJIora8mVKps2fPr6+MnrayUTh0LzsYEODr8YAO19WBNNKfx9KvIofoZ
	6bQoHzogIwQIIdu57Uc0nqi0PS8iVQ0=
X-Google-Smtp-Source: 
 AGRyM1ub8qqxHWSQD7dl0gJbLf9XWMWCIR3BVttjKnPegNRqzWYuwCcQ5fBEEJkLOicM2sJjNPwVRA==
X-Received: by 2002:a05:6512:2282:b0:489:fdb3:2351 with SMTP id
 f2-20020a056512228200b00489fdb32351mr12243905lfu.209.1658062617287;
        Sun, 17 Jul 2022 05:56:57 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:56:56 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 0/9] udev-extraconf fixes
Date: Sun, 17 Jul 2022 14:56:39 +0200
Message-Id: <20220717125648.2942046-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168148

From: Ming Liu <liu.ming50@gmail.com>

udev-extraconf of kirkstone does not work, back-ported several fixes from
upstream.

Ming Liu (3):
  udev-extraconf: let automount base directory configurable
  udev-extraconf: fix some systemd automount issues
  udev-extraconf:mount.sh: fix path mismatching issues

Muhammad Hamza (5):
  udev-extraconf/mount.sh: add LABELs to mountpoints
  udev-extraconf/mount.sh: save mount name in our tmp filecache
  udev-extraconf/mount.sh: only mount devices on hotplug
  udev-extraconf: force systemd-udevd to use shared MountFlags
  udev-extraconf/mount.sh: ignore lvm in automount

Richard Purdie (1):
  udev-extraconf/initrdscripts/parted: Rename mount.blacklist ->
    mount.ignorelist

 .../files/init-install-efi-testfs.sh          |  2 +-
 .../initrdscripts/files/init-install-efi.sh   |  2 +-
 .../files/init-install-testfs.sh              |  2 +-
 .../initrdscripts/files/init-install.sh       |  2 +-
 .../{mount.blacklist => mount.ignorelist}     |  0
 .../recipes-core/udev/udev-extraconf/mount.sh | 90 ++++++++++++++-----
 meta/recipes-core/udev/udev-extraconf_1.1.bb  | 27 ++++--
 meta/recipes-extended/parted/files/run-ptest  |  6 +-
 8 files changed, 95 insertions(+), 36 deletions(-)
 rename meta/recipes-core/udev/udev-extraconf/{mount.blacklist => mount.ignorelist} (100%)

-- 
2.25.1


