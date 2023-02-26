Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB30C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:02:56 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.69604.1677430976362581830
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Wn+CiTS7;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id d10so2212375pgt.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHGbrVRapqjU68mq+IQwn+OIT1Mwoxa7tuvXDg3+h4I=;
        b=Wn+CiTS7M4EwMrM5CSMYbPzY5p2PJoFC8oDQmigsMFppB6GMNPSvCNz1Bg9/sU6uIG
         XiVfFgt5ilmTyyba42zfrH/c6g9aiKTxHRShQu1eWzDtDKVZHMe/3zkSnNeD+1bzzJZz
         K+FSlps3FHkUR6drJAOSsy6+6Cds+mj4fMzjxT5BD2gUBAAYMrNWCb6E9vFX2eURVJAc
         cANDSqi+pYBEVoKNOmQynjqrlvnhmaz0ArJUTxvgcj1IHsRqnx9M/VyY0ewoltXG9JLV
         LOb/1NHMXZr8awfHW3BmKVXykheU9hFb2WCFEOpgLapxzUSd7ZWOHwSCcuu79tyKXMbS
         MSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHGbrVRapqjU68mq+IQwn+OIT1Mwoxa7tuvXDg3+h4I=;
        b=odlkmA9ixvQ8ODH7vFeSQaxkwRQnRpGJrTNVXV8DfdhIPseLU8GEsmG9ezlnDYjNDI
         c9QK7I6nNr+oTr0jJ9Lq4UqOWIubwRUdrf3hbt9TWtHl5b3pXb4sbpYlVk/xQW/OPfHa
         r0g/FJMsUILpZTlMcmT7WAO2+unmUs5ao52dcJFpLoJxjYIJ/KmYr2LtiBHXFgZZu75F
         ZgxycfpInXPBnZO5/0N1/EBHSytAvrwoPoRtw3yjkB66BGTElsBXXjDARDmomJTb0AL6
         drZGMSbvvgs7Z8lOBxq1KISLiCJKigjemRmy6/QUBaKjPpWrowDlvW473gWJ4yI2zE1b
         vHLg==
X-Gm-Message-State: AO0yUKViBqGCy28Nd/RClpUFu+sSoQXICn1m71OyXrdq5TziiuhRB9Le
	1WEdo6sxywTGTT9tb9S6u65zhTFxvz8LeUpTeOk=
X-Google-Smtp-Source: AK7set8lnV2LB79l61938c3SjvBwXu+HzL2e4YljPV3ffTZyYQdw8r9cmG9hGdzp8wkebvYbpWBuoQ==
X-Received: by 2002:a62:1946:0:b0:5a8:bd6e:90fb with SMTP id 67-20020a621946000000b005a8bd6e90fbmr16799758pfz.19.1677430975380;
        Sun, 26 Feb 2023 09:02:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.02.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:02:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 14/28] wic: Fix usage of fstype=none in wic
Date: Sun, 26 Feb 2023 07:02:10 -1000
Message-Id: <5f7239eebe61aabbd3dbf4e6e1cf703c71273a35.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:02:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177752

From: Pavel Zhukov <pavel@zhukoff.net>

This allows to specify partition with fstype=none in the wks file
to have partition created but without following mkfs. The none fstype
is in the list already but the usage is not documented.

Example;
part /data --ondisk mmcblk0 --fstype=none  --align 4096 --fixed-size 512

will create a partition, filesystem may be created manualy on the host
or target and data will be preserved if the device is reflashed using
same wks. Works with bmaptool and probably does not work with dd.
Use case is persistent filesystem/data between reflashing of the image.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 351cb64da37aa43113e5192605d04436652aa3b8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 2a916e077c..382afa44bc 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -133,6 +133,8 @@ class Partition():
             self.update_fstab_in_rootfs = True
 
         if not self.source:
+            if self.fstype == "none":
+                return
             if not self.size and not self.fixed_size:
                 raise WicError("The %s partition has a size of zero. Please "
                                "specify a non-zero --size/--fixed-size for that "
@@ -405,6 +407,9 @@ class Partition():
                        (extraopts, self.fsuuid, rootfs, rootfs_dir)
         exec_native_cmd(erofs_cmd, native_sysroot, pseudo=pseudo)
 
+    def prepare_empty_partition_none(self, rootfs, oe_builddir, native_sysroot):
+        pass
+
     def prepare_empty_partition_ext(self, rootfs, oe_builddir,
                                     native_sysroot):
         """
-- 
2.34.1


