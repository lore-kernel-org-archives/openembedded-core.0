Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84119CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 17:06:31 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.56148.1755449781093488351
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 09:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aPQg8trl;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: mroj4n@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-618b62dba1aso2511005a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755449779; x=1756054579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+V75mzFSB+F3+RuWtFUWL9aD9UL5O+3KlyLFNIDeDs8=;
        b=aPQg8trlsR5kdiRNeJAGaL5fObQbLSiTEuDUXVHsybV7IHr9xFo8Zc4MH2QFGj1wPz
         XTj6XQkZMHdXqnftSUICXzLSbGrBjLE0SIbT83tdrGm/XBKYsWRxrNdzMcIik1uoXgIA
         McN8R7sZYalPpkxwXjn75jRXB8o2Oe2bHqrzE5gwS3o2ujR2hmiPMnK6jmoZ4aIHbFzC
         Ys/kOZmz9dMObP6ZLQ1RVjX7FuZnyCSdHUAGdlyyjgkVoSRZtsP5Av97lXIkV3/GPCex
         tkCaOktRnIn7GnovHM7JJHrZbFq4URRpHFXpyc4VWCfyibnv4wWGAeXuJ5s9oI2v50ei
         1G2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755449779; x=1756054579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V75mzFSB+F3+RuWtFUWL9aD9UL5O+3KlyLFNIDeDs8=;
        b=E4OfDC7L8BIYPn9Iwv4kvlgAm0a9v4MMkulTjLByAH3R18wH95Vv9fYKdDPsENmBI7
         R41/jcLOPZUeVjQmFfTIs3xlRlTQNAZa5w/s/pkDQRvNeSIbv4zVOpMpqXGrHdJk09zw
         zA5/HfNNhy75XKWJHY/k/wC3C9sFE8S0WDFA4D0GxhPN2WYNZTdkeUA0S3IN/av5OhDq
         qz6CJ6U/cEWbdmWgFaPYX5CvWYiT6KgCY8DGetMD52dzzMta7TsDJeIPJxgkQmo//KZD
         9+teCSBNxDZq4J5f6oddyCJcq8OaEwQDYr6726U62B+Pr9KrrvqCLeDAeX6/YKycioFb
         dTIg==
X-Gm-Message-State: AOJu0YwvyCZI+PuWx7FmeIG7jnHKW3PJWqZ8r3SkE1QJ7z6E+d4eTtlU
	uIfhcqMCwwzsT94D+c3Qe7LjVUHwhzgIwUoxIUMD1ZXKdhQhcIL9Ge0Z8BpKmjLy
X-Gm-Gg: ASbGncsQk0rX1/3wKzleOjzkwhxokMzyL7E2zknitwpIiXJBtg2EL/Ex58ZbKDfPfKy
	20TjcU01TxBRui7Sr1ghdkG6Ms49/plc5/BKLLrjkuAk4eeelM99JA6b7eapvGgSVVR74i3ymag
	HquIxA2wKt1q78GiEZrW6gliQKhFUpegqDsmM6fJCDHiqMdaQq0Cuw/W+QD4AXcICcKvm7xQMIW
	G13Dk3URMYOrQScRQlHXrQXY5qQX3fX5GvmgNO4IfN6bOxbto6YV7XvogvLJ2zzB4gqVD8bp4CU
	tq4OX5DgASsYTYZYGGeWecpRN3Tl3Itw/LVuYYrvBrfFj5WLhEowZdaUCfMTfN3Q6fb+9lJK4kP
	qkERFrlh7LdR9sDw6+CeV1gxh02LePmmWrADs32CXlXBizhlTTtgG1g==
X-Google-Smtp-Source: AGHT+IHLpwaYRxdDlEI5+uX6dRSwa4jEKZ5IynOpN+2EUIoC432ZjUzH0P6b+E7VlYOiOdlLkMPXdA==
X-Received: by 2002:a17:907:9414:b0:ad5:777d:83d8 with SMTP id a640c23a62f3a-afcdc3793b7mr831717566b.29.1755449354126;
        Sun, 17 Aug 2025 09:49:14 -0700 (PDT)
Received: from MROJ4N.localdomain (89-64-15-146.dynamic.play.pl. [89.64.15.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfce50dsm634530866b.71.2025.08.17.09.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 09:49:13 -0700 (PDT)
From: Mohammed <mroj4n@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mohammed <mroj4n@gmail.com>
Subject: [PATCH] wic: add attribute parameter to parted
Date: Sun, 17 Aug 2025 18:49:08 +0200
Message-ID: <20250817164908.88234-1-mroj4n@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 17:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222005

Signed-off-by: Mohammed <mroj4n@gmail.com>
---
 scripts/lib/wic/help.py                  | 3 +++
 scripts/lib/wic/ksparser.py              | 1 +
 scripts/lib/wic/partition.py             | 1 +
 scripts/lib/wic/plugins/imager/direct.py | 5 +++++
 4 files changed, 10 insertions(+)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 2e3061f343..fef856dbbb 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -1070,6 +1070,9 @@ DESCRIPTION
                 an MBR header. Partitions with this flag will be included in
                 this MBR header.
 
+        --attribute: This option is specific to wic. This option is used to set
+                      the partition attribute.
+
     * bootloader
 
       This command allows the user to specify various bootloader
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7ef3dc83dd..af4fb91d58 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -189,6 +189,7 @@ class KickStart():
         part.add_argument('--fsuuid')
         part.add_argument('--no-fstab-update', action='store_true')
         part.add_argument('--mbr', action='store_true')
+        part.add_argument('--attribute')
 
         bootloader = subparsers.add_parser('bootloader')
         bootloader.add_argument('--append')
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b34691d313..cf5c51f105 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -61,6 +61,7 @@ class Partition():
         self.update_fstab_in_rootfs = False
         self.hidden = args.hidden
         self.mbr = args.mbr
+        self.attribute = args.attribute
 
         self.lineno = lineno
         self.source_file = ""
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 6e1f1c8cba..877a5d2a97 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -664,6 +664,11 @@ class PartitionedImage():
                 exec_native_cmd("sfdisk --sector-size %s --part-attrs %s %s RequiredPartition" % \
                                 (self.sector_size, self.path, part.num),
                                 self.native_sysroot)
+            
+            if part.attribute:
+                logger.debug("Set attribute:'%s' for partition '%s' on disk '%s'", part.attribute ,part.num, self.path)
+                exec_native_cmd("sgdisk -A %s:=:%s %s" % (part.num, part.attribute, self.path), \
+                self.native_sysroot)
 
         if self.ptable_format == "gpt-hybrid":
             # Write a protective GPT partition

