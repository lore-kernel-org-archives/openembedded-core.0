Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.16133.1613304512195159475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 04:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fPiI3BU1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id t15so5197858wrx.13
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x3E1r/e/CpW8IDNRQstN+UOlxmRDxqNbcPBmMiln1MY=;
        b=fPiI3BU1IOZo1kr79Ya/WwVdetMMiy+w3GmST5nq77QTnt+jGgu/IK0FOjjbZwwaPC
         M2XjIRKZ6npdNwcWaVgcjB22h49iWKOOzpEpkzbnpTP2rfLqsszTMm8EK354jxUUzo/I
         HIw1WAXQkmORkNJN1xPSVRBLCBELLQDlywHuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x3E1r/e/CpW8IDNRQstN+UOlxmRDxqNbcPBmMiln1MY=;
        b=obseIrMQDb0pUdE6dywgi0NnhtIhyaAddKR3jQSxlCcN/r+80DJan+sqlOeujkmeJg
         2TNHeF4nvYlSnRWSXcMpmxeUXqrmtiGWAiJwNu9d3qvLDb1ZRPb+uDjI8EeTyu/keDHs
         twVVUPjKga0ySAMKjy7w344Nt+pTbN9orPS3wPPUjXYfS16gRWlhzMcN0JNBepngUtQo
         r75nM9XxDZ9Yz4lIRytxrat74HVHEFIHjTMEi5sCIB9xv/buv+LlQ2U4C5EPkP+j0Sqi
         chzO7b6vV+7nFzrYt1o/Q/vcyQZhCPJjseBa1J00Wgw/0qrRH7P0ypiegNaRMHvdebeT
         5Bmw==
X-Gm-Message-State: AOAM533FnzPOUzS2R75j/9uI6h4I3ykoO9yvah7uL1tT9t3iSanHt27O
	ICiNfZLKjYuJ2Y/ayF8GdbkxlUNV3OZkqw==
X-Google-Smtp-Source: ABdhPJzN+DK3VfjjnBwK93NFtR9Grye684q/II1Xhi7B21nI7hXFy2NhtgceOmlJKGuwjxXSUTOaXQ==
X-Received: by 2002:a5d:5104:: with SMTP id s4mr13451091wrt.277.1613304510572;
        Sun, 14 Feb 2021 04:08:30 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id t6sm10014393wrn.96.2021.02.14.04.08.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 04:08:30 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cwautomacros: Ensure version is set deterministically
Date: Sun, 14 Feb 2021 12:08:29 +0000
Message-Id: <20210214120829.1962472-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The makefile injects the current date into the version file. Do this
deterministically with SOURCE_DATE_EPOCH.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
index 65a99fc28d7..02b016fdf1f 100644
--- a/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
+++ b/meta/recipes-extended/cwautomacros/cwautomacros_20110201.bb
@@ -13,7 +13,7 @@ do_configure() {
 }
 
 do_install() {
-	oe_runmake CWAUTOMACROSPREFIX=${D}${prefix} install
+	oe_runmake LABEL=`date -d @${SOURCE_DATE_EPOCH} +%Y%m%d` CWAUTOMACROSPREFIX=${D}${prefix} install
 
 	# cleanup buildpaths in autogen.sh
 	sed -i -e 's,${D},,g' ${D}${prefix}/share/cwautomacros/scripts/autogen.sh
-- 
2.27.0

