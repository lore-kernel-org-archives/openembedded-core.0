Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20782C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 16:14:11 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.55511.1739204050446995353
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 08:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IB4V/7yn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394c192285so2363435e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739204048; x=1739808848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wWrINidrDW8GCzYECA971aP7+2vSqstg2dyHoNU/1m0=;
        b=IB4V/7yn3G4WbHSj4LYzDX/DNjT/qXZhFll1sq7PkSWnq5tRODa60/3IyFJMhhGvvl
         sFZm+Y+4A5sOiNyDD030iQZ1T1l8yhWZoKL9O2P0TxiU6jlkCDU+kB9Uc9muYW3ncD62
         JDwEVJPtdeHToRZWTOwc5ozVTfY1xjHElB440=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204048; x=1739808848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWrINidrDW8GCzYECA971aP7+2vSqstg2dyHoNU/1m0=;
        b=J09x3dXIxXRVPLyFLFBKqzPaZvmHsdb1H3qnK41ELHlmFMBPRk7ho1V0LPzLrWK2FY
         KxuevBEMqrmG1VT9eDajBU8d7DWDzbYnkBHlOy3fuJKOwyJX5Kr7mtlssP2Oo775ySaY
         NLmKMAB1PRam2yJdsvluwd8dWxsGmai6b523g+2wGCVzfuInMm1E1wSVfLFPlFPdRAVY
         H0z9LynWgbMPZeAA3MjydUTKMLcB5HAV93Zj/MqNZfs4T5/E68erDrYProYuN1eJgepX
         3XGXwTGFhbvIjnC9I0EB5l0mehw64gPkSBWQSVrxJiEz+9G3ILM6qOWd9VvU90EZZ63w
         FFag==
X-Gm-Message-State: AOJu0YwpM4uuaz6/NH3mbUm4CWDXF+oUvhrjbRUbgzSdWIyFc9+jDx6f
	LIHkteW6cUfsPql+6w5IZET1sJxJYmkmZN1inL7QJQP6uBJ2EHkg0rvA3liFv0s3Te9Wk381XI6
	8
X-Gm-Gg: ASbGnctXUuuBm9fIW02UppqzLbJod9hxGh0XL7TbI1HgjciH6ll/thrsnYMK/OHOgo9
	979gQkAZao2HG3h+GaKdEj1HAoe5FD8RdyOy+ZW3gMG3r0vdgFXBtqnfVUa4Thaef+h98YIl+5u
	v1Gul/8A7vYaHvdFijm8P2lM0ww6wjatJjlf5oQxVgtumH+BnwY/7ndR/g7U3TIiETnUMHbUEqx
	XFY33s3fU85cL3fm3jcAn77eRJJZX2LTMwKtqf3qLx5XwbTeXpe3pjjPjT2XmXuAcP+zlCucVcr
	iv1LJrm51f65lACDjjqYXuiP1xSEyMphaCN8w1uJgtM=
X-Google-Smtp-Source: AGHT+IEgYHclGdQJPgZNMgHYUy8RkAHGcXYMHNhFa2EPfKHRE+tp3egTdU6FQxK9NVg7wKE1jEacmw==
X-Received: by 2002:a05:600c:3d15:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-439341c0e1cmr68544915e9.24.1739204048202;
        Mon, 10 Feb 2025 08:14:08 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d33a:26d6:1846:991])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11264sm182262495e9.35.2025.02.10.08.14.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:14:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] libsecret: Inherit bash-completion
Date: Mon, 10 Feb 2025 16:14:04 +0000
Message-ID: <20250210161406.384031-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 16:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211101

Use the class available for bash compleition to simplify the recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/libsecret/libsecret_0.21.6.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb b/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
index e99201228a0..4d801105fa8 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.21.6.bb
@@ -24,8 +24,7 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[manpages] = "-Dmanpage=true,-Dmanpage=false,libxslt-native xmlto-native"
 PACKAGECONFIG[pam] = "-Dpam=true,-Dpam=false,libpam"
 
-PACKAGES += " ${PN}-bash-completion"
-FILES:${PN}-bash-completion += " ${datadir}/bash-completion/completions/secret-tool"
+inherit bash-completion
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET:armv4 = "arm"

