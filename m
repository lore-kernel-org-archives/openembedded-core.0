Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C53AC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:44 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.3819.1714704043519289192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K2tpMGRO;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78f05341128so582321885a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704042; x=1715308842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N5RgaTL+vKXV2iT7cjmHcsWPVuMzosgRxcXAHDUwEHA=;
        b=K2tpMGROogUniW6oIayM9WXzn/BDWZUB5iuEups7FYTLsYa2qvuFsOvheUc3B12Cus
         O3qG1VqprnfSwuNNPFaLZg6Px68MyLEHLsFkNExc5IXJ1L7nVOPoPrdZ/x3mVSsiwUEI
         JIjbE6KRWKu5mNgQbDNHfMllumIdDoX7j8tP7tyKEFyQLN1k4WpUvpmhs0AuAFMftt0k
         n6bzKFnRGGpt1hauOCTvSqBgDYAAgh0AugdkY+xqshQJOSCKQTZUw7Rl1lu1k/k2UcjO
         QJFKX92vEppur+Au7/XvpAoKEHEysCZB/+x7K79w0R467vEUAulsr7YmiHU5LnRIoNGn
         ESPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704042; x=1715308842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N5RgaTL+vKXV2iT7cjmHcsWPVuMzosgRxcXAHDUwEHA=;
        b=FLh/rMtKoJhKt5n8LCTgh0dfgWvWHZ9U4yamvIvPwL3kKAhvdkQL6GeQPd/eeKFIoX
         2Rf8qjesm2QIO1wDRdcOkCk/c4m6HtGJ786ADm2XTOLKkjq7uZOTz6hJ/c3gEkUruZgc
         QuIPF5RWjJOwDqa4GQAlHiPp5wpO3ucSRI2oB8CPddcFpDzwEkNQ7ZRtfHOFhLCRy7md
         NljYx5xI4PznsHMeMyAEOV2IwYpH+7hkouIWud3bb2diTD+JxLYzxBaEgnCvW6GwklEC
         Z8y/4rjlMFyFBqnlQ1O4eHJR/MNlNSyA3PUbFqHLDQmRh+4h7ptPyejomQvNuUwBJuvo
         kbNA==
X-Gm-Message-State: AOJu0Yx2PlraaFckKZJ9Z2eQ5t8AwOMtC7+9SwazJr6bWKNCLvjI2xRd
	KJqhtgmHRz1dKELOHbPSEtKPetFIfafUqp/GhD+4jitGcQl0AkmFQ3lM3w==
X-Google-Smtp-Source: AGHT+IF+9mwLNfrM404H4IbkLqFs7GDbBD5d8zQ2FeeI/uush2ulkrbBoNpJ7qt0YWxY5pUkiGlD3A==
X-Received: by 2002:a05:620a:1245:b0:790:f42f:cdc0 with SMTP id a5-20020a05620a124500b00790f42fcdc0mr1533302qkl.7.1714704042316;
        Thu, 02 May 2024 19:40:42 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/12] linux-yocto: v6.6 updates
Date: Thu,  2 May 2024 22:40:28 -0400
Message-Id: <cover.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198931

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Now that scarthgap has released, here are my queued 6.6 changes
for master. Obviously these are all appropriate for scarthgap
as well.

Once the 6.9 kernel releases, my plan is to do an interim
bump to 6.9 for the kernel and linux-libc-headers so that our
jump to the fall release isn't as large as it would otherwise
be.

Cheers,

Bruce

The following changes since commit 0e163082bd8a68412c66e2ea20e665b1ddfcc9f7:

  brief-yoctoprojectqs: Update to the correct hash equivalence server address (2024-05-02 17:07:13 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (12):
  linux-yocto/6.6: update to v6.6.24
  linux-yocto/6.6: update CVE exclusions (6.6.24)
  linux-yocto/6.6: update to v6.6.25
  linux-yocto/6.6: update CVE exclusions (6.6.25)
  linux-yocto/6.6: nft: enable veth
  linux-yocto/6.6: update to v6.6.27
  linux-yocto/6.6: update CVE exclusions (6.6.27)
  linux-yocto/6.6: cfg: drop obselete options
  linux-yocto/6.6: update to v6.6.28
  linux-yocto/6.6: update CVE exclusions (6.6.28)
  linux-yocto/6.6: update to v6.6.29
  linux-yocto/6.6: update CVE exclusions (6.6.29)

 .../linux/cve-exclusion_6.6.inc               | 2720 ++++++++++++-----
 .../linux/linux-yocto-rt_6.6.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |   28 +-
 4 files changed, 2018 insertions(+), 742 deletions(-)

-- 
2.39.2


