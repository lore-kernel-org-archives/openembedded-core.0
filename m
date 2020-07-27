Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.47863.1595818251132991906
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 19:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t1cB+5DN;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id l2so1917370pff.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 19:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=7CbbsHqHQCg4yFeJ7tF+vTVtG4JG3H8W506G+/MBlUc=;
        b=t1cB+5DNHSEELxgzhqQp6XxGlI30n6LbY9cqd4s5sQni0pIs/hpWo7tBOqhbg0J6oj
         oocQ1y85sxVEB3HMz+RZR4zi7MICarrh5gvhaDWMValas7MfKjwnxFuUQqIFHj2lkFMn
         igD5ly1XBI5yhd+X4V1O0t55sfN/UYzB3vBOC39ap1YkmmbJG/tRY1/14aMPIsS5L/PP
         1mxXvYuIGRUUy3SEQoGbO6Jr7smkLdw27mK9QyeBE2vjVnJw0FcCtMZBYBBJ3lOyEVQL
         46Z2EWgsjx7oH0DkZ3s6MbdixT5QTDxS9TflhCF3JHtRdDjsZKPAvYbUgY9HRCyCp1Ex
         NZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=7CbbsHqHQCg4yFeJ7tF+vTVtG4JG3H8W506G+/MBlUc=;
        b=Vks/UdiJf4Ssa1bRLr5naAN0Jl1n+lf6ORmXDJDwQ46IOfJ7yA69Y/2fM7Nfcz4/f1
         T8vCgStHJpYIFGayXCjII9D6D9qomzVIIGCNpkRi+elbrZ/2iinXHuM4Mmk5rpWcPnWj
         O9mjFhZQL4RwCV0HI5TOx1tEZE9MNBT2OB5QMqDd42RmbVQSecRwYuvAK1+gQqzWgUQc
         +p6vmTTUFn37jVn/TU5L5jAuMJS1TH435Km8SmIqqmEvyWSpnbPXIEYNttks9liuNqH8
         /mjEyvPweU19+tH/FDdF4DFh5lyWskDQ3+Iw4HOZ+8Yp8715gj0yMmk6+HXwWNAvIpLd
         6oow==
X-Gm-Message-State: AOAM532yNJCGYO0ztoDz/FhJR+r3iDatkIb/QySxqLGESZ2i8vRrO9pZ
	sXgUj2UzlerIVRPw3F9HmPACA1gGq5c=
X-Google-Smtp-Source: ABdhPJwm0AyFbdMvP2TJ5BKDpv8xgWdBa5In3c76vY7z+ob0qwUOmUDiTI4vXRQa6FqO+R5AI54/+w==
X-Received: by 2002:a62:a217:: with SMTP id m23mr18411512pff.291.1595818250341;
        Sun, 26 Jul 2020 19:50:50 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:957c:826:e40f:5fde])
        by smtp.gmail.com with ESMTPSA id d14sm13044783pjc.20.2020.07.26.19.50.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 19:50:49 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cve-check: print warning if file is missing
Date: Sun, 26 Jul 2020 19:50:47 -0700
Message-Id: <20200727025047.24186-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

If the "tmp/cve_check" file was not create as in the case for -c populate_sdk, just print a
warning instead of dumping a trace back

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e61c90e5600..b16da9890af 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -56,7 +56,7 @@ python cve_save_summary_handler () {
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
     if not os.path.isfile(cve_tmp_file):
-        bb.warn("File Not found, check has no affect: %s" % cve_tmp_file)
+        bb.warn("File Not found: %s" % cve_tmp_file)
         return
 
     cve_summary_name = d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
-- 
2.17.1

