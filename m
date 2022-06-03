Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF5BC43334
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 12:17:27 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6569.1654258638475878692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 05:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EcB1sLNg;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u3so10189246wrg.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 05:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MA5Xmb/fJIohoOgJowXzrAVdFKzDjtBenjg6jJeWvDU=;
        b=EcB1sLNgy0vHalM+oOzlqpmT5Hc0hWUK15u0ooyN8u5CSxLCFFcxWYVQX0WlsyOGy/
         ncllO3E+DDYjIGwINDTki/skE/FyE8CnYr3Fid3pebUqYT4ZmlpnWpVwYrjXjeRjQcXi
         JLmj633tPLwDwdRPfzVh8aeBCjhmsG5vcvD5buSx7uJdsUygcoOkJNgdUKk98ZIwfRLy
         v8xe6NFzg6WI7qTDEVsRMa1b2cWcELK4RizulMmrELByTP5En3k9dvQ36RmP93dPHXGC
         ZLH8zZ+dR7EX17zWJeDIsifN9S6DUFL3rrDzjzykrhsZZ7LO0QMmi1+Mgd3RsCN9Q/QX
         meXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MA5Xmb/fJIohoOgJowXzrAVdFKzDjtBenjg6jJeWvDU=;
        b=Kz6HFuHLt3SgxnBPVzztPBy/p/Tqy+/kieDnVNVTDQ9eewcQlLrrbuPvbLYVYL3LHQ
         pIxhGD4GVCRJMo+cVPWISV0HXJr65e26BHHDNq2FT0OiATXioRv82aGC7t3K/Djk/Eem
         eqZEPjP4wiVxR9wdSWQZGJJtpFW7zqUIs9vin79OROZRG12c46Odmy2pAyv0FguBbgBL
         vAg73y54rbFyDoPj48291/FsoG4+ytXfpx57Lk33NGGAGiyoDbP7CnH9/M2sAre08qT0
         2fb/zGkKf5V6v+zna9oGbbbcfc9fCvVxdM8ia9xKp3CC9em8PEkHzHG0Kvmpf477bsbb
         OMlA==
X-Gm-Message-State: AOAM533Oitn10xWNKLuOPhKJeHxhi09E2NCgT3Gir7ZGjeQrPQ0aJVbv
	l0qtXACsSrOMvU/Wu+qCrin/tDHX+yA=
X-Google-Smtp-Source: 
 ABdhPJwON1xxce39Wy0stLrAS/2yniXBlotbsYLMnR20pcay/RytEKzGwhVD2Ll0CC1zT6aEkAPkJQ==
X-Received: by 2002:adf:ea82:0:b0:213:bbe1:ba4e with SMTP id
 s2-20020adfea82000000b00213bbe1ba4emr2589795wrm.387.1654258636353;
        Fri, 03 Jun 2022 05:17:16 -0700 (PDT)
Received: from localhost.localdomain ([80.215.210.162])
        by smtp.gmail.com with ESMTPSA id
 a21-20020a05600c349500b003958af7d0c8sm8284542wmq.45.2022.06.03.05.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:17:15 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ernstp@gmail.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH] cve-check: write empty fragment files in the text mode
Date: Fri,  3 Jun 2022 14:17:10 +0200
Message-Id: <20220603121710.2443242-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 12:17:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166517

In the cve-check text mode output, we didn't write fragment
files if there are no CVEs (if CVE_CHECK_REPORT_PATCHED is 1),
or no unpached CVEs otherwise.

However, in a system after multiple builds,
cve_check_write_rootfs_manifest might find older files and use
them as current, what leads to incorrect reporting.

Fix it by always writing a fragment file, even if empty.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c80a365819..0579d882db 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -440,23 +440,22 @@ def cve_write_data_text(d, patched, unpatched, ignored, cve_data):
     if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
-    if write_string:
-        with open(cve_file, "w") as f:
-            bb.note("Writing file %s with CVE information" % cve_file)
-            f.write(write_string)
+    with open(cve_file, "w") as f:
+        bb.note("Writing file %s with CVE information" % cve_file)
+        f.write(write_string)
 
-        if d.getVar("CVE_CHECK_COPY_FILES") == "1":
-            deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
-            bb.utils.mkdirhier(os.path.dirname(deploy_file))
-            with open(deploy_file, "w") as f:
-                f.write(write_string)
+    if d.getVar("CVE_CHECK_COPY_FILES") == "1":
+        deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
+        bb.utils.mkdirhier(os.path.dirname(deploy_file))
+        with open(deploy_file, "w") as f:
+            f.write(write_string)
 
-        if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
-            cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
-            bb.utils.mkdirhier(cvelogpath)
+    if d.getVar("CVE_CHECK_CREATE_MANIFEST") == "1":
+        cvelogpath = d.getVar("CVE_CHECK_SUMMARY_DIR")
+        bb.utils.mkdirhier(cvelogpath)
 
-            with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
-                f.write("%s" % write_string)
+        with open(d.getVar("CVE_CHECK_TMP_FILE"), "a") as f:
+            f.write("%s" % write_string)
 
 def cve_check_write_json_output(d, output, direct_file, deploy_file, manifest_file):
     """
-- 
2.33.0


