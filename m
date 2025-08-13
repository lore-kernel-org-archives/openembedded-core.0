Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E501CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 21:29:13 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.7883.1755120543742594924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 14:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GZi31oo9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-244581cc971so3874075ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 14:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755120543; x=1755725343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUjtA/DgaI6uMl2MhaDwneBAoqT3/z3BzXNanBtr8Eo=;
        b=GZi31oo9LLjYik6jIEQQxhhLk2pnM7AVhmnvy6T0bxV/tfxOdxmDsH73de/S02oaKZ
         dNTwUvJ8Uzw/TNaa7GUXq9VgOAJH8yozGhtxirStFzG4+jKE8tfNebiTmIjO/uJ0dFjq
         SYFaBoqVIl+4t+Gk4ybWNGOQcbSrDiDKYKS9fXQzfybOSDTKee8Q1tFLJxVLymk6qMXv
         v74w195F4FVVWxmMW131qL5j0JJ37Iskm9uQ2quIt1GhhLoIPtEG+3PG9aIEk4DiXmda
         2cLkFs1qShymuNSs1S4k407HSf7U4O0P6QJEwXAFxsiChGpRf1fswl3rPHErFpffDlQ9
         Zykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120543; x=1755725343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUjtA/DgaI6uMl2MhaDwneBAoqT3/z3BzXNanBtr8Eo=;
        b=VN7Xp2g5spqU9PIgnQWWxKAkx1FTosLSf5vDiaTE0/bJnW1jF4sc5h3VDGqZbaOYzN
         XeanXv0ZGkyqrXAnfP0RhVEep9miaU0QK3/nZ/R1GWvHwFgoY1a/j3gJz3Fqn8WHU9Ju
         8JkURNR+botsEB/wy3pt34byfNuxV6m0d4HiLd5iUcw77Jnf4SqOESPqGg14hJlp75rs
         3vM2TaWF0dRwP7NVJWBj6dXXOPIuwekG+z4z/vusdkIAXgcZPMJy5yzyybIcRy3/dJce
         teZY98E1qvR6ayOw2z3813KxvRC8/Js5HFnxR1FnH7Rnv8uzCeRnFXVY8NsyeTjy5Ybo
         zojw==
X-Gm-Message-State: AOJu0Yz966INkfNuctlZ/PiF5ceTuYDZinX1DyApQp2f0gRtjRsalxj6
	B2RiS/xsAGd8hoRKIjEwh7fnLqWGExQBo7epyHmBePi3T/nkz05Ohe2+djz+DrPlEw4jKQT20DU
	VZ8X8
X-Gm-Gg: ASbGncsBmRjW5c3gmEAEyLgI6MaqGpOXzyQA/AbPBY7E4Ac2RLj5czyRdOSsEWZN3iy
	Vz4SofZHbT38XeIJLDnkP653s0LCtonUmJRPQgR7sNUo8LVPPvy70KGG1MwcoGnYpfCOporT9I1
	E1EarAztMbZbRzhcgM4auIkKcdoupZXAtWZVWyvJWTjNMfAN8IEd0dxaUec7CaFzWVCwadOEzTd
	kzqlP8YLWF+Y4VYFyu9mN08oVszWfLNgPT+kJ7EQCFQYT5oOAKQXl2LUwN5luMSdycgDteB5beZ
	KjfDcY58S8ZoiO4VgCLWyoEu9juveD6nOxpFAq2hX+vB76JvhjWwrsSFzLWtX/jA3bN4HloBtfZ
	yo0XN20jODWUYlA==
X-Google-Smtp-Source: AGHT+IGQ1ow93Kwo12SqO+53jvCDBGzHazEmSkjM07vAeEeY96lOUqjAHQBrwCNZfjZV2y7958XjGg==
X-Received: by 2002:a17:903:19c5:b0:240:a889:554d with SMTP id d9443c01a7336-244586db829mr8968805ad.45.1755120542866;
        Wed, 13 Aug 2025 14:29:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:38b9:9a51:8a43:9529])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a48esm336178545ad.114.2025.08.13.14.29.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 14:29:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] go: ignore CVE-2025-0913
Date: Wed, 13 Aug 2025 14:28:45 -0700
Message-ID: <473da932a8f94b7454e0e13912753a7e7545fc17.1755102550.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755102550.git.steve@sakoman.com>
References: <cover.1755102550.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 21:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221835

From: Peter Marko <peter.marko@siemens.com>

This is problem on Windows platform only.

Per NVD report [1], CPE has "and" clause
Running on/with
 cpe:2.3:o:microsoft:windows:-:*:*:*:*:*:*:*

Also linked patch [2] changes Windows files only (and tests).

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-0913
[2] https://go-review.googlesource.com/c/go/+/672396

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 033f770f64..36356349d2 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -73,4 +73,4 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 CVE_CHECK_IGNORE += "CVE-2021-29923"
 
 # This are specific to Microsoft Windows
-CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284"
+CVE_CHECK_IGNORE += "CVE-2022-41716 CVE-2023-45283 CVE-2023-45284 CVE-2025-0913"
-- 
2.43.0


