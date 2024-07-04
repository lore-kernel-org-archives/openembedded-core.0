Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB4FC41513
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:32:36 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.8996.1720096348404316451
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vVEXyfvl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7066a3229f4so392820b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096348; x=1720701148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qofDwsVGS362lWeT/dNwUlS2AFWOXDWscLI+Gssx3e0=;
        b=vVEXyfvl/emda/AC52VO/cbAUfBwS/DtPPc2/Ey545YttA+F7xLncI2ktks+Zv3+xV
         xLADeGyjO/XoyBSoX7yzHRi54vwBXRctGHxjT7l5I8MYpw/ql385S+emXG8hk+pMjOKm
         7EmmuJws70y99mFrV9leGvZEWIzku0+RMj+6b6BRwWXTJ8Ji1U4dZ7dP4gMWKu3P+3Dp
         e2Oyq0JtQcAoRU4khljogptIxHqBudtLHlw0KmKLo5Xia0VRyQ6FPejn6SXRzvN1btx+
         +EiGc54cWyIPgsVkYmmgVZIwiFWukW7wGaJ6J42mhBM9+YvEKkqATT0yjF7ypH7euiys
         N2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096348; x=1720701148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qofDwsVGS362lWeT/dNwUlS2AFWOXDWscLI+Gssx3e0=;
        b=V0DGtDdmXeC0orAhyLS/XnpmauZmiljmYcBXxM1xs5S2+UB0NzHMAni1bOB51TPo5o
         6hlhcPjLNW4c98H2b6/5cCdq5KqVTivXssGKIY09VoL5Ndz9JmlfIQgHegDu+M3y+Ddr
         fc9KYhyEB/3q983AZ57q62P1GyrDM5sU1s6wDUu4JFLIrQjfyLHr1FVgPMNP8+ZzwH3u
         2fCNlsmO/qWrjXLjy2NbKdprf+Az1xQSiOROp0IhsKVKbg+UGXzNG8s3xRK7B4vskSQa
         W2ZnfAR+l66uHmRog3V9oNnaC3VVXgHEKUnXodBrPNhdIPbNCP4mjpfjn80Prys9ebVO
         MKBw==
X-Gm-Message-State: AOJu0YwdoDihVsgxIjINZMaR5wT6nkA8+jTDAfMgi6Ynt8E/bAFzY+Bj
	uuFvfbZWIXhRND+C6rd2LaVbEf8YtrtJJ+M3mjBpvOQ8RXsC1cveypUn76BDL9iUfAqDEU7a8at
	d
X-Google-Smtp-Source: AGHT+IFgaKf0yk0B1ssQSyIuE4Me3qH3ZxrntEemCJhtpx8fhOWLLB5+zlMZDPJXOu9D9r3kOZ6PFA==
X-Received: by 2002:a05:6a20:c793:b0:1bd:248d:990d with SMTP id adf61e73a8af0-1c0cc74bcaemr1241678637.25.1720096347629;
        Thu, 04 Jul 2024 05:32:27 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d337sm121034095ad.284.2024.07.04.05.32.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:32:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] glibc-tests: correctly pull in the actual tests when installing -ptest package
Date: Thu,  4 Jul 2024 05:32:11 -0700
Message-Id: <c09335a23025ff78a6d3eb41c483b5a479b1c3be.1720096173.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720096173.git.steve@sakoman.com>
References: <cover.1720096173.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201572

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


