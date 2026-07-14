Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677C7C44511
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:31 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1667.1784055866127923315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rLcClr/s;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4560d6f82edso537628fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055865; x=1784660665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rt3acAGZlMP544ezc0Y5kgzCfuz8EKGwNyEGxX+UFaE=;
        b=rLcClr/soI2GJYFXVyHG/O3fC2EFc15DAV0fg+evZSbvpuvgUCPaUAXPbJuKC++t9F
         kFUcSJOrxu4ZxIHfRRJ6hdBe1H+KrpEQjDfxDNWU7xoYhvYt/nqWsQS9kVBA1kH1i6eT
         pUhsGYoEM6txnW6Af2jj00nn+MHm+yzlhmfuYrLzX/YGJiz+WbE6gRp2BBflTz19M6jl
         Tqi+BSSJw8t++HvF205AC28r7ZBN5ze9/bg0h/cWLnlGON+aA4/jD8nbRgEmsS8GIa8e
         DxFUwKpvsKeU5nGj3k/c/vAMmUGI81yzvKthAingEMk24v19LVd5e+t2nxD/EC/nT7Y/
         TB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055865; x=1784660665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rt3acAGZlMP544ezc0Y5kgzCfuz8EKGwNyEGxX+UFaE=;
        b=Js/ESKuByN5D47Jg/EYIPudhOveP43/okzuyBDQU3KvqbLeBz9sEf+AIN1U0Ia1U9u
         Dh/n64jx8V5KJcd4+1kKu9DU0lMoPMcbOkkNL8xvXtHTOkZfd5nDLny+fVowraruzYV+
         EzZkPjTWSCByBVYybGzQNjMfXQ2Jwx3S7Pjt62PDXiQ8xYoCklApYbUYVnwEnOf8diq+
         kTj6+MMrL/FdzpUbNmGfkm4FATFt/TXH2BMy1A28MRYv67Rus5ATeVfAKNICukETQw4w
         CXkGdLfxR1y8kaY3Fj/h53uHKtTtQNR8KfEUiBWepJYcfR/XtR69tSAxEbKzbaWNx9Yx
         Rf5g==
X-Gm-Message-State: AOJu0YxboisPdSHknJ+YipawKgXY6VlD9vYlU/UZYRS6OPIREr2Hue4u
	zahZICgkBYyofuIPe23u0Lj3Hl5aTwMm0eoM1dlW9hSnatANrLtakkcQvhrFfA==
X-Gm-Gg: AfdE7clabMiOxV1kRusP/+aePwmLk9/TRzWoqHxZ+a04ILJDTEdwSvkuYR4fJC1BwFP
	UIVLxLT5PWv8xIFjamyob5lszWfdowg9tqWePH+sj0Vn3LP64MMI8S47qqDJKDVU8OhtpfUJOmU
	C6GlRMhivum2MiEBzikio4sw/q5sVzYiOMgH5u9ZjkxV+xLz7iOjxYn6Pre7hY3adVkllViW7W+
	7xsjHoL/lVjHTSbbJQsgdSil5/3GrsP/aW/O9dk6VxMuR7FbgxUhmR3d24AjqD6DvyXEfw1ECSU
	XiUkX39cY+V4glbYPVEiQho7baVtQcXVwy2R2RWy19gBTkaR1vv8i/DwufCu9lbAYZSDFYuPZUd
	49GlaO3c2kvOG1oCtE6yD2WFulj1QxPWIDGTKrBgqJe+H/5k0nqhgG+MYQuyhsQ3ZC1lbYhh7Co
	aH/5A6tlhrSw==
X-Received: by 2002:a05:6870:d36d:b0:43a:c6c1:e40d with SMTP id 586e51a60fabf-4560b4b572emr2071511fac.16.1784055865214;
        Tue, 14 Jul 2026 12:04:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 22/22] meta-selftest: libxpm: Fix license
Date: Tue, 14 Jul 2026 12:31:32 -0600
Message-ID: <20260714190405.3328796-23-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240929

The license for this software is X11 and MIT (verified using the SPDX
license matcher website), so fix it up to be the correct SPDX
expression.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
index 1fcbbdd65e..bcfa65ab17 100644
--- a/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
+++ b/meta-skeleton/recipes-skeleton/libxpm/libxpm_3.5.6.bb
@@ -1,7 +1,7 @@
 require recipes-graphics/xorg-lib/xorg-lib-common.inc
 
 DESCRIPTION = "X11 Pixmap library"
-LICENSE = "X-BSD"
+LICENSE = "MIT AND X11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
 DEPENDS += "libxext"
 PE = "1"
-- 
2.54.0


