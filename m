Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 637CFECAAD5
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 08:57:32 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.9924.1662022644684718568
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:57:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FjpS6u2V;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id g7so6479351lfe.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 01:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=o/QGJfXwRWRoKgUKVAnnwqVc6i2GKdCZqJUF8DUdyDc=;
        b=FjpS6u2VFDW2VmjzID/LGIKHUvSvHvK6+bFz4fqHe8Tc2lWLfXWIh4svMoLQZm2d0L
         u3LfqcXqI18xvXPIDegL2K7vY19fJWvY6RYEyRxvH8SwbFsEkr+biDp2w8hbgmxXnuM/
         njKBXWOyzei/mfjj5GLKatEXCo/msHObd697KY8KMAUajwG88KpwKwvw4KkXhoVSS+/U
         hhu04RltVlCHyDYK0bwToo4QLe91KzYaPqkaHZWfDhYncLzm8WMxysWGG9xki9v/IKIC
         h3bsTgl/dspVjjhOy7F6FHvT5uDC/00q8eTja8tDHaJ57rlXJ/ESr/Sd2vi2qceLXe1J
         wxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=o/QGJfXwRWRoKgUKVAnnwqVc6i2GKdCZqJUF8DUdyDc=;
        b=WOP23SrjH9D5QK4Wj2cD/prXP/100ii7fqFNtkiJS7uh9kYjoSU8F2bCzuxPF8Bhsh
         fXXtB0mgt1yI6B5LF7yEPBq0013ST7/cc5/thmQkpWNnk+p6gEeMGXaNd+CcTFvQDIlO
         SkkO6nyC8iOuMVrKcLewDxRL1/CDJF79iFo3te8tWVVWpwk53/5f6FNi4tIIU3csH/BQ
         hDyACx+ICCpfoVk2OEa2O3me1mBDkV6QlALoYi/VcR2+blej5BknbscMfmdwOatYkJML
         1xjvsn7q9usvNZyiZKzRL4M60sioD7e2Y0C9b/Y71JSeXboSmzPskbdDVQS59fHxnk/H
         viwA==
X-Gm-Message-State: ACgBeo29IPpyxoYmXSYqSf3zQ1RF8IX9PUZkJTdJsaw7AoNQJMt6hsZF
	NylLc2fdihSm+yZC8GvcWgRry9gFlFU=
X-Google-Smtp-Source: 
 AA6agR7qzSqAeDWqPSB9pzbkpW0PeEYhcAQYeZ6s5VHhc9YkKcU5lcEfjkddeUruA15BpmXPq7RjNQ==
X-Received: by 2002:a05:6512:1293:b0:494:96ee:80c1 with SMTP id
 u19-20020a056512129300b0049496ee80c1mr1425563lfs.417.1662022642482;
        Thu, 01 Sep 2022 01:57:22 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 ([2a00:801:74e:23c9:cfb:ccf0:d533:6859])
        by smtp.gmail.com with ESMTPSA id
 f24-20020a2eb5b8000000b0025e5cd1620fsm1607701ljn.57.2022.09.01.01.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 01:57:21 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH 0/2] kernel-fitimage.bbclass: backport
 some fixes from master
Date: Thu,  1 Sep 2022 10:57:11 +0200
Message-Id: <20220901085713.10361-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 08:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170157

From: Ming Liu <liu.ming50@gmail.com>

Backport some fixes from master branch to kernel-fitimage.bbclass,
otherwise some features are incomplete.


LUIS ENRIQUEZ (1):
  kernel-fitimage.bbclass: add padding algorithm property in config
    nodes

Ming Liu (1):
  meta: introduce UBOOT_MKIMAGE_KERNEL_TYPE

 meta/classes/kernel-fitimage.bbclass     | 4 +++-
 meta/classes/kernel-uboot.bbclass        | 3 +++
 meta/classes/kernel-uimage.bbclass       | 2 +-
 meta/classes/uboot-sign.bbclass          | 3 +++
 meta/lib/oeqa/selftest/cases/fitimage.py | 4 +++-
 5 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.25.1


