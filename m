Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC82EC54FD4
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 21:14:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21866.1785359682662976084
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 14:14:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VSP4u41w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so920061f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 14:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785359681; x=1785964481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5pLF0jXV+t5KJQVSD//BL24k4o8wgZFhrt1Y4GCCfGs=;
        b=VSP4u41wLDRjgcCD7aV3Q8OCWk8ebVLFcwjRZCBFoUBjAq2yXIziz9cYWmWcRE8UFW
         ViVHa7Ezk5rLWQsj9jW0ADMUjCJ80LmkWRe58ISp6+OgptcmNpnVr3ZwdwNfnE5DFC0j
         BJHB1m2NO+3BPwk23fhz7X2F0UMnqFAuZWJB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785359681; x=1785964481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=5pLF0jXV+t5KJQVSD//BL24k4o8wgZFhrt1Y4GCCfGs=;
        b=HhFINu1RVoULaUKIhInS2aaK2uT/iJ3R86x4W7vUo0RTMaASNPwvLXzq4kuU+gHjnE
         sqrv+waxKjx0/xbLsMFZL8gKbfXrAvcqrU+GzS4/puDp4Y9oqERWBz0a+qSicrT6inIN
         HO94/TYS7pWZIvQaPp6ErIDUWd/Iow73+jeR6SGQ36TyoDTzZC/4bqVdV0Uv132m0b8e
         cH51QFQHW1l8oE3HBDv26zr2SqtMC7mTl3EroTFT19hivaPDGw2SDp2yUi+bnJBZtIgR
         /RfzZYx6Qsc2j42diJQ+K8wTAwVBsQstXf7MVvegx2Cb7uZjbiWjbJQLzEZ1Uhb7dK2A
         SPCA==
X-Gm-Message-State: AOJu0Ywoq1yTxXqtO64gRDnwegEnHsjSm0An0n3OqIJcaK5N+X+bwDNG
	8m76/WRk1Farpu5gl+/s9LR/saymMjjpUYfwBfSpa7YoZO5EjHDEAUElll4UVqYfnIStEeIiNEL
	T3Q9wQnQ=
X-Gm-Gg: AR+sD11UUK+olFcJRR22WhiKoNiNZvBV+KgY+OPOwMRf6OZ5kd74WWt7ezvAxOR0tIf
	f/4sPC+y4CG64cpePXTO1NAUkOOaeHJi/mEBaDoXUCpDoYQD0+fD8oaG+/0gjWjG/8YpwagnvGY
	Uu/B1QT0oUyUTq0tkUpAeCGJV8Du3AhZt5UuCLSlJzimTMwoU93pa1TfElN81VXgMMjPiJPoVCs
	d4SUuXXkme8tVPbM1zuMku0ule62KW1pvEvIJxGQU0x4RKwDSBMHqdAIWUB+UUEOWnLsH83r3ly
	TBrMJfb7xc94nF7p5gReuXIP9l8vWU0OdGDDJoSUcK0Oc5FQSfQ929Tm2UEhztc5xXe9Nl+qykV
	tMs90AT0czcDNtrInHVzxilGobNqOz2J2hLkgQ/DiMhuRPbskvKvM7EvHkhtsXcurTLqeXP/Aku
	toJcTJm6fTpQygYy8kNKDriAla4OjMTIowE45jq+r2rhaE6i7duNQ6ntQDLMtPftWE8f+E94jsP
	UCrEkVKN0jnv2XKsQ==
X-Received: by 2002:a05:6000:2001:b0:475:3a97:8e3c with SMTP id ffacd0b85a97d-47fc654d44fmr504089f8f.18.1785359680903;
        Wed, 29 Jul 2026 14:14:40 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3647:86f2:68ea:efc7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a94sm11277116f8f.8.2026.07.29.14.14.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 14:14:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] libmicrohttpd: upgrade 1.0.6 -> 1.0.8
Date: Wed, 29 Jul 2026 22:14:31 +0100
Message-ID: <20260729211437.3394641-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
References: <20260729211437.3394641-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 21:14:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242287

Source: ChangeLog

Tue Jul 28 06:12:03 PM CEST 2026
    Fixing additional vulnerabilities inspired by reviewing the
    code for similar issues like the ones reported by A. Ramos;
    expand the test suite to cover these and other issues.
    Releasing GNU libmicrohttpd 1.0.8. -CG

Mon Jul 27 06:12:03 PM CEST 2026
    Fixing various vulnerabilities reported by A. Ramos resulting
    in possible crashes or out-of-bounds stack writes for certain
    requests in specific configurations.
    Releasing GNU libmicrohttpd 1.0.7. -CG

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libmicrohttpd_1.0.6.bb => libmicrohttpd_1.0.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_1.0.6.bb => libmicrohttpd_1.0.8.bb} (91%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
similarity index 91%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
index 30344bf13f0..998f282a35a 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.6.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.8.bb
@@ -7,7 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "bb5cfcadfc52dbd5eb512d6e2995e0361351c33e97a87aba426d3a4a7ba6cf70"
+SRC_URI[sha256sum] = "0763970a0e39f8f382123366e3cf5d03f70aa1e2208d3101e84da3e2cd674703"
 
 inherit autotools lib_package pkgconfig gettext
 

