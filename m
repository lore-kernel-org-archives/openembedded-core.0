Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C41C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:20:15 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9894.1786702806475681211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e2tVO3x/;
 spf=pass (domain: mvista.com, ip: 209.85.216.43, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38101f85591so1890990a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1786702806; x=1787307606; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SpcV/P09Rn4Mk0fYrvHWG0ICth06naF1qCrkoCNlZE=;
        b=e2tVO3x/uxGHulkfRsG7SXVHq2Zgm5i+u+bTg0LY4FKZl0Mkr2W0/O67tyIV0IYIGn
         lG29wywHxZ517lBXAifTL+F8TO0n6LQRHCxOmJPCHfsV1HvxLtmGvnL9E+oiLP7q6ReY
         DdBIYeWLLip1U1jFEjJXnoKOpC2E2GL1iXbqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786702806; x=1787307606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0SpcV/P09Rn4Mk0fYrvHWG0ICth06naF1qCrkoCNlZE=;
        b=DhhLo9L4FambsHRyp880dKwgAlBnikDTrQg7pa/DK19VGCWfbQUToGxd2Yf8wEy19Z
         eDRgBeXwV1phvlCopUVTvADxebXKVPvbRoOkw+wQ5cXDrd1xLGnfUYXre/gLVkBcNKGq
         sYY0pKKVNF81rK6Aogkool9S0O1ndW1UnrU/eKYBnFUp/jdcn8BZneATJvhtq/+QWy2Q
         4MfWXrLf3q9ieLLuPhqs4QKzNJMyIRwoFZ1/9jckXhFIHicmDeiK6NxbViOGfq2zbLKA
         7cFG3gusEtZFwmy8SwTmWHcU4OIGGz3ff7nmvuMbe82bSgPlIOw90j510uZ9M82YtTqd
         NCpg==
X-Gm-Message-State: AOJu0Yzui5V2Wxuu3+zoAKwOw3xZvEQuAf+MpM5Z9LjQhsb+mBuTUh7Z
	o2JoPTyEirtj1Te+T2VFKvpv8hWCf51XORn6InF503Mr/dtfm5zh+3ar8MRL6vZ29mY621N/Pb2
	iz/gt61Q=
X-Gm-Gg: AR+sD10jk9yzyzosVkbSJ2B0IEesTYH2Bd3Nppv9RR9v4TfvDrQZ2f/G6kIn59L3NPj
	Xzf2tL6K82JmODftL6YLDpE+oDkW+xk6oRd7Gtp6AYCOK7F1ehR1ipDDelh45Ndn6xSplgjqfaU
	0GoFo/M4c82U8cSYQ3lmd5VkMEVaB+YeZuDVHD2qN1nvv07se5ci+DM1WecH5uhOJc/Z4YuLuhB
	em3uBbcIyeu/cLWDKuxxURZYuTqqhkfCKCjUxIkjIsforEj/6Fa0roEo3LOZIAMsFVSxQKMjAq5
	pegRoOQjhoGhTyI+zLbv9wWblDV0mRax0Mmyv2vE3fVBQvbxs8Z5U2euFnn3Z/S16DAi0nkHzkJ
	RWDSlJe6zUrdfYXNcpKdSZrPiojD10Kw+DIZrTV9ZxjCiCWgjJw76F3AuNhcQVzOjB0onMzbOSe
	uXB47N5wGd2kqYt3JAOydOxm0gTNasLFuridymAXp+k4y0cK1/p+4kw0/8ZT5VFFOEAtaCYzyHe
	UfdQw==
X-Received: by 2002:a17:90b:3a4b:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-3931f5bb8efmr8829178a91.14.1786702805739;
        Fri, 14 Aug 2026 03:20:05 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1cc4:a7de:e349:c3d5:7c44:1c80])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm7889333c88.0.2026.08.14.03.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:20:04 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][wrynose][patch 2/3] p11-kit: set status for CVE-2026-13757
Date: Fri, 14 Aug 2026 15:49:40 +0530
Message-ID: <20260814101941.873295-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814101941.873295-1-vanusuri@mvista.com>
References: <20260814101941.873295-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243433

From: Peter Marko <peter.marko@siemens.com>

This is a RedHat version-less CVE.
Per [1] this is fixed in 0.26.3.

[1] https://security-tracker.debian.org/tracker/CVE-2026-13757

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3bb664fbba47febc9c26dd7f7965e508870a023f)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.26.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
index ecf7500b13..9219e9eefc 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
@@ -46,3 +46,4 @@ BBCLASSEXTEND = "native nativesdk"
 CFLAGS += "-Wno-error=incompatible-pointer-types"
 
 CVE_STATUS[CVE-2026-2100] = "fixed-version: fixed since 0.26.2"
+CVE_STATUS[CVE-2026-13757] = "fixed-version: fixed since 0.26.3"
-- 
2.43.0


