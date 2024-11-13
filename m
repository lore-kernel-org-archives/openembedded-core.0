Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B366D597D1
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:28 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.3463.1731467784115322287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pm/UDp+V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-72458c0e0d5so223986b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467783; x=1732072583; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0y5ZSCLZaQoygE7lo7n/hBe3nvo6x7MnywGydCT7n0=;
        b=pm/UDp+VylWE3F37owzmUhJFS2dDUPbefojShfE7KyCadOk1db6mHPyyoNnwVyfXQT
         O0SXEf8QVRtYIzG0nafZc71SNTBuBRuOcs/sM76GoNf9YqUmziyohqkJjd+OuUOrDDCi
         nRcrEy3i3vMefGifwBSZmgKpTzYx7T/lRxAIJlbXP9AsUBe3wVNiSbTWG/ZIMyncHH2t
         WAA76ewIigrRcsvfcCEkk9d64XRwcaeS2nvCvnCJMX9T7Y43RmlIHGPyCF83B+E56CxB
         sxY8GLlywXMeT1q+SPWL1UFCpetjV4rxyyv5qyXa5i6IJAB9ID+dKAdszzY9F0Nr3Ond
         PDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467783; x=1732072583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0y5ZSCLZaQoygE7lo7n/hBe3nvo6x7MnywGydCT7n0=;
        b=iKuYbcJPrmM/gP5smZCFP7WOHIWkH4+qAbf8Uc90CauhKYIgtrSHUf0s7BPmfeUgTM
         6PcKhXyd5xh9m98apNnhF3PeZtDI0wUMnZRMTTgv9CBFuvqmkUbcANtRlL9bZROprXNF
         UGON0Kb7wsh1xLjZyqyuyVtPqw6mz0ZXJfqzEB1ZDincI9FloXi8ffGm/qjdO6+WzwzZ
         JvzrpHRfnCwhM1Nu3ypKh3hgb7CkDZvD39eDSRkUKUl9PnABKCvcgeeME+5o9X15CCKs
         YD6PsYJyqwlIJT6bbsBDtdBQrHSsNW9VKI4axUXbm+IUoM+QjBb6Hz2u1i8UrgpJIVao
         6g0Q==
X-Gm-Message-State: AOJu0YzUcbNqnI6nrRtUDlho5RKkJCAKqNEhmuoEP+22nLVMD0hHg4xu
	PJtoHPVf1mXBWr8Ffn+7FzNGihS09Z2r0BdbvNP4AB0l0N/CERiDqa1wil6IByEjoefvbLZ6lbo
	a
X-Google-Smtp-Source: AGHT+IHmt5XIBLJKbUPkUprw1sxRg+f4z6h7YTiEN+9a2f4vWVxrRuPtrAlAMvYbrvXA5T/Oa8Q4Fg==
X-Received: by 2002:a05:6a20:9150:b0:1d8:a322:6e with SMTP id adf61e73a8af0-1dc20633951mr27957035637.19.1731467783310;
        Tue, 12 Nov 2024 19:16:23 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/19] gstreamer1.0: ignore CVE-2024-0444
Date: Tue, 12 Nov 2024 19:15:56 -0800
Message-Id: <e64d90d4c52f2e236dbe3b24b7deffce10452671.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207076

From: Peter Marko <peter.marko@siemens.com>

This CVE is patched in gstreamer1.0-plugins-bad.
cpe product is set to gstreamer, they share source git repository.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
index 6d002198ae..2c9c6944b0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.7.bb
@@ -69,4 +69,7 @@ FILES:${PN}-dbg += "${datadir}/gdb ${datadir}/gstreamer-1.0/gdb"
 
 CVE_PRODUCT = "gstreamer"
 
+# this CVE is patched in gstreamer1.0-plugins-bad
+CVE_CHECK_IGNORE += "CVE-2024-0444"
+
 PTEST_BUILD_HOST_FILES = ""
-- 
2.34.1


