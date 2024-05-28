Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562EDC25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 09:02:31 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.17884.1716886942197022400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LqLaIzs0;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5238fe0cfc9so517954e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716886940; x=1717491740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/jJh9rOnxFrls1CVRv9gAIarWRemtMNMAeBQBNVswI=;
        b=LqLaIzs0k/gvgleVmGS0HpaX/Pa6mqi1y6UxiAEmkkng9ZW5jv3o2RBvx2ScfEq2oz
         prpN60DfjvlFdWj/WPsLFhnnHyMkW/pgRACRJ5xsGKtUpmNLSEeyNHSW9o6auVKKw6BA
         ddYc37/8X4kJh1/jhhBSWc1KckeXPRV8Y1r05Jqcf2QinVu4kqprmqKnpnBt9llQTrOz
         QZC74hMCbcxMQXLYs/KDRj5lILqctRdVgKu02Xpx3WCnm+A/OtzksqZfpR/sr+3V/RAn
         SawWvWeBVZp+JQZfk/kS65CdMzIbgR3Q18CZEhUa0oCcJODu43LfFaVxoMsBgSfQPQRD
         RSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716886940; x=1717491740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/jJh9rOnxFrls1CVRv9gAIarWRemtMNMAeBQBNVswI=;
        b=O5+jsLMEPL+VAM4d91z5XQBlXgz8S5i9wvQQyndWMaOxXPzKAGDSZnuZgi1+cGjQxI
         ZAAJKe9mUkovAC0qW6oSZeyWPlW1EWdHefPWa8P6Xg/btOoQjSVbA/fHnuD+//bDa5uj
         9frfwGSy+sXd2xh2+NkdVgvsf0rvsSvSK8v7FUuy5dcp8dn4TXvj27JGNOdM5kmSVSPS
         TUsCE0hps6MepVI+/gyrM6RHAsuzZCzTSP0P+fTAoFYDTBa2wNqHmpv68uL0Q9P81jRB
         HMZ5nyI51rdwZp0D0yVagVbF9i3ze7lV9RwUafsioGcPDUSo25sHwb6NlGKICzekFZFb
         xdag==
X-Gm-Message-State: AOJu0YxWRpaK8dEU5KC6cazhQkv8n9u8yJwpcTe9uOhFV+cuBMTBpNbv
	KukKFAB74nGjN6LZ2vrR0XClcsMZRqQKr5raiz4eGMULuJtIsFUX9l5IPQ==
X-Google-Smtp-Source: AGHT+IGOE9bA6CiP3QFwBOiabZCUlJm3XEKCql3ReoVHZGJbNwB0/8c9JfVmGY5nvsMo7znUqvR5FA==
X-Received: by 2002:a05:6512:488c:b0:51a:cdc4:dd48 with SMTP id 2adb3069b0e04-527eee35cd8mr4498723e87.3.1716886939524;
        Tue, 28 May 2024 02:02:19 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c3327esm887095e87.196.2024.05.28.02.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 02:02:19 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@cherry.de>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v3 0/2] image-bootfiles: new class
Date: Tue, 28 May 2024 11:08:30 +0200
Message-ID: <20240528090832.725884-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 09:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199958

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
2.45.1


