Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7C1C43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 09:10:26 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.5257.1654247415226321257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 02:10:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+Is1tW3;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k16so9590784wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 02:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7QdsC5kXeVkr+UNXVqfej3KEycmOhitwX7uafNpSoOU=;
        b=E+Is1tW3hXH6DWTjCIf9IbNBurAObSEV9li5iYlJ3g8U0uaFPEVw+s2T0kXoL8tie7
         ggsNxI3eouP3arfAmZQBac9J4xxTaHkTDDAkAlKRTYmB5lhNFFSY/EDqn377uwuDKl/4
         BbhLKPDn7YY8WqVQC/NdDsMiC4G2+FhyBr/3h6j6gF6is8PIUbm+AFueiCXIQBcRfmwO
         qPSBHsibY/6yBuXsi/fSrvwkg8ECEh2kb0zYwoo4jQwiQWleT/AhXH0ItkXN/ZUXUuFZ
         c2Nte4KiHzi3MG15Zlk06gLRF7rvzkg236QxTNE4uk66YF0AefzZWmx5qh2rul24iziB
         efSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7QdsC5kXeVkr+UNXVqfej3KEycmOhitwX7uafNpSoOU=;
        b=ptt/0O+aZ9RnGDoWVpCNugCYyj0VuMHFaNfL/Gaya6n3XRQQGoUecHtvrKCsfvj976
         Yk+DVKxOLxZrebylUAgxFO+r6uoAU1joC3Ue302BGl4GSEgbYFPsDG6zpynZBusqPcof
         IRjVQg0nG4dBQ5w09AdVblr9eZ9StewFBKYtrR4SDu/HgNp87PT9uOkBXHH36ZzarVeX
         n0Y0L952+CQcbtltA3A4T+/2zz2atsPRh2rrw3NjrYJGRSj2oi3VquLYZhL7OlUcHQQy
         hkLcukLJWw6o7gqZFl6GDnRgZ74SK0knRk5mzvjACqSiz6o91XLpA4es3fNTzw6FA8A/
         Mv1g==
X-Gm-Message-State: AOAM530huxCDPVWirbp/49cMKUprmHUBDDkxmMCWKS0HZXdpet8f2yJz
	igC7HwErQbwKpdMM/x43RU8dviWhH04=
X-Google-Smtp-Source: 
 ABdhPJx94iXDnxCjOH2futQOEXw8VeI0C038NQ7UGb7/OE0ygGbogmDfLk1hkmP8ek3JFyPUbtEUhw==
X-Received: by 2002:a05:6000:791:b0:20e:615c:aae4 with SMTP id
 bu17-20020a056000079100b0020e615caae4mr7182737wrb.206.1654247413305;
        Fri, 03 Jun 2022 02:10:13 -0700 (PDT)
Received: from localhost.localdomain ([80.215.210.162])
        by smtp.gmail.com with ESMTPSA id
 c16-20020a7bc850000000b003942a244f48sm10928010wml.33.2022.06.03.02.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 02:10:12 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH] cve-update-db-native: make it possible to disable database
 updates
Date: Fri,  3 Jun 2022 11:09:56 +0200
Message-Id: <20220603090956.2240303-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 09:10:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166514

Make it possible to disable the database update completely by using
a negative update interval CVE_DB_UPDATE_INTERVAL.

Disabling the update is useful when running multiple parallel builds
when we want to have a control on the database version. This allows
coherent cve-check results without an database update for only
some of the builds.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index c8c1cbf115..18af89b53e 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -15,6 +15,7 @@ deltask do_populate_sysroot
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
 # CVE database update interval, in seconds. By default: once a day (24*60*60).
 # Use 0 to force the update
+# Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
 python () {
@@ -51,8 +52,9 @@ python do_fetch() {
     try:
         import time
         update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
-        if (update_interval < 0):
-            update_interval = 0
+        if update_interval < 0:
+            bb.note("CVE database update skipped")
+            return
         if time.time() - os.path.getmtime(db_file) < update_interval:
             bb.debug(2, "Recently updated, skipping")
             return
-- 
2.33.0


