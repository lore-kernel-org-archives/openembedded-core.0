Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB4CD2ED1A
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6468.1768916288125079137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pQFxp131;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so31164885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916286; x=1769521086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJaTVEqykozFwQpgD40GAymuXfXm/85A8TqkFdWDSmo=;
        b=pQFxp1315HykVc+26JfMHCa9cO5m/3LizWB4V0ANRjQs7v7o99NyFpNbdAlXsdqg01
         8wF2sL8icagzMwuy3C7m25bP1UdLYq7bX259zVtTRETMYcH+l5aS/cZTTzpz5pNEKWWK
         jHElNZBgsQ9u13f08wylxT/Jc29JoxL78gM7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916286; x=1769521086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJaTVEqykozFwQpgD40GAymuXfXm/85A8TqkFdWDSmo=;
        b=LZc/IBWFeDC9facoYiVRG6mCmZzx0Z8vG8IsYtJJA4VZ7jL9R8T9PXQZI7wuAWOiOY
         glZRGR2x9PI4rjn97E+GV2yP34pKWzj5ol4pQXAXCEva7/ANQAvBMLP/bH0PxGmAqKBp
         CqRNoDZxQHqGYoB1movlbwpUVkpbjEF1h+vG4JfaHyPa5A/CMkLJhxK/g2E0XK06vW/S
         Zm+vjhFg68ebdLFVSzSbPhVk39wROje9B3OgDcSDo1T+52bocRQbu6l3A56KudhE2LGA
         DIJvdkVUoW5lG4OdhmxS65wWzS4jkoNDgma7E9hFeDGJEfRxuOAhz8620/bIPTAdHZ7M
         kfuA==
X-Gm-Message-State: AOJu0YyG7UfaXeUOBfEf7p00HBa8olgDHneFf8k1I1scaJ2R3NskyBRS
	kHIa9IXgIble+w9bu78zayGdXMocjs5gOO5wkvD6IaJYuQBsqoiScJxjm3gLF+IHCzHEQTqilZP
	S/ER2
X-Gm-Gg: AY/fxX668oiDNccuMe9LWxVgeqV7vLerCrT2fCBn7JWs3fvUg0dQXFh+O06w1095wNC
	T8cdXuhFvLHOUzpQF6ytsbnf8nMRTncw9M57BxU0MWIR0rps/G1HfAaLC13CVZiHo9wWX8a8zm5
	16mwYKIG3jHkzFq3BQTKuL2Gspj7UVVMER1HscqjpqNFW1vSxGgvuF4lh/5qPgf7roBRjF/+ajc
	MuCVjSrBwP/+H0ePbQNrddYEXxAbbuq7fR8QCFDbZtvObRdaV1ufswVJ6HzVKYXN9pCV3eo2386
	R8n47Wytc2RbvJFpqzQlsh63pPdlgA112tAVd+POWNgyn0gUl0Uxl+UrgTK4nomMawj6ignLeIq
	q0ahldmELkZlVelpJe8LemvarbSqldYi72Opc3AK9vA3ZnJ19NDJvzJbMPFo51iwxBRPewjMS71
	keW7f97MeB8jg1VH9gi79jP04vf3MUOgTTC9n2njJ5xZxJUzpf01BMUvtX9NH/adQWxfKObzSPh
	pyAnicwVCx855vcWuzRyA==
X-Received: by 2002:a05:600c:1c24:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-4802590e305mr190785785e9.14.1768916286285;
        Tue, 20 Jan 2026 05:38:06 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/26] qemu: ignore CVE-2025-54566 and CVE-2025-54567
Date: Tue, 20 Jan 2026 14:37:27 +0100
Message-ID: <f415c8d77aa370dfb6b6c83c2f06282a7b9e1b54.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229711

From: Peter Marko <peter.marko@siemens.com>

These CVEs are not applicable to version 6.2.x as the vulnerable code
was introduced inly in 10.0.0.

Debian made the analysis, reuse their work.
* https://security-tracker.debian.org/tracker/CVE-2025-54566
* https://security-tracker.debian.org/tracker/CVE-2025-54567

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2866cbe7ec..764f0e110a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -169,6 +169,9 @@ CVE_CHECK_IGNORE += "CVE-2023-1386"
 # virtio-snd was implemented in 8.2.0, so version 6.2.0 is not yet affected
 CVE_CHECK_IGNORE += "CVE-2024-7730"
 
+# These issues were introduced in v10.0.0-rc0
+CVE_CHECK_IGNORE += "CVE-2025-54566 CVE-2025-54567"
+
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

