Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E82CF5385
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.7702.1729686924265221291
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QKDECm8l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e3fce4a60so4557810b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686923; x=1730291723; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Es3XUTC8sA+jVYxXYnSVKFCOkwZwUcMScU6RoqTVVxk=;
        b=QKDECm8l/mIu1hz1H9FH9AXI/8OTV0WUpGfjGfJ7w9DmAE3HjKYAy7ebJIOhALO6cN
         KZQYqlHJQLK5jPh6YnfGDA7B7qI0rKBtmlU19Qo/GpLZmVkgiRNtww0iupkSGEjbQVR9
         sucrgVSZvfb6/nHwdEzQCo/ofSxSUeg5L4PFCrsS77pLDsknI/cJCuaCsJXWx+FNq00l
         HRNMIIN3g8ZpdEr4mM1pPzcrdM3kWijXnY64hiVWIa1LN3lbEkYmVacF5mKqiOlDsvH+
         nbaohiwvbc6nxGndKbGbMWm2vrTWyswAsgEkhSuMCJFl8fk3uwSJVUtUxqsjD9Z2Opwi
         GVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686923; x=1730291723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Es3XUTC8sA+jVYxXYnSVKFCOkwZwUcMScU6RoqTVVxk=;
        b=YYX4a21HG9olH35Xjoj3jUEDkAZjm2FhniVa6tydrDWS2vXG0lquPTHDcXdZi5I5zs
         F3IKjU3JYMjOJbR9Wul5sK/+mazar0UYB2T5wnoQ5IiNF9Edy5x781p179US3HX+w0WZ
         HxJdNzLx1N0UVKdUxV1f5soA9gEE5NxYs8JS1DBj4+u0K2lpd6erO7TAyLLSlPqeEQ6Q
         pjT13Nk/I6r+RNYQPm+FQTrWJpgDGx3iVYZa2Vrn1dr2jMUm+I1sHx3AbSWJw8mX4cWr
         GSDp5NJoSvJFzHhuDUTBgUWHXu+JKfn4cC8xEsVZ43HsacFGOfzFfrGs4gHjGQdq3ebn
         vQzw==
X-Gm-Message-State: AOJu0YwMTOgmFTHLNjBSBEgeu6THVEWnoNPQvI6p/dx95dCUJ5RVE24R
	YY860mPt+O2AXJN9h99wP6OxCwwj5auyqGHAosKqxQ7WWWfm/QHhq0n7Fe5u68K+SKz5xDVN78J
	x
X-Google-Smtp-Source: AGHT+IEO4BHTj6LgLnMF/Y00141hONoHS9ObbMrtEXRqy4KkfpBgBiMMLpXT9DaqUpY9S90ALGuYfw==
X-Received: by 2002:a05:6a21:10a:b0:1d4:fcd0:5bea with SMTP id adf61e73a8af0-1d978aebf8fmr2839500637.6.1729686923478;
        Wed, 23 Oct 2024 05:35:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 25/27] bitbake.conf: Mark VOLATILE_LOG_DIR as obsolete
Date: Wed, 23 Oct 2024 05:34:33 -0700
Message-Id: <fe1d653d094f006509c8b2aee3eafc5118be1ab3.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206236

From: Niko Mauno <niko.mauno@vaisala.com>

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=2f8806deb7655b37d6f8d12ff54680d6acf7a298
("bitbake.conf: drop VOLATILE_LOG_DIR, use FILESYSTEM_PERMS_TABLES instead")
so ensure that distributions become aware that it no longer has any
effect.

(From OE-Core rev: a951a900ce459191a9796a7069a1d3b658dda88f)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ab4c6a2d9c..59ac1873e0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -106,6 +106,7 @@ BB_RENAMED_VARIABLES[INHERIT_BLACKLIST] = "is a deprecated variable and no longe
 BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] = "is a deprecated variable and support has been removed"
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] = "LICENSE_FLAGS_ACCEPTED"
 BB_RENAMED_VARIABLES[TCLIBCAPPEND] = "is no longer used, modify TMPDIR directly if required"
+BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] = "is obsolete and no longer supported"
 
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
-- 
2.34.1


