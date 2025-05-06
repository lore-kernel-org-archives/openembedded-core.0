Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AE8C3ABC3
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:33:06 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.80818.1746549183676079845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 09:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ENOqAG2A;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7caeeef95d4so157303485a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746549183; x=1747153983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZe8xhofxUc/akp3V4ZBVDFX7cJMo7n4wQ30YxvCvf8=;
        b=ENOqAG2A2kSjTOhnvGCqh18oOSzks23kQDoLPpO+XAuwgnmFf4ES8KM3y2D8OAb0gm
         54UCfbtWXyyZYE3SlQRtHixqeJlMv6OjwYUcrmcazO4gUiEyJ0QiuNcZxeLgueVDIUhO
         rAGBl94c7Mwv4FOubf70dVytdkdV7CGPQM2zYT39/oOnaoInI7V2/kiK++wkfOiOaKcp
         +fEu5/wNlk8mSe21y0hQdcTDuXEmHZUgB9R5bmYcQ5iVqQxLLRfSDV95oU8HpTCPrvgo
         oZB0e0qvF/IS85T0GoLAEo4Xyr4D+1B7hzLi0nqjmrGBx3X+RPX6PVDYH/9o3uMLCRLd
         O/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746549183; x=1747153983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZe8xhofxUc/akp3V4ZBVDFX7cJMo7n4wQ30YxvCvf8=;
        b=Wq4kAJpqUMuXy7ZDvrbj62rccb8zCIvLqafnCMhR/NPxH99EtfrltgequqWTdLcMj8
         aBKPa4eE1CMGbk6tN4ekI3mMX/bsmAUFwQbgK/KSZ5U6lQCBk6eysglAqEFgU2zBblTe
         wb+36VuHW4moPMr1NMYO7gdBo/vG36HZRNiL9KrPoYOc53PPSbfrkKfmKz9EDMVp+1D6
         /ApXpN/b4LavWTdbrR7OiqeQBFE5CuzjeZXsf8LXGuh4JnxG2LiJ2bUZuKcpSQ6Tyw5Y
         5xdjNsHpV0PWn46kDVLNo+FfB+FzKNN/q+cwob7wk8q3DwgKWGrvcA/sZhDG7rpocioQ
         ZT3Q==
X-Gm-Message-State: AOJu0Yyc2DNVnQcBZkIcubfIAUCuT901Qlq9RVS9lPZeOgais3ii/604
	GaMZF49BoVf6o48Brfee07rL33tBC4bX24rwuq9cBdvCTcIXU1fI
X-Gm-Gg: ASbGnctwFyxlL41J08mnMAjAZrYVnY9+5xi1YjllnI1X+u1ozyKB7ro1mPpfXGT/Xd2
	SiDT3JYADWlqDmByvcF/C8twViLT/HUn1RXcav7WeqXMGs2v4+FB9eQ9HIbccfoMdztX9iu5usa
	fQdxBkeVeMDIeZbCUqrvZhNeNmRdyNqoPaTrcytKVY2tsFm88PtDhI/W70KTvt4klBCW6X5MwkF
	wPuJzheQKlvv0TBVNsvxmjDO/+utCvGcHcEjTPs6mQfqYx6rPd5lyAi5vLHbCqpbqHnsXX4w/gh
	H5bTdqtxcLnpQWzSg/3moHJgnR6R3RCUNs736l5Cl7m6rOuxaGUbsVjkOU3F2iuhlfaO1GF6PoZ
	OrGf5i+E9zjQ5ipkWkaI677Lv3CceWE7qSIyK73kbkQ==
X-Google-Smtp-Source: AGHT+IFhsPM+ziSfeUIuGSEn0oIu97MQfW5hib5SZg45HRVkmlOQoZ43bc1pQBMYNw5kAkFMCjZG0g==
X-Received: by 2002:a05:620a:472c:b0:7ca:e943:144b with SMTP id af79cd13be357-7caf1119f2emr442337285a.23.1746549182475;
        Tue, 06 May 2025 09:33:02 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48ffsm735977085a.45.2025.05.06.09.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:33:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
Date: Tue,  6 May 2025 12:32:54 -0400
Message-Id: <cover.1746548780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 16:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216073

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi Richard,

Now that I'm back at my desk, here are the queued -stable, configuration
and feature changes that I have queued.

I'll be sending -stable updates to the LTS branches as well.

Note: once patch #1 is in the tree and doesn't need any more tweaks, I'll
send a documenation update. This is the patch that we need to enable the
modular initrd work in kernel-yocto references.

Cheers,

Bruce

The following changes since commit 601b05a298c0847e96b8f5f71e50d057e2833382:

  mesa: Fix header search paths (2025-05-05 18:02:48 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kernel-yocto: allow annotated options to be modified
  linux-yocto-dev: update to v6.15
  linux-yocto/6.12: update to v6.12.24
  linux-yocto/6.12: update to v6.12.25
  linux-yocto/6.12: bsp/genericarm64: modular configuration updates
  linux-yocto/6.12: update to v6.12.27

 meta/classes-recipe/kernel-yocto.bbclass      |  7 ++++-
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 6 files changed, 29 insertions(+), 24 deletions(-)

-- 
2.39.2


