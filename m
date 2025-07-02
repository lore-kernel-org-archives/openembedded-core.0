Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58706C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 01:56:00 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.13683.1751421355318891843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 18:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BilLFiHm;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23636167b30so36350285ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 18:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751421354; x=1752026154; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=BilLFiHmX/cUZq9zZnuzJwK6X5gsJrlsg+wFiKZ/tSoup4FLe7n0eB1+esG/gQp7m4
         eNUniXcPTykilpab54bpi0I1QfQ8kp1iCmqaHttfbgto1iZpZB49xmyRT+irMTEBCB3s
         X4fffNiat0HCez/RBtQ0eFrMQ/DiOZaMqALY61/WOHKgaUFzE6NC2aglFSbbeK0v35V9
         fRecz6WEAxhsgTYRt3IxOgEzQFm1kICcuHQ4g7Y3BA4QpjnFBnfThNj0YzpAr8JlzUI2
         muCLHN+qwivkrW6Id0OBJD0hcuKAh00Eo3dErRo4teRD42N+PCwa+iWgzdfuE9rjN4je
         NDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751421354; x=1752026154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=YczXARgIf5JB8QOXwq6IQbYCMr9vZJgpkPhOVE5tqskIG0t0726hB6RKpdsAV/WcXn
         KxDG+YFrEv3Vm5gMTc/hI1bmegf6A6gU9Xr6HoVoCJGnFTYydSzzHbchIAgAOns0fAD/
         OpxvL2uAkBi55CUhHUOH2IQN0uKBxuDIYoRU47QuB+ak6AvBDuJrPWY09iwEolFNkQBC
         D9xAVtTtceTiaCCY+hT/CDdL585rmeo2zvELUn4g4lxee/M7LyBXeqG7jTp9Ud4iQvfi
         9scEMTeynh+3bNpeLm+2QkZX4rTUbhalt1ALyZq+K0Yis92Tr+BMs4dyPk8/cUjx8X1d
         bsMw==
X-Gm-Message-State: AOJu0YzNmV9iv65YivV47MZ9YGdOmDPaqwlg3mTP6cUWxpcMPUziv17t
	c29JyibQrlIc7fJJW29PNiqOKoRcFjkrwiptU+5GieJfcErSxciofVnI2wmfLZkr
X-Gm-Gg: ASbGncswEMT2C/FID4YfJOIbRIYCoU27u4kNa4CmIapckUKM+Cb8Lh/W+gVgtAyxPSz
	cuwswBla82miZaBGnaPQ4BLGPBRAl1/Xm8CGNGJWMBynWVIf8FhBHGIrjEvl91DgzQLEo4v2got
	SIUYJl/phWg7jqX5wGBfsyvJPTNrN81y7pjA7t9HKNfcecZNza4UrtpTdshrxwVtIkVQQkK4T3x
	reqrHc+UdqqRZq3yiuB52JGjSfjFjWipDPQ163TRjD8cHTkDzJEThnRAP+Sar/A/lyo5lxPT08Z
	ftq4EdQdH7EPYnehumzREg09NdcNzrN2WJZFeP2k+LiKVLHY4/L+xA==
X-Google-Smtp-Source: AGHT+IETMEDotaBioHfRtERUbPrEm8COhKZitK0FG/WfxgYP7Gft2RWoN0VFvwBTaS+7+jthotf8ag==
X-Received: by 2002:a17:903:2352:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-23c6e49053emr12221035ad.3.1751421354387;
        Tue, 01 Jul 2025 18:55:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e25c6sm114404595ad.6.2025.07.01.18.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 18:55:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 2/4] base.bbclass: Deferred inherit native toolchain class
Date: Tue,  1 Jul 2025 18:55:49 -0700
Message-ID: <20250702015551.1453616-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702015551.1453616-1-raj.khem@gmail.com>
References: <20250702015551.1453616-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 01:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219748

use TOOLCHAIN_NATIVE variable for selecting native compiler

Default it to PREFERRED_TOOLCHAIN_NATIVE, a recipe which wants
to enforce a toolchain can do so with

for cross toolchains ( e.g. target, nativesdk )

TOOLCHAIN = "gcc"

For native

TOOLCHAIN_NATIVE = "gcc"

This helps build native recipe with clang as native compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac145d9fd64..6be1f5c2df2 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -30,8 +30,9 @@ PREFERRED_TOOLCHAIN:class-crosssdk = "${PREFERRED_TOOLCHAIN_SDK}"
 PREFERRED_TOOLCHAIN:class-nativesdk = "${PREFERRED_TOOLCHAIN_SDK}"
 
 TOOLCHAIN ??= "${PREFERRED_TOOLCHAIN}"
+TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 
-inherit toolchain/gcc-native
+inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
 def lsb_distro_identifier(d):

