Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E20C05027
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 15:02:24 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.75506.1674745335782159630
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 07:02:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pOtAkKKE;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id f5-20020a9d5f05000000b00684c0c2eb3fso892608oti.10
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 07:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uCbz+ac1yBcngW9yeSv1RMb6MXYqil+CO7+NvWed7xs=;
        b=pOtAkKKE/X+S1SyK4jvxE2eUGD/THE+JV2Zsogzuho+uOSZ8my9yle5Puj7sF0UfLL
         dNBcafnftFd+/t/v2o3ZAP2MdWzbLcoX12MnKpS59nxEFXqPCGZtt84KEW6BmQI/O9U4
         SnM7/6T8bbyoec1E7wb82eCDyXj4cnN6j0MGLgIWyKw+at+RYC/vKWLH7ujZ91IOJ4Gq
         eHkKsBba++6b1HtmDyk3FS7gvz3eJJjSRtPlLxLnH+atKCD4TUHm3RSP7N2yR1rYO1H/
         XRsNz0ljUfO2+uD54gZUQiK5Qn4dw5we7uBDLzlhpLJndOl3F1+aqrkXbXzkziEpvvuX
         UHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uCbz+ac1yBcngW9yeSv1RMb6MXYqil+CO7+NvWed7xs=;
        b=nFazkUuvCgepKtSTnehuZnijCsf0m4lNJeoEIVc1iXHU907W7f/0JyyMiZ8guanV3J
         zTi0cMO0Y95tCML99Lqyf2n2N4fPBnQD16GlLntYF1Hxf9QQBmwrgHcJAumlnkhFpD0s
         pVwtYIBf7E0dqCllDeBmkvCrtX2CCY0YqLUt9CchpYF+Zp77NU01hxPaL9ACi//WDc7v
         c2JH+hvFYJogaW269W0mjY1hZySRZOhiWwaVNPm3xcQbgDelHui11p2N5O9WNJgi1imU
         Sk8LJ3jQ9vHW20ZDzrAwkHhk1blI4pOGtNboPeexTp/+y8zw1IVNV033PVbslX6hSC6Q
         naWg==
X-Gm-Message-State: AFqh2kpc8xf/QlneuiKHM4ZuNkHe+niPtLb4ddh9iMeRvdPWvKJGgmN2
	2VCuYpLj40QDG48rctrahDy9nDGFWhc=
X-Google-Smtp-Source: AMrXdXsabCUfQ8PeIwawq+ldqqQEoKTziBrYHj8cPBqyphZ/4Ya2nQ3kPX85myJLlj4ySOev8ZXArg==
X-Received: by 2002:a9d:4e87:0:b0:671:4b44:8344 with SMTP id v7-20020a9d4e87000000b006714b448344mr17094202otk.28.1674745334767;
        Thu, 26 Jan 2023 07:02:14 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:75b5:cc59:51f7:fd2f])
        by smtp.gmail.com with ESMTPSA id q1-20020ae9e401000000b006fc2f74ad12sm1024773qkc.92.2023.01.26.07.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 07:02:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [langdale][kirkstone]PATCH 0/1] lttng-modules build fix
Date: Thu, 26 Jan 2023 10:02:12 -0500
Message-Id: <20230126150213.335693-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 15:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176402

Master was recently updated to 2.13.8 and needs this fix. I intend on sending a patch later today.
I am sending this now to help minimize dup effort if anyone is intending on updating their 5.10 kernel to the latest version on these branches.

Armin Kuster (1):
  lttng-modules: Fix for 5.10.163 kernel version

 .../fix-jbd2-upper-bound-for-v5.10.163.patch  |  52 ++++++
 ...e-the-correct-print-format-v5.10.163.patch |  61 +++++++
 ...ix-jbd2-use-the-correct-print-format.patch | 153 ++++++++++++++++++
 .../lttng/lttng-modules_2.13.7.bb             |   3 +
 4 files changed, 269 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format.patch

-- 
2.25.1


