Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3895CC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:29 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.7295.1654699197576437012
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:39:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DT9fTwVv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so18494131pjq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hFC1EcpEWgewimK7HDnGF1Q7wiV2YEpkRBTlZYzjzbM=;
        b=DT9fTwVv6g+53qXuob3DMNV7uB5cmHu+SnSLif/G2B5F+vzD9AG2NN6xd+gj1dQFKf
         nK1QUQst8vQXB2q/KqoSjEinU+TMdp8omwcJ04cr3YShqr8yQeEayU0tFfA8k0ywmJQT
         6SKZuZQ9louXH7G9X/U3j4+tiAZyhU4Dn6hZ2YBL3McwIxgWwmzpSVq15fiVmtEn9xOc
         iJLVtPf7wVlm8yDKK7HPDNUrDgGuMkz0ST4uSe7H7octonHmPbW3sZLTrRtcns1K8oCC
         0nv8hgdX7akKGUM1YSZ5Z46Z36h5sOIyptrjODT6Ew8HIaQ6NKaokhEZ/DCyzAqhao1d
         1fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hFC1EcpEWgewimK7HDnGF1Q7wiV2YEpkRBTlZYzjzbM=;
        b=n/xxtD1EgJgXEazjEjs7nbJJd71M+SGnVPedvGHUNgUkGvD72Shr2KFrpc71XES6gs
         0Tyf8yS83zIHj+NfIM7U9kIoRPkKPcUvgOr5feWeyVFQooQH2h3zO/NioSnDJWsbiYNm
         7hf0RvtuF/y+tYaXPduMHdDJ1eX2UC6keYtYL+pn4jMvon2wJ93gDIXp6zvgptBe3Kbf
         iPBFyawEWjrqHtdBkAqPzWBjjk4LGCJ0ir+fwAchN8YWRO4/jmqG9RVpJ4KsEy7tDuLn
         GTj9YfUQ7yzrs/nvc0eSw8JJjOoBlmzYjXjzjRQeHJO7qhmjpsGjhuZpTh+f2qGixWOB
         9pYw==
X-Gm-Message-State: AOAM531UeB54Ja4nCc3N+TQhWrBurvUm3fFsXLF50eTiWS7gl1OxyD03
	KUxf2we+n3t6hNGbwe8nlWoNaW7OosYkw9T3
X-Google-Smtp-Source: 
 ABdhPJyTipc3lsZ0dTzf2+fIASTKEY8dkfSB5zX5qFrGWIhAX4FSW7BstCpMLCtquSk5S+qSFsPDzQ==
X-Received: by 2002:a17:903:11d2:b0:167:8a0f:8d4b with SMTP id
 q18-20020a17090311d200b001678a0f8d4bmr12061264plh.78.1654699196576;
        Wed, 08 Jun 2022 07:39:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.39.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:39:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/22] cve-check: move update_symlinks to a
 library
Date: Wed,  8 Jun 2022 04:39:14 -1000
Message-Id: 
 <66bf08f2df478a909a12756c650dcc2ae09a0a47.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166712

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
index c80a365819..3844efcddb 100644
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
2.25.1


