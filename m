Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4B5CCA48D
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:29 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web09.7426.1654699645873332443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=j5l54Xs0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id g186so10213257pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=/HreWVmkgvMibX5deOFbHCe3Rv53dAd98d5EjYMRV8M=;
        b=j5l54Xs0btN+1B9zUqsOhjf7AEfAbWQcaDjGGUbxQVGKPX6Iawe/CH8qbKC2oYljKq
         AL8ZrGjeJhcurQY0RdGdzxaDgpvz13nebJc5QlPLl0fwRkATv+tK2zjwVXL8xGbY2pEH
         UVgjGsWn3Oyf9Ip4U/dmfTH8Q4LJrPbixrf51XEX1eKwCmA+if9dD/l6G9uAf1LcX0Ny
         4LK2Gd/U5GqXFT9jgWRuA/AI61uS53pkxGA3SEc1KjXltFCLdZwMRTG+UXxBYSzoyNSo
         I3dZZIhArVjr2XsXCo538HicIY9D69qaMloOKm6yxcs/q25qoyA7ffC02YdC4lDss/km
         dUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/HreWVmkgvMibX5deOFbHCe3Rv53dAd98d5EjYMRV8M=;
        b=fVFHLDQDsXp82AXQll2EKRzeQfQkqTFcCk04yhaVyy/glCXfOILsdhQLqu8UzIc0Zq
         iqOLYKnwMDBOnfLWtAU0qbnhohtwj2ELctjRDsVxCvjuzWp6II5Wmh7SYh40CvORAaWw
         S7fUfJRhF/n1KsOMEnG8tFRkZNbGeLGy0rgMcc1cgqOOSbX4O/HxN2RY/gZ+RjwZf9hE
         xPw8gFnuxmWOkkMGblsAE0pr+vwXdkRyNVBbC6HVCMIpdXWcKZfJIuh2wWFDDjJzhSQs
         4fzp6d5guETHhBT5gC10GyiqQd11AWx9cJV38b4mLcS7sVHu1kzeu5ZrL5Vxwhj7qXAS
         gU2g==
X-Gm-Message-State: AOAM533R4TsOASuf7tIWB7sdTNgGz6pJeQGM9qFLFTpCQC6BJl7vk4mW
	ReJcUCFjkHXrJMQThg2TLIyYiYgh0A1Zlkfj
X-Google-Smtp-Source: 
 ABdhPJzJteNe8jBDfu+6GQ1cyE5MvLk2ObxFuJSsDIPrlbiAOKW4lsqxiq3h8q7nlpQ+f9H9Xwe+Jw==
X-Received: by 2002:a63:341:0:b0:3fc:824e:86bf with SMTP id
 62-20020a630341000000b003fc824e86bfmr30863824pgd.140.1654699644804;
        Wed, 08 Jun 2022 07:47:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] cve-check: write empty fragment files in the
 text mode
Date: Wed,  8 Jun 2022 04:46:35 -1000
Message-Id: 
 <4c10ee956f21ea2f805403704ac3c54b7f1be78c.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166746

From: Marta Rybczynska <rybczynska@gmail.com>

In the cve-check text mode output, we didn't write fragment
files if there are no CVEs (if CVE_CHECK_REPORT_PATCHED is 1),
or no unpached CVEs otherwise.

However, in a system after multiple builds,
cve_check_write_rootfs_manifest might find older files and use
them as current, what leads to incorrect reporting.

Fix it by always writing a fragment file, even if empty.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f1b7877acd0f6e3626faa57d9f89809cfcdfd0f1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 2ab1720dc3..48f75456f2 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -471,23 +471,22 @@ def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
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
2.25.1


