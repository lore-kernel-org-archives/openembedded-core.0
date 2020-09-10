Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.20779.1599740703440097867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PniqPsIb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id x14so6445101wrl.12
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ObKJagjqBGLvYZoH3Zl4LvbwzVpOlztErUeweAz+2E=;
        b=PniqPsIbrMFXwdO9D6kXIqEHpCmvPdQkn9GfhQmYVPoXcpVwnb01LMPRJwVptdWNMI
         buQeC2j55lo+wVMilTGHLqpDyaJKbPUFZTuo0vkcuTAV8h1FQCchPD8+ggfwd0ojwvoR
         WnwLuixhkvoX7j87DIn8CxazIESlHv0b0hmMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ObKJagjqBGLvYZoH3Zl4LvbwzVpOlztErUeweAz+2E=;
        b=gbzC1VOpr5V1L1la0plIrW4TKJIVaDv9JtNd+LfvlyyUQsvgtcoPsMASJev7gBtJsY
         KdTteFo+xBrmm0SKanZY9cTMkutEov0EykZUzmOSfLE7nd2GMmaVa2KIRDKLOAtxDt+P
         TWVFKz/vFFKZ/2Mwww+Qfpyih62jGVygYI1AeeHxRSShNSJJtenewCuVckEfQGedQfhe
         b5tjQsPP8Z20whLBKjEnjExVayJ+WzuWfk3o7D0uSQKrle9cYF7gIxuJSAyiVhE9GPGc
         iFzkkSEfJ/3QB97TxlgevswgwhuYLCDktAK8PcMVBoFJI3p4qmdJHlhh3jOTqExVXqFD
         juFw==
X-Gm-Message-State: AOAM531BE5c/4KUeAK+hx9hkl427EWHQc8+8oAg4UyEbit6hmutFfKdJ
	HiRqIt76I8yPtQMyK38Mi64H1En9Lvt0AA==
X-Google-Smtp-Source: ABdhPJyCBRyMq4B580yO25r1dU8hxKNmwAN9mnf2c7ZjSo8+m/bPWv0SvZrL7BxIYuqeuxMyD6VOeQ==
X-Received: by 2002:adf:ef45:: with SMTP id c5mr8405878wrp.37.1599740701763;
        Thu, 10 Sep 2020 05:25:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:25:01 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH][thud 26/29] cve-update: handle baseMetricV2 as optional
Date: Thu, 10 Sep 2020 13:24:30 +0100
Message-Id: <20200910122433.2040293-26-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

Currently in NVD DB an item popped up, which hasn't set baseMetricV2.
Let the parser handle it as an optional item.
In case use baseMetricV2 before baseMetricV3

(From OE-Core rev: 77f119baf6f4b85194a9b26d8442ddc7fb3bb97c)

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index db1d69a28e5..e9a023e9bd6 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -160,15 +160,20 @@ def update_db(c, jsondata):
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
2.25.1

