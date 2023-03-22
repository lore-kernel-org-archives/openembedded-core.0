Return-Path: <dit.kozmaj@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A04EC6FD1F
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 15:54:54 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.47169.1679500484586262122
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 08:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20210112.gappssmtp.com header.s=20210112 header.b=L5d4IiMZ;
 spf=neutral (domain: kynetics.com, ip: 209.85.208.43, mailfrom: dit.kozmaj@kynetics.com)
Received: by mail-ed1-f43.google.com with SMTP id eh3so74857550edb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20210112.gappssmtp.com; s=20210112; t=1679500482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frgcBqkrq4Zd+m8V5QcgHVfzjNEb1zlGCNc07gBSEH8=;
        b=L5d4IiMZuMufSm6HhnuVdUgLbjnbGVnjxUbOicX+YwXwLAMwlvRtA26oOElerwzvDC
         jFek1D69X4Sc2Ja9U4RJZOEB5/O1YpPt1XEDZTFVOPlihCAflZYiLiG7LQBRDDEHuCrZ
         e/FmCIBAg7xXlZ+laAaiVeNDu5blpqZ7Pk4NPfs3Hzde+rQVanrTHKJzAIIehdJNdiOF
         AAyzV6j+MQVyE44sgdLDNrdPc2aQlRO4fanZIiPmQ1trv90cOMqX2VXrqOSmEaPWloWd
         Am8lOF9OFikMHCHFDAttxLwmX3fR981bx3N+iJ1oEZg84F6AS4gt0OAnSsbquNPtD+XB
         GZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679500482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frgcBqkrq4Zd+m8V5QcgHVfzjNEb1zlGCNc07gBSEH8=;
        b=2KXPh1p1pwuVrj1jar2RI96MI/4Xl2wgsFx/mEokwpywr5NXMvKt/djFBJrhTkjFN7
         CMn0NonpSvXqclAf7yQahTlY3UMSdHLATP4hnAYni8/TmtUZqryQbHiVcUaU/HQdqap8
         xOBVwj7zcY5tvK2RdhWuHUWJdwZUHzJ1OHISh+mffn6uYIAw0iD+8nEmCWaGnsg2evhF
         hYCycsGQOJn8FNt0pYKODmvCrmEMAeVi3is3awqe9EnJWByZQe+xN9ZlV/RMQ1ROqFvQ
         a5C8KAvsnfyLVaVUBUJaD4cOc85wrQlb7xrquBn9xKjdwD1DGrV1nyrlRTQ8mMuX+D3C
         btkQ==
X-Gm-Message-State: AO0yUKVBaxh5+OL54FA+qwsy+7vUdCJvxjHBkn7WK5hh1xj7wASHHI4B
	Jabk7ipOWgVg7bMgPG8joKF+1TIA0VLMvBiksDo=
X-Google-Smtp-Source: AK7set/7foI28wDv+YsonrMqz3oF9yM4L9ACw9Pay3iGyqQ/SVC4L/KU2o6YJ8zAfEx/VDp8a7AqSA==
X-Received: by 2002:a17:906:2344:b0:931:bc4a:ce08 with SMTP id m4-20020a170906234400b00931bc4ace08mr7863559eja.36.1679500482454;
        Wed, 22 Mar 2023 08:54:42 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id z23-20020a50cd17000000b004bd1fe2cc02sm8020792edi.16.2023.03.22.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 08:54:42 -0700 (PDT)
From: dit.kozmaj@kynetics.com
To: openembedded-core@lists.openembedded.org
Cc: Dit Kozmaj <dit.kozmaj@kynetics.com>,
	Diego Rondini <diego.rondini@kynetics.com>
Subject: [RFC][PATCH] wic: use part_name when defined
Date: Wed, 22 Mar 2023 16:54:30 +0100
Message-Id: <20230322155430.31594-1-dit.kozmaj@kynetics.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 15:54:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178948

From: Dit Kozmaj <dit.kozmaj@kynetics.com>

So far part.label has been used to define GPT partition label even if
part.part_name was defined.
Fix the code to use part.part_name whenever available, as it makes sense
to have a GPT partition label which is different from the contained
filesystem label.

Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index dfaa901567..1f06b89f8e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -571,11 +571,12 @@ class PartitionedImage():
             self._create_partition(self.path, part.type,
                                    parted_fs_type, part.start, part.size_sec)
 
-            if part.part_name:
+            if part.part_name or part.label:
+                partition_label = part.part_name if part.part_name else part.label
                 logger.debug("partition %d: set name to %s",
-                             part.num, part.part_name)
+                             part.num, partition_label)
                 exec_native_cmd("sgdisk --change-name=%d:%s %s" % \
-                                         (part.num, part.part_name,
+                                         (part.num, partition_label,
                                           self.path), self.native_sysroot)
 
             if part.part_type:
@@ -592,13 +593,6 @@ class PartitionedImage():
                                 (part.num, part.uuid, self.path),
                                 self.native_sysroot)
 
-            if part.label and self.ptable_format == "gpt":
-                logger.debug("partition %d: set name to %s",
-                             part.num, part.label)
-                exec_native_cmd("parted -s %s name %d %s" % \
-                                (self.path, part.num, part.label),
-                                self.native_sysroot)
-
             if part.active:
                 flag_name = "legacy_boot" if self.ptable_format == 'gpt' else "boot"
                 logger.debug("Set '%s' flag for partition '%s' on disk '%s'",
-- 
2.34.1


