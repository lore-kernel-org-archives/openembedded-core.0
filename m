Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B86CC6B0B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 05:22:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9233.1775107338913800255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 22:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GCxsUmYM;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so5233045e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 22:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775107337; x=1775712137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BdC10byt721TSx6b3cWr6pgEyRusBHwDSoDpwh+GSJM=;
        b=GCxsUmYMtMtcAnlsQpta3k+eSuq2lGHG84Id6nOk1V23qTLf+uBjqgahiB1uzufr2n
         AhzO5xjIDuR0CuDhwYmZze9pyv/BAaoi8YsRe0hsJB4XFv5f8lliVESIPqKPB4FckuBz
         vO3HpqjqYiOdiPM/RFcH4ndVowk0AWafN+QTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775107337; x=1775712137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BdC10byt721TSx6b3cWr6pgEyRusBHwDSoDpwh+GSJM=;
        b=YpZ5fg+hF+9gy/QJYy1Oh+TrqVOFPkIhHrckiqXl4qAsOCd+11xd7v8JZ3oFtBAj9r
         qfjW7v/lIVtqLtBJga4RFIYwP/tgkWIfX4HKmI57ZTweGvpxTorzYI5Wo6mInq+6abRa
         UaolwCADcA8az6uy+DoYeoPtoQ0Bf6hGh/bcGWDjQPwZwDKZVDSJlTfinSS2v9YIfU4R
         0NCGriQ8ZK7ztFG4HgCFh7IRyMRMcircfHSpA085MFeZjM5H/0hzdZPzZiU5k5PKS3di
         83/hEkRGNZ0MilwmQ1QJMvL411spnocXvE8T3UmjulM7/KMOb8nl/iuMUzqTEkJ/0UEf
         L7dA==
X-Gm-Message-State: AOJu0YyXNyjcaDhzQ7pQeoH1/lt+0xHm/eGQKKnu/wJTQXtH8Isjrfag
	/X4d0y0tJKlsUxuAg25+PFJ8qc4q7LX98vd2VirT8ah4U2ZkTAVVp1dAknStIekD8WNTdQ3Zh6X
	MHYtGFw4=
X-Gm-Gg: ATEYQzxNjx6D+ilKixshuzbLtsqPaDVS3t/OGBn9ODbovfTk+lsxzfqU6C73b0dt/FN
	dQctXI99tlLkjAqgD5zCubVH/T7SrRXmA81uiF4zdxvaNgDUNgN7pVVnLdioZER//aqgpikBvQn
	1LdFvr6ceVxWKdPcyHEw4Scnm03FHDj5X01N0gDMROc06iRwd/o9ok9URy15ZdS2blIwNSxWqsN
	banQCek+VMYZKo3os2hGp8gjkwofUG91rCI48bkYCmBz2SBnQ7yrU8o+aDSf05tfhUjQu5wZbWm
	cuooSv0I4OM2FTzmRq6Su+P0nZx/DF5Mmro3hLCNVEQHWA9xx3KZHdGXNYLm3C4sCDn/aRpn7WX
	M9SeHC6hvVRT7D9LezjIB8alAR7mGhfEb34LAmopN3DTkb4kGCAaE2RcGMVKtdpBdwG+pDZanAU
	mEqyJ7oRjrO5Y4u1VBZAn11iKlJ+xD6b5gavvCmCTs5rVZqmAoKJlXq5E/5x4cUNsXlgtrfp+2M
	9Vb9HqihaiJuOZ1pbVSbO7zSfg=
X-Received: by 2002:a05:600c:34d0:b0:487:2651:dd6b with SMTP id 5b1f17b1804b1-4888359ac5bmr109853255e9.29.1775107337050;
        Wed, 01 Apr 2026 22:22:17 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e829c43sm151111865e9.5.2026.04.01.22.22.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:22:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 12/15] tzdata/tzcode-native: upgrade 2025c -> 2026a
Date: Thu,  2 Apr 2026 07:21:29 +0200
Message-ID: <5f499b815ff4ad073a576ddc5183a53da8b0e72d.1775106968.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775106968.git.yoann.congal@smile.fr>
References: <cover.1775106968.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 05:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234484

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 217ede26d64901d9a38fc119efa684487714c08a)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index b9323432b8d..00bb704e360 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"

