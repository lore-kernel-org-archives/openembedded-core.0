Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B93C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:12 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.424.1652293210973332866
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WscMwW6P;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 137so2494285pgb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tMcgu+VQP4Zk4q3mDyj2MheX1oAFn9We/uDmG9HydUA=;
        b=WscMwW6PGKU9jTqYNsIOja7v27TPMc2k1ltj27a1O441HFshJDHO3YCLQL8+GYwCIK
         PqFpDbRKAUTxlGv8jd2SPCTvfA76W2ew92xo2XiOr5BbUDGm5XHnXd86hpLttHMlc8ro
         QfHj2PZuPDEr0N24kuQd2ghUOWTJvA70/NS6mO96wP3l59iWW+CrqhiJkNN0j+9/EkMK
         tz78ZPzQ6PkoxXtGu8J2Ajl2jwak+fNQJNg02aFvBrqxpv/y2TvsQlKwRRqEZhYjFeKV
         Do1HtKuxrOhYt5ds1CVosWdDNZCEN+HpXOWWKTnXSn7d7zLzCkpaPdRxH0nNYbeW5FIR
         HUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tMcgu+VQP4Zk4q3mDyj2MheX1oAFn9We/uDmG9HydUA=;
        b=RASNZ2Fm8lMEn2aGe8Leb2SfyxOr6k6KfjOfUivx29MW2uMLnAAQrazKSozT29vQxK
         4k4gDI+Dm8pGEqZ4OqyAQ9D5r+/tk6Hufvx6KVgQ/i2MOtxtjKQLJ9Iny8GxXgHMikP5
         FWL1c03stKQ/9j27D/0aywfO9ygU4lzghSVwLRkJeYmI7BXt9YoxaPgD1zPjX4sEzAXK
         v4TsmFqkRDdIknyTCmAYLXdBrukooCEmYxQM/pwKdKfdF+mu+c/R8KuYOKJOS1KBcZa8
         ZGhY82KN3dOKQWXN9vI+v+eUk/SsFRsFARPURUugRbHQa85TD24RST5qITAB4E68D77J
         Wl4A==
X-Gm-Message-State: AOAM530H9/hq4teKEF2dQweMQ1XL6xdQY4iTd/Rz4f1TVfQqBhJx4FEq
	tHvyRdU6PzS4fgFqJn9hZMWcMxiFNEGMxO5N
X-Google-Smtp-Source: 
 ABdhPJyDFnCF9+pOyOtX3QmjLy7dekDwNBl2sA4/MNAl17TNCzO70hIoW8zQrBoLx95l+AfWGlTQ6Q==
X-Received: by 2002:a05:6a00:1306:b0:512:ca3d:392f with SMTP id
 j6-20020a056a00130600b00512ca3d392fmr1256791pfu.79.1652293209847;
        Wed, 11 May 2022 11:20:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] cve-update-db-native: let the user to drive
 the update interval
Date: Wed, 11 May 2022 08:19:26 -1000
Message-Id: 
 <ce79a724dc0f9baac480cbadc05894ffcaf48eb7.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165513

From: Marta Rybczynska <rybczynska@gmail.com>

Add a new variable CVE_DB_UPDATE_INTERVAL allowing the user to set
the database update interval.
 - a positive value sets an interval (in seconds)
 - a zero ("0") forces the database update

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fe7bc6f16184d5ebdb1dd914b6dcb75c9e5e0c9c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index a6144979f0..594bf947c8 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -12,6 +12,10 @@ deltask do_compile
 deltask do_install
 deltask do_populate_sysroot
 
+# CVE database update interval, in seconds. By default: once a day (24*60*60).
+# Use 0 to force the update
+CVE_DB_UPDATE_INTERVAL ?= "86400"
+
 python () {
     if not bb.data.inherits_class("cve-check", d):
         raise bb.parse.SkipRecipe("Skip recipe when cve-check class is not loaded.")
@@ -43,10 +47,15 @@ python do_fetch() {
             os.remove(db_file)
 
     # The NVD database changes once a day, so no need to update more frequently
+    # Allow the user to force-update
     try:
         import time
-        if time.time() - os.path.getmtime(db_file) < (24*60*60):
+        update_interval = int(d.getVar("CVE_DB_UPDATE_INTERVAL"))
+        if (update_interval < 0):
+            update_interval = 0
+        if time.time() - os.path.getmtime(db_file) < update_interval:
             return
+
     except OSError:
         pass
 
-- 
2.25.1


