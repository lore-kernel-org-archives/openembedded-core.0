Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB51CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 05:08:37 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.9970.1757480908951913769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 22:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bUU8faG2;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-805a1931a15so670145985a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 22:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757480908; x=1758085708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ypCBlectJTUUgAjgep0A6vSQ5cRA3s3gbmqPcjEKNpU=;
        b=bUU8faG2+BirgF240k9WOn/dsRP71TEzjWQwVxokMSBjQ0YpBN1yL2tzzAupocKLTQ
         UfD8Q4x4t/CN4W8Iu16zZkA3URmVneEPQ+zth3iuhpWobuU0IyqBHlil8BjZHE5lN7zF
         P3mBI5Phrgh+rrgqGXqBFbWSc3HZsLArf43ACEOE405IcyRzS3WbuWoqLKfBrXHuQNVZ
         dCAdX/J7DEHfjRs2i5YZvxVoECvjvpFwW5qCYmgvk31XBxLYF73dJeEuUqMO7s1zkMmh
         Yfqdm+eUEdIlxVBS1FdD/WTYedS3P3Gbq5CsdsBZjoMphzFRNBZI3WQvoAYNtSJT3RCa
         4ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757480908; x=1758085708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypCBlectJTUUgAjgep0A6vSQ5cRA3s3gbmqPcjEKNpU=;
        b=DeQwhNNIXIN6Vo1ms8CqmOadM20l6zlrQzCwWjQlgjVpVYtN4ZWkH5n1FGWoD5XiRg
         sINsE5enTYIsVrQGncstKHJWhfTpoLc1gJRGAc1rigwM/MnMXrdAzkvJOlvXW+cDGPJr
         rALV80w5F18K+DifIzWr9mVWqrYEwEpq8bWVp9eE2tiiOH8usvZBwgCLs3jr38sECbx6
         NDLjlXl6+Trps9mf+dlOtnUj8McixHXs07ijKypLkv+GpJy8NDzy0h1ws4bTc0e9GfLP
         Fj+S9DWQsxwVwrUHaVTbTWtkcgJ+BcKyO2ng/wxHEDWNmy3ng1LEjeTuP2JlH/ljUGYE
         pOGg==
X-Gm-Message-State: AOJu0YzlyzzdpT94EL1y9wt4IM5p1JGfWWfngvAnDLXQr09ochXvHBoW
	mxTokrXPvBWqYvSJ0VJJdgHXyRczQq76t2A6nsprMcLxDFZXtASYeERY
X-Gm-Gg: ASbGncsF+p6Fm8cMhjT79tE8uyclz/ujjZoF5nkshNBnx+/G9eoHuaqm5n/64nkPmSv
	rFdI+UMKPI1eZ1fHEE/N3fIxEoPiZRAZPlHk2KgAqcHM+1uKnW4jFlESIE0hqDy2+ksbUqOx3Ve
	RMgSfcp1vXoightdGthsklV+aZfVAnncbBPSmuH5NWXlvZM0QFU8yRT67EFDmWK9CTZD3e+dXMj
	IwOBQR6k1ZN4TZ85pJAm63Uk+eiFRm/oMk89gZtBJnEUjbpIeF2NTIlGgDXg9MUVMVfCCLP9k1x
	TsN3TqHyyIdUDm/1ARKBHMzwf/AxRStuyNCXPtleZjPkCuuj8fKxEAo5JEm3ne1HEFRTbt+qfuk
	Linuvne/2NuXvhOft0ztt3VGuEEHQJUViPjnA8pnzT+1iL0eaPEgLyHyfXGFhOZ5baI0GMtzeVO
	MDxRKMQzMLxxX9QcV/q3HfqHoyHrZtMntGtIwYdoeE4nQA7KUdc8zv/2eawaBwmEW83w==
X-Google-Smtp-Source: AGHT+IFk1Zk4h2LJXPSPh1oDJLE5JOmfDYnf/2RzqoC1Bd8tH2jeYauhWgt+jtBahlWE5SyoXL3QIg==
X-Received: by 2002:a05:620a:a908:b0:818:1218:5919 with SMTP id af79cd13be357-81812185cb0mr1081392585a.39.1757480907865;
        Tue, 09 Sep 2025 22:08:27 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed72c49sm227866685a.51.2025.09.09.22.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 22:08:27 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com,
	mikko.rapeli@linaro.org
Subject: [PATCH 3/4] yocto-bsp: introduce 6.16 bbappend
Date: Wed, 10 Sep 2025 01:08:21 -0400
Message-Id: <20250910050822.3273330-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223145

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Adding support for our remaining reference boards with the 6.16
kernel by introducing this bbappend.

We no longer need the patches in the 6.12 kernel bbappend as they've
been pulled into the kernel tree itself.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.16.bbappend     | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend
new file mode 100644
index 0000000000..d28ea78e5c
--- /dev/null
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.16.bbappend
@@ -0,0 +1,10 @@
+COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
+COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
+COMPATIBLE_MACHINE:genericx86 = "genericx86"
+COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
+
+KMACHINE:beaglebone-yocto ?= "beaglebone"
+KMACHINE:genericx86 ?= "common-pc"
+KMACHINE:genericx86-64 ?= "common-pc-64"
+
+KBRANCH:genericarm64 ?= "v6.16/standard/genericarm64"
-- 
2.39.2


