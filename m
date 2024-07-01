Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE62C3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:13:22 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.13280.1719814389074248402
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UW0ypGaD;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7381b56fb6cso781146a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 23:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719814388; x=1720419188; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BOEbaQSK5gl5RCEPsUDz8n105Q8RFQp+M+0hPzHFZnw=;
        b=UW0ypGaDYJksv2jx0+Smwuy7+LppomtbSGz+onbFyt1AVMdXE6yFeGYWeRH+YUujcH
         uxof93XfcqH3dLNQGgIPV4YwSxhYAzwtPEMUukhGq2cBPLTU3Y4ufuMBzdkP5t/3OwT0
         Jy57Ge9hxmYXubHlTxTlA/M7Wtzs38pSLQkEoq3e8UtobyRcAWvZClkjeE2NGoWSe8tt
         3y4ae6JbXW6/1b+uKuA0PWtRltw9hEyxZicKeoMUrBe39yVvbLMVgtPuKfCIV4qcrf5u
         HxbvWuyWr9Xk5H1uBPWYzxp5hK7qdcG7S19L/Ec8t5dMJSUZaIWRDu/1YnEqErPIoDvh
         twVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719814388; x=1720419188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOEbaQSK5gl5RCEPsUDz8n105Q8RFQp+M+0hPzHFZnw=;
        b=bE0ukVeW2sP9O9gZZsp2fXTiHRY8yzxw5Cbp/tQr/sPQqLV/BhEABg7a2eamNxUkKZ
         ukW2CVCrxFar8q5STB6c7LsK8eXXeNzaNLuHWJYNY4I4e5cHv8RY7rjLWRZMfIKQ6JPY
         n62v6hFiux+8zAJCL6ksY+lbVejUSmLEaWobcmK4keSY9Y83LNml2lHqjQMe61g1Ojhj
         KDCf2chntzRRUBoh+kezSRPGJA9QocHlS9l3U7KIUDcFW7KyXah7P1Q3RRZcesluQ0f7
         D+P8Rdw5JHLBz0LPtPASfhAZXwVwQt8Q2Uti7997hasTxTPDjFRX+KuUhykD7Cv0px0R
         fk0w==
X-Gm-Message-State: AOJu0YyLN65FshRiDfIRpO63mZ0taJqdtU1dVNwAIF1GuGTGYQ6d1QWV
	WPS9/h4Pf69GXBaeMw8WdHVzJ6cd1KoGaBOnmbkBmyjY6EAWzFpO77xuqTxZ
X-Google-Smtp-Source: AGHT+IHufNUfFWjKsOQ32hj9AW9f8HFmHheUX5f9MWbmwaoZ23oHL8qXDMtWOT2rynVgdccRGrT9hw==
X-Received: by 2002:a05:6a20:49a8:b0:1bc:f575:3f07 with SMTP id adf61e73a8af0-1bef6246c28mr2734284637.41.1719814388053;
        Sun, 30 Jun 2024 23:13:08 -0700 (PDT)
Received: from localhost.localdomain ([43.231.237.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159ac64sm55677685ad.295.2024.06.30.23.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:13:07 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Alexander Kanavin <alex@linutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH 1/2] glibc-tests: correctly pull in the actual tests when installing -ptest package
Date: Mon,  1 Jul 2024 11:42:44 +0530
Message-Id: <20240701061245.141303-1-ppjadhav456@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 06:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201277

From: Poonam Jadhav <poonam.jadhav@kpit.com>

The tests are packaged into the main glibc-tests package which is fine,
but then glibc-tests-ptest package needs to depend on that.
Which is what this commit addresses.

(From OE-Core rev: d37c2d428b09b9d0cbb875f083c6a1e9883a7fed)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 644914efa83a289da154c888b5661b9d16eaa35b)
Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-core/glibc/glibc-tests_2.35.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-tests_2.35.bb b/meta/recipes-core/glibc/glibc-tests_2.35.bb
index 97d5dc29a3..4b765eaab8 100644
--- a/meta/recipes-core/glibc/glibc-tests_2.35.bb
+++ b/meta/recipes-core/glibc/glibc-tests_2.35.bb
@@ -17,7 +17,6 @@ python __anonymous() {
        d.setVar("PACKAGES", "${PN} ${PN}-ptest")
 
        d.setVar("PROVIDES", "${PN} ${PN}-ptest")
-       d.setVar("RPROVIDES", "${PN} ${PN}-ptest")
 
        bbclassextend = d.getVar("BBCLASSEXTEND").replace("nativesdk", "").strip()
        d.setVar("BBCLASSEXTEND", bbclassextend)
@@ -30,6 +29,7 @@ python __anonymous() {
 RPROVIDES:${PN} = "${PN}"
 RRECOMMENDS:${PN} = ""
 RDEPENDS:${PN} = " glibc sed"
+RDEPENDS:${PN}-ptest = "${PN}"
 DEPENDS += "sed"
 
 export oe_srcdir="${exec_prefix}/src/debug/glibc/${PV}/"
-- 
2.25.1


