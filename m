Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C8DC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 08:53:18 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.9631.1720601595642121844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 01:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ge65mKVe;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e9a550e9fso576726e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 01:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720601593; x=1721206393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XjpVI4FOeETleD9FGw73Wrb98GC2c1EyEQLYiUwMlN0=;
        b=ge65mKVem7kOGLpB1VoL1xOD5H2TcP78SLkXGU3JbadsT/8cEdS6imy0kzpUb4h2nM
         8BbGxrF7QYT4aHzM9G8Rq1utVW2ESKRTm9yD7ICMh8YNOiiDAKxQAQOZyFm/HQxVqeko
         GWUE47FRSn9hsOaQ+R/V91Hm9hfen66uqPwwe/DRQ/jDmDNra7DLatCkCTxej5mB1iI4
         iQDFa4QekH4X8FA22rzTYGTRMG2XlijCz753LhdM0bco6uVw8sdVXlVLjKHcwA4QFzsW
         RM9No6ro7KISSVCrmwahu3eJfr8Lql4YiS5xerGcEhQRsdNCWAhMq9uooaOkfXxo4QZs
         pBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720601593; x=1721206393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XjpVI4FOeETleD9FGw73Wrb98GC2c1EyEQLYiUwMlN0=;
        b=ItSvevFbuK1P1W91KjXJARRNWvqc1RGueThhf8kp6G2iwCskrDJ1eifxx1tgJDekqH
         oplxsiWihYkB0LU0yiVxrMWLmXsQi047rjN+UgIaWEXsAmZ+EsriCce+0MmPJQM6KZS3
         zjwa3d4RkrKAPFV9ATr6WhPIt/wnxZjtHvcFEsjgKUzAeQgJYGmRxa9pPHs7uvudUF/w
         h06azb2iHzTq91DFwiO2zV/CfSmV/Bh9FCWjnMn8kIh2lWAeJH70HapiBV9h/4shPN2t
         AqevONMywVrvGwsL0HE7bgqcyr7iz260KWzsrin+zDGiN2EVoVxjz3Qkl6m/JSCDrWJF
         DtDg==
X-Gm-Message-State: AOJu0YzwWYu0xzQlw0Zmp5ZeqbJNtOaPVl/dgZODEDib6umELrc9ibd0
	Hinl6Q1RCyQlM63rnRKswgnysTxEh4tlQvjaHT0S1PgptI4SV5BTGa9x/Q==
X-Google-Smtp-Source: AGHT+IHdpjF5m6VFnMwCUCzOqfj3YVxjcJ0tSCPuGm8kFDE9O1Y2z0i9dRq0tJckJpWUa4S/R7swug==
X-Received: by 2002:ac2:5962:0:b0:52c:c779:a025 with SMTP id 2adb3069b0e04-52eb9d54d08mr1296269e87.15.1720601592975;
        Wed, 10 Jul 2024 01:53:12 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52eb906e86esm526621e87.279.2024.07.10.01.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:53:12 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	kweihmann@outlook.com
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v6 0/2] image-bootfiles: new class
Date: Wed, 10 Jul 2024 10:53:08 +0200
Message-ID: <20240710085310.147425-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 08:53:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201691

The image-bootfiles class is used to put all files listed in
IMAGE_BOOT_FILES into the root filesystem.

IMAGE_BOOT_FILES is used by the bootimg-partition wic plugin to put the
files into a boot partition. 
Be able to list files as "boot files" in e.g. your .conf or image files
instead of install those in every recipe is a good thing.

It is not always desired to have a separate boot partition for boot
files. Sometimes it could be good to have them as a part of the root
filesystem.

For example, if a double copy strategy is used for update the system,
then you probably want to update both the boot files and root filesystem
at the same time as there may be dependencies.

v2:
    - Removed the documentation from the patch series (will be submitted later)
    - Break out the parts in bootimg-partition that is used by
      image-bootfiles to a common library
    - Make the destination directory in root filesystem configurable
v3:
    - See changelog in patches

v4:
    - See changelog in patches

v5:
    - See changelog in patches

v6:
    - See changelog in patches

Marcus Folkesson (2):
  bootimg-partition: break out code to a common library.
  image-bootfiles.bbclass: new class, copy boot files to root filesystem

 meta/classes/image-bootfiles.bbclass          | 41 +++++++++++++
 meta/lib/oe/bootfiles.py                      | 57 +++++++++++++++++++
 .../wic/plugins/source/bootimg-partition.py   | 39 +------------
 3 files changed, 100 insertions(+), 37 deletions(-)
 create mode 100644 meta/classes/image-bootfiles.bbclass
 create mode 100644 meta/lib/oe/bootfiles.py

-- 
2.45.1


