Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C04C433EF
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 09:56:33 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.9117.1651571792090896320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 02:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OiBcIQGo;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id k27so19252968edk.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYdfPf6sewE+HjcudddHjZzri51e2U3hreoUY4G4qcU=;
        b=OiBcIQGoYcxEO0U9fBNUGuE+90CnJiGrWpiVzmQJNhx5WoSDfcAis0LFlREBGEWvIQ
         bt9afoyipzcK6TpmaxrVzXhh9YHHBcSvnyg4mjxJOc1ivi0qi9FvpeckhQfS1c9U72LV
         1SfjKdDRinAFFSqsFiCRD5QuPM6jKl3UqbUKYo755HdhUiDA0NupB4LuxLD2ZwGf7pSV
         UtrzkyQDlMM05vfvnNObK2GQrLIsXtTlLCsviMZRov3ehLK/HvBd7aurukxVmjpMfl/L
         M3IIS990d4IVmUWNrL6OJmzGPG4WoULGHLNc7NJvJ8LZP7KKSBzoArwyZHmrCr+YeTEg
         DI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IYdfPf6sewE+HjcudddHjZzri51e2U3hreoUY4G4qcU=;
        b=2AF93woo1IJ+0Lh2f39Dgif+ymkLScGbKVTYp6cqc4qAViQtITLRNiRp/mUuHC7Byq
         04/myyHknFyyNgYo2UHmJ2gF3YCJGEhHBKlETQAMKS2IqEY1AtkJWWYwrSyT1pdJNQwe
         QAWNBvxzER5JHq+L4EhykOHK1THwme5hF8wDI6LJ2M79kBy8oIchYbExAQisy86ZdGcX
         MlAE+JAotYAHuA759WLdsqknoAJ7Ous+EPkr0Ky9MxgCfxcVnBJnC02e0vJDgxhYCIZf
         abRH+EVrAYP97z4ojMNets3gDwwBBRGRl/Jm4dM02N2xt61ScLGesUZxHqwk97PIEntH
         PfRA==
X-Gm-Message-State: AOAM5328+rp+Zly3YXobktG4TQpwrds6/v3MCueDrbeN2oTYe++Amllf
	ZdXA3hcwIjnZKwodvTHVzH5UaDvqwn4=
X-Google-Smtp-Source: 
 ABdhPJzdPScOB/TxgL5nqQEx2gYZgzct3TwXBY7zV8pQRtFnu/eVxqPKh6Pec7SY7MX7cYb23Ncu1w==
X-Received: by 2002:aa7:c445:0:b0:425:d509:2113 with SMTP id
 n5-20020aa7c445000000b00425d5092113mr17543473edr.12.1651571790249;
        Tue, 03 May 2022 02:56:30 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-163.retail.telecomitalia.it. [87.5.19.163])
        by smtp.gmail.com with ESMTPSA id
 er10-20020a170907738a00b006f4512e7bc8sm2031278ejc.60.2022.05.03.02.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 02:56:29 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH v2] rootfs-postcommands: fix symlinks where
 link and output path are equal
Date: Tue,  3 May 2022 11:56:27 +0200
Message-Id: <20220503095627.12752-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 09:56:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165199

When creating the manifest and the testdata.json links, if the link
name is equal to the output name the link is not created, otherwise
it is. This prevents a link-to-self in the first case.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
    - v2: change tabs into spaces
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
+        if manifest_link != manifest_name
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


