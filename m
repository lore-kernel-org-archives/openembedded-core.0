Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.12458.1596464849460462622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=GpI/NJQe;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id f9so11386247pju.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=rQc2CQEwfB+FLd+mRxDE/MczrWT7+qfbpWmdcxfXE0A=;
        b=GpI/NJQenAsVhfG+RpfkanjthmQAWsWPpt3IkjGImK2s222cFqYQ3yF91cGJIrQ96G
         PZ4ZuJmyhM4e6qYe8gNxlE+w+c3s8kxYZcIw3q34LXlB4XhsOls/4eJtSohdN2rJAzsX
         Xq/6g5iq52n64tQhH7gZsvb5YeBg5Ah5nvfuvmp/C8pd4vd9bWB+O2tiycQLwU7ZwLV3
         2OTvToSo1u4XUIKuxUnnzjZXjCBLVCVGjqfGnooeRBlc/pnxoaVZ0/5qsqZFP1kr7BsX
         DHgNBc4RR6qMR2KTmYa1PiuT9gqkVwXKCwuTVBxaR8FTIYiH8b5eqzo9jRUiECF7FlLr
         YiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=rQc2CQEwfB+FLd+mRxDE/MczrWT7+qfbpWmdcxfXE0A=;
        b=Jf+KIP4xVUYDVh1TaenyYvnyN8gv6eHgrNTXWCwPSCiBuRRAVGaZ+6bePU188kMDsh
         dMLbf0PoXneNjy0EdJn4wAENe9DzNGadw+gOOpcYwkIXRFToNSG2InCEb5ZcqtP4LZIV
         MuzgecdarzeglaY3xi08xy41LR2ntq9n36lJ3Rd404cqbf0tYB6pmilDgdYmGO9L1coG
         fYWLymDvVt9BDIuywKj70+lHIJOrPqPgNV8lYLUQ8fgs5AlR43KYe0Fo2qfokhhurDBo
         ZFnugGRmgSOnwkKJ3kfoRwDQpkjqDNV7qoBK2P7nQK8k3C/MpZcAj9kEsqoGirdqRmhO
         VH0g==
X-Gm-Message-State: AOAM531zihg6L3bsqtWybe9R4J6IYM8LQITnVPvMyee2i5UD0Wo/eyPA
	VVQKGhxKkj1lZ1ZglHN4iohGiupRDs8=
X-Google-Smtp-Source: ABdhPJyWI0UTKn9xj2g5JBeHpdWeuZYCLwDh1UFOaV6e1FmcOdcLCxAYJKhHiMeOaEWt2i95DiEAGQ==
X-Received: by 2002:a17:90a:eb17:: with SMTP id j23mr16817163pjz.151.1596464848465;
        Mon, 03 Aug 2020 07:27:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] cve-update: handle baseMetricV2 as optional
Date: Mon,  3 Aug 2020 04:26:56 -1000
Message-Id: <135a6a4f55aed6148f45d01b307fadbd45be2997.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

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

