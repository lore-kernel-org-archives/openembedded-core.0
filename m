Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38834C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 13:52:05 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.10861.1636638723886546893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 05:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C2FLtqaw;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id q17so5774844plr.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 05:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3j8xZqeqLR1cckgXbrUhL8nCL7ei+5ePTf8fJqTNEbQ=;
        b=C2FLtqawnMPUS9oAfHrY/zgWMgeLYFWhlhOn+pQvjEgh7KO6ijc1BIgGiySq2hBlWz
         0J/rTJ90wTfpCF4QOQETPfjp3Pcecxk6kasBBb0ezyTYQMKMsDebBHD5LvAV0q2c4fR/
         0vjcyVV2APIxgIMcL4BPcP9nauQGsZT7ZDAnhXqYHdLW/Aihxe8pz4aHssia2VPe1PYc
         HmDU+Pm6WjzqfHECI2bSStHOjB/6v+iasb+O3I/siHAwIJ09FUU92bK/vF42EkmS8CNI
         dArYVCJAXlGNc27BdAbgEUGpGwTu1R2mCqDtG7niEuna5CCCtP8BXjcB96nc6YtytmIu
         UfRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3j8xZqeqLR1cckgXbrUhL8nCL7ei+5ePTf8fJqTNEbQ=;
        b=sMoEwgyjOSxKVmUa5NqNAUQTXHo2UfpmOSa42JqUxYbORkLd/0cDwa3Vnvy4lc8zSR
         l5kzuo0q6KAOuhn3OtLUaJEl2ovOArtKwwv4bYHG/+GG7rFOhwC4+HFeZnnKhPnz4pIu
         og0VWY1Lr4VGFvwOsIYXIUjvToX9Y0gfoNGntV81CE8gAHYrS6cKfMBb0737W67g5HpX
         3kzeUSKGsXEyz1SBcMMdLaVitJH2BA0/l991V0DnjDCrNwMqhJYmEWXj4UwZwEaPGldi
         iVHug6JwZbBloBEROkaG/bD81krHHxmCn2WIxlA9H/n+c7FrHNL48LQT5sQ7jRj9td0n
         a9qQ==
X-Gm-Message-State: AOAM533HTLeoSyCrJEHovU3tJmd5Mvdgq7yFsR5z5g0eSckxlWdzfr/I
	fZA+YX3lcMNUSx00MqRZKJwylyZ86AI=
X-Google-Smtp-Source: 
 ABdhPJwuqfEDBVTK1iAsoJWrhwjbWdEUEDnltcsZ3raCWt/81ErIiW0zJf8N+bquJXENqkPEK06yGg==
X-Received: by 2002:a17:90b:218:: with SMTP id
 fy24mr26857270pjb.187.1636638723077;
        Thu, 11 Nov 2021 05:52:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 v2sm2984232pfg.115.2021.11.11.05.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 05:52:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] qemu: Exclude building on riscv32
Date: Thu, 11 Nov 2021 05:51:59 -0800
Message-Id: <20211111135200.2765078-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 13:52:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158180

Needs syscalls issues addressed. fails currently to build

../qemu-6.1.0/linux-user/syscall.c:659:1: error: use of undeclared identi
fier '__NR_nanosleep'; did you mean 'safe_nanosleep'?

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8cc4600cad5..ea7dfaecef8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,7 @@ CVE_CHECK_WHITELIST += "CVE-2018-18438"
 
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
 
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
 # upstream states qemu doesn't work without optimization
-- 
2.33.1


