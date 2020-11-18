Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.25945.1605713153318678910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:25:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Q0lYhLGV;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id c80so2594242oib.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 07:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=vQPqsK0QDXD1NSXqjIRykFyN50gDNc+qlR3gHE3v5oY=;
        b=Q0lYhLGVkcz0mpWQQiKXS+p/qHviHJYsqZC7T43Gsd2SQGUXPxBcfh/lFust4h9Ps0
         CegR76SCoV/lPA9AI7xrIrLW5LcnAX1Qf5x+TeqTRMZuiAOj4EWmMh05mwZXLeS257AP
         /IY6Xl32hLnx4i2B+NjQbgnchjB3OT9yezbh71bY9nGBmR2cCCwTTu/oxpz0yEt/deEn
         h1rddL5+U9iFJ6zFS2VNnQGOdO1cT7wfXjX7o2EqilAicg/I8JPOCXkJX4y2sXo3V16F
         5pWSA7qpa520ilwLVhnNxqR6QGXSbMimiSruzgT3HIgVliluC1I86/gLorI2ksYmWd/n
         pGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=vQPqsK0QDXD1NSXqjIRykFyN50gDNc+qlR3gHE3v5oY=;
        b=akvVWEaoM0zU8P0/CKZ7+0IcOPkiysrOBCVpgYlCPQoj8zi2k7J/8fynYYtpUnkVjc
         EPOaPT3VAkQQ48rRh/blP8FjGQw4L//TGxyM5ilZgFeHUGa855LqLKZKf/708R1HcFqQ
         MXbVKgVQE+IAD82KWoq1achISEK7/ou9hbwUNHl7FBRpqMCm91mkpK8zhceXy4hXW2Oo
         t3XFDYhErQogBqd3e5AoQcvGE+zvmTf5khVKdkj1/OVdCqu8DuO2PXeLaLV0gIH4+IqK
         +e/9zxNRPet8druehtqeC/AdDw+s/SgrbYrOoT69n3Mjie+ZbTYWVhKw4xQ014X7i1oV
         WWkA==
X-Gm-Message-State: AOAM5328hFscITyDQ/4UZzenCXOuodBpne8Uynu9bJN94zbdI3fjPNNV
	r6k+oiaiA4KcEeh0vFLqM6DuipcWUBUUYpeF
X-Google-Smtp-Source: ABdhPJzgbT32tKd0VaUIVF5zJlMFJDGK42CXe5BusWJmixmIWh3Ye7TAuDORCfcH4+o1Rnk3BjqnBQ==
X-Received: by 2002:aca:62c2:: with SMTP id w185mr413652oib.20.1605713152050;
        Wed, 18 Nov 2020 07:25:52 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([75.104.55.184])
        by smtp.gmail.com with ESMTPSA id l72sm4603127oib.41.2020.11.18.07.25.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:25:50 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] cups: whitelist CVE-2018-6553
Date: Wed, 18 Nov 2020 05:25:22 -1000
Message-Id: <20201118152522.20849-1-steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

This an Ububtu specific issue:

The CUPS AppArmor profile incorrectly confined the dnssd backend
due to use of hard links. A local attacker could possibly use this
issue to escape confinement. This flaw affects versions prior to
2.2.7-1ubuntu2.1 in Ubuntu 18.04 LTS, prior to 2.2.4-7ubuntu3.1
in Ubuntu 17.10, prior to 2.1.3-4ubuntu0.5 in Ubuntu 16.04 LTS,
 and prior to 1.7.2-0ubuntu1.10 in Ubuntu 14.04 LTS

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cups/cups.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 87870e4aba..df8d4d284a 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,9 @@ SRC_URI = "https://github.com/apple/cups/releases/download/v${PV}/${BP}-source.t
 UPSTREAM_CHECK_URI = "https://github.com/apple/cups/releases"
 UPSTREAM_CHECK_REGEX = "cups-(?P<pver>\d+\.\d+(\.\d+)?)-source.tar"
 
+# This is an Ubuntu only issue.
+CVE_CHECK_WHITELIST += "CVE-2018-6553"
+
 LEAD_SONAME = "libcupsdriver.so"
 
 CLEANBROKEN = "1"
-- 
2.17.1

