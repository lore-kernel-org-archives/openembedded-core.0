Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web10.41077.1599485019491299411
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 06:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison-systems.20150623.gappssmtp.com header.s=20150623 header.b=KOZgBKv6;
 spf=none, err=SPF record not found (domain: madison.systems, ip: 209.85.215.196, mailfrom: matt@madison.systems)
Received: by mail-pg1-f196.google.com with SMTP id l191so8044336pgd.5
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison-systems.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpw8u7GFUj5PAQaHUZRvg30nNcjkXng+m6ID3B4maZQ=;
        b=KOZgBKv6qwcdK7AIvZJsRi7I0rai+00RQvthfpbeyCKThhOJpi651sTuzNi0CHayb+
         JeOHwMtE34RCK6E7HCk4yGLYI493T2GxdZHywY8bhonRKSnHkMYX/0Zv72CSuBh8zq7l
         0/aBtO9CH153IiGqbgwN8QRvvAZl1iqC6+cU+Mgiqek4eTljW/bq1aNCofudLEvO7fRX
         w/bCiGQJx9Lo6SJsEuMb48XWmBhoKsD5qnPp/WsuEgVLlpmkMTC3M88kIx/lsc4sMonz
         ePBAqeBXN2/eairPXqz0Ds2OtwwWfSFS0tAVnykSMPw5/+B3jYBK4jTYotWGiBcYasyf
         9SBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hpw8u7GFUj5PAQaHUZRvg30nNcjkXng+m6ID3B4maZQ=;
        b=infJvmmThZ4OtxhG6r+Y0NagcGcBlT3fRaLqYW5Ng5K7b4ZnzJr67Llv+itYlhgJYD
         bO2S/25fKcqOEF9bI9wFzITHgXQ6YSWpUIcs5/eYwroBZXAFHT27SqHb5Fl/x9eWi+1f
         95i08tsT4UZtObCAAliFRETPv1rvQteNvc62+T+7LRBACcMVK3xpbSDw03ysn2SwiS5D
         Yi3hlrpo8wS8Q+iMy82zkcFVNXFvHCkgxZ9JcpITTKxqCRdRdI39q/0hWSBxHeN4nvZj
         SdO6w5OFdS+GJPW6GeL592prc17GWtBFDG1mnbzhIEN9QoJI3xTZMfl+RZYQRFcX7Rwz
         6N4Q==
X-Gm-Message-State: AOAM531PugJ8nz0EWYs2IRhI8b0l+UWS1q/gSF/0enWU9v+TRcdWKJpK
	S2HVGXqx7rwRxO0FnnbVlryPjR3S9nNuwA==
X-Google-Smtp-Source: ABdhPJxzq9vnnc2Z/fvzCedh60BORm+Z/M0ExDXC5/w/VRxFNdvfkJcDKE+RnkueUoYocL1CMzTs+g==
X-Received: by 2002:a65:6790:: with SMTP id e16mr16817206pgr.14.1599485018394;
        Mon, 07 Sep 2020 06:23:38 -0700 (PDT)
Return-Path: <matt@madison.systems>
Received: from legion.athrat.org ([2600:1700:87f0:9cff:51b4:f6d6:111f:d07a])
        by smtp.gmail.com with ESMTPSA id x25sm11792142pgk.26.2020.09.07.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 06:23:37 -0700 (PDT)
From: "Matt Madison" <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Matt Madison <matt@madison.systems>
Subject: [PATCH] image.bbclass: fix REPRODUCIBLE_TIMESTAMP_ROOTFS reference
Date: Mon,  7 Sep 2020 06:21:15 -0700
Message-Id: <20200907132115.1015287-1-matt@madison.systems>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 97b439469a45a089431ca9c31893288c855045f4 added a fallback
mechanism for getting the rootfs timestamp. However, it uses curly
braces around the variable name, which causes bitbake resolve the
variable reference, rather than the shell, so the git timestamp
never gets used. Fix the reference to restore the intent of
making it a fallback for when there is no git timestamp to
retrieve.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3b5600e550..730c843c18 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -651,7 +651,7 @@ reproducible_final_image_task () {
     if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
         if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
             REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
-            if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" = "" ]; then
+            if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
                 REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
             fi
         fi
-- 
2.25.1

