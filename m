Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F941C25B74
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 09:47:05 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.4372.1717062420520784479
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 May 2024 02:47:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aDqygJfO;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b27afe214so545311e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 02:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717062418; x=1717667218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1HdcUr4UceSzanYARxuXDpMTXLM/+ew4fSEYh5q1KvM=;
        b=aDqygJfOvdxjdl5hhqm0gHL2eTzdOsWRfbuIhzxVMw770p5L8NjvEm7LXMXD+triEz
         +YMJss/VhpgTSXNH9i+ss7ho6safn301vMKEeBi/8/XtZyMDyph2/8Rm9cr8wsltbQb9
         WVZYO/NDKvb3ZPrn94WOAbMauuK6UYm4hDnwexuFoptYM0SjFgrSE8SSgFJNUB1V1N7n
         W3m8V9ikGSfRtooEI9izUsSf8zjundmKt5UYzTDU9XaTKoHGfeSlUvOJjEDq858So4VT
         krGije05tU60aXQrApKmZXiMJykMZ+gP3WKVevNKufRSkYDrWwWNdiMV3IyF76ZDFhPF
         azXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717062418; x=1717667218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HdcUr4UceSzanYARxuXDpMTXLM/+ew4fSEYh5q1KvM=;
        b=moBhsGByR1np5t1+rglVuQ3AthYds+VrXzEVRwikEsP9eWZ6ZHckvUSOX3k27e84bK
         b5traS/9gTYJPKVQGxjnbMIOsOfIyG0dsU/v7EdPqiQNNRIHGfSK4BnVauXp09g/uuRs
         6Fg3q419+/HhuYRq5zUj8O5eXqtt8pefgEKeuE0kQOwxJa/+tUxdKyeBI4EXLvL+Bu0Z
         mpNx5ZfrKMeNmqJFNAqKEH/GdP9q0bLVgOZtjt2+rYcfEYVKUPF9UuufxaJxCoY4Bgmh
         n76U0CXZb10Bw7jE6M1TG2tmoZo9qNwuWKtoN2MyA42pYNFpOte2/uYHVVvoQVjK4It+
         tV8g==
X-Gm-Message-State: AOJu0YzL3jc1cTv+RHZbUTaCav4C+YXQMri0vuqKyfbZxLVi0cY2PRtV
	fSiRuVtazH08NTLLoHFUzMMpRvRZlNrmRygfKBo8MLUxfnzr3PVgnO+tyg==
X-Google-Smtp-Source: AGHT+IEqi+l5iq/pnjzLHQ0PvGVLL84n6v6gMICUVYzRAmqSoHfSDLV9s10dO5JG8kfPz/OjfxzBuQ==
X-Received: by 2002:a19:f704:0:b0:51f:b3b:6373 with SMTP id 2adb3069b0e04-52b7e109a16mr365334e87.15.1717062417932;
        Thu, 30 May 2024 02:46:57 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b547f82d8sm344332e87.279.2024.05.30.02.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 02:46:57 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v4 0/2] image-bootfiles: new class
Date: Thu, 30 May 2024 11:53:12 +0200
Message-ID: <20240530095314.407638-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 May 2024 09:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200016

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

Marcus Folkesson (2):
  bootimg-partition: break out code to a common library.
  image-bootfiles.bbclass: new class, copy boot files to root filesystem

 meta/classes/image-bootfiles.bbclass          | 38 +++++++++++++
 meta/lib/oe/bootfiles.py                      | 57 +++++++++++++++++++
 .../wic/plugins/source/bootimg-partition.py   | 39 +------------
 3 files changed, 97 insertions(+), 37 deletions(-)
 create mode 100644 meta/classes/image-bootfiles.bbclass
 create mode 100644 meta/lib/oe/bootfiles.py

-- 
2.45.1


