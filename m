Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56063C79FA6
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 20:45:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2596.1788641130080495228
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 13:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=k+hFOQp9;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-485843aeab8so2346677f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788641128; x=1789245928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Nuy8dWkn8fl8+oMdwhPZYfIZs6HVlQpH6ZKqVpHSHM=;
        b=k+hFOQp9+mOmRtRJJuqTNwvq8tVaIqxD0GnaIHhhwTsa0gl4qao0Xplc0XjltB3sge
         ji6EmPNmIYUNGgKgFrUpoOHXUrDoT6unsaFj6vjITa0DAHOPSaQWr5Bon6p4UqatWGlT
         q8jEL46I/WEuEiEK4cAYd01mUk4t5naW8rmvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788641128; x=1789245928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1Nuy8dWkn8fl8+oMdwhPZYfIZs6HVlQpH6ZKqVpHSHM=;
        b=UL3ydumcVkiFrV3QYrvRI+zhaxJW7nzfR48oZR7ivnciQSwa3075yoiSXqAQArbPx5
         zhi5yD9/Sm4/UXZGMYpsnSiNG/v7U2sVOIRfW67NGKf5oRDpS6ZUMofJ5HASltclEn+G
         C7Txn72JrJW5U69KmgtLpVyqbP+yu9guPvM/F8i1bLy7UR1NNL0EB/06g1Tzx1m2sAhy
         0YUfPdjfcz0gEdlr28MSzuTkas/tUm+8p9Ya8MtFitWA37bZbKcwqZ/X2HxMz2X8ENIl
         KXTR4nD6r5pNU9N7B87ZpJEDBqMEur8qgkz9Suiid4UYauOXX8mIhNsgzua/ivLA+KAN
         nVTQ==
X-Gm-Message-State: AFuF++kYb3JwGsJ+iTqkcQo7vXHlY12MIdH4Qtor4kSki0A7k/0HXHW/
	80dRUBu7vLV6R/+AErYOramcud5x10+D/Oqu8/Q+KLH+15CSKm8Cr28h+12unyL3rcVlFdCZ2kx
	2CRsGpL0=
X-Gm-Gg: AYBFou0Y2v/NXxHzlM4foJBU9Y/4rHciQvDwMdF8htjhOxYF0d0UxGp650mMgK0EQF1
	AB0+0C1HIYYKTa0SWkgUs7MbsyInFgie4OVDIUQviiNOLTC9F3anepMQQcm+sqFFraTnE+Btyh3
	CivVlfJ8Df1y58qYR5znFPTsnGcJTJw2Lr7FpQmeFqeNLZrDoj/GaRZ/R4XHC/RxHt7UyRI5SZp
	fTzUkztj6NwyGxiyjpMid12NJ84w2BwZair976aIggpp6YSBFHKkxH/FrsCPdmaRoK7Ls+1KsJi
	G2vyIvzfLLIN+n8ARgIlsWQlqh6fZ+efF4ZBmpNNsQOxmMy+SHn7tYrj0xxkAxca+vUGlurEJYI
	YP3cgP3DibjVSGrxfZOy4Ku8BznvabPphCRp+GkaRni2YQVFhS7bUnFy2o+maePZvv/I2iK2r75
	wQwSqrzhOB2VA6lKys4xV+g12Vu2Yzn/wn7wDvifmUAfLptOmpoFyVUbQsXrosqutnOkculFlpI
	e3871s4t6kJ5N0TRaGAc1KAJJZdsAdC2JZE7Hl/smEQFZF5GuxE3oqh0UFKcPeUER7yf3YsFUMN
	+Q==
X-Received: by 2002:a5d:5889:0:b0:485:8b5c:da26 with SMTP id ffacd0b85a97d-4858b5ce16cmr23827162f8f.11.1788641128361;
        Sat, 05 Sep 2026 13:45:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm17069098f8f.34.2026.09.05.13.45.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 13:45:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 31/40] binutils: stable 2.46 branch updates
Date: Sat,  5 Sep 2026 22:44:32 +0200
Message-ID: <77f7ea9abe58ecf0af7aafa53f195ac2582cedec.1788629392.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788629392.git.yoann.congal@smile.fr>
References: <cover.1788629392.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 20:45:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245183

From: Sowmya Sathram <sowmyasathram12@gmail.com>

Below commits from the binutils-2.46 stable branch are updated
on top of the 2.46.1 release.

046eeeef472 x86: Check XMM destination when optimizing 128-bit VPBROADCASTQ
2c77fbc7007 PR 34204 dlltool SEGVs with --exclude-symbols
38093d82a3e Re-enable development on the 2.46 branch

Test Results:
                                  Before  After  Diff
No. of expected passes            327     327     0
No. of untested testcases           5       5     0
No. of unsupported tests            9       9     0

Signed-off-by: Sowmya Sathram <sowmyasathram12@gmail.com>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index cae7c1c872e..f798d6f1a00 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -23,7 +23,7 @@ CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release co
 CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
 CVE_STATUS[CVE-2025-69652] = "fixed-version: Fixed from version 2.46"
 
-SRCREV ?= "5e56594815854de5eca35c7c04b11705d0f19c02"
+SRCREV ?= "a9c090db342ac76f10bc47258ef8e58f7eaca748"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \

