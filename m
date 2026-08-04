Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCD4C55838
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:07:27 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18687.1785856044226954933
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 08:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tYacUYjj;
 spf=pass (domain: konsulko.com, ip: 209.85.215.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so2587636a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 08:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785856043; x=1786460843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=afQQZephRELQFXctbyZbpF/c+4K6Bgzs0i0b9f1t6GY=;
        b=tYacUYjjRIoGCzGJAv24YeZRbO7tAYr38G++1QjLrpgOIOn9GoGDht8sxHp2teSlRb
         pOQ2moHjf3DUuqAXJj1TQfbWBNUr3wwY0sREdZ3TXj2g68xigyhm01RzBkcpTX7mJdyy
         KR8uah/D25W4aZNRmhne2GyaSHlJ4MYpvMTN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856043; x=1786460843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=afQQZephRELQFXctbyZbpF/c+4K6Bgzs0i0b9f1t6GY=;
        b=qoke8rDNm5dClDecX6LDZly+bbq+QtK+DT8bhdqpqmobaGTGsU+gUZobLzf4EJn7L7
         GgvRI2rJEocQiKGCo5TDKhdsWKL+JHcJ4lAP46eLFR4XLPUNun9acEnTYiFFAGfqd3j8
         JXlUUXiyegMPP2rdyEGv20xoo3buscFz+/uvvqk8xlrS6BCZhWPMusnTOymWUSpIen+z
         vJkg3kGUXejNx4D8DG8X2H+5KMXccf+vyikKFaPvRDeRcQd4H1G0YHx2POTeda4oKq8Y
         x0lbTOV+6J+KhW99VteLuz7arv79/v3oOWHMDI57ypJuw8vVaZAvkYJVwCnG1B7Xpmfx
         JxlA==
X-Gm-Message-State: AOJu0YzD/Vs9QTTplt9popRLa7Qy3AxROxgL/I2qHHAmTMRHWh8W9itI
	HMWQ2Ll6bjNHXsFKM++3tmAvWgYtVZeGZaLQxaF7tWXnrpPfAJGXuV9OFm3yS5kRkFgiIX9IpJF
	ZQuph
X-Gm-Gg: AR+sD100QV2K/PB2v1Sp1NwH7a9ZtLzPX7dE5xZ+sYVL3kEgRvfPUbESdK2bS2us5/J
	+JGa/A8pgiqEmEipQdBMbxsLUhH85pEBZxDGx4ZKlZOHSefBLbOiL1itODvDYzxv2kNEf6kwDpW
	sZIG+nIda5rDXG+L/mG9vPF86yXDHXpWxYVPzeM0KjMgoBRsc7KPMsDFL0W1xZiyQclyEpceviY
	azqaIo797/bOpV+sTgPASfUWqNUrTFw0Ej7oYuSLqf7p9GBEDQSLvH3A+VG3b+YuTukVM1gDD33
	5Tu6TtymabRWjBMH+A8t7ZRlLhH1Joahi1EPmD2Xu9HKtbel7Zlr7ulIvh4m7fMW1UI109AMy3i
	xgljiaCmaNWYQKuJGcbFL2+gFLhOvDYedwU34RE1ehhPa4qO7rs/H2Ve3O2YAKBt3xv/UefRGLj
	1mRq9496U7CLE/3OoQsG31n8xQXfs6LGtRuRYrSueOyv19FMExJ3OiM8LCM6bwVY9Hu8xNjQ1Rs
	Y5s+A==
X-Received: by 2002:a17:903:380d:b0:2cc:aa36:c04c with SMTP id d9443c01a7336-2d052189e24mr148164395ad.1.1785856043488;
        Tue, 04 Aug 2026 08:07:23 -0700 (PDT)
Received: from thetis.home.local ([2606:c800:6024:2000:6808:583f:6e91:c834])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4f35d5sm9026355ad.82.2026.08.04.08.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:07:22 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cffi: upgrade 2.1.0 -> 2.1.1
Date: Tue,  4 Aug 2026 08:06:00 -0700
Message-ID: <20260804150559.2506646-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 15:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242776

From: Tim Orling <tim.orling@konsulko.com>

For a full comparison of changes (2 commits, 9 files changed), see:
https://github.com/python-cffi/cffi/compare/v2.1.0...v2.1.1

Upstream release notes:
https://cffi.readthedocs.io/en/stable/whatsnew.html#v2-1-1

v2.1.1
======
* Minimize internal Python API usage for interpreter and thread state
  sampling where possible. Avoids breaking ABI change in
  Python >= 3.15.0b4. (#269)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
No surprises in ptests on qemux86-64 (core-image-ptest-python3-cffi
target):
Testsuite summary
TOTAL: 1840
PASS: 1734
SKIP: 102
XFAIL: 4
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 189

 .../python/{python3-cffi_2.1.0.bb => python3-cffi_2.1.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_2.1.0.bb => python3-cffi_2.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cffi_2.1.0.bb b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cffi_2.1.0.bb
rename to meta/recipes-devtools/python/python3-cffi_2.1.1.bb
index 718e43e339..455732a269 100644
--- a/meta/recipes-devtools/python/python3-cffi_2.1.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_2.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT-0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c0158ab9b75875f3bb7fea081d388818"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "efc1cdd798b1aaf39b4610bba7aad28c9bea9b910f25c784ccf9ec1fa719d1f9"
+SRC_URI[sha256sum] = "dd31f52ea1086513bb9df30f8fcee9b8918323ae067a3d5b78bc826a000712be"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.47.3


