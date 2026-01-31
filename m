Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AADBD79762
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:06 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5103.1769846220443303134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EYe2nbuX;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so21673485e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846219; x=1770451019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRbpdnfCPzXYtV9l9RU5VAF3MvD/TbwGpKBzzr/lkfs=;
        b=EYe2nbuXCh2zBW/mYr7UxlcuEJ2bs9gYasn/ZsHUIXIpyjy6E9ZguXR394S/rukghE
         r9vpsnwwan8gIlSfIx+peKlC2iTtQs/3TXEoCPJa4bJToWzC4ttHQX8Xs4x7oRuo5+Y9
         eQk+RkntrY2qf3uILiO2u1IEfxB65e7+MuLyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846219; x=1770451019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SRbpdnfCPzXYtV9l9RU5VAF3MvD/TbwGpKBzzr/lkfs=;
        b=Beb7fBlJT4aDQKREYTqbRRBTTR6J56t8+A/OoUhfu3Y39Kdi6C3eCegV2XNHbaZXKn
         y/rwVX++J7x48Ekjw8JWuvwk8Ges9zo9I4VXf2kutUv364hPFoG1o5mxGkayLgPeiczc
         4XR01NSvOlEYjR9NA888AR1KEFJVN0AXH8PayxRni8qdxQOYQ5QOwjlulbCM6N1ELrcA
         lfQWYe4nNGDZQv9yDdHvI4C0tKE8M4G7aUQdOHtTseuDKil74RDf2g4ejbBKD6JTTI7E
         SjyLX1nMsK/vhvtX3Y48sVeoxcCDwV70LcSxUWiMpdZLW1q6kOhBaywaepj4gO5XFfQ6
         dbFA==
X-Gm-Message-State: AOJu0YzNothLXkEns0lPu1HtRynjub7a9tVKDT1hyH2BZHdYtUjs4CCb
	VTgShKXm/WI1kpQsatE+raao5v4DOhQ8/u/DFKdY/u2WJ3LdmvBUSO0FSouT+oNpopekMYMXeag
	dsyMYM/c=
X-Gm-Gg: AZuq6aJWQ6P7ZSBchN6B1SRVW4Bxm/G4v4EtuHt7fHc9xOcoYl4zW0+XHw4fp2WscEc
	21S7NB3/SMurmpN1skg3toed+kDlv+C/lkdmWdoX7rC+vgoa0+lT3/YIoXlSuQZr9a3sboY16CE
	1kM6q4aedNTw8DD85bMrht8AeqEduQZ/42bY5lQUUd3Se+WTGcTV5cJ/baUzqcOT/AqnrAn2rtt
	DvKIsTav1n0CN6bf5QlX61tVsmC1S4nwlKfVYaC+Mh/osKI1ylZ2FIM4XXLdvB7mfoIj6Fs2Hat
	EBLUAymlYLb8c+5Lv8zkn7pbZTgw3RGaTwv2fvp+OTBm6KLjyfXheTgtMFGIa2/Culr2EE7CQZK
	vIVV9/eYzGGhByr+lM+xlXmN2qs0x/URMcKADxPSXmIf1jDlJAVLJw90QPIfnBJqpKNuM2yJkZw
	whPVUSXhwrPiyuW3KFGnJdcChrAX5PkHTib5lb/w1p13vlFpe/SHxJV2w9z1BCtI5ksGPLCdiud
	eN/dvVElN2Un4VN
X-Received: by 2002:a05:600c:1da8:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-482db493ff1mr68899575e9.3.1769846218579;
        Fri, 30 Jan 2026 23:56:58 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.56.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:56:58 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/22] zlib: ignore CVE-2026-22184
Date: Sat, 31 Jan 2026 08:56:18 +0100
Message-ID: <70a80c9ff8662981ff442abf1708f6cd21ce6479.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230212

From: Peter Marko <peter.marko@siemens.com>

This is CVE for example tool contrib/untgz.
This is not compiled in Yocto zlib recipe.

This CVE has controversial CVSS3 score of 9.8.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0592c51b6ad038d737d2f6b30977bd0c5c50058)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index 592b7f14229..ef831421216 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -51,3 +51,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
+
+CVE_STATUS[CVE-2026-22184] = "not-applicable-config: vulnerable file is not compiled"

