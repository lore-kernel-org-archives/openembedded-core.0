Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1726BC433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 08:03:23 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.8420.1651564995932441182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 01:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fkaaKuUJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id be20so18968164edb.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 01:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EslqLWA/f+KoMJYOjZrNoE8x8yCmKukQFxsiPM64XLU=;
        b=fkaaKuUJGCNX8zH6iZSRiFOL8qaz+OF44tTxV3joFFZPDopR0TalbUxyhfTCFgBppz
         9jLFdzD5e9oMlxNSUQSW7Hc9+jIVE2epb/pmtwcOoCvUVVmFrbEIMvLj2DyH50+PB5UK
         4FrIURIKQqnUhRxl29/SaX83Gwp1ZKSXTmC6vLtmTgIC7zG84Q+51iB/lCyI+wTaWHHb
         0iFuIUyGIkOORGj0REW0J0IHimt1fecVEmOXhJyAk6HfnimAMuLLY/dqm5Fp36YMa79W
         q6hzhI1VayFle5PZdHWTKPOvFW8+54uF63eMghDmVa6DunqDxD4qDvbxayAL3bn96mtj
         jmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EslqLWA/f+KoMJYOjZrNoE8x8yCmKukQFxsiPM64XLU=;
        b=jfoa18KkKY0tlrb+GRce5pwgpv7gBHLIA3ycgo/DWeZ4EVaW6e2FGtePFWn2ZUgqzI
         C4yXp6e6cgKVw8+Eb8+xiRSkiwgoapn6FQHK9P/HO2w+qlGUu20Ukjqc3EhJ2D+oLejf
         mTokbfd/QvOm6686ZXJEmJFwzuFehr4ycGWEVzx0/kRYF2BPy2qYEWvNP8J0pC2J7IlW
         kASs28jmwkIQWS3BqFf16ce8Tjbch5tD8oi4MRBZfzW8sF2Ctf1tOcyuRnO113odQa78
         RFz+l1RmVkcbr7OArZ4gKlrzSxzVA3G2HxXmdnyfBbzDShE0te+qnFXJhaNVLb8377/J
         irQA==
X-Gm-Message-State: AOAM530x01QV0+5yMA0oNgPkhkFzuJRNFSeWt7+btUeS7RT3zTbz/Vvt
	5CArh1YBObUnHmhEm8OEYBdg0NKm6Ms=
X-Google-Smtp-Source: 
 ABdhPJw73+79aDaQePtScbbfWsa0w1hWbLXs6LoqUMNP/YpiuZLuqNqyv1bcAyD/Ozeyr/vRQU/arQ==
X-Received: by 2002:a05:6402:294e:b0:425:f016:24e7 with SMTP id
 ed14-20020a056402294e00b00425f01624e7mr16719054edb.111.1651564994022;
        Tue, 03 May 2022 01:03:14 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-163.retail.telecomitalia.it. [87.5.19.163])
        by smtp.gmail.com with ESMTPSA id
 zp26-20020a17090684fa00b006f3ef214e62sm4347060ejb.200.2022.05.03.01.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 01:03:13 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH] rootfs-postcommands: fix symlinks where
 link and output path are equal
Date: Tue,  3 May 2022 10:03:09 +0200
Message-Id: <20220503080309.9511-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 08:03:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165195

When creating the manifest and the testdata.json links, if the link
name is equal to the output name the link is not created, otherwise
it is. This prevents a link-to-self in the first case.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/classes/rootfs-postcommands.bbclass | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 7b92df69c5..c949115647 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -267,9 +267,10 @@ python write_image_manifest () {
 
     if os.path.exists(manifest_name) and link_name:
         manifest_link = deploy_dir + "/" + link_name + ".manifest"
-        if os.path.lexists(manifest_link):
-            os.remove(manifest_link)
-        os.symlink(os.path.basename(manifest_name), manifest_link)
+		if manifest_link != manifest_name
+			if os.path.lexists(manifest_link):
+				os.remove(manifest_link)
+			os.symlink(os.path.basename(manifest_name), manifest_link)
 }
 
 # Can be used to create /etc/timestamp during image construction to give a reasonably
@@ -339,9 +340,10 @@ python write_image_test_data() {
 
     if os.path.exists(testdata_name) and link_name:
         testdata_link = os.path.join(deploy_dir, "%s.testdata.json" % link_name)
-        if os.path.lexists(testdata_link):
-            os.remove(testdata_link)
-        os.symlink(os.path.basename(testdata_name), testdata_link)
+		if testdata_link != testdata_name:
+			if os.path.lexists(testdata_link):
+				os.remove(testdata_link)
+			os.symlink(os.path.basename(testdata_name), testdata_link)
 }
 write_image_test_data[vardepsexclude] += "TOPDIR"
 
-- 
2.32.0


