Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525F2CCA488
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.7349.1654699642777087844
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vvlS7g6u;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id u18so17847679plb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9mKgTL4yjdggRrEpTBxop92doshNHE1p9HjJLDjCdRo=;
        b=vvlS7g6ubpwumaXfFIB7lhqgQJeXZNSfeCmm4WaanelnVYaTcWS0puxldecS9ZzMY9
         XgbNNq2Xy5CIvuzaZ+XMrGZ4qDEDsnKHLKOBOElp5UzrOGqJryEocljvxy1LSNJBt1Km
         404rz4J2gXJGHlQVpwJmTi69hQLYWoDt8cOyzLZVoTxVEV0VBTkrwsSv3iHPO/vqUoIa
         f9csKKm5rjEOC9jVGeUfjSXp7plvtMCVDrfwqFiLsAZtH/HeUrj9TQw+JItOyqFlweaq
         6lFSQXIVC6Ar+J/7v+vhIcnjqM67w0PnE21ddYe3OtlgPThoBAu5jOZ+NgqPb4JJ7gb7
         jxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9mKgTL4yjdggRrEpTBxop92doshNHE1p9HjJLDjCdRo=;
        b=KyofvSE9hf3140/dgEqJ4BYb6j7F2vBUucEejyQHqoPjgVqJ4FheAP0MIGXtGaG4xE
         5M66Wrvf7R6Q/0U7abV3qaVLTqZWn2mNWOLBaUo5HhIhVII15FQ0KLpPu8aF+W2zVeqc
         oWQv0N6g892+ROCj0NcLWccvKcg2topFTdHyXI9HaD3Gs2xP9n40GhLFJaId1VsC1Z2X
         UhLaS8x1OLQd6Fz8Kt519soWa48OuxluWCSX4RDtMGDwjuVk3CEmyXzD1VTK999K1QhQ
         Xj+JDGgQPnrksLomhdqcXMQGJZ6ktWIon+pIxzc6zqw6koVm/TmPMQ7yute1MT6U+2Wv
         DDjA==
X-Gm-Message-State: AOAM532cF3zqa73g6HP06hKeES/JbqgQoZSxF1CILxYOcfJyrCGujpSk
	UJIMbpCPaTfdn2vScq6Drt9Jpa2f/4BaeKOb
X-Google-Smtp-Source: 
 ABdhPJy6ew32sY69WGtUkWa8fOtKWTwurEy+WbZdmuyBpRHCBCpvryMUwaKNXWiM3/6gLuWRfbFQBA==
X-Received: by 2002:a17:902:e88e:b0:163:ee82:ffb with SMTP id
 w14-20020a170902e88e00b00163ee820ffbmr35239302plg.142.1654699641770;
        Wed, 08 Jun 2022 07:47:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] cve-check: move update_symlinks to a library
Date: Wed,  8 Jun 2022 04:46:34 -1000
Message-Id: 
 <c8a0e7ecee15985f7eed10ce9c86c48a77c5b7c5.1654699348.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166745

From: Marta Rybczynska <rybczynska@gmail.com>

Move the function to a library, it could be useful in other places.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit debd37abcdde8788761ebdb4a05bc61f7394cbb8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 11 +++--------
 meta/lib/oe/cve_check.py       | 10 ++++++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0111ec6ba8..2ab1720dc3 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -76,16 +76,10 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
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
@@ -106,6 +100,7 @@ def generate_json_report(d, out_path, link_path):
 python cve_save_summary_handler () {
     import shutil
     import datetime
+    from oe.cve_check import update_symlinks
 
     cve_tmp_file = d.getVar("CVE_CHECK_TMP_FILE")
 
@@ -174,7 +169,7 @@ python cve_check_write_rootfs_manifest () {
     import shutil
     import json
     from oe.rootfs import image_list_installed_packages
-    from oe.cve_check import cve_check_merge_jsons
+    from oe.cve_check import cve_check_merge_jsons, update_symlinks
 
     if d.getVar("CVE_CHECK_COPY_FILES") == "1":
         deploy_file = d.getVar("CVE_CHECK_RECIPE_FILE")
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index 1d3c775bbe..b17390de90 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -79,3 +79,13 @@ def cve_check_merge_jsons(output, data):
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
2.25.1


