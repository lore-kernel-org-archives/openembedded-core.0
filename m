Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69499C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 07:43:57 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.7859.1651477433257902729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 00:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hnuPXqAv;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id dk23so26233308ejb.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 00:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bZBSJje6lRR6fiBpRN09Hff1PFb9PneLBLaBZgRocs=;
        b=hnuPXqAviLzp1YjOceS0vUOJ8gfgAX7sHNgG3LT/Swig2XBTfy/lf+JjBAtBLbY5Lk
         MW7nLxjrVk4PlVcn27x+pBF+kJ+sFjAcIZo445S1XjKGr2OLumPVsjRCHsrUmeC41d0r
         ZrqroHenrSqlL/LMvU3+/SH5AZOBK1Mv0H1YksfRIfeNhoXzzNbVc3eowRqMmSrWRR+y
         18BrozS60xIyj/ScbZ95gEKrdypYSDEWsOsT22EUlr9s23w2/xxPLGg6c1idZGWISkp9
         H2mOEAAxL454YcRUYuOd0KFSndk7QSxch9CHcD65DBpnSRzGxhdu7PZEwP8L2qADbFHR
         FlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7bZBSJje6lRR6fiBpRN09Hff1PFb9PneLBLaBZgRocs=;
        b=b7cD0OXgRfLH8r/n0gMR9EECfffE+JEyB1oL66TSWPtjrYyPLf/5MInOn091DOt5Zt
         rxmbHPFXdrUP3+c3/5jbDJyaMs4powM1/fjNG9K+PIWxkq2y85xGHENOQFGlXEbNDkqz
         RaRjGzFYF3nmiwbGY5d3lm/Zllcwk2TRdMZ/FDrocsjgdvoEMwQGi51kk9gJo/pzLZ4Z
         8XBPpOCbyFfx0Jm7+VuUzEyg22mTEL1oqm4/YXS1dd8qVSZ9QikFvVP3dUsv8K/NcWVp
         13Hno8R+ZfBq1Vk8oxD9irVPfbJkHX+zx1mwwwbp/34Lbo5LhRN01EXnlIpobKoRN9JI
         Kxmw==
X-Gm-Message-State: AOAM531SpZEMAaQ8+0HDJXlKyi/kK4pwwc0i0JxswahGGtB3gun1KL9w
	sVRoVLg11vQXl3blmpFFcw/Hxo1s5mE=
X-Google-Smtp-Source: 
 ABdhPJz2qAXmxY/IQ6vopR0bEW775NOpYyV9919Bl2Ms53HdzG/zKQJQ0NvYvPsJ1X179I53H1vUBQ==
X-Received: by 2002:a17:907:3f02:b0:6f3:5c42:321a with SMTP id
 hq2-20020a1709073f0200b006f35c42321amr10410954ejc.521.1651477431195;
        Mon, 02 May 2022 00:43:51 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-45.retail.telecomitalia.it. [82.60.178.45])
        by smtp.gmail.com with ESMTPSA id
 hg13-20020a1709072ccd00b006f3ef214df3sm3322495ejc.89.2022.05.02.00.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 00:43:50 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH] cve-check: add JSON format to summary
 output
Date: Mon,  2 May 2022 09:43:17 +0200
Message-Id: <20220502074317.6470-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 07:43:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165160

Create generate_json_report including all the code used to generate the JSON
manifest file.
Add to cve_save_summary_handler the ability to create the summary in JSON format.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/classes/cve-check.bbclass | 50 +++++++++++++-------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 78516d0..64875d7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -79,6 +79,29 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
+def generate_json_report(out_path, link_path):
+    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
+        import json
+        from oe.cve_check import cve_check_merge_jsons
+
+        bb.note("Generating JSON CVE summary")
+        index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
+        summary = {"version":"1", "package": []}
+        with open(index_file) as f:
+            filename = f.readline()
+            while filename:
+                with open(filename.rstrip()) as j:
+                    data = json.load(j)
+                    cve_check_merge_jsons(summary, data)
+                filename = f.readline()
+
+        with open(out_path, "w") as f:
+            json.dump(summary, f, indent=2)
+
+        if os.path.exists(os.path.realpath(link_path)):
+            os.remove(link_path)
+        os.symlink(os.path.basename(out_path), link_path)
+
 python cve_save_summary_handler () {
     import shutil
     import datetime
@@ -101,6 +124,11 @@ python cve_save_summary_handler () {
             if os.path.exists(os.path.realpath(cvefile_link)):
                 os.remove(cvefile_link)
             os.symlink(os.path.basename(cve_summary_file), cvefile_link)
+
+        json_summary_link_name = os.path.join(cvelogpath, d.getVar("CVE_CHECK_SUMMARY_FILE_NAME_JSON"))
+        json_summary_name = os.path.join(cvelogpath, "%s-%s.json" % (cve_summary_name, timestamp))
+        generate_json_report(json_summary_name, json_summary_link_name)
+        bb.plain("CVE report summary created at: %s" % json_summary_link_name)
 }
 
 addhandler cve_save_summary_handler
@@ -175,25 +203,11 @@ python cve_check_write_rootfs_manifest () {
             os.symlink(os.path.basename(manifest_name), manifest_link)
             bb.plain("Image CVE report stored in: %s" % manifest_name)
 
-    if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
-        import json
+        link_path = os.path.join(deploy_dir, "%s.json" % link_name)
+        manifest_path = d.getVar("CVE_CHECK_MANIFEST_JSON")
         bb.note("Generating JSON CVE manifest")
-        deploy_dir = d.getVar("DEPLOY_DIR_IMAGE")
-        link_name = d.getVar("IMAGE_LINK_NAME")
-        manifest_name = d.getVar("CVE_CHECK_MANIFEST_JSON")
-        index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
-        manifest = {"version":"1", "package": []}
-        with open(index_file) as f:
-            filename = f.readline()
-            while filename:
-                with open(filename.rstrip()) as j:
-                    data = json.load(j)
-                    cve_check_merge_jsons(manifest, data)
-                filename = f.readline()
-
-        with open(manifest_name, "w") as f:
-            json.dump(manifest, f, indent=2)
-        bb.plain("Image CVE report stored in: %s" % manifest_name)
+        generate_json_report(json_summary_name, json_summary_link_name)
+        bb.plain("Image CVE JSON report stored in: %s" % link_path)
 }
 
 ROOTFS_POSTPROCESS_COMMAND:prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
-- 
2.32.0


