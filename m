Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F87C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 12:00:22 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.86726.1684152018125035578
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 05:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@konsulko.com header.s=google header.b=E4ziK1Kh;
 spf=pass (domain: konsulko.com, ip: 209.85.218.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-96652cb7673so1528935266b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 05:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1684152016; x=1686744016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Bcr32Kojnw1VvyLNoMJphbaOuSlCsys+WWHyFTYhUQ=;
        b=E4ziK1KhfkqWQ8fHp8sL9y+w3qYX+ZCWKI5sDL09cV+iIl9f4eRUgp+LFSdvMCGX6m
         mSaDua0137kb0pyKOyIyFlHe3e8VtL0jz9z8I+BiOlw1GjVxuGhliP1y/mgYCh3BgICf
         n8fyIhQ/Mvd19Qf+29A8M2FZCoqZOzA6NTBwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684152016; x=1686744016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Bcr32Kojnw1VvyLNoMJphbaOuSlCsys+WWHyFTYhUQ=;
        b=EiUnDyFEkfU/oIeBhaRZhbQAEbjvG6ZD7E1SI7PzyGA+nCIdcOCzWG4eQBgRg0DapG
         CFOaoVANmelmMHuBvIXlgWdu7iajKQp0IRb4rRglAAJ8PgjfhgsjeriNDFFdmQyl0w0f
         JTfMe1auxED6m2h5YTixL3W3HKIfaPQ/R8uzXa1Q+UN1EuIojkzm1G1QkYnbryMJO07o
         LQA8DkhNOatZ0eAPel4CtEXPHFPg1t3y4xzXAfhfjyZ7fPo//nGmkZORW1Ewk8TX5SnX
         4T4sAhzhOTlQflsExhA/cGBMMtfrfIUGuwLnnsw0OUDAC34vG0aZjt4HGKHMFHzcfpEm
         d9Yg==
X-Gm-Message-State: AC+VfDzdaaIEUZ5TyyxyU5aWBOx+SV4WOaHk9uMXUcHKrNQAPf6raKJu
	6IOyHQl641DiLmRfFRXAidhyT2jh/bJNu+BZcTQ=
X-Google-Smtp-Source: ACHHUZ4q0sTNOmwxWpDfd4OoQB7qGf+bIZoce/QBkBpFrOhZYodDuRxuV73YqRJIX7+8dwHCN+dSTw==
X-Received: by 2002:a17:907:2684:b0:96a:ee54:9f20 with SMTP id bn4-20020a170907268400b0096aee549f20mr5775447ejc.37.1684152016238;
        Mon, 15 May 2023 05:00:16 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709065dc100b00968382ebf41sm9634435ejv.140.2023.05.15.05.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 05:00:14 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] wic: Add argument --hidden to default imager
Date: Mon, 15 May 2023 15:00:10 +0300
Message-Id: <20230515120010.3211832-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 12:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181247

Add argument --hidden to avoid MS Windows prompting to format
partition after flashing to a USB stick, SD card on another media.
Set Bit 0 (RequiredPartition) to mark that the partition is
required for the platform to function on GUID Partition Table
(GPT).

The new argument simplifies setting RequiredPartition on GPT
through a WKS file and the default imager plugin. Otherwise,
without this feature, to achieve the same result a new imager
plugin has to be implemented and set in WIC_CREATE_EXTRA_ARGS.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/partition.py             | 1 +
 scripts/lib/wic/plugins/imager/direct.py | 7 +++++++
 3 files changed, 9 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index d1e546b12d..667b2ff9c3 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -171,6 +171,7 @@ class KickStart():
         part.add_argument('--rootfs-dir')
         part.add_argument('--type', default='primary',
                 choices = ('primary', 'logical'))
+        part.add_argument('--hidden', action='store_true')
 
         # --size and --fixed-size cannot be specified together; options
         # ----extra-space and --overhead-factor should also raise a parser
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 382afa44bc..bda4aef1b4 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -59,6 +59,7 @@ class Partition():
         self.updated_fstab_path = None
         self.has_fstab = False
         self.update_fstab_in_rootfs = False
+        self.hidden = args.hidden
 
         self.lineno = lineno
         self.source_file = ""
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 7315d8f073..55347f5480 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -605,6 +605,13 @@ class PartitionedImage():
                                 (self.path, part.num, part.system_id),
                                 self.native_sysroot)
 
+            if part.hidden and self.ptable_format == "gpt":
+                logger.debug("Set hidden attribute for partition '%s' on disk '%s'",
+                             part.num, self.path)
+                exec_native_cmd("sfdisk --part-attrs %s %s RequiredPartition" % \
+                                (self.path, part.num),
+                                self.native_sysroot)
+
     def cleanup(self):
         pass
 
-- 
2.30.2


