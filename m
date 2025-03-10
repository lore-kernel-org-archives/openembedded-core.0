Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11619C35FF2
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 09:37:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.33760.1741599423298034618
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 02:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YEmUTv9P;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso6066455e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741599421; x=1742204221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdvZpLc0vrNAyN+gi2/CAoglnDS+R5W2oCKs4ti5QC0=;
        b=YEmUTv9PAMwAh6HziCmP5wg4osk9ggv+dUaONOQDZvVvsRe7GLrvXY6yCTpxGhjYko
         oEvgJ4tC/8N7eOqTmWOEQXas5QgLtfnlDwgjt7lDIec/4D0Yf05a6x5SwsWnkkvv0JaE
         d+yd7HT/Rf5sWcC70xA7dYy0MhMsRvlv6MBfAI+vMRp3ZPK93RjlcttQ064kI7rtVRtF
         syKLxx6qmVYIwpBsD+8fMmT3JM7OQTMC5o59Qh/ocM2W1glLibMfre5+Y1UfhRZYcJHG
         WnY6aYFe1fqMqk3NA69KSu9NG1OqX8UC8eaHf81ywZKIx2cwHnyDFsTPPXhvZ8Hc5sfC
         Fisw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741599421; x=1742204221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdvZpLc0vrNAyN+gi2/CAoglnDS+R5W2oCKs4ti5QC0=;
        b=VnRjDtw+BsQ1rl8LGaxSdHD0I9EKaqEi7/ZiDSxKZMUnukjcMAMFjP8sQ6bd+XOMK0
         W+fFDT9qn+7avkt5VDx+alYQYNqn1LOGS1YidzUfBOHDo6ote2gbZew90IHeC77/FfbM
         h841iqkbdKlb/8PQ5EOD3Ed0KA0mdsIA1saSUDoPOqVubJhvpaA4ec0TOf1PsJqrFpPV
         jXDpNmo2KmYPkfBXJI9cdnpP2c7C7X1WAFPJVQzCN5WHWtgW0yEVGDUWNONgxhPm7UrT
         SXqfS19Mqr0iHsJeQuNszDErZICr6+UbdY2zD6Lo+GsTilBdhuLG7hqAaa9NnhHJu+Ok
         ef1Q==
X-Gm-Message-State: AOJu0Ywc1c80uwSqvRYKlI+ucIbdGd4Z9AIik+AlmWnGNjFEevXCIKRd
	TkhMIM1pXMYCsPNGOGoieasa7dtzfKGFzKpJ6KKqlktNdzuoW5aPA5GUSw==
X-Gm-Gg: ASbGncsyNUzcDDoN+cRE7MmtHYuiWOGKVuxS27hIpNxYDw9YWMOc8KEmUvHrJr+hZCH
	JDgBwq1CG/wfrwTyTRrVD4f6wSnNK2eoHCJ068bYQe8U5PfmOaS7eeV4GKFQWozhw/dZyZ1vNDo
	cAoMQ1xGSos+Ow5k7DLc3CbT6/SlHC5qvbkslAjSODmQOSVtSJY0S5kXcDil1Z33hQvzZWVueXU
	BYumCvP7lFUJn5QoV17S+DUJ+DmfC7B6k+1PMvRVKLKxejifiv0RCTOTdTLxj4LqqOLnVpkO2AK
	atxVH8PKZ6ME0MR16shYAgRh6x8HtDhqDgXq0DCpyBgIKccPNgVlDRasoFj5S78M8o8=
X-Google-Smtp-Source: AGHT+IHNRJFnekkuvZZ/nSR2kjfjwsOi51lNbfxjok5/6rClRoWETuPYUkJeUo3LC8Otc7jx4BMXhA==
X-Received: by 2002:a7b:ca4c:0:b0:43c:eb00:50eb with SMTP id 5b1f17b1804b1-43ceb0054a9mr46222145e9.5.1741599421255;
        Mon, 10 Mar 2025 02:37:01 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79fbsm14554454f8f.13.2025.03.10.02.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:37:00 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/7] uboot, kernel: use hex address for UBOOT_ENTRYPOINT
Date: Mon, 10 Mar 2025 10:35:45 +0100
Message-ID: <20250310093641.1983560-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
References: <20250310093641.1983560-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 09:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212499

Compiling a FIT image with this default values and dump it with
dumpimage shows decimal converted values. For example the default value
20008000 looks like this:

 Image 0 (kernel-1)
  ...
  Load Address: 0x01314c40
  Entry Point:  0x01314c40

With this change the expected value is printed by dumpimage.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel.bbclass       | 2 +-
 meta/classes-recipe/uboot-config.bbclass | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 64a685a964d..36ce659762e 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -233,7 +233,7 @@ KERNEL_VERSION = "${@get_kernelversion_headers('${B}')}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 # U-Boot support
-UBOOT_ENTRYPOINT ?= "20008000"
+UBOOT_ENTRYPOINT ?= "0x20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
 # Some Linux kernel configurations need additional parameters on the command line
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe/uboot-config.bbclass
index 74992182c36..f44605cb6ae 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -19,7 +19,7 @@ def removesuffix(s, suffix):
         return s[:-len(suffix)]
     return s
 
-UBOOT_ENTRYPOINT ?= "20008000"
+UBOOT_ENTRYPOINT ?= "0x20008000"
 UBOOT_LOADADDRESS ?= "${UBOOT_ENTRYPOINT}"
 
 # Some versions of u-boot use .bin and others use .img.  By default use .bin
-- 
2.47.1


