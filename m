Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5422C36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 14:10:41 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.8624.1742393440876059794
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 07:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dvnrE4Qm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-223594b3c6dso150087865ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 07:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1742393440; x=1742998240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgUUdWVOXVECcjb99rFS8YWWBbCUYmB7JwFPV14nrLE=;
        b=dvnrE4Qm3EVKW5SvrPp5Xm7A8MMB0Hdue85IdW8oVHry7rzE4RBS8a0hvUvbnbOjWK
         wms00nHW+Yq2AXZa+hOKW3TQwn6Kdbr9iYz3vDCC2pb6yZDRKA6o2Px9qzPXBpP4YlRb
         7l3oxxvCHW4e5t6Bqkz97e59KWslVm2HBelt51fx1+oU2UTzZvLiiCPG9tcupNvv5/To
         FueNvAaRsccpSKL/i9VXGaqjkGGWLUbinGbDAkHZDumfWC0gV9trWNHCxQLwhlm3tGNJ
         JDWx1KRxzd4S+PDOHMDYUSnSQLpFPfBCfhnU1M9YsYJWUSzK4Lh62rRbyfGD0Hdx2eR0
         s6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742393440; x=1742998240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgUUdWVOXVECcjb99rFS8YWWBbCUYmB7JwFPV14nrLE=;
        b=qTXMdBVlUdcR2Palkzn7xuDXILRkc/KRU8guC2TsV/hN2xZFjpGiTCeXjR7F5LxZtF
         4lo22W3dIO/LSR6giLLunl8qrs/Zw6OZ1oUQWCA+NeJQru22IXr1rJlCixf8qzjM+xrp
         ILfG8oGZY1+Rn2Jo5yeNCa5/YcEcI0ilsW+IuObZX8GaU54bwe1KvJzHGWe+5iWAeGl2
         el+Zho4l7H9rPPuFqpxracdenuX3Ven1Jrs4qYr7uMJNFYy9VJ7xgmwbz1pZ40G/pkgc
         Tcuhr/mKCusM2uq2/k818A5pOnBCeNREz2mvRCWUm5WAOnE272kO2uvuBnP6jLNxj+K4
         372Q==
X-Gm-Message-State: AOJu0Yyx2Lr74k1GCsjvXAixUDORVLY01PlW6Fli4tWcONO2o3nOARb9
	NClSDnFsDGie+MLvY2GMPQXpzrRhoF7eJfg+0SwuV267TjXB//E5EgFK3w3RVAhZ/TUqkAbsF1Z
	e
X-Gm-Gg: ASbGncv63Gd19v8nS70ndza0VnMAQxgAS9NPWFbvCnYfyF0cftvh/6GdVL+KKLRb00x
	Qgdj5pFDBgfNF9AcHnuI8NGFt76isWMWAW7/f56lLBqxCZiqnSBIdHfqH0XHO01S8v67iKV0807
	zVZYSXJb25F1akOCGy23ZLxV6p5oTu0Jsr83/5YKc+SJN+yrN2dC1O7DmcSJaAbLEE0gbVXxXfn
	VOsw1SAmHbWA2A0U9QGs377AW0Kere89IW5X87b7ZzzEvj7iBEM3WiM5Fh/6yarnlzdhBPK8sO5
	kTwBEaO29yfZE1/v7Wml+dCfa16pSf3J/B5xCxpm7wBnTc8=
X-Google-Smtp-Source: AGHT+IFiD5aueeGk7meU2lorvm55fxKGsWZsSi84i07SdhoKPZjfw58dnbWFAW38RTTaMIYYNWAeLw==
X-Received: by 2002:a17:902:e952:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-22649a39147mr47818105ad.27.1742393440008;
        Wed, 19 Mar 2025 07:10:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b10e1sm11557214b3a.165.2025.03.19.07.10.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:10:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 3/4] xserver-xorg: mark CVEs fixed in 21.1.16 as fixed
Date: Wed, 19 Mar 2025 07:10:17 -0700
Message-ID: <ffa253cba600ab7fa3334e1d4b2b300a352da966.1742392880.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1742392880.git.steve@sakoman.com>
References: <cover.1742392880.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213337

From: Peter Marko <peter.marko@siemens.com>

These are tracked as versionless redhat CVEs in NVD DB.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index e2754426cf..815be6a498 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -177,3 +177,7 @@ python populate_packages:prepend() {
 }
 
 CVE_STATUS[CVE-2023-5574] = "${@bb.utils.contains('PACKAGECONFIG', 'xvfb', 'unpatched', 'not-applicable-config: specific to Xvfb', d)}"
+
+CVE_STATUS_GROUPS = "CVE_STATUS_REDHAT"
+CVE_STATUS_REDHAT = "CVE-2025-26594 CVE-2025-26595 CVE-2025-26596 CVE-2025-26597 CVE-2025-26598 CVE-2025-26599 CVE-2025-26600 CVE-2025-26601"
+CVE_STATUS_REDHAT[status] = "fixed-version: these are tracked as versionless redhat CVEs in NVD DB, fixed in 21.1.16"
-- 
2.43.0


