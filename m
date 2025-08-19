Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523ACCA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.3384.1755634084202207759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m+4Tccl3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e4f2e4c40so3136985b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634083; x=1756238883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7DQA5fjG4ajUiFqPLhO/xs1fmiVkJ8jdJSNFzELioA=;
        b=m+4Tccl3JUG2jl2Z1bRXFaz//P9LrieUxxiAsKeZ2F20YqsVGvkNFKQYceu3ouPZaM
         kX5I6be2CJV39HYTgfbTNoCj/9xks47x93BLzbeGXeQwcJ0cHjIVFyCn+3/3djEG0n2V
         9fdZNa11KU/Euecc597lX/38s/LFbmrirDwe80l10igmCSNPUGDF08I52NjN7pSbnpkI
         WqCAX85r8maNZ5Ts0hwX/P+LqGauBYbEEz7XKA2FmpQvea/4picTqi+jTp5Ed3jHc07P
         gaPx3G065qmeREJJy71+0YRy7553fJOr3vYXwnFOtwsyj/5//nofDQdotMMZLATLWbk+
         xBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634083; x=1756238883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7DQA5fjG4ajUiFqPLhO/xs1fmiVkJ8jdJSNFzELioA=;
        b=MOaRPkqUuNxZo3+dLXJfdnfFAhUSWzyIhy4fhYLikoHPK2ra++rOVlt0+y0VSlPwjA
         6lWJfEGL8ZOG1Hmguxm0tr8QiWJ3v00RHkxqIyCGIxOhQsoUZ717/StvXRWlGYaOSWnK
         90SSyC0wUdTz5jXHGhGKDQqGfG4CeGyqGLWz33focGwegR6lSMGuuVlGzwtKORvZ63D5
         pnC+KVNe8Lg2/WcmbBL3OKzVGzvjQOQ3hXqB0bTV9O1mOS7BM/0XUCLMcAVwhLH3/VAl
         4/Ref1DftCzczGms2wZnsbtUcSvwu24uZErxIqbEgAJe8+wfZuCmAQqqIah2LYsBIJrX
         6JHg==
X-Gm-Message-State: AOJu0YwbFbCBOY4qZ20Q2r3dZbnG8aqBLQ8GC2iFrAWbaASbcd7zuhJV
	nh6OIBuoXuUkXbPL8jCxMJT2ENy6OlyKv/v09cHBYepGlBXbJJjTnhyxf8rKx2d5Ibok7WSYk3l
	V6sOP
X-Gm-Gg: ASbGncvR2aChRyzDP0J+RKZph+sm3PbhVovFnBQLEmYDPM0TTZ+8fZDFD1+/HUqnBIe
	T54bvUNAfzo4lNP4ruRVx3S2sy+/0JtLCWBSI23Zf2uCbzl6wHKeYrEGPLtf31wTinfMueUfcOx
	ynzfL+4iq1bbcE4npWn90pvYdvkDcrUZSrukrQ1WMvoiWeqpH3qg5UH/ppXnulzwcG1a+DAhqvV
	M/qqQ+0fGJ58M1b8dUROrtJVP6rPyX4tqt53TBgsF3tMDRLj0yozWxHzKJbVdg+Gfx/nb8c3V+t
	7/15K5YresM1taY5GuUeCXemUemckcLqV+2M8KPuITDqHvzsiu1YUsRWBcymMLRH+lgAmZEJ9co
	MR1s/h9QlLnrA7A==
X-Google-Smtp-Source: AGHT+IHkUMH+cfIMVnDcfuWFLRdbtO85VJzJnWmnNeixO+EZX/8d/i9WpkL9ZAX98RTFLU+snPx67g==
X-Received: by 2002:a05:6a00:1a8f:b0:76b:a439:be4a with SMTP id d2e1a72fcca58-76e8dc24dccmr525375b3a.12.1755634083343;
        Tue, 19 Aug 2025 13:08:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] cve-check: Add missing call to exit_if_errors
Date: Tue, 19 Aug 2025 13:07:44 -0700
Message-ID: <b3d12589c26f4e86b153bbdcda774985e4e046bd.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222128

From: Philip Lorenz <philip.lorenz@bmw.de>

check_cves may raise the cve_status_not_in_db QA check. Call
exit_if_errors to make sure that the task is marked as failed when the
check is categorized as an error.

cve_status_not_in_db was in the meantime dropped in OE-Core
452e605b55ad61c08f4af7089a5a9c576ca28f7d so this change is only required
on scarthgap.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6b8376bf17..d08c6ac670 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -196,6 +196,7 @@ python do_cve_check () {
         else:
             bb.note("No CVE database found, skipping CVE check")
 
+    oe.qa.exit_if_errors(d)
 }
 
 addtask cve_check before do_build
-- 
2.43.0


