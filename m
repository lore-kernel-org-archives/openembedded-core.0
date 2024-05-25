Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEBCC25B78
	for <webhook@archiver.kernel.org>; Sat, 25 May 2024 08:44:25 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.7681.1716626656919462208
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 May 2024 01:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jeBA9+4a;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e73441edf7so64293121fa.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 01:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716626655; x=1717231455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSFTYV8Krn+ybg4NtzkgQMOE0mAXeaRd3oM0BaYAbVg=;
        b=jeBA9+4aziEm2In3Hzf81MtBlBFse8fxio5Kpb9YoPgQZjjLQC/5VKlkTv8Z49pml+
         8tzcVl1h1fGOLHOLYABv2JvVq/t1osH9dSg/oKL9BVm86vvfzkSNZAs79mss9dfocDpv
         KZTUubZp0As66Pvh+4F8khpPBDQIZtUD9nWA2uxWVgmGdW0YO4Ko6HD8t1g4D62+knY8
         7GZOjlzDqr+/Zdlv0QchIddTtEvY5JHBwcZzqgMuKBJYfrxMGto+sBom0TWF0CrioXxh
         ZOQT/rbZuTWDfxO9KmeTZ+eEj4BAbjtTqIaXHfM2QIqLOC1PGJ1SR3Dyfg/OPmm/nWXy
         jn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716626655; x=1717231455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSFTYV8Krn+ybg4NtzkgQMOE0mAXeaRd3oM0BaYAbVg=;
        b=pa50RaQFXcGSCoEouWQqsBgOA6v4uWZv9fT4gU0aP4XVNbuyXSzQ+7B6eUXkINxSQR
         hshFuWa8+xXC012iltpFKGK7Iej3hBiK/ln0Tn2V4h33fYBzuyB6r24YXyDLgeLPTeD3
         2+djbuXwcMv1wduTwSYFYqY7NNHk9nB/aY2zqRTAjbAmIv52W6ugjXYz2g/a+/be5b48
         A09/x879fGSEaBq+5o5wREJTGzaPdsm6+Dd2J5OXdmyfmZtje4+JHUi1u6BHYrIfTssa
         Em5UxvOZnf77kVXc0rPnsw/v6E6bS9Fc1UdoGmoFUqVPi813lENYY/VVwks64uPH0M0h
         ORfQ==
X-Gm-Message-State: AOJu0YzHXSJgKdVJIsjaYJVvYyk60mbVSW06XHFJrgiyS5dWI1BxAeAI
	aPlib2WD7IYaUPvgZlfKsdWExHBQHakB8MtHyNkwdBUJFaOFFUrF7Fr4Pw==
X-Google-Smtp-Source: AGHT+IG+aqpF50HuckYHk2SRMvipPqeW7fDIV86SWgADHmSPbm43+yqq7GB2JwYNC7pyz0EKW/kTjA==
X-Received: by 2002:a05:651c:201d:b0:2e5:6958:b5de with SMTP id 38308e7fff4ca-2e95b09af62mr26042681fa.21.1716626654393;
        Sat, 25 May 2024 01:44:14 -0700 (PDT)
Received: from localhost.localdomain (c80-216-168-104.bredband.tele2.se. [80.216.168.104])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdd1cb0sm6197871fa.91.2024.05.25.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 01:44:13 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v2 0/2] image-bootfiles: new class
Date: Sat, 25 May 2024 10:50:21 +0200
Message-ID: <20240525085023.6042-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 May 2024 08:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199865

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

Marcus Folkesson (2):
  bootimg-partition: break out code to a common library.
  image-bootfiles.bbclass: new class, copy boot files to root filesystem

 meta/classes/image-bootfiles.bbclass          | 38 +++++++++++++
 meta/lib/oe/bootfiles.py                      | 56 +++++++++++++++++++
 .../wic/plugins/source/bootimg-partition.py   | 39 +------------
 3 files changed, 97 insertions(+), 36 deletions(-)
 create mode 100644 meta/classes/image-bootfiles.bbclass
 create mode 100644 meta/lib/oe/bootfiles.py

-- 
2.44.0


