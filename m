Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF7BCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 16:48:19 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.1271.1758300490600477740
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 09:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=pvd9GHTK;
 spf=pass (domain: baylibre.com, ip: 209.85.160.194, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-4b79773a389so24110251cf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758300488; x=1758905288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foBghxkZySE73neVmlTg4uqQOAUl8P2RWjzghOcO2qQ=;
        b=pvd9GHTKLCWNOfJKMdXUGv/AjrpzNVs10GO/fGdquJFve+vJqrnDGw53aLYcS0lgVg
         /Mc4QJ+S9GYM7HvE0089wCoYU1qI9CiPxVLvGZ3BZ10ad8yy2h8mxC6JoDEgrD2MD2aC
         RSxQH2wivQrnwUx9ZfIn+5JT6d8NBS9dlXUexqE6SnGwAAmJHhjm/JBUGkWnlnoBzUJf
         0L/lB6gA+pF6olvEnP1Ps2fPvxB7UH7Nsi5Uh09ybjLTFM3SwSrZdTdxnQUTLPBK3vSv
         AUl9XcmFoSjgic5pt+iGilL0QNPBSzvyJLyIzdEtXNV7wienLQng2Uw1A0vwnOksuZnC
         0BBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758300488; x=1758905288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foBghxkZySE73neVmlTg4uqQOAUl8P2RWjzghOcO2qQ=;
        b=DvpmXboTKF8lMy/Hom4gHJ4qraRk3QPorTyHkzhgjsGAWPQnB8Chc9geQ4ik2ywX7J
         tle2lb/3QUynoTshMjK5jd63WW8mADw09opEh5tmYrdxOpeeLwKSnCupfPaBED3p0UEN
         BlbIf7CpKUq3DQDKBoWMfredkj28Tn6VLl4k87z7n/ks3JRGYc23AfbEVGZUCOggcObC
         m1p20c71JI5YJxXSsXSPtMLG/JUOtmrZkqJW6KJqmyZsSbgYtLSQ9VBW4ShmV/KcYWHt
         Rwz0Qzd2i4WSlYbZ6H93FxNqbuaNPn9wKPeftlT5YojSgBRSovGUKEVSs39c3gXrov8k
         Jgpw==
X-Gm-Message-State: AOJu0Yz6VgUnw7dMP9TzWcLwxlSFlTILC0QnjZuaMLbg/obHAlyqhxnn
	VpqB0J8q/N7dReiI+gkBsS4gONKj+whEti6g1L5VCjUZlu1trnwg1rWDp8Sl305rDeraAuhJjRW
	dBk6YtPLFjA==
X-Gm-Gg: ASbGncutL0j6pnsdsiMwAMw3eedd640L16YTYvdHWZMLlssp5TNII0r2FlN+BJPu75R
	rIhWqCTCi23/12E0toYiHYLwJhKtfTeWW4ngbxIjdyGs5bZqcBL0/HPhKldbfnZSeciOsDMielo
	C2z2Jp+zdKa6taRcAwIOpE7h1QfFnCd0VTwZAGu6E84viojq4RDa3BwZVU2qQIyY4Ilr63IwZy4
	65QE+ztGi7zasteWE+y6TvNbOBQT2B13ZhFaYVN5lFdKCDfGSk/ondxmZuI3+ooK3/Z46U5r2tM
	pAfdM06PLYSztewKmnAVhaKoRXVoupzfd+HELe6MLS5cNhu+96cSM7762vMWSZwoZf2xroDKz+t
	Ck+DZHxeG/JzTMyWE+IDR55S8D8xT9t2lrhO8Gn5O2NnhZMyMf86vnVTX6b6Psq1s2GrL
X-Google-Smtp-Source: AGHT+IEsDD0aaIShasO9Ozap2WDFSFhdC5rLySmOD/HsYj1rQC0IGwYAFxMBCHe5ecJtx96S89mnNg==
X-Received: by 2002:a05:622a:230f:b0:4b2:f4e5:8eb1 with SMTP id d75a77b69052e-4c0724868e2mr43986861cf.55.1758300488571;
        Fri, 19 Sep 2025 09:48:08 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4bdaa0c5156sm31068521cf.45.2025.09.19.09.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:48:07 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/6] python3-numpy: upgrade 2.3.2 -> 2.3.3
Date: Fri, 19 Sep 2025 12:47:59 -0400
Message-ID: <20250919164803.3174518-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919164803.3174518-1-tgamblin@baylibre.com>
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 16:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223761

Release notes (https://github.com/numpy/numpy/releases/tag/v2.3.3):

The NumPy 2.3.3 release is a patch release split between a number of maintenance
updates and bug fixes. This release supports Python versions 3.11-3.14. Note
that the 3.14.0 final is currently expected in Oct, 2025. This release is based
on 3.14.0rc2.

Reproducibility seems OK.

ptests look OK:

|============================================================================
|Testsuite summary
|# TOTAL: 48954
|# PASS: 46490
|# SKIP: 2426
|# XFAIL: 33
|# FAIL: 0
|# XPASS: 5
|# ERROR: 0
|DURATION: 169
|END: /usr/lib/python3-numpy/ptest
|2025-09-19T15:20
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3-numpy_2.3.2.bb => python3-numpy_2.3.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.3.2.bb => python3-numpy_2.3.3.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.2.bb b/meta/recipes-devtools/python/python3-numpy_2.3.3.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_2.3.2.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.3.bb
index 7ef353c420..dee3bfaa44 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.3.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "e0486a11ec30cdecb53f184d496d1c6a20786c81e55e41640270130056f8ee48"
+SRC_URI[sha256sum] = "ddc7c39727ba62b80dfdbedf400d1c10ddfa8eefbd7ec8dcb118be8b56d31029"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.51.0


