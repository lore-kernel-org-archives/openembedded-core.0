Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314A4C61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:43 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.37130.1749225634354187990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XR6FITfN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74267c68c11so1948435b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225633; x=1749830433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZS8+XpD+CJGhs0B+BPT3Ns14gYZa7U0oqBJUwi1syQ=;
        b=XR6FITfNsN8DJf8VJFXcGgAgXs6tGEuvLyjyggI1OXZpksC/IVSeeFGr6yVwBeUnc9
         Y0PkvQ4NmsYE5ApmeIJwzn9O+3XNn1gk31y530FjsX7yxftFv8SvGPpD+PLVgnwKJl6O
         9aSk6imCAEJQ4c4QAfE07WdNeYaZ1ILNt6RbjkLPdr7lvRmYq/rlW2paoPcpWV+YEIA8
         LX8pwTYdTrig14WOM7FaKQ339f9PuWtVbuPU81IFcbOt4qxtkz6lxa8Pp36W7wydW+v6
         NrJT2O8XeglpbPbPlbVLakF2sv8BDE4HirOoDlDeSOt3FyBOLBMB6/eYAeim+KtgDAyh
         VJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225633; x=1749830433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZS8+XpD+CJGhs0B+BPT3Ns14gYZa7U0oqBJUwi1syQ=;
        b=el1AREGjZ1GWOb2YxNfg5jzone6mYqy7XMlMHZ8DUU+Qhilj9Qdg1CyuJGpLT/oaCc
         9fAmyNvg+C7G4/rKgasBgne0EYyyXiuCzzq72gzck2jUwoZ8uHnF2xBvSpOIYh/z7trv
         YW3pqxMZEhtZYhoW0XjjHmMIfYsjrdMqS2xpT7nymFONSzdWQCp5xfjQWuhB7ravlVY1
         rCk2vmngJ6xUTVA3AH4IuANk/1uFn4WCm8MOm98hrwEuOoW9cNzJkusiZW20IWiK7YXq
         EmpkmSrOTcdquYwoUDkxiSp5B8oBqp6Ni15zWC3SqjrmRhvrH5moP/IIoaTDFbjW7VSX
         lY0w==
X-Gm-Message-State: AOJu0Yy1RtgAJ6YuVAehbf8Hh3ndPsj2wWWEOveixhCFnS+7tI8+o46h
	h8z94P+GUcRfgWXuSadRjYkVhSPtcqW8t1tFCbqsiSDfw3OCQM78mZtyZ9U3VA7r1MNrS7WkYAO
	OC4lE
X-Gm-Gg: ASbGncujBGZcB0L9o+y7UgqIBvWE3BcGM12pkAtgI/xmdk8koezVZkst3XRT8URvUOX
	C2EmBJ11VXuBFXMg0dep6mQ5KZ49llbOQMWEkUnqqrCF1xHeWNrSPGp7sqqSdRSdsCz39gRgF0D
	tVHGkF4Jw+/UhpvssFCS8ZbwfNGGECp7NSWgP2nq/Jr9DyLfYV/jNFAglG/C/s3UGCzcUYcyHZm
	c9Bja6O0oMeqqTGh9BnEY42pR9bm03LC1EvKKOArIBbHxgiwQ28eJUUoHZhkIJS12Z4FGrA7SBu
	BreSDxlhTfiFRU798VtC+kKyFcI2Q9qWk31j1WomTFwrwIsh3VFQWA==
X-Google-Smtp-Source: AGHT+IHqLdbQez446lg2aMncoO6KwNeLwIFdTTpSl0MLFWYfTEOP0d7ZEmTTjvUyplgQ9pH5hdfJ0g==
X-Received: by 2002:a05:6a00:1743:b0:746:27fc:fea9 with SMTP id d2e1a72fcca58-74827ea5541mr4589122b3a.11.1749225632025;
        Fri, 06 Jun 2025 09:00:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/12] binutils: Fix CVE-2025-5244
Date: Fri,  6 Jun 2025 09:00:02 -0700
Message-ID: <31fc180f606c5bb141c9c6dd85a7b1d876e1d692.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218171

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32858 ld segfault on fuzzed object
We missed one place where it is necessary to check for empty groups.

Backport a patch from upstream to fix CVE-2025-5244
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0022-CVE-2025-5244.patch         | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index c6fec579ae..ea018a48a3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -52,5 +52,6 @@ SRC_URI = "\
      file://CVE-2025-1179-pre.patch \
      file://CVE-2025-1179.patch \
      file://0022-CVE-2025-5245.patch \
+     file://0022-CVE-2025-5244.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch
new file mode 100644
index 0000000000..e8855a4b4b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5244.patch
@@ -0,0 +1,25 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 10 Apr 2025 19:41:49 +0930
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
+CVE: CVE-2025-5244
+
+PR32858 ld segfault on fuzzed object
+We missed one place where it is necessary to check for empty groups.
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elflink.c b/bfd/elflink.c
+index a76e8e38da7..549b7b7dd92 100644
+--- a/bfd/elflink.c
++++ b/bfd/elflink.c
+@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
+ 	  if (o->flags & SEC_GROUP)
+ 	    {
+ 	      asection *first = elf_next_in_group (o);
+-	      o->gc_mark = first->gc_mark;
++	      if (first != NULL)
++		o->gc_mark = first->gc_mark;
+ 	    }
+ 
+ 	  if (o->gc_mark)
-- 
2.43.0


