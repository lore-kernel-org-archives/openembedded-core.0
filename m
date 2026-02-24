Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACBFF357A6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:31 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21490.1771943130477287340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=M2V30oHO;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso63271345e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943129; x=1772547929; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyy7T70tEVv80aBtX/y0AZneg/375iLG4y1LtwrgLM4=;
        b=M2V30oHOcBHUFZKnaoVpfhUo8wUJVaFiHDqQOw2IghBxzgs8eRDX3PMmcfET7ZkOUN
         pGp+IiVF9defzU9C8JJT2P2aOpRXvCIDnY6q42fuBwtcZG1ENyrDCkzR40lxcy/hSiWh
         QgjZFqgQIUc07e9Ik5YJ+eGdaTkrgJW3FehyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943129; x=1772547929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nyy7T70tEVv80aBtX/y0AZneg/375iLG4y1LtwrgLM4=;
        b=VofHs/W7LLVtpL6kc/buivrq1NvHvlUeT8/k+QBOEOf6RD54jvq1Oc8Gv+8LQ+MuBE
         B/dxYxD1ewOQKPtpXmTRCk5NdICYHOBZIekO/2O2WLro1T0Lv7r7xp34UZEYc5Utz4Em
         zFxa6bluSt8cLtOUJov0+am/wZEqCV9tdyAL6msOHeUxp5t+jKAtF//STQKdI2Eceuxk
         UlftIQmt9xLk/KL1eXq4srQLBlRgbc/oRMqr/Kw2U7/nTcr21XkwL8y6A+KEZOFMcjLk
         E/sHd6sNuyU3TymS2USLb+PWMfBVIVHcU/65qvxYRz2uQ4szpVRBtXDFaPUTMS+nTmJC
         WIjQ==
X-Gm-Message-State: AOJu0YyNEuMvrykslCWEVXsySIGkscOeKggvZSGjktYu1SKmvMn6dBG2
	SvH5eGuIQIyVhwPwlSaaE5yhSrRtHWneRqeQH01s22d6XZUqnAnZeYzZ9fo4rdsbMQnnDNJzE5H
	0z5y0
X-Gm-Gg: AZuq6aIQpwR5rGQqlb9wI4Skc+UF2IfcGF3o+57rS6ildL3SHJNd9DR4MrYJ5cCN0Xa
	42Dsrykxk9WkAqrecY5qzqGdk8ZNdPjp7jAzAwU5fdZudBCccOtq6qppzWsySmep720G5LmS9yi
	J71rsYNGHRnTJFYHS9Hk1WZPeKDQvMu46Ne5cNVmARSr49q56eD2lq2L5tjnTKtzrOrWpYVxRkq
	lrl5cTY2cILBqKRdbVxPAoAKXoi4FYGir8Xq+C6WTg6RGO7wh5GYbugkMu9QQpHX/6rKZrIXUY6
	6wu009rSl85jGgwW2hnJfUzvsoBm5u7yFBIFj/GxKM4lSULsJ1+IFt/Vwcc17+bhQeSulkqZdwy
	WdSmBnhgR5VUZTTxlpfhsIAAHl6Nc0FEDkkVLPzvya5swVdfJUSxobVQ+seFPDMkZD+bnFQKYeN
	cV+VBNl/t6xrxpWIZ11tyrduXsFSmx4/xxCPx709/dGUoXq3MrpfaOx9OrnJNWvN45NWpLgP2ZB
	Srofh9DN/W9cuJ8Geh+CMY4BMSmRU4EHg==
X-Received: by 2002:a05:600c:8717:b0:483:612d:7a5c with SMTP id 5b1f17b1804b1-483a96375e3mr199885975e9.25.1771943128497;
        Tue, 24 Feb 2026 06:25:28 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:28 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 35/38] harfbuzz: ignore CVE-2026-22693
Date: Tue, 24 Feb 2026 15:24:27 +0100
Message-ID: <2a4ccb4257b8f8a1e66e4307f331f26877fbc003.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231801

From: Peter Marko <peter.marko@siemens.com>

Patch [1] linked in NVD report fixes issue in cache code introduced only
in v6.0.0 (as can be seen in tags containind that commit).

[1] https://github.com/harfbuzz/harfbuzz/commit/1265ff8d990284f04d8768f35b0e20ae5f60daae
[2] https://github.com/harfbuzz/harfbuzz/commit/7a004a7ac27da776b623c0892ebced3d12213c39

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index f7dc61ebd56..f4e90799228 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -50,3 +50,6 @@ FILES:${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
 FILES:${PN}-subset = "${libdir}/libharfbuzz-subset.so.*"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# fixed-version: vulnerability was introduced in v6.0.0
+CVE_CHECK_IGNORE += "CVE-2026-22693"

