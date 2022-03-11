Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D3BCC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 20:13:38 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.10267.1647029617405828869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 12:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RYxmpIhA;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id kt27so21526651ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 12:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CINwIsQX9/0/rh5P0BAh6Qrjty9glDv+Qn+5DrNdI8Q=;
        b=RYxmpIhAB/2/cUjujAuPFkGL3dMPn6m0e/9gLcldbrpBcpg7piLxweS/cvFV8qV1Yp
         ie2DcWmr3+6+dkwYX2+z+JehfF4r1p3nDs4vY/0J08bE1HK0lf3rzxJ65boDgOq7qfpe
         Wfd8kmyIT6OZ61Ie/qvBgOETi2d2NvHF0QZMDo7TXjig7EX0KvLBx7F/ucy6IuQwlg9v
         0KdU8IF9iAqBLw/O8V3HBMwIri8Bb5D+qoAua9VZI2yQfJ7zh9Y9Vr8cIiBA+wtTVn58
         m2UwD+NBetYPNTjVKi+7lQCCnV6amb3mkSo6FixPFOghVztz6ao/mXMCSBUFcJPaSrEc
         zOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CINwIsQX9/0/rh5P0BAh6Qrjty9glDv+Qn+5DrNdI8Q=;
        b=6k1xU8+uvA6FovNE5wNyeBhAhc0gp9GqGCf2XYDOlsJ7yJYWRUM8qeKrw4eJ03x3W/
         L1auTtcd/iIhvEXY7ayA0rHImOeRTLD+Qb6SpQR6p/uR6n2qTjkejeHdLaWO32n0veL6
         vNjX5BtycnkU8VaAlS3EljJ5diTsZEQPHmy1p/8CR9BBDikIkav+4Rslb9BZOKodDRBq
         FMVt/uXu8GoZrZX4lcv7Tz4aMEc8trMAAM7A1GxwC/wzA6/QFxjOFP05ArUj9n+Rt0r7
         QBt5ytY3+/W5xF7jDJrEH11bE7/c/4JfB8kSgK7dadpNfXP59B8C8Dc3vDJJ9uf/WDFm
         ablg==
X-Gm-Message-State: AOAM530j/GvXFXdAgEKsnRKdp6B4kg/WKCekl1Tbnk0fBd5OhmAS++w7
	lOaac7VvOPCYB8aw49xQGUFxFfJPWSo=
X-Google-Smtp-Source: 
 ABdhPJxwdW/kWJncm+Xkk05N5+Tu5VWInDENtqhqbVRdNEgZxvaom10QAXfjcU1zQolCkyBw9/+gxQ==
X-Received: by 2002:a17:906:30d1:b0:6cf:d160:d8e4 with SMTP id
 b17-20020a17090630d100b006cfd160d8e4mr10052378ejb.265.1647029615790;
        Fri, 11 Mar 2022 12:13:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 ep16-20020a1709069b5000b006daa26de2fbsm3248904ejc.153.2022.03.11.12.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 12:13:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] bind: all even versions now get long term maintenance windows
Date: Fri, 11 Mar 2022 21:13:32 +0100
Message-Id: <20220311201332.257313-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 20:13:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163076

See here:
https://www.isc.org/download/
https://kb.isc.org/docs/aa-00896

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-connectivity/bind/bind_9.16.26.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.16.26.bb b/meta/recipes-connectivity/bind/bind_9.16.26.bb
index 877d0a2fed..aa64a11b9c 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.26.bb
@@ -23,8 +23,8 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
 SRC_URI[sha256sum] = "70b39a5eb71650358ec9ba41da3050d32aeac0aeb4a466684b23f35affa7fb45"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
-# stay at 9.16 follow the ESV versions divisible by 4
-UPSTREAM_CHECK_REGEX = "(?P<pver>9.(16|20|24|28)(\.\d+)+(-P\d+)*)/"
+# follow the ESV versions divisible by 2
+UPSTREAM_CHECK_REGEX = "(?P<pver>9.(\d*[02468])+(\.\d+)+(-P\d+)*)/"
 
 # Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
 # so the issue doesn't affect us.
-- 
2.30.2


