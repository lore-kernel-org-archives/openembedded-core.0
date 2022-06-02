Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5787CCA478
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:33 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.1523.1654188751910318764
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nRryyEcc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id w3so4948848plp.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OhfjCfeP0ET7fPSMlbukSWqwE3nqotzj/cMgbQlB1k0=;
        b=nRryyEccHDZq30foiBYbfp3huT3HT+SHnc/Z0ZeH2I4z9+5sdfqBXk0MNLg1J361Eb
         9GGaeltG40hw8Y+AommcNndjH5aMBCue/oZRz8OP+SILuvCN9xy5Q4PiTDdQySgCWufL
         tU3tmO0+AgVxvyppaInQZqgus8ElAbg7MewSPm90pZUIO6DKSKzVontJkFVygueQlqQs
         /2GtK0nEt0hGUoUsSXw3kwp0joSUFiMICu9sc/5TEu3JIezi7EjXa+hN1nYLtE9Ar+k2
         uccnCdhpnVEFr4dINg2rlimxuxzjvzWfCZROyPnw2jyYHeH66at48xde0NaJxdB5w3da
         P6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OhfjCfeP0ET7fPSMlbukSWqwE3nqotzj/cMgbQlB1k0=;
        b=z5Z/En3Im8Mb/Wc84NodJWN8AgTKbM9h8wtdde3sWiLB5qojWOj/W5ZRsqueY+f+oF
         GH+vLGHilO0EsaBUbv+0OYLjYpQhf0to24qiKsqtoWbSf/0qEK9/uC/ab40eUFYI0pF5
         StmmMrQRyzSXfgc8uS6q0UfaSBCCvz0A+SM7viKrKlAWlc/Y4Wq/SMi0qGSqouLSzfD9
         /RRS7dLq6utDebXAwoFR+75jy9+vfs15Wblm+MGdEGI/E7q83X0OzLxPGP5xfjHqZfQT
         XVB/C185CdTKtBiCGeb0Gr2thnh3GCIFLVIC/2oWE7clVdF0OZK1DteYivppGpQuoYFM
         izJA==
X-Gm-Message-State: AOAM5339jLnOw2sTzBXT/O1T2UwlueRiW1YNgdR6qI/OsWXZxHH+8Ior
	JNMKGdGq6YwVybZ+bb7WxtXcaxuZYy60qKpP
X-Google-Smtp-Source: 
 ABdhPJwrjXgsAeNa1GiUyZ7rxSOJIPJ8Oe83Brn9c0h61zQyyV6lgvJ4Xcj7L1kW7fPz3XBa6boAwg==
X-Received: by 2002:a17:90a:5785:b0:1e0:3647:7851 with SMTP id
 g5-20020a17090a578500b001e036477851mr6232427pji.155.1654188750657;
        Thu, 02 Jun 2022 09:52:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/26] cve-check: Allow warnings to be disabled
Date: Thu,  2 Jun 2022 06:51:40 -1000
Message-Id: 
 <8fd6a9f521ea6b1e10c80fe33968943db30991ba.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166485

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When running CVE checks in CI we're usually not interested in warnings on the
console for any CVEs present. Add a configuration option CVE_CHECK_SHOW_WARNINGS
to allow this to be disabled (it is left enabled by default).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1054d3366ba528f2ad52585cf951e508958c5c68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3bb924ba34..c80a365819 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -48,6 +48,7 @@ CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
+CVE_CHECK_SHOW_WARNINGS ??= "1"
 
 # Provide text output
 CVE_CHECK_FORMAT_TEXT ??= "1"
@@ -436,7 +437,7 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
-    if unpatched_cves:
+    if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
     if write_string:
-- 
2.25.1


