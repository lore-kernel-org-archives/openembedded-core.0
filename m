Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CFEC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Jun 2022 08:58:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.5171.1654246725352228855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 01:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HdiYTLFZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 f23-20020a7bcc17000000b003972dda143eso5998768wmh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jun 2022 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7ZH/lrOGJ1Au+SWsO5xpEgMgglSGO2kxFxmFYQwI+c=;
        b=HdiYTLFZ6G4ZS9Z0kZiPiT7fY72l7A3DDn1vEdPj0KVwpFcBEx/gNxrsMZWsC9/BGF
         Skh4VaaE4EVznm0GXj+Jv3Pkg8cqLjLDeL35Kxg6PKnTXHtipcMLTKXDTHGSD9MJH8o8
         0hD0oiRhciIZgWcu72grUoK2xfvUiq0cGsZP4vm9OVR+wj/chT3A4XojcfAzUwjA++Uj
         qHYQRPTekiEE9qZmhmo68+HtNHhyvw9QHlmzRvQK9jUUCFABH6H6dpKAa7GD0+5DRAVa
         M5uGYe6ruwkQZNqf5cEuFtR7SNVylDjK/xxIwmlPzAKaMc0uXbacbxE5eC0GDVx3rG4x
         TUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7ZH/lrOGJ1Au+SWsO5xpEgMgglSGO2kxFxmFYQwI+c=;
        b=N6Bx/7TNe4M7TWjzeIcaSmXJ7q44k4E/R5wOGfWK+94+DiPXaQG5v+5p2JDOYNbz8t
         PERhNyzcI7HwFKKc0Zs4k5t4Xqcqwb/cS9nY27Y10YfMHG5cWBxpc2lGwuO2o2HEksf9
         ueVqiaRP4gA0cMOBnjwpce94+DeCTBnKH4/CM6omoMAPy97P5tHiwqAPygAjZQevKaNi
         fL4UhBHneu/AHpTWEvLsXP9WC6j3VF9quVv/5j81uCQJtIHksfw1VbRC0xMTu+GvBJfG
         ad/JXIuG7RZcsnljBwrrrCyqWmOUctbQ+jdsNOibJ+LuRIE8Nzeku7Q9XCpjaAb6Ejx+
         PKgg==
X-Gm-Message-State: AOAM530EZQNpebrq74RHRtjhs8ai1S/Ii5OfT8SD0lBDK8Z0Xi2eT2Yu
	CZluKAgKErX4mdHEFu4AVtvzbcykUNo=
X-Google-Smtp-Source: 
 ABdhPJzoSv52Irt4uGtPnT93yklANa+Iw445AZZq4Pt7EvmtE04mbc0zOwIl/sW0S+lzWw/u1wFHQQ==
X-Received: by 2002:a1c:7407:0:b0:39b:6b:f2fa with SMTP id
 p7-20020a1c7407000000b0039b006bf2famr7493057wmc.13.1654246723485;
        Fri, 03 Jun 2022 01:58:43 -0700 (PDT)
Received: from localhost.localdomain ([80.215.210.162])
        by smtp.gmail.com with ESMTPSA id
 z7-20020a5d6547000000b0021020517639sm6848551wrv.102.2022.06.03.01.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:58:43 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org,
	ernstp@gmail.com
Cc: Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [PATCH] cve-check: move update_symlinks to a library
Date: Fri,  3 Jun 2022 10:58:27 +0200
Message-Id: <20220603085827.2214734-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jun 2022 08:58:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166513

Move the function to a library, it could be useful in other places.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 meta/classes/cve-check.bbclass | 11 +++--------
 meta/lib/oe/cve_check.py       | 10 ++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c5c22c4c51..5eb0622d00 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -80,16 +80,10 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 # set to "alphabetical" for version using single alphabetical character as increment release
 CVE_VERSION_SUFFIX ??= ""
 
-def update_symlinks(target_path, link_path):
-    if link_path != target_path and os.path.exists(target_path):
-        if os.path.exists(os.path.realpath(link_path)):
-            os.remove(link_path)
-        os.symlink(os.path.basename(target_path), link_path)
-
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
-        from oe.cve_check import cve_check_merge_jsons
+        from oe.cve_check import cve_check_merge_jsons, update_symlinks
 
         bb.note("Generating JSON CVE summary")
         index_file = d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")
@@ -110,6 +104,7 @@ def generate_json_report(d, out_path, link_path):
 python cve_save_summary_handler () {
     import shutil
     import datetime
+    from oe.cve_check import update_symlinks
 
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
@@ -179,7 +174,7 @@ python cve_check_write_rootfs_manifest () {
     import shutil
     import json
     from oe.rootfs import image_list_installed_packages
-    from oe.cve_check import cve_check_merge_jsons
+    from oe.cve_check import cve_check_merge_jsons, update_symlinks
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
         deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dc7d2e2826..aa06497727 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -163,3 +163,13 @@ def cve_check_merge_jsons(output, data):
             return
 
     output["package"].append(data["package"][0])
+
+def update_symlinks(target_path, link_path):
+    """
+    Update a symbolic link link_path to point to target_path.
+    Remove the link and recreate it if exist and is different.
+    """
+    if link_path != target_path and os.path.exists(target_path):
+        if os.path.exists(os.path.realpath(link_path)):
+            os.remove(link_path)
+        os.symlink(os.path.basename(target_path), link_path)
-- 
2.33.0


