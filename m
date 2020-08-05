Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.8715.1596639013237318513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oUh5fXtU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id o1so25392367plk.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rQc2CQEwfB+FLd+mRxDE/MczrWT7+qfbpWmdcxfXE0A=;
        b=oUh5fXtUkNi5QFQcC+AQct/O/KUOZy8V+0a54Y/18H5VKcAAsYYi8suma06GJeOG2O
         +BsCix0UJ19b2C8ok5M3LYzOq5qfPFvk4Qs++h1WhBpfXqnDTZ/waejtlxsQak4lh0kt
         FOE/cmJHSlN109OaO1ye52OKUQyUdWsx668evCmSe5fM4ShJwgtjeigH4Sma0t67zdp4
         ak92sj59H5x/zMG+lAmhvz7xYlhNAbgz2bsWtljImQTXKBEyCGjte4krcRTAisIgiFXJ
         G+MTkG4aUs0cC7PlCxQtfv9Dtgnp9CJSUD8yoW1uo4e2MKy4ZPDRc+HG+k84OQNRJikN
         rAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rQc2CQEwfB+FLd+mRxDE/MczrWT7+qfbpWmdcxfXE0A=;
        b=oel+O10mdudmSTtTVEPAAFPt2OPfiM/ZROq99IHkGk49pX81jTSphTL9h2kIRQHgEX
         MhhC0fukXwDJ6HqcML4S4JoyfXjwpLIVXFraJ5HI/RwSFBO/yV5uANuIntEjwm9ybXwF
         +ft2OAnoG5mfL+SzbmtO+Yb+NFV9mhc+qQ27G4zFJVSkFWM+1GlgrV06gSsMSXedNEmI
         mjn9cxO6ytbVGxwUX9Z6ZnZs/XXCoaFmQ9K7funpnrp/TpEor899gSPiImMpLMFOxSAj
         9mamqbdWfP8P1qn4oP6FF3mDvZ7T/4HUa4ECyxk6X3m/oeqZWOET9nRU8AKCc9maCjtP
         nUTg==
X-Gm-Message-State: AOAM533hQDA9BoPwkk6JSLXpf3xlATQWZbWGLkPNrMDakzxAojqnSVgv
	/KL5zlTEKJceGC6P01GogUncrTGR9m4=
X-Google-Smtp-Source: ABdhPJwcPiWgxBB+dDjM2a1SBhntEGz13kNafB+rWLSqfF46AjkoluTr4FcpPhfjV9t+j/XwzouHZA==
X-Received: by 2002:a17:902:bd01:: with SMTP id p1mr3562725pls.25.1596639012355;
        Wed, 05 Aug 2020 07:50:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 04/11] cve-update: handle baseMetricV2 as optional
Date: Wed,  5 Aug 2020 04:49:27 -1000
Message-Id: <135a6a4f55aed6148f45d01b307fadbd45be2997.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Currently in NVD DB an item popped up, which hasn't set baseMetricV2.
Let the parser handle it as an optional item.
In case use baseMetricV2 before baseMetricV3

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fdcbf3f28289188c5a97664d1421d4a5c4991eda)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index f27ade40db..32d6dbdffc 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -176,15 +176,20 @@ def update_db(c, jsondata):
         if not elt['impact']:
             continue
 
+        accessVector = None
         cveId = elt['cve']['CVE_data_meta']['ID']
         cveDesc = elt['cve']['description']['description_data'][0]['value']
         date = elt['lastModifiedDate']
-        accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
-        cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
-
         try:
+            accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+            cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
+        except KeyError:
+            cvssv2 = 0.0
+        try:
+            accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
             cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
-        except:
+        except KeyError:
+            accessVector = accessVector or "UNKNOWN"
             cvssv3 = 0.0
 
         c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
-- 
2.17.1

