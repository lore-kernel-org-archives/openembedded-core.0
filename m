Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9942ECCF9E0
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 02:49:03 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.411.1761360543012428457
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 19:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UrvCeqsc;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-89e81dff0d1so105384685a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 19:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761360542; x=1761965342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJb8LUoRBzW1DEXexCVwFdQmG/sgd1fxXk3Pax57lP8=;
        b=UrvCeqscH/oQmo6o7cMUa4VcCLON4NxhPSfXdMrxlzQPzgDIzkPVqsrhI3lre27H3S
         z8aM1NuzPp3SPF3w33KB0bPrCd7CVT65ag7yPZnvV7QZOusjoIvH0+kAdIwEqVAEyS7T
         Wx8xT58EebmsMAW0fgG7aUmYIJYEYk/pVJTizbToCZJxU3oepJENJEruKer2+E/Pg201
         9a6Zbv9o+qrbqBx8Pkju48FtPj5U8IoH8ASrRaLuJMSYWyQQj8Zzc50ecmdQmjfLZvK2
         nLSE542+t59hUhb6s5uNnk86suDg8y/XvKDnL5P2VLwwncxPBX5tLVqb0Fkf/Cc5T5PN
         glXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761360542; x=1761965342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJb8LUoRBzW1DEXexCVwFdQmG/sgd1fxXk3Pax57lP8=;
        b=dCCfo1xFruoyOevhy+TBTvcyNlK3K4BswiEiKJtAuquEgT85ZLrz490tFCdequsF71
         UHWkALUg0Ww82hZPBzMjwfVEeCxr74Eqn4nWqS+1JxgdVKx0DOp61kLKy9X48FnZcjOd
         jhzhi/fiIGFg16py+0QoQh7FV/2eYrTUWZa+EJuX4aYsc2qoa+wghB0FWrViaFS6aUWI
         /CkwjVDQxfgJaweEcN4adEN8mqRTcSp5XdndNRN5kQBTUi5lh6h7pg2oSEW5yYEqjlcu
         MoXAg6PnaQSXX7AE4wYMZA81WsNU9WIConUv1Nsw+55Egt83Y5o0Nzjv4olDkA71Wjh9
         X6Gw==
X-Gm-Message-State: AOJu0YzdS3k8FxvDeNnfQHelAKNZWc89ddeNOjLR89vNUigItFVFrCoJ
	cfOxLl/3YFOfam9YqFAWGdsLqDT5vrfxIOb1faqczle5eyp4rq7aXVFrko3nOZ4ANp8=
X-Gm-Gg: ASbGnctH05jNAN4coekTeSKJcqEK20NevkofYCeOdHTujho9JkdxER7T2Yh4bg9uGvv
	7DInCb+M3+YA6ZzP72PzZuEy+5q3JRuRygkj6BD4vCdkRfOFTwOrNOYQXPTB7XNRJZmz/GkwuAi
	P+fALlUZ23SeXXrumYHlFtCKW5ZyGgY6dPhLpgTTfNy/ySRO8eVJLomB2Mac6OXB9cVWRNXzBI8
	DumWUCsN9H5i7kz33zIdRhihrTZKP3v9Bvy1A5IytC1r64MrO+PLNmXNSwJb5h91EdS9yshLidH
	yjNIUX7+c7HptHuhhfL+dxgE8iOzSZSVwsE+0u68ZP77RjP9hn/VaUnaI1lHrOvufPQ6czkKx1P
	b0KewmPJKTYWQfho8a/4XRyARAQjRwmb5cGpLj5su+38vwbsn9ALWTXznrbUImIBO5ZettQYKJR
	YKGgClHfAX1GVGR8CpQnZTiFEVOE/moFs91XVhJLtgr6EVT2pUHOUss6dCC52id1+bNo6up5RPx
	sa5o7mP+woHocc=
X-Google-Smtp-Source: AGHT+IEb5rOmqaMszJsZbEHg7hu4vVMvcSoZu3QMtAlrLzPdgS8wdWYCr6fDMacSHtBFmGhgqMJgsQ==
X-Received: by 2002:a05:620a:7102:b0:890:c3c4:3e27 with SMTP id af79cd13be357-89c11e631d9mr1018039785a.41.1761360541807;
        Fri, 24 Oct 2025 19:49:01 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2421f6a5sm62447285a.5.2025.10.24.19.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 19:49:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: 6.17 reference kernel
Date: Fri, 24 Oct 2025 22:48:56 -0400
Message-Id: <cover.1761360245.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Oct 2025 02:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225302

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

As we discussed on the technical call this week, I was going to take
the 6.17 from linux-yocto-dev and finish the work to make it a reference
kernel.

Note: the plan is to leave libc-headers at 6.16. Since that is a
      safe matching and is way less churn in the overall system than
      bumping both.

There weren't any major surprises, and I've now tested three major
architectures with more tests running now.

I wanted to send these out, so they could be run through the AB if
there's interest in doing that.

Note:

  - I haven't removed 6.16 in this series
  - I haven't made 6.17 the default preferred version in this series

I can do both of those if it makes testing easier, just let me know
and I'll send them along.

These patches are on top of master-next, and the branch also has
my lttng-modules version bump.

Bruce

The following changes since commit 3c0d478e33a0b64889ff7307ff0cc5096eab458f:

  lttng-modules: update to v2.14.2 (2025-10-24 09:12:36 -0400)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto: introduce 6.17 reference kernels
  linux-yocto/6.17: update CVE exclusions (6.17.5)

 .../linux/cve-exclusion_6.17.inc              | 17536 ++++++++++++++++
 .../linux/linux-yocto-rt_6.17.bb              |    48 +
 .../linux/linux-yocto-tiny_6.17.bb            |    33 +
 meta/recipes-kernel/linux/linux-yocto_6.17.bb |    79 +
 4 files changed, 17696 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.17.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.17.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.17.bb

-- 
2.39.2


