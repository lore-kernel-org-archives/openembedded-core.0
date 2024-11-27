Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D9AD66BB0
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 04:11:57 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.64879.1732680708750250067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 20:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZUzW6OoN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-724fee568aaso3434131b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 20:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732680708; x=1733285508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvN2nF3bynpO9E5Vi9Z641o8yv8xM6mFv+CxxPnJves=;
        b=ZUzW6OoNEKYhmKD57B3ZLWyeTH1mpIcUaoCdzuUVP00MXFoL17gscZUUVJYoTD+jFY
         b7VAQSltQjwRxBO/8yigUZ3Ofidyp39hopvvQ8VwIVxXADqxdbR/0c3SkI/T6+Go3v4M
         iJ8sHAuVG016zHvykQzcDSOIFol7a8bMQg7Cr0HmU+G5dJsxuEVwnCNFDjLHlwch3hWs
         TbCpZXrSLAtTe0vCb8H8tBhNZXtbBdcg5Nf20Bwo+s5l0/F1wodxFie6HxdMjLvOq7jo
         aSImwkwacus+gO5mhiZXiXfkmNV+yBs64hanC/LJKhKSjzxWajQZJO+YL83n0NnyobO2
         t8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680708; x=1733285508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvN2nF3bynpO9E5Vi9Z641o8yv8xM6mFv+CxxPnJves=;
        b=RU5AHqXs0YEvAekaPPym1R4+1A4SUKiW8IQ58g0Da5fnBfbxcDhyqi51t8OynkwMJr
         CDbumtROezdSOT11M7sZcQaUDAw6C8CFL65pVwCodlxQov3wsbya2ANLUnBkByU9aTry
         kMg0hNZS0XvtQ7yNlFqiMEJfOW/f9KdWvcM+NqGsG7WZEIbsSLl8T9HnEM9/0v2Qk9JE
         L7i4yGLLO4I8g1b09auSKFlr3LbOuC5MhPKPay8Rdg56U2wUU1sULQ+yiHn1jmiBZx7y
         /lxHVv4EAm9OJ0JeHzeuvp3pAyhJqmJ5Q59HaBLfT1xGFm2HAjNkotQd0KPVCpPg71xj
         89HA==
X-Gm-Message-State: AOJu0YyvuasXbFNUjM+faOMsU2PtfjT9xn+aCcWmt9hK1xEmMMQlKSRv
	Bifmvm0xRUL2333ZdVsnHNylpwWYsPkVGzbvkS6weuCxljtyzeZlUQEBnTHXnyvxs3x5Rcdzpkl
	p
X-Gm-Gg: ASbGncsbHUSa7w0yC1fgBjZJVncQasssck9wb/Dbf+ALD7rBuaoINC2R/59o2qw1+Ud
	82NJakrOBi0UJ0pGm8piNrGRbnHbtjaa8QkXdAbc950yAR9765VIGWi2qw3ZFQCDmHYSEi7Zq4h
	yUASsqigkY93hjJgEyhVCEJQeGgTjpPqRSAsMvJiHH6dhHZR4OKF2whYW0Q3wQx3+Iudun/8F7J
	QRHRmghoB8md2X+Xra0UbVdmJKehift5LjpXN0=
X-Google-Smtp-Source: AGHT+IHV+lcQWQltsHGd+ZcYwyjwOroAIWWSqCQ2DpScyG3yxN2crImqQFxDf2+nm+Uxdl32qmTSGg==
X-Received: by 2002:a05:6a20:1594:b0:1e0:d618:1fba with SMTP id adf61e73a8af0-1e0e09cc482mr3106903637.0.1732680707847;
        Tue, 26 Nov 2024 20:11:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de485c84sm9240796b3a.80.2024.11.26.20.11.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:11:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 03/18] tzdata/tzcode-native: upgrade 2024a -> 2024b
Date: Tue, 26 Nov 2024 20:11:23 -0800
Message-Id: <eae95be63db899ab2e247d823149e89aea6170f7.1732680538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732680538.git.steve@sakoman.com>
References: <cover.1732680538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 04:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207897

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b84b29b1827624270cc1698feda2ee87d55c01e4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 4734adcc08..adf095280f 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2024a"
+PV = "2024b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
-SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
+SRC_URI[tzcode.sha256sum] = "5e438fc449624906af16a18ff4573739f0cda9862e5ec28d3bcb19cbaed0f672"
+SRC_URI[tzdata.sha256sum] = "70e754db126a8d0db3d16d6b4cb5f7ec1e04d5f261255e4558a67fe92d39e550"
-- 
2.34.1


