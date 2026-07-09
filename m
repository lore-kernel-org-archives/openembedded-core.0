Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BDEC44508
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5885.1783591624850747152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LB8JNqjN;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493e497643fso9212635e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591623; x=1784196423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eFEpz6vFYGVGPALKbt8jQw3l7zfKzlUpSXkTawD7/1g=;
        b=LB8JNqjNRIlBa7JQuz0sLaqlFsav1rhyXORx6TwKqffq5sXTbBfrGbhZO8el9cUV0x
         r+DJa4jKKgLY3E1gJJ1UMBVUQR1oweIZOr4wC4cxj+pyoqC0wJ9NuDm2GMGY7NX/+Wvd
         SNVuMw+wK79MER58lFTbRRxOCrfrqfqVqehNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591623; x=1784196423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eFEpz6vFYGVGPALKbt8jQw3l7zfKzlUpSXkTawD7/1g=;
        b=Pfb15EuUlxOEjW448syMU9KyablCXJIZg29e/AdgAcFP8HODw/4ceaSo0pV5u54fjF
         BGLPBpBH3+RY0N4RrhHFcXl/dK3UgwTE0Gc5LHVoIZYn17ngcROceQ+EDa4xlj+Kl+Un
         mDvVJ1024fKQvuwoPUZfgrZZsvEE8hc+LDdxPlXcirO5cupEsSzKpEyPNaK9ba4lmIFO
         rXclZ1Vj+uEeZlz0yaXnRk+j0yo9CBMH5wKOpZ8JSND/0ccAhaHaBcaDWhh13bjXbVgr
         5tiIrIkBuZAWyTRwq88tdXtLHEHWRGdY4PvY8tkV3NGMeTwdMFbEZPUcK7oX1z5CO3ub
         uCdA==
X-Gm-Message-State: AOJu0Yy2kcUnZstQweRUaezN4L71nJ4Xu2MzWocCHbhLPAdUNkHbuBJf
	Wjlwj7KmQV6QlWSL2UNjl6RuyLKMlJNIxV+Iz2MVz6Zt0E4LVQ5Xh17El8yc5tZVvHAx16mRNR7
	YBj033T8=
X-Gm-Gg: AfdE7clJWGl2iFddlTvFu7SGTN4tHFi7IFLDzWQe1ApwErYN0t/hnkVNLCaFEV7Qo6O
	DD5UCZpqp3hJ9QOkRJDPgjg3YtybmPGLIGzvFJn2BatjowxMJqaZLs5I1mjvrn7wvYJttiOJBJV
	+IC8m8oyEUd0+vqRevc7SDfxAQFk5eT/EV7sHwajrfAHEQn3r0ueuhLes0JHNye2ExdXnlFY6X6
	QgFY5fAT9j9Wmw0W5gpyMmCBUJdUIrX2rS2sQxWwy+9BhptSQ+GNECoEgXwyjuup/u0bLbgNwp4
	d6282FvSzGVP5O97MVT8E9Fmth5AYaglB053KlfzOrwhhPYt5vVvirRQ1jXf60SioyTFKhBSqc0
	FIkHpwrDcnrgwlNuxUv28lDD1vlwRW5KfqCEpl8tHxZ/12K5fUbH7FOWw3GpFPANf5YaylK1Xts
	W1VG5tu6/nO9V7uUWB0sah2yrP4Wadhhgltl4Dgh4YjZVmpdSSlF5d+sDH6wzUgO/74UOXylVBI
	xLFC4bulzjP0R9Z8Q==
X-Received: by 2002:a05:600c:4512:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493e6893c66mr61357395e9.11.1783591623037;
        Thu, 09 Jul 2026 03:07:03 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/25] binutils: Add CVE-2025-69646 to "CVE:" tag
Date: Thu,  9 Jul 2026 12:06:22 +0200
Message-ID: <a05c20091169759c01e70bf2e31dd7d0164368c9.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240553

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2025-69648 was marked as a duplicate of CVE-2025-69646. The
existing patch already fixes the issue associated with both CVEs.

Update the "CVE:" tag to reference both identifiers.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
index e04d7ed6c21..e123273338c 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69648.patch
@@ -19,7 +19,7 @@ length field.
 	(display_debug_ranges): Check display_debug_rnglists_unit_header
 	return status.  Stop output on error.
 
-CVE: CVE-2025-69648
+CVE: CVE-2025-69648 CVE-2025-69646
 Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=598704a00cbac5e85c2bedd363357b5bf6fcee33]
 
 (cherry picked from commit 598704a00cbac5e85c2bedd363357b5bf6fcee33)

