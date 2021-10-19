Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53564C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 19:54:39 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.15277.1634673278361152310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zgS6GXGr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so728125pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 12:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=5sqPyw8oSmdnOMFo6PJhm6JDI1Dxs1JfQHaUsqFSP6U=;
        b=zgS6GXGrTFOqvFdeVyFuNsKfEsfffLbtSM0q8Nd3kRcbXuR96++TW5M0z7XN3zZUNW
         4CpNAzL9eS3qhnOYVptVaQz7vOqMWOnIFg4Ud7/aBJOenNHRC3/PzJGAnYdicb0nVfKU
         Kvsh+Ciur/lRthlGZu2BcjwGSC8hPVOIwMUpMxJgqcgqJahqZ79X7zp4NS/t/ra8Wdjs
         1PL96G1LsZJKTuQrA52hEu0FQBJxiEqznfm4gn26mznJ2GpF/faOxsAmLukUn2pJFeN6
         4flGIddbTUXO40nc8bYQgHvzZBsXZ5YW+F3QgbMU3z21llIuh00PNkxzrfxsy7EeGLE3
         TtpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5sqPyw8oSmdnOMFo6PJhm6JDI1Dxs1JfQHaUsqFSP6U=;
        b=QEIcvxjtGzch8cMscDXmw9f+gpM1y08j1ZBNC5f0x0dW+tRlEYz/JNM/XGTLkS7o15
         +Vdd0EjzwHvhQlUx9nXHI+fd+qrBKmqttF9adsU5mEI146F3RY1WbB+MZN+M4dg0Ooue
         6YZgxd6WIn+lysOlsY1u982nm/LxdKjVyiQxvZsZvSRqvy/musyqHkmcRx2V3gQHWemn
         v/zwFSUshu7WgVt/2dX9OPQWZglU//cB69N0/v+Rt6BTbNlgia7SX3WJgkWkJDUh/lUT
         PNzKjRGIb5zxgbHwU2qkx26oHwAvkh3/g2+gqkeQu/AOhKyShMfWSF5A++yZTYCSdeh1
         68sA==
X-Gm-Message-State: AOAM533Byg2Q9CVT2kwIUf6pmrf3OBID24F6pWeA8aVvqL+szPBpxM6Q
	0qPwEUGgeypIMDlkXizme2Wr7ZIOCyZVISAAD2o=
X-Google-Smtp-Source: 
 ABdhPJyq+SSgA/a5qs69cCw5RGbBlXU0e7VtP3Hoteg2NuVr21cEkSqS+6Ndu1ElJbkuQqd6wztMsw==
X-Received: by 2002:a17:90a:c795:: with SMTP id
 gn21mr2200379pjb.112.1634673277428;
        Tue, 19 Oct 2021 12:54:37 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q14sm67104pfk.3.2021.10.19.12.54.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 12:54:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/38] tar: filter CVEs using vendor name
Date: Tue, 19 Oct 2021 09:53:24 -1000
Message-Id: 
 <4d0ad4962bd3c69800f70770dc9123a694e16c26.1634665675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634665675.git.steve@sakoman.com>
References: <cover.1634665675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 19:54:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157218

From: Ralph Siemsen <ralph.siemsen@linaro.org>

Recently a number of CVEs have been logged against a nodejs project
called "node-tar". These appear as false positives against the GNU tar
being built by Yocto. Some of these have been manually excluded using
CVE_CHECK_WHITELIST.

To avoid this problem, use the vendor name (in addition to package name)
for filtering CVEs. The syntax for this is:
  CVE_PRODUCT = "vendor:package"
When not specified, the vendor defaults to "%" which matches anything.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 45d1a0bea0c628f84a00d641a4d323491988106f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/tar/tar_1.32.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 87eb8b4188..db1540dbd6 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -66,6 +66,6 @@ NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# These are both specific to the NPM package node-tar
-CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
-CVE_CHECK_WHITELIST += "CVE-2021-37701 CVE-2021-37712 CVE-2021-37713"
+# Avoid false positives from CVEs in node-tar package
+# For example CVE-2021-{32803,32804,37701,37712,37713}
+CVE_PRODUCT = "gnu:tar"
-- 
2.25.1


