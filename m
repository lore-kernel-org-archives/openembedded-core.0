Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D95C369AA
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:55:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.6337.1744311342033650464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:55:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LPV0+KLm;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c0e135e953so129774085a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744311341; x=1744916141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=95mDLSFFO0AuvvtG08mJiX/0oZfSxqKIh9orCjzv26M=;
        b=LPV0+KLmPvviXIWtKzX+D+CZewwaj/mTzIOiTd9niDQbtz1BhfrHIR+aU06eWalzNx
         kwBPH1WatPAeSNxGGGgNuFuSEFN1oI6q6VJ29pFgZb3oD5yidMa34SOlxT84tCH/+HWD
         nasUTuzBAzChXyqQ0AYyMSAcs80EOjdNaplvHBJbCjyDkHAaddvvW4deMrdfL2NuWoa9
         CUvWYpV4QueKzxYDHKCsYg4yWKHkuPD/6U1xV/cP/SdcxBwwdT6Uast7st8R5N7D3Nlf
         YOSIafZURAP6qALfPqcfV3dEtYdn7TF5Qh+l9FCD6LKXtvB5QCdPlRMhLc4MVfPcuORi
         xe8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744311341; x=1744916141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=95mDLSFFO0AuvvtG08mJiX/0oZfSxqKIh9orCjzv26M=;
        b=dEqp9eY5183UI/JHpP+rnFo3YBTjyULOS3HdI+BH1IFYeu1zfzIEI2f/zsAsS11Q4a
         zS+XGFbvSZEl2pbCGOgE9TeBBM4FPkfXeuw6pf4/8bskyoM/gXyxKEQB2XZ7fdf58sZY
         ArQ8Yc6sF33dWuq/oOxqkrcMPnkFIMwNQgc4nwqvzYuK3dKEk7MtZlQKHqS2rzcaHkih
         LHbqo9nDyRhpZAzKkh9Z8aMkDXw8902oLsZ7sKSSbLO1M+mXoVR1e9AaCp8X8VYj9Uo4
         UtzQ8YMDzrsQcBzhXQ3+hXCM5N9zwPqARf/6GR6S4P/ZDkYNXkMK0HkOWf3KImIQUFp8
         ZsHQ==
X-Gm-Message-State: AOJu0YxacHFY0L4S4arhbJ4nZdIfQMsHf7AjHLA4Cxc4gTxMCTHJLq3D
	Ps1Oc9EBGiRes6MHa6RlAT95DCAIpB5j9lztLi+1lv7Ai1nBS799D6jAgQu9t1k=
X-Gm-Gg: ASbGnct/5AQFfoLwo2EzBj4ft6Pc4OybIJvlNe7otJTbXcGA0B2aJgVFs/o1PNrV/v1
	qL5djZ8xBc6wOn2d2b4oVpr4tsxewwwqMzTO1TyG52aJ+7H0IuV75oV6OS3xl5nFHySWW0bdNGv
	BTtS5U/8uF3r2ni4N6c2W/mPBkPulKyz8TJiWYVJSw3bVMwzK/SqizzmdfxWoPV12zPOVZrayNe
	kep++YA/SGEmefZPNvZsFsrdmgUhUqCdZuWfCxqYXIeOjyT6T0mbhJo+q4a399PtCbN2aaLabpc
	Jdlc3o6nnHIEXSc949N60htg4eYs35TAaiOumYBD1P9LAkHJ7OB8TJgeMrH9JNiE0oFBWfNcdRI
	nstcAIeCXF5PMQ1sfg/mEM99BPJ5GPoL0KaJb8c6Gpw==
X-Google-Smtp-Source: AGHT+IFjg+zMzI+iGEo7/EV8M8MS76+h18yVi3b/IecvVvgBWV59jzFiYweN0e/bS6oHSCrLfMRVnA==
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id af79cd13be357-7c7af0be2b0mr15219285a.11.1744311340938;
        Thu, 10 Apr 2025 11:55:40 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8942eadsm134956585a.5.2025.04.10.11.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 11:55:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: consolidated pull request
Date: Thu, 10 Apr 2025 14:55:35 -0400
Message-Id: <cover.1744311165.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214693

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are my latest round of linux-yocto configuration and -stable
udpates.

Note: if you take the 6.12.22 patch, you also need the kern-tools
patch, or warnings will be thrown at configuration time. There's
been a tweak to the meta-data to have some annotations around
kernel configuration options.

While the functionality to use those annotations is not intended
for this release, getting the notation in place is a ground work
step. It just needs a tweak to the audit regex to ensure that
comments are not detected as part of a configuration option.

Bruce

The following changes since commit 8050390f99cf4e87608b0a4ba6e190f2516a1017:

  meta/conf: Start to populate autobuilder config fragments (2025-03-26 18:45:13 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  mips: Add '-std=gnu11' to vdso CFLAGS
  linux-yocto/6.12: config: add pmem to genericarm64
  kern-tools: allow comments after configuration options
  linux-yocto/6.12: update to v6.12.22

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 4 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.39.2


