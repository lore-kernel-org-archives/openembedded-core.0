Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E719C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:55:45 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.6339.1744311344485810723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 11:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iwTxdlvO;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5b8d13f73so131636985a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744311343; x=1744916143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvFc8lwtRKx9k2ji1V4Qyr9zBXeqzN3TELe8hYPGokc=;
        b=iwTxdlvOdKbh/ou64pcaueqlRGtpTwr3MNGz5kSNcKbpm4wvytkkYmXsUx/ysUCbVC
         y6qhKVOKffDT4ftyeI9jJj/MOyvQ40IgHnfwJPO38baQDdR6G9E9iejvTJBGWtfIAn5N
         b7CDkONEIIhVAN5qH7shiwGzomh6uRJQ8VfWGpgcO83sbtnaBfP81khBLsEgYD8w9+t2
         jXdvVneEIPIwQoCOqNCDxjNkoUPYZvo4Dv9yv8nW9oAm9Hrhv8msgfK7KFvfKLfClRHv
         UtGZJ8KDSvvwybey8Vu9vqUtPBZYuIMs20kwK266/TglzPAED/WmW9Bpo5OMAHW4WM3u
         j8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744311343; x=1744916143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvFc8lwtRKx9k2ji1V4Qyr9zBXeqzN3TELe8hYPGokc=;
        b=rNk2qP6jTwaLFPMfse9FE5LZG0T/DpodYMXoFCoROaowlE3U42A9ErhvrpR2KSmbkV
         5/ta5v+JDkQ+jsr75O0pIr4hG8D8FkEeNFB9RVgqzZhPJDT+ixGIq3DvVuNtNq5iatjc
         ss9/EkXAG9+oSyPFOT5oHvZrrgS2eOg7ZmFFJzHZWyGgBXJkSj5cTj/0j1orK5cSWaYk
         ujoSCYqcJ6IWOzqvjL3EnrCgEnRFxASvAv0OlaWiFXURq6mojqETS8Qt4ZNIYaV2H+uv
         2q/T7mywgkYD8m2Tx6DNtf8AhGSw7OTnpLqOXZtdIjHbrDW5R9jjADwOsPFMymMxshgJ
         o/xQ==
X-Gm-Message-State: AOJu0Yzm6AW31W8PUvucIPqW2jl6XUD3SdQWkh8eRB+gzsKGaDuIyl+G
	j9JeLJu1NTUlJa43XZH0ybkSUqan81kBJn295vcxIRKjJS/Rc5h+gupciaPd8rU=
X-Gm-Gg: ASbGncvu49q/5dVDsVGH3jxOkwtaTCs+V8c49TXJIyYphOEggl7X+56Yj0Mp+j586oU
	wr2OBSJIv6pstF08x2JS+HiSoKa88kB6O9MZH5wNneWH8hz+nDHSkC7PIbVI7hFtlvlQLcAhzg4
	mvgKIeJuZp+wWrGjKwg0zEcYRXSORNtJUIwkdw+fZV41hzttmwmkcAWt9b4BeflZ/RcYDaf+fGv
	RWc/EPY1MBwtkWMS0PpnCDK6V6SHQQmXd2lJF65YIDhdaGaSH2+VRIyA7tNmHxxMXTpNbzA3GfR
	UBeQ/cSxAcYdAtRJo7ZsFedftk3wFp4M54Zc8Oic/4e4gzdgSP0NVKSuXcwKiZi9NwRS2pafxW1
	UhV4rzuIBZhTZw8io1X3yUTrSCnoPPptY9kaywcsnig==
X-Google-Smtp-Source: AGHT+IGl6T/XJpR+87m8D8OqQ8z9OdRqbKdyx4LZF+XjwObmNuQzG3vM8mU5FE5I/Kp5h2wR4EsKRQ==
X-Received: by 2002:a05:620a:3944:b0:7c5:4f5f:15b7 with SMTP id af79cd13be357-7c7af0d4895mr14732085a.21.1744311343458;
        Thu, 10 Apr 2025 11:55:43 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8942eadsm134956585a.5.2025.04.10.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 11:55:42 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/6.12: config: add pmem to genericarm64
Date: Thu, 10 Apr 2025 14:55:37 -0400
Message-Id: <142b8b497dbc852418e1b4c5e12c9aeacff618da.1744311165.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1744311165.git.bruce.ashfield@gmail.com>
References: <cover.1744311165.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214695

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64: add pmem feature and enable on genericarm64
    Date: Fri, 14 Mar 2025 11:48:34 +0200

    PMEM enables firmware to provide large memory block devices
    to the kernel. The firmware can download e.g. installer
    rootfs images to memory which kernel can then boot into.

    u-boot support has been added in
    https://lore.kernel.org/u-boot/20241203163605.1482152-2-sughosh.ganu@linaro.org/

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index a04bd3a95d..c09a91c579 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "15dd975f84e62ba7b866a96108aff27b97cdbf80"
-SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
+SRCREV_meta ?= "722f1da424c10f7a7cd02646657bbc56b86c2c7b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 5b3661a80e..ec030dedca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
+SRCREV_meta ?= "722f1da424c10f7a7cd02646657bbc56b86c2c7b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 10350edd5e..97505b1263 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
 SRCREV_machine:qemux86-64 ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
 SRCREV_machine:qemumips64 ?= "9e2bc57fafb525cb3fbbfab7c7f92bca7e9a43f4"
 SRCREV_machine ?= "2ee7ebed771b39a795c227aae81524175abf5d00"
-SRCREV_meta ?= "d034c1073cb7f88eaf3ce929ba21ba11503729b2"
+SRCREV_meta ?= "722f1da424c10f7a7cd02646657bbc56b86c2c7b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


