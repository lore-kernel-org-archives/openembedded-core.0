Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C670C44502
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 07:54:32 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39680.1782892470674690585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 00:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EgPBcPhB;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e5cb052edso32229285a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782892469; x=1783497269; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=56ZjC3bE+objWKmU7nR9bLmAhk9zlEVnPwq8jL42Odo=;
        b=EgPBcPhB5VLR4Fe06CIiT+ZspihbFLZDWMNV0C8TKJ3CdEr4wMDS1xfY7+JeJt49VQ
         lZWtOa3fOJh5J5mUNM5Ksf5pLMHQkI6fvRC46MhZqhZ3ud5O9cuVr3jsUkJfe9iKVFRB
         JqgKu3XL3YVWA0uMDkkcNgOvjo9p3cL01V60XfvTdBkicOtdHmbPVoqSYQyKfDqBMwCe
         jBeXCVweU9njsh5/1xf/Ehvt+Ts9NVFlmXislyZoaoE99LJ8qYW7QzzYt01II0JQ4L73
         RYu0GzCFzbc3tbcyN/3bv+fbBViLEYDTfxlL/sX3wupLhgTYacRPz2Xfqg0zzp2e9rvT
         9CfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782892469; x=1783497269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=56ZjC3bE+objWKmU7nR9bLmAhk9zlEVnPwq8jL42Odo=;
        b=IFSXLzd+Q+nC7D1MOs7H/NGGdSNLamB2ZoCBbj/bRLfqCOVzV6o/l8WzsNBMtEuASi
         aBJMKy1uyZpAOVclU25//yGr+9MfZcS5hFwXzSTDQF+7a2HPdCSUXDMMInxpJN0Jlwg3
         5aLe5VOU/GGwOLDTPI65i5uVNlGsPzPZ8U3Xlqv0/ezTISjlIYcbabGxrcfJ7aJpzet/
         bXqnFdupGtFaejp1FXPF57n3C6jIfDEEVMrePh1oTzonye5uIfYNsUJVz+KQXljRd247
         p3c3VHUn+2wf+1Av6ViXRRaXcTxHmEdEpzIFJIJBqnA3KX3vRUo8x7uzN73ai0C3WvB1
         Gp9w==
X-Gm-Message-State: AOJu0YysOMjYby017PqGxPKm1OniKpyw5j0HL95EIVQpNSl9BF3QSgtR
	QV90s9NEeR1ACk59Qat2vsk4ZZw45TrJvo+AKUZHH7Fr8r3uwNPDAEY+cTzZCQ==
X-Gm-Gg: AfdE7cmxWC45uQ/7VlUwdcSFHD6UwPPDsDtWWlxZ4fOOJdWUM2ye4q8Ptm8chy6InA6
	VMhEr+YgZ1yVJRytV1purzoLB5a+0IRJivF8jx3sewjcYoDTBRo5frr9WKUTjv7+APEff7qH5st
	Nz8XMqUbvBdlM03SQfhsqbVhhxscpH79DPLWSfCmEzxNS/LV+SbzZnUZG+s248w2jK1v1bT+APP
	aNzEJasszQ9aJlbLSSnI8cqkLRwdx/m07Cof46Sy5Vv/5cQ0aZi/zAG1TzaiMrhME3SuzQ+NBSx
	rXDTnamTi1EgdHktrVqj86ttWZzmssa9Mr9lbinw/1Chg/VeQG6c195J33DAn6AI7RpeI4lTMyE
	dkmfnQZh/EG/38/3AoGqgea+GGkA+FgNyGyQRJBMsFMNy2OyEGx3RytK365HAcZmwUVmfatgkho
	bF64dM4rsHRfezd3aMcK0a6eq0HAtb4qPB7y54sOF1I7pjTF+9WDFLsMadW6WA0DWFWA==
X-Received: by 2002:a05:620a:4548:b0:92e:5137:2830 with SMTP id af79cd13be357-92e785453c0mr72815085a.72.1782892469641;
        Wed, 01 Jul 2026 00:54:29 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62371ba1sm502294485a.42.2026.07.01.00.54.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:54:28 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] nativesdk-packagegroup-sdk-host: add wic
Date: Wed,  1 Jul 2026 03:54:11 -0400
Message-ID: <20260701075411.1092848-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260701075411.1092848-1-twoerner@gmail.com>
References: <20260701075411.1092848-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 07:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239952

wic is useful from an installed SDK for assembling or inspecting a wic
image, but it is not part of the host packagegroup, so a user who wants
it has to add it themselves. Add nativesdk-wic so it is available by
default.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index 51e48f250b19..a8e59de4bca0 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -29,6 +29,7 @@ RDEPENDS:${PN} = "\
     nativesdk-bison \
     nativesdk-flex \
     nativesdk-perl-module-integer \
+    nativesdk-wic \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.50.0.173.g8b6f19ccfc3a


