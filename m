Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 215D9F01801
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64464.1772781781849653840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zmkGT2eR;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so103973205e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781780; x=1773386580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f44y10boasrVvjD7pLzjbdEOwWhty8Ztk3YLro0e3mY=;
        b=zmkGT2eR5vQwcKOdjOYezqhxZ45gBGM9zZWFRJihemrIu77S/kHunuWJsk7TsSRm6s
         Vv1GDibdJUoRkmhfV8M+eP+6ohmgu+7mL/L+pb3jiANgYQ7KkMO8ciymnt2OKWI4hhYa
         BRRKG2icxfAjYO713vDjCR2WlTtc0ArfB1IS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781780; x=1773386580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f44y10boasrVvjD7pLzjbdEOwWhty8Ztk3YLro0e3mY=;
        b=FzuAb74yncndDMIh6bHz2LgDtmb0ULDQCF8tBi7301aXxyOBUqN/LsfaOb0uAdvIqr
         ydmSuzChAWB3ftAjP815OOBFE14j+RqmkRpEQmtxmLWpGP/yz6Jqn/nCyMte9ZDvHVzy
         PNJYj4HwXqJUSgoJxJ2dC+5MEUStpUkEHC8p0HHxqiwPFBsiTwPzZ+tJz0JBFJtFCruh
         7fj1/Iws/BHHctVPnq4gnhqhkRV5waQF2JQNL5LEFaD0fgOr7Xm3yEuMqL5rBhrBx7gn
         6mTVKGoiUNZgfiaib/lFKM5VxAB7bbkjHayOCpT+zXKalYOLLrfjQAU2CdcPMeQ8KAMC
         CXGQ==
X-Gm-Message-State: AOJu0YyK5WCaz2CGnZbl4EUUIAnlP7T9fekr4iDU8kz1SSAU4R2mEYso
	eNq+f6mFjqc9DCBVSolLh28agiskZXxtmxeJCW+XiViNlDZ4FShM4wVjnslEvH9cVAp7ABy0ZWG
	jxETf
X-Gm-Gg: ATEYQzxawX6wfD6TBQSMChVDW8fn1+NFWtf2jcRvqf6HYsG57uo6zQXitYYPK+7nPeg
	cvpUXOiwFeUC9N5ziToypRlKWdxRyUG6Ftk/j7u4b8RkHOjhzvdti09p9nocA2cf4g1/tWAjiWz
	DlNL7lkkatx3hBhZKcP0K7rZZJepyQvxJE0+gVwHOSJu74+O1vQjQFnqCeihXJiq70sdAY4nx1y
	9H4wpP+7Mn0wSZfxtDw7okn0MCGCwf+gbO4QzaaNjmo8natNIpepFqXRdZSX5+Mpg04yobR7LK+
	32p5fmhP3m6HDTz+5OY8SiTbpFMSJSfgIuHf3NXiI/v/UFSun0q6ULtLTdQxV18sx1U9TqbUY5K
	MPErPWKUgxFN5A8FCgqi8tnUeoUpD0yjm6wRBvEUXq4uCG01BITDr7jrbICUlAPsd2kIE/LU141
	kHSarknSmIjP2sTO3ZzNO8VVCKli6lkJ7H2pj28nOQZzCZg69hu7hcmW/f7l0IfQsf+xGcvgfKE
	DA8xfI2FkfyJl2fhhXSMIWV8EuU
X-Received: by 2002:a05:600c:19d4:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-48526923ba3mr17147685e9.10.1772781779942;
        Thu, 05 Mar 2026 23:22:59 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.22.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:22:59 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 02/16] wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
Date: Fri,  6 Mar 2026 08:22:02 +0100
Message-ID: <6560f78f56a50581cc769c12d29f1795c9dc39cc.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232541

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
index 68ae3b0464c..2f7c8160434 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
+SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
 
 inherit bin_package allarch
 

