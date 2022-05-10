Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693B8C433EF
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:05 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.10706.1652193565397838443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uzsEjHCe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id m12so3181255plb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ot2UlQ2vn0UEaRQUGFEnPnt22eE+uws8yxk4s91DZ9A=;
        b=uzsEjHCeQrgXwWfIqkVNzGWmnAXP0J8P8r9duD55FUOr+m804OmbaZclklix7rAUCw
         uENATcwLyJHEBY6MeDs0Jfw6oba/w9EHQOTc8a12v8Rwq7ZjwHmNjxLbeD+hioHzu+Gd
         FHd3hy5NpzdQ/Pc4NJbfNy0+fWz31WLLRqrox2NeXnRoiMzBEMcJh3KQLlNS79iIg55z
         SY5fIYSMIe3hOhHFeldTCmf/9vfvvGI2Obbn/utZuhf13OYzq+c8N0iOzckaIqIIKFv4
         FolsXsBZpJKSgKZlX/tnG3fpmCqfK4kozEZXgw4ZyxS84m6ET/FENz1u4+/D0ZdB4Sve
         hnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ot2UlQ2vn0UEaRQUGFEnPnt22eE+uws8yxk4s91DZ9A=;
        b=VcKSLW5P6oz2RdhVq0NzdZpBa29WVlq6bojlV+SelWeCJDBg8fTBCGD4loqhFsJ1Eh
         SD11v4Lzexj/cwDJKgiG4u7MMP3iBKiwo8N420XCY2UV4iiiQ5ada3iTEa+M1D5EQwWU
         jTFKFRYnKkzvQT5LxcrcR/aRbKdXKMkEZ4TXyVc6GB2PwtPw7w/AQRIP56eTu9du4Mki
         3oa60/EERv60tGZK0YefxwwPAIYpfUmx66vC5ME9/2YdEqVusWlCij37LmrsDpyn+2jV
         hXlPQsdtoltoAGK3clEpTBtgXhAr1SpvSSMjDC94QpsOlfrh2KQmCX4oquRZjp+PqaO3
         quaw==
X-Gm-Message-State: AOAM532PStC6uPS90h4jTdcS8Fh8vnJMnTjm6BRxzWdn8npgrYi11Jw4
	QiYXtI0DDVg92YlDQL9t0XoYxDYzDVMHni6s
X-Google-Smtp-Source: 
 ABdhPJyWr2pdm5j0UASsFWf5HYHFFcvaLp3j/pgsAYVUQeGkLTqErUygO31BkzIAoKSzdMXIHOF+Pw==
X-Received: by 2002:a17:90b:1251:b0:1d7:f7ae:9f1 with SMTP id
 gx17-20020a17090b125100b001d7f7ae09f1mr307613pjb.65.1652193594674;
        Tue, 10 May 2022 07:39:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.39.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:39:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 31/40] cve-check: add JSON format to summary
 output
Date: Tue, 10 May 2022 04:37:10 -1000
Message-Id: 
 <8a79c476706b25e5c707c65b4e46b6e940874bd6.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165448

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
index 7cf206299b..c74c717235 100644
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
2.25.1


