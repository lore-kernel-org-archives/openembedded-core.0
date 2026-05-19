Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF58DCD5BB7
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.951.1779233430284371021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RCe+9KfZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so61880665e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233429; x=1779838229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdDcbjtZW60Wr2ec3qnImoJ8Tf6fQAzlWlAChPrpwPE=;
        b=RCe+9KfZ7i83IQlIhlGgymYmFZnpem3ZxUbOH2yTHJ852s6TBIQousXWYO9ccXevbv
         OgcrA6RVcIp8bkPzkHmAdOkUqw+/xXznfODN29I8zGH1/RZc6cCHDaRuyXK6c8a0K/Zn
         SkswaBzZLgXtF/Ezqlh2C3h1kn47l8dbr0bjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233429; x=1779838229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UdDcbjtZW60Wr2ec3qnImoJ8Tf6fQAzlWlAChPrpwPE=;
        b=HvxiiKf5O/vomOVuFMdyK0YMnHLuK7HYK/FBogGdJdFjeBSWtztlTT/L80bS4/pMeg
         yH+Qe+U5A1+A0/HmfQ3oOK7BTEU681nlPOjV/QmFH82eQN9R/jkhzv4FHiRTaV4cpGPL
         3pJxXASj3UV1jg5zRUtBEk1MGc6Bmgwhm5n2yy8PNsvbwxs9c9OTGZmQtDAPsZ4n0wpT
         8ZCFkB2ozzlITHX1wZ8i50PTNnLpWwiNmiYDJuKPEEo2oR6L9B62V5UFbwe6RHjCJLEF
         juQV2nwVjSuNYTjtcv+mBbn6t7v+5JWsrMtycCn8ehuUQHGlBj9xpQtWxZL9jPNiBckr
         xM0Q==
X-Gm-Message-State: AOJu0Yxm7gICqtD+85fUAiGuaZE11c2+kI3vZ2+t/p6IYWflVJfOpvDV
	hHcX/oXb/NakHMvUePdWmGTNtKh6t73wA+6wtaOEqkH/4NbCtbe5NQXLSBRfX93CPKh+/t6OT+7
	63BrH
X-Gm-Gg: Acq92OGUv90X4ZRpH0zw+TtiiYbcqcut2c0dXCzDZtW8VmjcqgVhnIojnMM6KxDJ641
	fYMFPQ/wfLDaAM/wjYqqmiNdrp4p8C3iUKqUpPYi5+/X+Pc3rwaoEqImI6TOL65P9LpKkQZLCdA
	Lk5JH0/q/Tl053jPC37f56KJk4cWKRTmepUWgUgy4tHYjB/oLh6GF+CoLYJJ4Tw+4srcwksz1a3
	y13XPYABbCrM24kfJ8HkzdWSKPvtdP6ynEe3M6+pmP1ASwXi3OvKV+d2EiLElN/gGi8p1mE4g7Y
	2t2himCPzUosvipTJXMdPm4VdCmdBv9lGad2p5xVq+zsCCfrBMf/Kz+WnTzkBBZQYwV2V49d9d0
	LlJtqJJgh3ddsux+Xc8wP4jpfAgt5xGCCgMlzMAfNJv82bWA4dOqwU4jK6gj/YP1crDRm77sQjU
	Q2PcKKFOL1wl9TETroWD+5y3etkcoBS3W6Dot/U/11j2UyjOohtb1TU7T5z78ys2auFftZmLtcG
	1ncK8vVRgCOprLk3+vrhaNBlBA=
X-Received: by 2002:a05:600c:3f1b:b0:48a:7965:b943 with SMTP id 5b1f17b1804b1-48fe661db6dmr324476465e9.29.1779233428721;
        Tue, 19 May 2026 16:30:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/28] python3-sbom-cve-check: Update to version 1.3.1
Date: Wed, 20 May 2026 01:29:42 +0200
Message-ID: <f8968cff873aadfda38707eb0b72163df3829735.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237352

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

For details on this new release which fixes various bugs, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.1

Also, update the LICENSE, which is now GPL-2.0-or-later instead of
GPL-2.0-only, to be compatible with the licence dependencies.

(cherry picked from commit f8bdcebd01a16adb4e5d5a89c6b47c5f0af1f5a4)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...bom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} (76%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
similarity index 76%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
index 96fc167ecbc..8120848a667 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Lightweight SBOM CVE analysis tool"
 HOMEPAGE = "https://github.com/bootlin/sbom-cve-check"
 SECTION = "devel/python"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "dad6f9df848f6dd7b69922baef0ec187b66ad0847fe0cf62614529e27203e842"
+SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
 
 inherit pypi python_hatchling
 

