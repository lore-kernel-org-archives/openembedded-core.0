Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCEAC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 18:20:22 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.388.1652293213975340687
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7QcwZi8H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id v11so2680486pff.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 11:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bhyZT/rfVdH1irvYTNnrL9I0h0s+F8RRHKR+Ow86ExA=;
        b=7QcwZi8HRc1Kvxzwdf3VTZb8qJ8+bZWdwsgMKPWHkgzNkylaq8IdsK2Qf8ojFm1i2r
         IaRmFYQQcRIoRHEPFm7NziJqUrBMPURfMsY6H8p9zLCgG+jrtoSvFScrWHkZPPjYhj0t
         3BkCrk6RIGTSqErh21OeNeflHcmYOkPIy+PkBF8ILJDIsuIRLJIihYUsCSzDOSbU3yCO
         mbBOVufu97gZAMqOGDtUORbzQnaQBOsfQ1V17GRASt6Dx/E/4V5h1B6kYAbyKDq8DPnE
         cAMF2lG5qtg4vBt/23aDgcVlLmCO50YG4vK640AuS46P7XCnWbc236rAcOHDh1izf5kl
         mEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bhyZT/rfVdH1irvYTNnrL9I0h0s+F8RRHKR+Ow86ExA=;
        b=MwS+dkGiqy6BtXhqwQ1n5r5WscJKF/wEUvQLqa0tzlKx8ZHtYAbxpUDi7/MdQpBajP
         bBetjI7dQaOzhGoWNC2ud1938kphX2dSbDvVFIBPUjxp6hiSqhBALaXi81d2bkgX//gH
         hpvm4m5PtD/oLwOLIDvJDetGwRurUNMuVjDV1WH131siBcvxqc/lnHXRGS1SPf6egDLh
         nvF0VXifAKIZSZ/d8YhyqPFSXdZTzn/UHLwbBfb89Mmpijfx8VUyi5HR57mJAEXICzwB
         bjyE7z+wWvyAH/7Fd2I5Ew1aJzc5b7PDhj7SG1qYwEHCtD9KkGHSSA6SBk+96DKggsVf
         RIgQ==
X-Gm-Message-State: AOAM533YrizL84YSViDE0mvFkkI/MJgcpt4WqPSSAea/rpbmjKINynIo
	ZKBsgNIXKVJm8t+fyZHH2DT+JM0ADlJ/bn0z
X-Google-Smtp-Source: 
 ABdhPJxjioavyPXNJCji15T6L4+DgvwW/BVYR0g76YOaUiSNCM+P0CFCeLqW/ARLsm8s0Y3QEENgiQ==
X-Received: by 2002:a63:4a04:0:b0:3c5:e6c2:a111 with SMTP id
 x4-20020a634a04000000b003c5e6c2a111mr22489814pga.432.1652293212618;
        Wed, 11 May 2022 11:20:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i14-20020aa787ce000000b0050dc76281bbsm2126132pfo.149.2022.05.11.11.20.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:20:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] cve-check: add JSON format to summary output
Date: Wed, 11 May 2022 08:19:27 -1000
Message-Id: 
 <d8ef964ffeb92684d01d71c983af9dbb1e1b0c4f.1652292852.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652292852.git.steve@sakoman.com>
References: <cover.1652292852.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 18:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165514

From: Davide Gardenal <davidegarde2000@gmail.com>

Create generate_json_report including all the code used to generate the JSON
manifest file.
Add to cve_save_summary_handler the ability to create the summary in JSON format.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit f2987891d315466b7ef180ecce81d15320ce8487)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 51 ++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 41b4eb2dbf..350ed8ec39 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -75,6 +75,30 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
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
+        if link_path != out_path:
+            if os.path.exists(os.path.realpath(link_path)):
+                os.remove(link_path)
+            os.symlink(os.path.basename(out_path), link_path)
+
 python cve_save_summary_handler () {
     import shutil
     import datetime
@@ -97,6 +121,11 @@ python cve_save_summary_handler () {
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
@@ -170,25 +199,11 @@ python cve_check_write_rootfs_manifest () {
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
 
 ROOTFS_POSTPROCESS_COMMAND_prepend = "${@'cve_check_write_rootfs_manifest; ' if d.getVar('CVE_CHECK_CREATE_MANIFEST') == '1' else ''}"
-- 
2.25.1


