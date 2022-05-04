Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CB8C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 08:39:16 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.4084.1651653551699689542
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 01:39:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a5msH+iM;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id t5so878770edw.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 01:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RcXPLRjlAs7ljROKcPjEvp5N2H2ozCTqeycGg1kBdr4=;
        b=a5msH+iMP3W2dkvKAZcQaX7HPsp2FT00t6ynVUVngtdRm1M95ezQ3FIYl0efFjqSBv
         gbR9N0UXh58u2x9mzES4RWsyA3Arm6Ns3QUUxNgDMyx8OSqY6A6gf8yMRPsR67tDdmAm
         BdFdpYkd0TftHSTXH+KEjnsUn27uiBahWttF93lkitQdFiIYaBn5G28Ku8wyEQD3YlgN
         lywDgka11Whfr7Wx1HsPPIUZ5XZ36k0cjf/zSa9xBa5c7glPlaGVJX1WeqtO86PwMij+
         4OKBybgVhWY9+4Rk5sF28f5Q1NmDFJsN59yC7UsDfWxyOoApGGjbSYng/bNmlt5CAu9e
         4I1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RcXPLRjlAs7ljROKcPjEvp5N2H2ozCTqeycGg1kBdr4=;
        b=uuSgMjGa18ZK3Ta6dRQQ0Grw1v3sFQTxaliElLG23TMKgpY9RUHkIJkB63sQZNrhHN
         nSrivIw4mL0RbF6+oyL902pO8CGroadKDqmthe/WEmiy6Obam0g4q7bQAjIjdLryk/Lm
         uzrW0Ern4JpmZJ2GMSqyGERP3G7oRjpoDDmYjlwp1yBnFSvKv7A0FhgtYBa3Ky8+bkcb
         NczKhUas40YTf5lMtjhINg6GJMJVyrYb3vjK4xprt6f9IbcL/oPScdhK8dw+Ug2tqScH
         qxLryzbU1+ZMQ38BfN2n15zQsOyPvGhDUZkwiNdqHOffmWh/hosQZltsgCC7QXc0whUK
         gZIA==
X-Gm-Message-State: AOAM533GWSg/kSZ06zG1zmkCIVUeY3qUxlwIOfSFapvkOJWL/+Jr5cnU
	HjxmofkigyTZdz1onlHU9ttBgagEj7I=
X-Google-Smtp-Source: 
 ABdhPJy0LsV7SDNtXcfmCxWtgx+0yrgL7VwzEhOHZ9wS/7Q8ga7gDByShhHRlJS/Z9HGWL0PP7eH7Q==
X-Received: by 2002:a05:6402:34c6:b0:427:c65d:c254 with SMTP id
 w6-20020a05640234c600b00427c65dc254mr14344257edc.88.1651653549786;
        Wed, 04 May 2022 01:39:09 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-163.retail.telecomitalia.it. [87.5.19.163])
        by smtp.gmail.com with ESMTPSA id
 el8-20020a170907284800b006f3ef214e14sm5463498ejc.122.2022.05.04.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:39:09 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH v3] rootfs-postcommands: fix symlinks where
 link and output path are equal
Date: Wed,  4 May 2022 10:39:04 +0200
Message-Id: <20220504083904.10018-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 08:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165215

When creating the manifest and the testdata.json links, if the link
name is equal to the output name the link is not created, otherwise
it is. This prevents a link-to-self in the first case.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
    - v2: change tabs into spaces
    - v3: add missing ':' following an if statement
---
 meta/classes/rootfs-postcommands.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 7b92df69c5..2fa388ba95 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -267,9 +267,10 @@ python write_image_manifest () {
 
     if os.path.exists(manifest_name) and link_name:
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
-        if os.path.lexists(manifest_link):
-            os.remove(manifest_link)
-        os.symlink(os.path.basename(manifest_name), manifest_link)
+        if manifest_link != manifest_name:
+            if os.path.lexists(manifest_link):
+                os.remove(manifest_link)
+            os.symlink(os.path.basename(manifest_name), manifest_link)
 }
 
 # Can be used to create /etc/timestamp during image construction to give a reasonably
@@ -339,9 +340,10 @@ python write_image_test_data() {
 
     if os.path.exists(testdata_name) and link_name:
         testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
-        if os.path.lexists(testdata_link):
-            os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata_name), testdata_link)
+        if testdata_link != testdata_name:
+            if os.path.lexists(testdata_link):
+                os.remove(testdata_link)
+            os.symlink(os.path.basename(testdata_name), testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
-- 
2.32.0


