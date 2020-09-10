Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.20410.1599740608981129852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NCKKQ0F5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id b79so5582730wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QVxkRgGGQDwjV5bvU7YrP1II10p7sRDFPmZtyZXVW7w=;
        b=NCKKQ0F5OK1r5mHF4T/iaf80XuNNNoqIFip1e/8smiFLYb5+IXAnhafwXpfAy0kijH
         an9jTosliazUd7gSeazj4ENlP+60w8x/nhTsXPi3Tps8bGvCzDOXk7b5WeJJ8yQfuKo+
         6aGKMVPl7gtiPlqcPeRyqO37Kgmo63uv7SDqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QVxkRgGGQDwjV5bvU7YrP1II10p7sRDFPmZtyZXVW7w=;
        b=VtDcW+by7rt5zVC4WxEcgqCzGfbfTbw32aP4kRIFP0eSPt3HdfhN/K6+bZm2JCQDUk
         vW7XKV5L4gtK5cqW7zeJexcKl+v60O03+vebklITnyF8E7itKO4u9f6V5VnxtmIYqvfQ
         Ff/HQ6XkxURSosVG4hAH9rY9RX2EtGyCZ2NvR3tTyPYrMpOHIgLBLxjJxOxR8LqgfjZK
         vsTbSHXolpab3sqNTTruD2v/0FHwUTmUxnzsw3ZntpqTQLsNCv68DCfwL3RxfuJfT8U0
         KBS5Jmzt3G0NC0uSq9kVQandCvOc7rppDulfWESgosa0ah+TkvwRDytd1LgHlzHrnMuN
         nutw==
X-Gm-Message-State: AOAM532t4Frr+oESQu/RajJ2MZnVoQh+wD9rCSRbBPFao2a1YQ4AnoDK
	S86aM8IUSMbxH711GsZ33oLqg7AnlbPtvg==
X-Google-Smtp-Source: ABdhPJxrnPvsiAQeAcrX9lydrdHQpezHgPcyGB6Q2YLV7K0A5Vi7kHQTdV+HdF3eqyuRuSoGSt0IRg==
X-Received: by 2002:a1c:2854:: with SMTP id o81mr7923660wmo.61.1599740607242;
        Thu, 10 Sep 2020 05:23:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH][warrior 21/22] cve-update: handle baseMetricV2 as optional
Date: Thu, 10 Sep 2020 13:23:05 +0100
Message-Id: <20200910122306.2040194-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Konrad Weihmann <kweihmann@outlook.com>

Currently in NVD DB an item popped up, which hasn't set baseMetricV2.
Let the parser handle it as an optional item.
In case use baseMetricV2 before baseMetricV3

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 1b4f31692ba..c64dd768c85 100644
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

