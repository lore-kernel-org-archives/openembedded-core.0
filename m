Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217BAC021B2
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 21:10:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.7190.1739913014752393298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 13:10:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GEijPWLY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f42992f608so9137117a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 13:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739913014; x=1740517814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1hK9OxgZH2uRzdbYDEhbgoU+OMVNsF9lzvVyIuFJsw=;
        b=GEijPWLYDMuUwTf/RbewUZmJ3eLe4zBZ3ezqMz92lvW/ddWaH23NAKGbtTfP22O/s6
         jYZWCuwNebgVfSMJBm1fV/pHXDH+f8cokY3H4NWbMqQmRHBl3Uqj7vhgt3XN+U+T/aE4
         yhOEGq1p02ytoEmxAnbNxHfWKwj/r9oC4mft3iyQ6119j+ZL+rL99N91KejxoRKy7XXA
         WWQon0OdRNC0a1S5AQAtphPKZHLKU3f6lJmrDXtwf/PWJ+g58g6s28Oea9lullZTnUmW
         vE28UvPZEBZ+eTGzH0TPSumHqHeEKtSmIrkP7SbWNYnOzrFHsOmAcY5dPii2gZHjgXRX
         KU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739913014; x=1740517814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1hK9OxgZH2uRzdbYDEhbgoU+OMVNsF9lzvVyIuFJsw=;
        b=Qh0lmSkxSPWdT2VqTVkVdl/JttL6UhkXirC7/PlqaSbCTPorBYo/H9VnfuoSx9KmCG
         bsYFwLGvDBIiiNNDOwjPrUaLJ6aEesBSB3p5IrIMoPaUpnD9cpIsM8kS10Rtcrjn5pI4
         SDlYGyEKTOl6vA8ECC9+Ikw0z2D0YhBHfzkDjUaH/yPo9U/MgLXSZLVpflFnRWFYsqPD
         JB7lFSlGiBvLYnF5nUYvF1RmuV4p+u9NuuygfJPjY9HBZSEED2lvYo8BMCBlHegxaLGl
         17oe+1Y/mVgMNWTD+tyQcuAaTicu0kU79PIn3LuwaF1fN26JnzG5kzn+KGibP5PKhUic
         hYTg==
X-Gm-Message-State: AOJu0YxS59FwilKcDHFamIxbSnJx8SNAlyJm8k3gdfjxMdmdVPz6+WjI
	fgEe1McY2B6YvlImdvk8oMvm/NSGsBTELLOSnny1CpY6LlrlAMmyneMWpYQVQ3xxWSr9OvEHSqv
	c
X-Gm-Gg: ASbGncszMJZUX5SunD9+s3eQpRyS95VyK+bh8M7HgqSFByoM7lFAk2RKcIHXO5dDiQv
	+CQ9A+hTdy3751hqB2aBJEptGWwX+HFIolPCqeERCsdO/Pa6ugYZndNiLrXA8OQVEU8JjdzN1Ej
	Frmb5VP+SlyJw5CIqaWmQhoBSff0nXHJUfv0VMmXoXq7AF8EQhux7dQRfU8XxTdQDkfKq8jlAvf
	LS5+vGELD3qNPIUii9gd8Gr0johlLUNfJ68twH9miXOC0HfHauEQbDmMaZWiXNvf0aOe5pbnpYk
	6rBMLG4=
X-Google-Smtp-Source: AGHT+IGwNyMvj12feUyfTj6VkT/SSFjv7HGR60gFbqf680ECpUKihHBpRPpg+2IVP9xBkrt5ENzRfg==
X-Received: by 2002:a17:90b:1a87:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-2fc40f10271mr21462152a91.8.1739913013995;
        Tue, 18 Feb 2025 13:10:13 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:83c7:94a9:a555:bf05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b326bsm12820720a91.1.2025.02.18.13.10.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:10:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/12] libpcre2: ignore CVE-2022-1586
Date: Tue, 18 Feb 2025 13:09:55 -0800
Message-ID: <063be7f1f3d9abe61a1eb2d71eeb548b4eb760e6.1739912869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739912869.git.steve@sakoman.com>
References: <cover.1739912869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 21:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211641

From: Peter Marko <peter.marko@siemens.com>

This CVE is fixed in 10.40
NVD wrongly changed <10.40 to =10.40 when adding debian_linux=10.0

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-1586#VulnChangeHistorySection

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libpcre/libpcre2_10.40.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.40.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
index 74c12ecec2..ba5f8cff32 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.40.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -19,6 +19,10 @@ SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c
 
 CVE_PRODUCT = "pcre2"
 
+# This CVE is fixed in 10.40
+# NVD wrongly changed <10.40 to =10.40 when adding debian_linux=10.0
+CVE_CHECK_IGNORE += "CVE-2022-1586"
+
 S = "${WORKDIR}/pcre2-${PV}"
 
 PROVIDES += "pcre2"
-- 
2.43.0


