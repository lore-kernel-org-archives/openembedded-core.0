Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45D0CF3951
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 14:37:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.21245.1726756656475997387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 07:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FtNFqPjb;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5356bb5522bso1149481e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726756655; x=1727361455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ/knW2N7PVRDDB5R+brL7z9Erq/BRnXkTj06+QJIXc=;
        b=FtNFqPjbh0Y20ULPsKa6YdMAFwOOjL6LRrDohklUq2W+4YxJX5z9DkzR5MfZVnf3Gx
         SFuz+yBWPf+DY8YwlvA+djdYKAltP9DwdAL3FBF+PZ4Dh0JqnPmBkm9g003HaM209kpQ
         V74XO7sRB5kGo3rRHoqlDmMPRWwhiBSElusQ/Y2DUvm2txxtLAV+svNT+wQv9IF2TWTM
         52FagYAfhplyOSH2BvSH3mEsoWpJi80T6md3jSda4bcR1XpAMU6s7Mb1JN35phcEptAB
         T7AuIZK9Z/K0D61kXFWcUelcQYNVm1stcaCCz78M4Vp1BOMa54OWOxvlI2fb0ogR9LZ6
         hWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726756655; x=1727361455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJ/knW2N7PVRDDB5R+brL7z9Erq/BRnXkTj06+QJIXc=;
        b=PewB3Et1CrezhE7laXNee+hpnD/edEr+jaVgfzpCtuU6s6eUzEmOkPbLuYBdpeKaET
         LDqxcQmQ9lYDnwIWNoDY4tK9YtKZSWjwdFf1fx55SXeLPF1GtDYqnna1pRQJUOGbj2i1
         ffVcPWRh/HdJBMN00fYf+0MORWSiaiuno3yLEqKKcKnB0udGUo5dwnl4JRaPHjJpDMtt
         RaB4zlddk0V4IIbkNW9WT4U+RdOv1woqVPUz0dJPt2htio7ouvvQv/y5dSi+5eYBlxOU
         sJDLHn8PGuqC9sLEuIHIw6rVOg63+tmda+loJG7VXV8lWU81WGs4xSwO8JErQATOKX/u
         OOEQ==
X-Gm-Message-State: AOJu0YxnnMYP2+GOOm9Ag4QaoLrN8VX9U3k7zaNUOOPFs+Cm7i1QQXoK
	1bPKh3LaEYwbztOWKkk/htKyVeW3INdcOdvcCvmcdix6NlOU3Bb7iWuBglylc7e5wrn7kz3NTaB
	QYhU=
X-Google-Smtp-Source: AGHT+IEUEXfMasVoJtwFkAblrY5nbyHUghLKstDSnpK+BnUKWZrWlTmZm/AYP9XofV0OMLFZSDQ1Ag==
X-Received: by 2002:a05:6512:e9e:b0:52c:df6f:a66 with SMTP id 2adb3069b0e04-5367ff3291bmr12844950e87.58.1726756654509;
        Thu, 19 Sep 2024 07:37:34 -0700 (PDT)
Received: from localhost.localdomain (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a8721sm1889194e87.232.2024.09.19.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 07:37:33 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 03/12] systemd-boot-native: add runtime dependency to python3-pefile-native
Date: Thu, 19 Sep 2024 17:36:57 +0300
Message-ID: <20240919143706.6074-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240919143706.6074-1-mikko.rapeli@linaro.org>
References: <20240919143706.6074-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 14:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204695

It's needed to run the ukify script.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/recipes-core/systemd/systemd-boot-native_256.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-boot-native_256.5.bb b/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
index 73db59b14e..58db408dcf 100644
--- a/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
+++ b/meta/recipes-core/systemd/systemd-boot-native_256.5.bb
@@ -13,3 +13,5 @@ addtask install after do_unpack
 PACKAGES = "${PN}"
 
 FILES:${PN} = "${bindir}/ukify"
+
+RDEPENDS:${PN} += "python3-pefile-native"
-- 
2.34.1


