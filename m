Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F5FC7EE2D
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:07 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.27577.1677860282984369368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=PJi7WsBA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id ky4so3206742plb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VCYzpuyHnqcjP23NMv647gb1JwYfwnX23mHt5hUbvU=;
        b=PJi7WsBAg5iEylqwFfL3zALzW5zGIQGqb5TziTr7iZ7q3S9oMZJi4Nr3STLI44u1Z7
         5N79PzjZRx9NX2fS+oBKVK83MowrJfa2cfn0stcVhB4DWg1X70EY7a6LZNIRSS73pQI4
         gl4eqbuOKr7vLtLhuDWpvKcKe1eK11L9ldkxxmnaM94dB0Z70k0Ah6ecxFkW6J1MzBCX
         0gHjtWP/UyX/ZqNxznsa/RhKm9QA6h6eNLpkgQdvjA6oEFPN0VQlExgvBEW8sfgl3ltU
         bvGty8ieYrZrc+py+TfV4yws9dfhVo3wKEu5MkuUqjE7sVozRpS43p8RGh0oZKt+8rmp
         Ys1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2VCYzpuyHnqcjP23NMv647gb1JwYfwnX23mHt5hUbvU=;
        b=LMo//nYV4Oyd+rta+WwQfrZSLI+N0LRjLjdiC9ZE9IKuPhrIteREkQUl1I2HakoZiu
         YJN1bgeoUsLU48urHur5DAwDzWzlqMaPCYoltlSeJ8RRJVxf8AaWxY/HL/cYcYDPsiyy
         BvzxS2btl/p5eDCGASnsM6P2QmX7XCg6f6jN5HN/qneq/hw8dG12dI8Q2bJhjJu4JXJD
         pgibq+y6/WDTwg/sgnoKUEz3FkIamHN+Gu0gvvMdSPT9M6yQzG6DHOot7Ab9RJRxVYS+
         +6bjrjpmTNyCu3MsVLTO4VzTLoQg7re9nzwA6eph0jXqcQFEInJvKWMg+tjCsmN3JlZL
         7DEg==
X-Gm-Message-State: AO0yUKWsieOK7GWDUv0mwZmt6ZwKK3dBSrAPccZg+fpj6BViU5kuKePR
	mzMlvOYuCpjEt3m8B1h4e29HX0kQ3Gf/5u2z16E=
X-Google-Smtp-Source: AK7set+54hYzPlUpsgvbCAL2PwMYFzNAF9za1AUe2Dk/99mkwP1ukSzj88T5rrI9n6ieTL000C9gKA==
X-Received: by 2002:a17:902:b193:b0:19a:a815:2876 with SMTP id s19-20020a170902b19300b0019aa8152876mr2057290plr.62.1677860281996;
        Fri, 03 Mar 2023 08:18:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/29] wic: Fix usage of fstype=none in wic
Date: Fri,  3 Mar 2023 06:17:15 -1000
Message-Id: <e2461b7a6e680b68774ad1f15a83981a26007029.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178006

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
index 5563f4448a..dce5d1485b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -132,6 +132,8 @@ class Partition():
             self.update_fstab_in_rootfs = True
 
         if not self.source:
+            if self.fstype == "none":
+                return
             if not self.size and not self.fixed_size:
                 raise WicError("The %s partition has a size of zero. Please "
                                "specify a non-zero --size/--fixed-size for that "
@@ -404,6 +406,9 @@ class Partition():
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


