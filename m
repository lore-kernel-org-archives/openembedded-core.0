Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45640CA600E
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 20:44:41 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5183.1791319476387117693
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 13:44:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EJhmw5m4;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1948611f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 13:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791319475; x=1791924275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iJR0ziekbJSfTWfAAfSAl3K3B7FIO2PEUvkRz7DAUp4=;
        b=EJhmw5m4Pk4EYwE0c8KQbNwjSYgmStTqTfrepeweEpvhSwPt6p8j+RuOB0bDyEGyZO
         9ZafckwXC2tGTC9gqEVe1DpubJfzMFmo8c8gAvNguEwSAsyqgBgJF0IZH+hic8cqN3pL
         gxHkOLfi5bXpglrklauKfTVT5lX2S8THktAro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791319475; x=1791924275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iJR0ziekbJSfTWfAAfSAl3K3B7FIO2PEUvkRz7DAUp4=;
        b=gu6d583W43+GsbzSrATj+js/LGZHhPSwdkob1LMPdu+kk7MVIdyE0FOOal5/iRhAn0
         6Y7QF913i4gqi6WdIgR5lmjhHWUTEedLtTMPeP8oFu7QPWZSDEuMmLjrKGKQqDLjZsf/
         DaWSZxQzbJMn5s4EBvv89ti/DwevaLY5Tw2Mas7EdRywl2prdXTke41zULhJ4rnu/GK8
         a0sQ93Est/N2sSHTS1T9KQZALoCfKghGcBkULdCiuuHA5xIEFgWWicqZUef+8SGhJaaQ
         oPv5Tm7i5yzgGDuwINJQSAZvP0eHoI0ZgIRksxQmEXB/KgaP3YjJyAKHvtyEru+yMoxC
         WV3Q==
X-Gm-Message-State: AFq9FYLGgNfLGRJqbF1Maj5LRmIHWhA9tA/wPQ1D6D/ZeEEyfsujax4/
	2LqSgErNm2vLyVRdOArXUWrW1CONOAp/kj26OpnGnundA449OLS+PU/jQaKd5yC96XxaSRXxOPH
	Ztw31pSg=
X-Gm-Gg: AYBFou3KGxS94D8K3A3NsSnqWheS8VZwGYrM/C56zpftpzRopgKB8lOCLn6khU5qYe1
	MQMGFIdRWOn1P9ddGPUubNtfbRnFtL8ob+Vkd8O+lM7S3SlEEjIiuC1Y3Y7qqbTIYFK/6bBYteE
	F8IueNi34Gw2CL3heqYAzMvbAbiNIGJ05WArp7J6zLDzCMergTwgCZCIEgz0BQ76xJOWz/Fk1dc
	KjwUSuKTHtQlA/i5xnyyycPJKaNGey8UeQQ3xrurvFuX0qgoHfL/RgFYx5UmSC2oWrtCYMsRMDZ
	KFVi4ZDooQEykL/DOd0GDRsqBhd3r9DcvGihl/k9+GUSM/nHzP5CD7GQovTpYf11uM05Vl8+fR9
	9YnVIukqX3WWoJ8DES5lqynhVYNoLB0QaXTfgTQYAfoEulqsVc8GkmhZoG3UIh824Ezfous3X3G
	lKuVFgDc/FcDZSKQDE2dZj61QdzSX56rY6MpKmmK6j8Udcv9sckq3azagsYXu8ecxlWtMyYEyGL
	dLTGRcg30BHkyYigqCrIexT6LB2gemFgZquP4El6illanjqL1kA/cwYaJk5Zj52zbq1xesOT0Qh
	yw==
X-Received: by 2002:a05:6000:2404:b0:48c:69ba:77c7 with SMTP id ffacd0b85a97d-48c726f3d3cmr859349f8f.6.1791319474706;
        Tue, 06 Oct 2026 13:44:34 -0700 (PDT)
Received: from FRSMI25-LASER (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7273b5e0sm997338f8f.14.2026.10.06.13.44.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:44:34 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail v2 17/18] python3-hypothesis: upgrade 6.168.1 -> 6.168.3
Date: Tue,  6 Oct 2026 22:43:52 +0200
Message-ID: <89c32199ca0b78f4b758e982dc7c65e3b456eb77.1791318909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791318909.git.yoann.congal@smile.fr>
References: <cover.1791318909.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 20:44:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247354

From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

Changelog:
6.168.3 - 2026-09-28
- This patch fixes quadratic-time behaviour when summarising the
  statistics of a test run, which Hypothesis does for every test when
  running under pytest. This avoids an apparent hang after the last test
  case with a high number of test cases (>100k).

6.168.2 - 2026-09-27
- This patch makes writes to the cache of constants collected from local
  source files atomic. Previously, a concurrent process sharing the same
  .hypothesis directory, such as another pytest-xdist worker, could read
  a partially written cache file, which silently changed the data
  generated for a given @seed.

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ca44cc161537f7f37b7ff7305ce6f58af7719308)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...hon3-hypothesis_6.168.1.bb => python3-hypothesis_6.168.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.168.1.bb => python3-hypothesis_6.168.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb b/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
index 7386f26afa4..980161d42cb 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.168.1.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.168.3.bb
@@ -16,7 +16,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "fd8acb5c67f260dfbdcc1b2dc95ff48b2b3f90708ae595c76f591bbf3f6f8eeb"
+SRC_URI[sha256sum] = "a43388f9067678fef6e13bdff325b6cfa6961a590498bb37f7ff31589c83bc75"
 
 RDEPENDS:${PN} += " \
     python3-attrs \

