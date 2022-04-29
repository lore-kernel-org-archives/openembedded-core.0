Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF47C433EF
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 06:33:05 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.7030.1651213974918446930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 23:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g6NzT/v8;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: rybczynska@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id kq17so13567409ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 23:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rgY/bTA3BZlsUf7W5LdXHaB+KUmjqhDSVV6IwnMunF0=;
        b=g6NzT/v8+wkNBd0l89AXb+XKcDrcGOPhcUZOcybiCigNAo5zQXVliGnVlNQoDepMbJ
         wsesaHGJBTA0uFT/AMdNZupfgmVZd+f/VCTfe3A9RWgWfJsBDtmbdtnWGSvLFWwpT11V
         Cx0/YbHBgCz2KzIzdBgsmNDjJXZj+cRTtfeld6+oFkz+H0kAr21aox4uMQl9HppJVT4Z
         lR7NHpLZhI5xCbiCHZLDJSwkVpGZxAFwk1aaIR2ygCB2/Ej5GF+sIuBKBIUFkyBpdB42
         qN0CD3JPFMWuGhps1hcNXuX0JRZg0XKl8KJjiO9MxLNrLOR6WLM2vrPyfbRpp+KvoKDG
         oEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rgY/bTA3BZlsUf7W5LdXHaB+KUmjqhDSVV6IwnMunF0=;
        b=CZm9u8swNBPqeJgRZM0qWKsSTtF7efn9qMGq/z+HBqkQQPNqBf1vgyJGMVATFJ1vb+
         xqjv2qFMaafTMsy9o0RqCrFCakwAwxKrkET8nPTcTMRW3iCv1PMwHBCYgCOKL6Xd07HX
         8+TmHN1s+/raFQbJYXanFT5e00jF/tfuRaB7lKGndw/l/ZQyUXEgDUjT8Zfo/O1jNnRT
         n2vTLcJ6PM9So1W4v0he8MHUV3pIpA74v5uLt+12olVVE6PvpU8y1mgMTjV1ChraYJWD
         gOgUEWkoIFiPF7KBEzJORnWguAb1DboXUXdP3tk1pRAdEMEmuwrSrPWwNEOmqznFHfWR
         9rSQ==
X-Gm-Message-State: AOAM532hJXVBEIBS2WdnsfEdI5GzEhQrZ+dfyq8KD/SrPa9h3wMBibB4
	dptDwRTh2Eg64UqlCg+y68I2fJYNQIQ=
X-Google-Smtp-Source: 
 ABdhPJyzGy11SdaM+ZQ0cHqIx457dRQA2CLypiWH8aWSnAK9k8s+xawCiz3CdmMxQpqZ5CqTeYJFnQ==
X-Received: by 2002:a17:906:5d04:b0:6db:7262:570e with SMTP id
 g4-20020a1709065d0400b006db7262570emr35047575ejt.8.1651213973177;
        Thu, 28 Apr 2022 23:32:53 -0700 (PDT)
Received: from localhost.localdomain ([80.215.178.17])
        by smtp.gmail.com with ESMTPSA id
 og21-20020a1709071dd500b006f3ef214df8sm337149ejc.94.2022.04.28.23.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 23:32:52 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH 2/2] cve-update-db-native: allow an option to force the CVE
 database update
Date: Fri, 29 Apr 2022 08:32:26 +0200
Message-Id: <20220429063226.22192-2-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220429063226.22192-1-rybczynska@gmail.com>
References: <20220429063226.22192-1-rybczynska@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 06:33:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164993

Add a new variable FORCE_CVE_DB_UPDATE allowing the user to force
the database update, if the default update frequency is too low.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index af39480dda..d89f79f310 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -13,6 +13,7 @@ deltask do_install
 deltask do_populate_sysroot
 
 NVDCVE_URL ?= "https://nvd.nist.gov/feeds/json/cve/1.1/nvdcve-1.1-"
+FORCE_CVE_DB_UPDATE ?= "0"
 
 python () {
     if not bb.data.inherits_class("cve-check", d):
@@ -44,11 +45,14 @@ python do_fetch() {
             os.remove(db_file)
 
     # The NVD database changes once a day, so no need to update more frequently
+    # Allow the user to force-update
     try:
         import time
-        if time.time() - os.path.getmtime(db_file) < (24*60*60):
-            bb.debug(2, "Recently updated, skipping")
-            return
+        if d.getVar("FORCE_CVE_DB_UPDATE") == "0":
+            if time.time() - os.path.getmtime(db_file) < (24*60*60):
+                bb.debug(2, "Recently updated, skipping")
+                return
+
     except OSError:
         pass
 
-- 
2.33.0


