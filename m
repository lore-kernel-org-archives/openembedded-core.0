Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC7ACA6009
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5179.1791319474421200629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o06XW/eD;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso28264495e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319473; x=1791924273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=clpYj/jaWNzEmHK8/+Bs4vHh22D/v13iQ6A6LXPsOpY=;
        b=o06XW/eDuEZPtTnTuqwOqeXJxhY3AYttAANjMq1Udj2hr/rXTP1YKfFe/hDxqsjJ5K
         QAeN3YvHwTgoh4so279WXPrrUCJpIvCOd2smagxlYZMzEC+fjV8b7NDNXiBvI1xnGqcX
         EDiyg/cA9oVcvvn7QOTVNNWv8O2Yroa5mv/N0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319473; x=1791924273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=clpYj/jaWNzEmHK8/+Bs4vHh22D/v13iQ6A6LXPsOpY=;
        b=UuAI3ovoHeEPmXUE8gG/ykx48qbBEcKIY4QFfYO7Nu3YfSqbzraaqzr8ZotGaEic2T
         0A8WDk7GQPsaChHA+VC/UwBK1Vg4UvyAaKq+1FTinH/oFUgxrtmbCIpw4tP3/mHxg81d
         E0nGZvjv7+x/sRYmzQK55hn9Dg4VMg4F8USG/nj4x2j7Bwx4DrA7F5UBm9QKUkwEK/KJ
         KrZoRjg+UyduUZcLotsg2lyWV+78Vz40zzycmFV9F+ioyucVgTEl0eMsN3VZ8ICk8rwC
         IZ+924088f6+HeI7gxJwZ2OMMPhS80x7Uu4THI6/8w6SDbl+CSc8OUjQOGC7oBtpj0CD
         Tpvw==
X-Gm-Message-State: AFuF++l6NoZdLKl669IR/4934lEaUITvvA0JupgLEDBILzQJOwqhB/k8
	PyIciTQquLFPszDIfukny0F0AmKWfNGGtWF6QgMgZSLxDupSFEXqYc/x3tJOk9Hde6seM4XKAUY
	IVpcKAs8=
X-Gm-Gg: AYBFou0PR+Ivhpahicm2+BXxlAV5Nk7u8mXggyiocgllgB4yuaUltkSxebw/COKPA96
	G6WBPGTfHxgou/v5s6E+e82w+bc/vM1gQamZj9oKKKK86FE3qF1cXWPs8bj8wK07eeipLcP5pt5
	TTiE3D6zuEvzMxf9wPPNuKXAS6Yf1Csm2ofObGnAk3E0PMcPkPaBKSEIq9FbrqXdg6Is26B/AmS
	MN0fGukWTcCYaH0KDGXf8YCQOCZXjHpTxw9RgDdG6+5O29O34J3uDIGKq9Ee44/0oPbX2wyyXku
	2sC4fuRYfe2Lnop7oo3BwKCs0fXhjk78itC4E2adLpShsGMtri85lgW+aiih+i5RKdg3h3vjOTp
	6jtiHqrDyQWDy2AI+pUiTW1+5D/WhOXaLwjIXqMA//jFpcu/v30zyVT/VTlRZBtHfnGYl96FJjw
	cOmHiTvRmCUHdmewhiX9XEpsMgkOjGytVsiCsPG8jklfXr2eJA9OB0JHFpan0tEs/b/INsPM5HV
	b0Rr8ShQW15qB0JnF7wMA5nLqIX/6QPgxAb1GznfJzYXnEL2Z9pWx7WALJ7cblT6DM=
X-Received: by 2002:a05:600c:5250:b0:4a1:6dca:51e3 with SMTP id 5b1f17b1804b1-4a1800cb359mr988555e9.3.1791319472671;
        Tue, 06 Oct 2026 13:44:32 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 14/18] tzdata/tzcode-native: upgrade 2026d -> 2026e
Date: Tue,  6 Oct 2026 22:43:49 +0200
Message-ID: <24a91aa340b78dfd43155b63075f05b48e2897df.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247351

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://www.iana.org/time-zones/releases/2026e

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 35a0a18640e92bd98eca22ec9150be11daca1df7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 92cd5fbad2f..44872c3637f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause AND LicenseRef-PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2026d"
+PV = "2026e"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -14,5 +14,5 @@ SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 S = "${UNPACKDIR}/tz"
 
-SRC_URI[tzcode.sha256sum] = "2f5c9f7fe29e6b8cb863583667884b8ce17b0a485355a054b591c6bdfcd81791"
-SRC_URI[tzdata.sha256sum] = "0cb2aa8e333c3dc049badc42a0c61f21987b8cd44e107fa900bad764aacc7767"
+SRC_URI[tzcode.sha256sum] = "cc3d27ca2a0d8399504551b920970d80af83bfb9c216e8082a15491921935d54"
+SRC_URI[tzdata.sha256sum] = "b26882805f26aac59d5b222978e6580484b834ccdc98be89df2f05a6dc53a652"

