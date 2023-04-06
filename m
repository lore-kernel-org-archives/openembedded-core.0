Return-Path: <dit.kozmaj@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CA9C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 08:46:24 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.153784.1680770780056000035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 01:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20210112.gappssmtp.com header.s=20210112 header.b=tzOxg+IO;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.50, mailfrom: dit.kozmaj@kynetics.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9338d479a21so110865866b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20210112.gappssmtp.com; s=20210112; t=1680770778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sy0C8HbubT6uDaJfUuttgwV8TZiw6TRar/MU2z2ld10=;
        b=tzOxg+IOck2rQYtJbYqmFXnL0SiP01wWOoURgPBRNygXBw2nK16NF8rrJblpc+dPz3
         5+s2118yEttjvsO0DNRYTv4xvVSE9J+yrR/4GnIRx8SPeuO+lh6sTKsLxLEl5SWWzbSt
         h8287Eap7lb+csGP3xwfVoGrIZmLdADAnCrM86DuNaNrMnOVUo9++wQMCsdPXpsIrwY5
         rJTNRqOhNp9T6aBJVIH4Dy67hFf6oCVIYEoZH0L3mCYwKWsHo/HJrtcYCEoLBqmqBZpa
         INTmx0iTVT26pHRCcYbGZhz73qbZq/qP1yJRpXP3163zfOEpBcttDw2uKIcuubT9KuoD
         K5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sy0C8HbubT6uDaJfUuttgwV8TZiw6TRar/MU2z2ld10=;
        b=PN0mAqqla8tIA5qYEpGtW/ubn6b1JYOpFaqF96wlqc2GsYZtpdCYtk6yu7+jtrwGZD
         e37Btx3BDA2LmCNsxUJzA0JYQBcc3sq/+83Qv11/xEalHRyNPmrQvJzmu9g6FWPAMNlG
         J6YZk5pyT7ItoWtKMyjNodbgF3p1U5BIUDR53DhABAMssBmvXz6wWX4iP72pNxqkKQSB
         ITTOrHx5S0zQH2RNynJjjal5Eh855i3bYf6xT4cvvzCvA9bhqhYgaisZnA/Q5xQ8z9HY
         Al9LyT73aXT1IQzttUL2KvKe2JhZ45gEyDivuwaIQ1Ypq5o6+wBYd1JTevCxQ5iRnKZX
         cz4w==
X-Gm-Message-State: AAQBX9e0UOLY0IPP3MOOXh6bZbIQXhYGb4g+AeVeDL38/qMAjDsVG6tC
	FL0PjUuF+1zCxyg+C5RnXW7/z8rAbhF6WvBTe5A=
X-Google-Smtp-Source: AKy350ZFC3420OWTemtNud355rxa9oA2jqEqUXa1ZRbkqG3RJEsQaB8bKidDuQR+4bMbhv4lkyuBtQ==
X-Received: by 2002:a05:6402:1842:b0:4fd:21a6:a649 with SMTP id v2-20020a056402184200b004fd21a6a649mr3710839edy.40.1680770778349;
        Thu, 06 Apr 2023 01:46:18 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id v13-20020a50954d000000b004fc649481basm440544eda.58.2023.04.06.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:46:17 -0700 (PDT)
From: dit.kozmaj@kynetics.com
To: openembedded-core@lists.openembedded.org
Cc: Dit Kozmaj <dit.kozmaj@kynetics.com>
Subject: [PATCH 2/3] selftest: wic: Add test for --part-name argument
Date: Thu,  6 Apr 2023 10:44:16 +0200
Message-Id: <20230406084417.34931-2-dit.kozmaj@kynetics.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406084417.34931-1-dit.kozmaj@kynetics.com>
References: <20230406084417.34931-1-dit.kozmaj@kynetics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179761

From: Dit Kozmaj <dit.kozmaj@kynetics.com>

Add test for wic --part-name argument in .wks file.
Test three different cases:
- Set only the --part-name argument.
- Set only the --label argument. In this case the GPT partition label
  is set to the value of --label for compatibility reasons.
- Set both. In this case the code has been changed to set the GPT
  partition label to the --part-name value.

The test uses a test_gpt_partition_name.wks file created for this
purpose.

Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
---
 meta-selftest/wic/test_gpt_partition_name.wks |  7 ++++++
 meta/lib/oeqa/selftest/cases/wic.py           | 23 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-selftest/wic/test_gpt_partition_name.wks

diff --git a/meta-selftest/wic/test_gpt_partition_name.wks b/meta-selftest/wic/test_gpt_partition_name.wks
new file mode 100644
index 0000000000..7db6da9aee
--- /dev/null
+++ b/meta-selftest/wic/test_gpt_partition_name.wks
@@ -0,0 +1,7 @@
+# short-description: image to test part-name in GPT partitions
+
+part --fstype=ext4 --part-name boot-A --label boot --size 1M --align 1024
+part / --source rootfs --fstype=ext4 --part-name root-A --align 1024
+part --fstype=ext4 --label ext-space --size 1M --align 1024
+
+bootloader --ptable gpt
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index b26b649c3a..0b0ca90c1e 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1348,6 +1348,29 @@ class Wic2(WicTestCase):
             if os.path.exists(image_path + '.bak'):
                 os.rename(image_path + '.bak', image_path)
 
+    def test_gpt_partition_name(self):
+        """Test --part-name argument to set partition name in GPT table"""
+        config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "test_gpt_partition_name.wks"\n'
+        self.append_config(config)
+        bitbake('core-image-minimal')
+        self.remove_config(config)
+        deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
+        machine = self.td['MACHINE']
+
+        image_path = os.path.join(deploy_dir, 'core-image-minimal-%s.wic' % machine)
+        # Image is created
+        self.assertTrue(os.path.exists(image_path))
+
+        # Check the names of the three partitions
+        # as listed in test_gpt_partition_name.wks
+        result = runCmd("sfdisk --part-label %s 1" % image_path)
+        self.assertEqual('boot-A', result.output)
+        result = runCmd("sfdisk --part-label %s 2" % image_path)
+        self.assertEqual('root-A', result.output)
+        # When the --part-name is not defined, the partition name is equal to the --label
+        result = runCmd("sfdisk --part-label %s 3" % image_path)
+        self.assertEqual('ext-space', result.output)
+
 class ModifyTests(WicTestCase):
     def test_wic_ls(self):
         """Test listing image content using 'wic ls'"""
-- 
2.34.1


