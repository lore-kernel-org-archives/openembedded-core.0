Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11B4C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:27 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2122.1743577825725860398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d4pV0xJ+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39149bccb69so5564037f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577823; x=1744182623; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W/WnwehB27M2i7I90qTWCpdxoCUvVZAobJCM/B6SjWw=;
        b=d4pV0xJ+9TTI4tPMpDnSNykQk/uVC6w4BXi30nDE1sB3Lz+Ga8eq0gdPl7xOATBOGa
         5fpBy3+RumIBroGSSckCGFsSBbG/x+hadzzqTog7uw6AIs6p9HP7DKb4BvsNCzBFuwPm
         T2qwL21vhUoqMf1PKcKbxrqUuOGDq1EmKENwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577823; x=1744182623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/WnwehB27M2i7I90qTWCpdxoCUvVZAobJCM/B6SjWw=;
        b=Ym4VB/p7D3pk+hLkxEQg7czJdwWNx9pF6FtI5ESVDHWZ8iugMj2FphxunP301IM7a4
         mpg9z5grH374UzVhlIy7iiUB2Jjzie12Fc263Q43uKc1oQws9Zt6mrSAUCMBgMChnj0e
         trwR0+vEHHGUkKqhkR+89E34tHmp4LHk8znkSjfrehnHaolnkji9kUOZHBvo1g2AyzBW
         PgAGykrF1ubRCFfX8A9DjX4H5FiZ/pbQUxq0kJTqALY19xQy9r1TC06WC2glJtijxyqf
         0gGt9g0xp4zr9/YF95En6Zy4oySPFM2apa0jShjiE7TKiTxsafz0B479RuJaSWm6nu26
         tPKA==
X-Gm-Message-State: AOJu0YxplUYwOFbkRcobiqjie779CymgMV7kLT+m4cRNQA9B6XbB5sfe
	+zeEfJKNch2dfRDPP0G0Bqxio3RNKXBEXFD87S8Y4HkzqFAZAy9oqv7YfKtdaEfnFyQzCjgQ5Pn
	D
X-Gm-Gg: ASbGncu6i/FvfJN5uWxO0O3G1mVMVfVtHHDEL8yF4kpUSLLh9/r6mresBXQygdNxcoj
	Q0FIxQermiMgB9+ikq3sOBYgMwm5s8basPYWxcnEn4Dmo9ga96B2YWt19jM0gXwwE6qcwNOE4vK
	V+wuwwcuhYd0bsGj/wzVlSp96g21KtlwKdtGoMfaMXncK96C78BOnIGPn5A+lyIRvt3zpkoQ5Nw
	lfPuZ94SOw++hkRv5jR+IemMLf2Y7+LjUtn5GvtnZgYfVgPcLnX+N9FdFvuYype1CB7v5MuLO+L
	yUj/ybwI29uf6I3YUrgQq1eaubF0hZVEO/F6GsMQZ9a8kIR7sfJqYe1xJPMhJN/SzG7fuctWOQ=
	=
X-Google-Smtp-Source: AGHT+IFDYdWKBf33rN2nluAkbKPSx6r6N2BPUC/4cvCi25PdW+gWpaLpLWQl4+/6MAY5/8rOi/uboA==
X-Received: by 2002:a05:6000:401f:b0:390:ff25:79c8 with SMTP id ffacd0b85a97d-39c297534camr883128f8f.20.1743577823153;
        Wed, 02 Apr 2025 00:10:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/48] barebox-tools: upgrade 2025.02.0 -> 2025.03.0
Date: Wed,  2 Apr 2025 08:09:31 +0100
Message-ID: <20250402071017.2157620-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214175

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 42989667147..7fd7a88d717 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.02.0"
+PV = "2025.03.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6da5f9e98a8c93f6eead3badefe133ed5fd865395b1a3c0192fdbdd9eb4f7311"
+SRC_URI[sha256sum] = "0bf7118004e445bdd57feeef89ee9064982acc221e8a046c4a7994d3da6da2ec"

