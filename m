Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2582ED3B99E
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 21:53:23 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2562.1765317202405196451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 13:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PzDMBbol;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29555415c5fso70397885ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 13:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1765317202; x=1765922002; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEd3kgiOa6q+685ohkg/am96r3qtx2f6ITCEHKwlYMk=;
        b=PzDMBbolks4HTECIv6MxgL8N403kdai4dCCDNI52j01U3UOmGOlDtDQiW7bXEWamyu
         qdanKJ/uv05P6AfMe51kHXAQH+A2Y33PtYiOYQPRNe6YxyCOuJFROkQGxaXrGjuMrNKV
         wcQJk6xcGASLlhPFi5sPe9sT2SjAinDXhKAAyATfSaXJxI3eEdNLSCOoocvwEfCFJtds
         ES6PuPFt88Nnle08kV3ZtrAwbZXDmbpcMRMtXWHoewShNwhqgopFVgiKFLaUJG/ookci
         O3C1Yx/DuCTQb7cYoIbsTdFdKEjdBL+y/dk1QDUKu+Zmz/ycQA6YvBLm05Mw3ZbAmxuq
         Xm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765317202; x=1765922002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YEd3kgiOa6q+685ohkg/am96r3qtx2f6ITCEHKwlYMk=;
        b=tXXh6cszoFaFm4PdGU1MEeme2W7TBZhXazop6oLL67GvYEXZzZz39Bs8VG0aT0LGZG
         DFZjrFXznIYRCRMYMO231BScVZoZXYGMSUrOGtqWo+AHGpH6y2tB9D82Fpr2B9t/Dhg5
         vLrlbjoKFglYXbCCwl4r8ncnbdo56pfG19sfayTvxjdBiYUTVMDRltAlVfjcA+KBHBoV
         LMaUWbu+W9+SghZBCJ7ZO4jaC/08mqXo92CUYWtZzccQqYBkhh8a5p6YBtyDHnvjze9s
         CnZ6jzxSs992+FEKOkGm068l3Wx6/+Ttcw3GGrxr8652Uq0kzgZPqxMuUvOyiiDdR+/p
         LAOQ==
X-Gm-Message-State: AOJu0Yw+qzWxSjpJXm09SD+9s0TQPeyBF6rjtA9xxELCDoRoTzAyRWjJ
	DlzVqhPxhxVigIyvOjfGYX5XVocobHWwCeQd+6BYyxeyTOsBcjRHiwR4xs64sPgoT3nv8b0i6aR
	PXqHe
X-Gm-Gg: AY/fxX4DoMpTlz4FwxdnDuNWHBb5OG6dOet9267aK2X0fC1mKneSGbsc73Ny/UfeXCM
	Iowh9rCy7tduEmmCXQhOBsG7SrhmhTRZBWLKC9GlOFIC6NR/Y0Z5og4YCQZCx5KC/ZYq3DjswAb
	g6rzzVi5X7+Finn27C69xzvwQc5wHLPaiDBLBn3SpqarulOPfncF+f2R/8f1XcTQL/Omgvuhi4M
	2kS2llvJ/nuJCkEw3zmBNNx9rkMV2qWIQT3xvRWBNhOvbzoRi1omICHcJ5gagMOz6oGejjzop5v
	8JzbjG+/S+wix6GQ4qfhmiv5DqDr9dwwPoU3h0kfUHNEezjQDnAQGahTC0Ii3i4bZ63q/7X4bcs
	Ml2/kcH20FmeTi2/olkldbnM7t2xu1JNkxFFaC8gAMgwvNjlj3ouC1dh61CljY89wqt2KJpufYM
	f2zQ==
X-Google-Smtp-Source: AGHT+IHtG6HVGFnwja0myHfJbb7fKBwKuc0akbdK9SfLKjfzF+kOeCyt7n7nudj4lh9fxGy8h6WiiQ==
X-Received: by 2002:a17:90b:1843:b0:340:bc90:d9ad with SMTP id 98e67ed59e1d1-34a728a0f4emr161862a91.10.1765317201608;
        Tue, 09 Dec 2025 13:53:21 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5aef:241f:68f0:d970])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a6ff012e6sm412296a91.2.2025.12.09.13.53.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 13:53:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/4] libmicrohttpd: disable experimental code by default
Date: Tue,  9 Dec 2025 13:53:07 -0800
Message-ID: <1d8e646aebe75b8ede51d4de9e0003a822992a33.1765317045.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1765317045.git.steve@sakoman.com>
References: <cover.1765317045.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 21:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227451

From: Peter Marko <peter.marko@siemens.com>

Introduce new packageconfig to explicitly avoid compilation of
experimental code. Note that the code was not compiled by default also
before this patch, this now makes it explicit and makes it possible to
check for the flags in cve-check code.

This is less intrusive change than a patch removing the code which was
rejected in patch review.

This will solve CVE-2025-59777 and CVE-2025-62689 as the vulnerable code
is not compiled by default.
Set appropriate CVE status for these CVEs based on new packageconfig.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
index ad3c34ab9e..264af6d81a 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.76.bb
@@ -22,9 +22,12 @@ PACKAGECONFIG:append:class-target = "\
 PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile,,"
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
 PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
+PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 do_compile:append() {
     sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_CHECK_IGNORE += "${@bb.utils.contains('PACKAGECONFIG', 'experimental', '', 'CVE-2025-59777 CVE-2025-62689', d)}"
-- 
2.43.0


