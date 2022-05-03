Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F0EC433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 07:52:03 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web09.8350.1651564315758426168
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 00:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hD9WLYiW;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id bv19so31880304ejb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 00:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bebVfni1hPDnwLTQogkb4fdBbAsnpR6mt8HBlfnINz0=;
        b=hD9WLYiWPA6vO5jLu7yTg9H5YFW6ODWuEnASi6q9M0RRk3SI7khKvfuTFH2jJabuT1
         atQOrxFPyyaXFnLlfXom1qqGZwteLeAdjKpT0M6+BHf+jvP6LgNW4YoW+GPmWi9zoYAv
         HYzCMz653KKKNixF162LR86/4B85+ai1AdKyLIRZ/cM9F53gLNIK7UEk7uUz7aPKAm0Q
         J1YHvL4iOx9f6gPpo55dfxrCgm3IuR03jIWSUsMQMwfEVGWs5A06Qmkxmy1bs6jfKarm
         gfAdECsEjslNLNzuWWhc3p0zFNOliRk4lwjsm42uw1pIEvv78jJsouahOxzS0WlccYPS
         HGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bebVfni1hPDnwLTQogkb4fdBbAsnpR6mt8HBlfnINz0=;
        b=GL8UZkWTk+jzcJOg4CteX7n9Pho78CUqDO8b23mevNrDSpJSIXj3KTwiuJH5K3owld
         Dv+sGGfF+0UEfyeg6rALTv+7YzPcXcNJMC7Bos2z/TRK63aNVOrrNQ8P3XUR4wrnKWMx
         eAoQnBm8xY0OJlR27R7uRJYZlv5GsrtdxvAkalPOx35GvwycT2qfTfFAtzhEeuWQT03M
         TO7whDgK8pwXIP6/BB439PilCTSQ2inRv3s4Rka6DcubGa+Ii8bUCNhboIt19gJcjiv/
         VbU1HfO+N8bQq3Su8ehtmRjr6TuY9am37qx6U1erUufNcVNRJjn/FmqIrpRjugvDECQM
         +NuA==
X-Gm-Message-State: AOAM531I/7n9up0nCV8O+Zmk1wHIVSm4FbEX+sKGkJJmpwJ9m6LKyefh
	eztGdPGb/1Fc3xTrdc1iWvkVaELZeh0=
X-Google-Smtp-Source: 
 ABdhPJwpwKhunb2tNmSuvd4Y4SqSkb+Gll7RzRF2ioD0lEuih92wOyOaJ0f4BZ28ntRj21MuM7kJvw==
X-Received: by 2002:a17:906:300d:b0:6ec:c1b:9780 with SMTP id
 13-20020a170906300d00b006ec0c1b9780mr14488593ejz.415.1651564313917;
        Tue, 03 May 2022 00:51:53 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-163.retail.telecomitalia.it. [87.5.19.163])
        by smtp.gmail.com with ESMTPSA id
 u5-20020a056402064500b0042617ba63a0sm7562056edx.42.2022.05.03.00.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 00:51:53 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH v3] cve-check: add JSON format to summary
 output
Date: Tue,  3 May 2022 09:51:43 +0200
Message-Id: <20220503075143.7669-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 07:52:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165191

Create generate_json_report including all the code used to generate the JSON
manifest file.
Add to cve_save_summary_handler the ability to create the summary in JSON format.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
    - v2: add a check to prevent linking the symlink to self and deleting the output file
          if the link name and the output name are the same
    - v3: fix patch not applying
---
 meta/classes/cve-check.bbclass | 51 +++++++++++++-------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 78516d0..e4e7240 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -79,6 +79,30 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
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
@@ -101,6 +125,11 @@ python cve_save_summary_handler () {
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
@@ -175,25 +204,11 @@ python cve_check_write_rootfs_manifest () {
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


