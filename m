Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD70CC27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 12:32:43 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.19547.1718800362431283098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 05:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JIyIH6Np;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso8683867e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718800360; x=1719405160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7NQ07QbufhmyFjiDmwZ3sF808Akosvl5flK1Us6qpXI=;
        b=JIyIH6NpqnT0NN+I9cxsNx+8fAhxFhpW2U+Gn75KvMgULI1xH/dRpUpkmYrQr0fM9a
         SEAHNAgvpxsnHx0sLy2s0Uswbt6rA4HHV+vDsbu/blT/kIEqekYotfph+ReUFDkH4nN1
         i2roWtkWqnhtAhz76B8H6GPTfxM7ursEp2rQfOJu+8Ay/DixazBbIk2RmFEADyL6/99I
         5XoeurLeQwayqVMyxTxME9nknwUUnx/JydEuWSaqTCeYxrQcFkq6u+722k8RR7Ba9HS9
         mBMW+7BVLdKN+VRdvoSADoObMrltb11FIhEm29w56RBovcEuoVHfSEQdEJBdRZ0Bgfq2
         WK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718800360; x=1719405160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NQ07QbufhmyFjiDmwZ3sF808Akosvl5flK1Us6qpXI=;
        b=fh8LNz0fS3O3ci97MU3aM7RGLZFHH7XM5LXOKAzlSBOHSA+scFEY64hQuFwrE5ICZL
         xv8k+n6tDGsjtdWFrsWWA3NMyEeTjsK7pEGy96wML2rHlAbol0aNbD2Fb0kbRRYPkwpc
         v8VAqMYHXiZOKehujLHADftUagcx2PH4LSQGausKbtu4GQA3P0iq2mTVleG7CaAviLV7
         /ZroNL5EpMk2/cQ2KcRFg3EX0VzQ/Qc638OQJrKZUKlXivZ66ANk/kdvzaSq7GDcIwSB
         T4zp5hc/8Wq8eBTTwYsBa4IdzhEsr7EykRhSldoI0gN4/ZcevUEW3j6cA9G19OfFUX/R
         hbkQ==
X-Gm-Message-State: AOJu0YxL2IeoqK5KFDWGnuVW/rtbTEIalO1YfcGMbE9BHexPgfifGsaO
	OfbYbaJ4GWJyEoQK1+AD8RS3x+arCXXedbCJRnj2XpMIQL1Nm1+VAcIhUw==
X-Google-Smtp-Source: AGHT+IGgXrdDm6tAIgJMBdrIHuJ9pfA/vZTHVVw4EJUJuxgkADp6qnjSykRUORvibMI20UdTG0Irvg==
X-Received: by 2002:a19:f010:0:b0:52c:9055:b257 with SMTP id 2adb3069b0e04-52ccaa52515mr1621726e87.44.1718800359986;
        Wed, 19 Jun 2024 05:32:39 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872274sm1748092e87.140.2024.06.19.05.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 05:32:39 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>,
	kweihmann@outlook.com
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v5 0/2] image-bootfiles: new class
Date: Wed, 19 Jun 2024 14:38:51 +0200
Message-ID: <20240619123853.2144538-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 12:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200909

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


