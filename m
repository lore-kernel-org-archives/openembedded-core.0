Return-Path: <skulkarni@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A6FC5478C
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:00:00 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.9593.1709031599878176125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 02:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CCW7a/hf;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: skulkarni@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e459b39e2cso2464066b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 02:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1709031599; x=1709636399; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqs8JExcrin4TGNbdk3Rwua3GLAJL9mhwsZdsFrf6hI=;
        b=CCW7a/hftfYPIgNqYijh9EYAf6G/gtSXZ4PONhVdnhjt+atvkQicfaTBulpkbZu18L
         z2kT/YqswsWEpi9n5oOv2Nz1JcVkQvHwn2xmTI7cSSmICQEkdT9ZSUgoMPWX1DeHYHGS
         eX8QGfzPoKqTawYuPazCm+pa1QxT1q0gEXltg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709031599; x=1709636399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqs8JExcrin4TGNbdk3Rwua3GLAJL9mhwsZdsFrf6hI=;
        b=ESH14FyYm5T8FVFZf5ndhFvZSmeIwrS8w6BwWgyfLbxhr6f8dtdRxhPbrKArsXf87w
         ekYVvRxyZ9Y3wSA7DAJIoNIbBdpLG/RDhQh/3LiDv8dr9iEae6ag6i5L/UKGA2ujcVAF
         W5XUaeAPdKOUDJE3WKVdrhMXLn0fB+uJ4AdO23+pa8F1M+w7wtvhMaEi0qrsXy2J+SEx
         PmaKVXzmhOZAp0QsLKzEkGjxt1uXWe0a1wsK1M8WC0nUtZO1IP+qKwoyEZhGSKPYDzKQ
         QcTm7g87hpElNqmVdiwlZsoy/TOlIF5diE/+qElT888ZfwbZ17TQ4ujaDQ6wABZNGmkY
         Lung==
X-Gm-Message-State: AOJu0YyyU59d4Oex8MnHlzsSXMtYCalH3oOWO179yQtlq5bajqC+TMTb
	+gWa6OXHedZXXyfG+WikFyIqdHS9r9KR2OqonWHasj6Bt7EnPt91wVhWtLXS/jVe4AN53loR7KD
	Tz1Y=
X-Google-Smtp-Source: AGHT+IEebYpkuCjCf6jF+uCI/Nn8hcwEIOWaFCBndfER5lYqYZ/IyTFQ1Fbscc/A5WjAW0kYUyxoLg==
X-Received: by 2002:a17:90a:f009:b0:29a:90ef:66f4 with SMTP id bt9-20020a17090af00900b0029a90ef66f4mr12282712pjb.17.1709031598840;
        Tue, 27 Feb 2024 02:59:58 -0800 (PST)
Received: from kite.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id r23-20020a17090a941700b0029942a73eaesm6139095pjo.9.2024.02.27.02.59.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Feb 2024 02:59:58 -0800 (PST)
From: skulkarni@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Shubham Kulkarni <skulkarni@mvista.com>
Subject: [OE-core][kirkstone][PATCH] tzdata : Upgrade to 2024a
Date: Tue, 27 Feb 2024 16:29:39 +0530
Message-Id: <20240227105939.22580-1-skulkarni@mvista.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196258

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 5abbd0abf992ce8d11f3ae31fb1d83d97f5319fa)
Signed-off-by: Shubham Kulkarni <skulkarni@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 2774e5e730..4734adcc08 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2023d"
+PV = "2024a"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "e9a5f9e118886d2de92b62bb05510a28cc6c058d791c93bd6b84d3292c3c161e"
-SRC_URI[tzdata.sha256sum] = "dbca21970b0a8b8c0ceceec1d7b91fa903be0f6eca5ae732b5329672232a08f3"
+SRC_URI[tzcode.sha256sum] = "80072894adff5a458f1d143e16e4ca1d8b2a122c9c5399da482cb68cba6a1ff8"
+SRC_URI[tzdata.sha256sum] = "0d0434459acbd2059a7a8da1f3304a84a86591f6ed69c6248fffa502b6edffe3"
-- 
2.33.0


