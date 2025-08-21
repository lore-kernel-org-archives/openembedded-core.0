Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAA3CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 14:03:32 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.10478.1755785005929058539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 07:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bv3Rf/8f;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7e87061d120so93077385a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755785005; x=1756389805; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/7EF0tC2yF8k/AplgkMBAlTrZObiSO3co1OaNKA5IYI=;
        b=Bv3Rf/8fWeE4/2lRQ1vhcF0XsNyDEaqo8guhUOg6JpEkS8px28vayqZ71JxyyHfcU+
         d0wK9YTm1N5I7sV4PKC8fIjc5h8yDal+wgC44ztQzkmXH20rVB5BWBbtIFBK6snQh/dv
         mGf+OUG14WgiVi0+fXMfL4OvsH266kn9ANh5/eIzqUSrdn+RnJUY8X6toIVvSTgRpdPY
         /b8G87b9WwBEF21k8Vg0V3Cpbzy/DVAK8A+HX2KK8A3T1317Rw/8MKZbU1a9j3EoEW9g
         dYZksn7W3YetUtHKeP7Lg4mC+G7RvwUi4b6RZKizmcHoR1qo0ZSF73Ux1r+ZWz/PSm8D
         ucrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755785005; x=1756389805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7EF0tC2yF8k/AplgkMBAlTrZObiSO3co1OaNKA5IYI=;
        b=uoTHc3B2ArrXkhFkL8B8dxjXzjiOuS6IimnXGRgi5EswoWtd/1xVPaspMF4KJIzL+h
         TOSMB2RX+O0iCkTuNU0Utp3FPlupmAbCnWk8g3yl+DO4zvrZIxNAsl0CCe9VJJgu2UPS
         SDzdRXYVEY7XXcE7jXaxVbEN0O+Kytr/6oTzZiuzDciDnSSAkDhHv28RYEn2ZPsrGpqG
         S9PYZxyn+1DrP+fH5Qml+mqrrbynj9ayw/Eln/I2SnDOpgie34D4bwNw7ZOK5JO9NPNE
         hPnsXKo+1xLBRpZ96PMJDe+8ZOAnwsa1NRrKbmI+3+uYdvpx4Lnta/GpqKPtlWQC44ss
         R++w==
X-Gm-Message-State: AOJu0Ywyq/ZcKgEH/6D6IbulJLRVsWAzjvYostpJ/NzVhzoSGKmr0IVL
	V3xC/ZNZ0hfjAraFoBAc7huvhsVtsrhWg3KTC0yoC7+gl+I7IPCItm3PYAnMwbQ5
X-Gm-Gg: ASbGncv10Jl6idXtYSgfJYrIcyruIp9Z6u6TdD5BJG4UdO75dBqRxw15M819v8b+MDS
	rzQQcPUna3Ebg9OQ1ZVONHUJ/74ZSRbZ17LHjhvVS0GUOqid02JaNbETQNtIPmtOJ+Nl0C+KNWs
	U9HZBp94O887quHcsPVK0g2EGaoO8HaFLWmeAMYNc+ktEP3mtnUyHFA4AbHhDH1B+hsbw+bQT8u
	HIw7XzFAs1GfHBh8EaYYhvXSJKZqrP9YnHjpVSBJHDNrWRwZtpvIfYmH4MTF6wsFYOY0TA2rh0b
	I/XUNj8JSfpZ4hhBNXMPAk8FWv4rDhllfphYR/kMCg3l6tBjQMYEnLBTOTSE7OPZMbWCqH2jKqE
	pcf3jw4/fvGCl62RJCBQF4Q2RxzKLT6kp6wsFWROVnESwU58JAKjqQJCHK85bwbW2Xkpg453Yjp
	ISMX5OkBTtTUkvVc+aLHkH5bI=
X-Google-Smtp-Source: AGHT+IE/LElnznzFzteSJ2m2YY3Ocw0pIWzKvtHvfua1Y/jilcNjL5lhN009GZyUTZFWUWyQShOewg==
X-Received: by 2002:a05:620a:711c:b0:7e8:12c1:4d5b with SMTP id af79cd13be357-7ea08d86c2cmr282842685a.6.1755785004574;
        Thu, 21 Aug 2025 07:03:24 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11ddd693asm100447711cf.37.2025.08.21.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 07:03:24 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: -stable and new reference kernel
Date: Thu, 21 Aug 2025 10:03:18 -0400
Message-Id: <cover.1755784780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 14:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222240

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of updates to the linux-yocto kernel.

The plan is to introduce 6.16 as the latest reference kernel, and keep
6.12 around (since it is a LTS).

This isn't ready to be the default for builds, but it has passed my
core-iamge-kernel-dev testing, so I wanted to make the recipes available
as visibility to where we are headed for the release (plus, I'm out of
the office on holidays until the first week of September, so making it
the default would be a bad idea from me being able to support issues).

We also have a -stable update to 6.12.

Bruce

The following changes since commit 5424fc6186877e1949a818307f43578b81c493ae:

  lttng-tools: Disable slow tests to fix ptest runs (2025-08-19 11:48:50 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto: introduce 6.16 reference kernels
  linux-yocto/6.16: update CVE exclusions (6.16.2)
  linux-yocto/6.12: update to v6.12.42
  linux-yocto/6.12: update CVE exclusions (6.12.42)

 .../linux/cve-exclusion_6.12.inc              |   264 +-
 .../linux/cve-exclusion_6.16.inc              | 14804 ++++++++++++++++
 .../linux/linux-yocto-rt_6.12.bb              |     6 +-
 .../linux/linux-yocto-rt_6.16.bb              |    48 +
 .../linux/linux-yocto-tiny_6.12.bb            |     6 +-
 .../linux/linux-yocto-tiny_6.16.bb            |    33 +
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |    28 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |    79 +
 8 files changed, 15238 insertions(+), 30 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.16.inc
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_6.16.bb

-- 
2.39.2


