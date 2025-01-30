Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A20C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:02:00 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.18806.1738252918791256869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V91po3hT;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6f8524f23so123400685a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738252918; x=1738857718; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5yujNxBXpJ2GvlCnD8uYSfWwk/tSXQyX9Tkp5GzxMQ=;
        b=V91po3hT2tkmBvxAz01EmOxe0msFOKvNzyNh9um5gyKQDEOduOJZeLTbRJdVnnALov
         TG37lOjyihPAEwzybclAvm2/hfxWG2aFcu5iyB8BvgdCZy4ytZGNbSIsOwLBKz3yJL1Y
         Ok3VNyg+2UY6MVgK8veXTtM75LmhEXYN7Vg0ZlLovC6B8cxa7XhWZ4Pv8N8TliCvql0q
         4kv3IdkQ13tCN1lqKQavOlFDa9uFbUAU3bPkxBcSBgUpxt1zG2jmwccCX+Cqt6eW8Lpe
         yJwt7UYvm6BEHAr95deZpYv6tpElpzd1qDVJVIUyBSHKIGBTkAwRTNqK6ZyxPaEafK9/
         pKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738252918; x=1738857718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5yujNxBXpJ2GvlCnD8uYSfWwk/tSXQyX9Tkp5GzxMQ=;
        b=NVdQ8IRCh3fgTB/M6BmVbUXDrb7bVMPHIEHk/B02VC5G06breMVNK2I0zMOr6Yu5Ge
         mar3IrWxP2nPBaG4aS3D5ZG4eMh/ujysPb05qTr5d6Rk7Bs0ilp/QAFGVI1jSJ1KLOJs
         CAQrIrvT98OwxEwKeozbVPjy0NxW7V3Eqzj/O8tikcDuc2lFXsADDdB29mRFxV7pgVAd
         N/eSwCS1UBNPFsdWcWS/LbcuX0hEeU/XQn6cyIJD5AILHnygWYBBgCa9f4oJpoYZ6n+g
         YjpK2pd1REPpOoQXgw7+QdBJoU94IlBF0rUOuigbV3maC/oeicgzRZGhL2hQTuQWY+kY
         Mmzw==
X-Gm-Message-State: AOJu0Yy/iEt29VALLxKkSohnjjbPwdHgMSaPC5yb9e/j1jmL51o1HdbZ
	EIPTPAp3+IbKOMRHg7Hcu+PnfYRKIIo0xlyUfHywnkzpnYssdx0n
X-Gm-Gg: ASbGncvqBW4LybPZYsLg5lxrsQDiXLudGb5eOCG5uMwjXdbew+nF82IqmxMxzlJxCNw
	V6TiMvRMrE3/IXIj4ab4dknjav2iRSvlaqb108pmtEdiDmxRdZodZ4tVVtNPBOFYWpndMfKWqIX
	+lo35YfDjj5Qbcb8BIZTIgSPdJWMJ518QUCfXEUaF1z6+W2Ln/Fy9eqHcLkJaJ7m8yWuEisztTd
	nAULHTnzTzpup9XkSZYpvOrAvmA3AFkUfx/1gOva8JXlzxTDbBgX2EeooCAavnf527Pjww3yLbo
	/KkzM4m9KJatBTeJsHda7JReno+297nbi3yEKVjhMvMCnVQw/xLeQSgmnjP3cKZqMi8HHjI77IB
	6PRT22Uy/cFa3iH8c
X-Google-Smtp-Source: AGHT+IFeEj4RTwDWz8EmU+/ixjQRT+jp15AttB8M+g2mC61iiTA0IGz76h83HW+8zncy7YIxlAwfhg==
X-Received: by 2002:a05:620a:410e:b0:7b1:52a9:ae1d with SMTP id af79cd13be357-7bffccc9b6bmr1152505685a.6.1738252917362;
        Thu, 30 Jan 2025 08:01:57 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90d3c4sm86086285a.111.2025.01.30.08.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:01:56 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel-yocto: consolidated pull request
Date: Thu, 30 Jan 2025 11:01:48 -0500
Message-Id: <cover.1738252521.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210454

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the latest consolidated pull request for kernel changes.

Nothing particular drastic, hopefully no AB issues!

Cheers,

Bruce

The following changes since commit 2960300ba09a56cb8d838607b3bbecb5cf90e07a:

  kernel-yocto: move the cp of ${KBUILD_DEFCONFIG} file outside if body (2025-01-27 15:47:11 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/6.6: update to v6.6.71
  linux-yoto/6.12: skylake drop CONFIG_SND_SOC_INTEL_SKL_RT286_MACH
  linux-yocto/6.12: update to v6.12.10
  linux-yocto/6.6: update to v6.6.72
  linux-yocto/6.12: update to v6.12.11
  linux-yocto/6.6: update to v6.6.74
  linux-yocto/6.12: bsp/genericarm64: enable PowerVR DRM and Intel HDA
    sound drivers

 .../linux/linux-yocto-rt_6.12.bb              |  6 ++--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.12.bb            |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.12.bb | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 6 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.39.2


