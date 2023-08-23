Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC29EE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:37:17 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.13092.1692801436452215138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=l6R58i6M;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso37446795ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801435; x=1693406235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7BoRcHb4Q9CiVVdJVsIMinSe3imM8qVwAbjM71WqXU=;
        b=l6R58i6MGaKq0hJ5J2z2k6bGNUcL59SRV9AMizswhg0zpmgIZRrDvzlBQG4Vr6d09x
         m0WRDEkn/XoyAneOGRB2Qd+EaKcDVCE5wlHGvBfUdUQYBzLG6Ho5Z6RaOQe7smIMzFYN
         bGYDgxF8+CKwooMGCppUypRUlpp1gRAXNYzVCZ8elLt+nePcza6peH6hOzt+rZpG5yo4
         bGyjCRnD1nKknKHhuPD44XFVuGKfG31LZPaESNWiHx0FbD9oKDlqT2+IpUSVVxEX17Mp
         25R5IwhD+fsZen39aqrshdf2jlAlHtYdkCr23rjyy8bCicIrnTXOhUf6fJ1A1cvlp0yD
         AVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801435; x=1693406235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7BoRcHb4Q9CiVVdJVsIMinSe3imM8qVwAbjM71WqXU=;
        b=MDaB75R+CGFXJ8VWMA5w7F7Lst+pV/AxkpuJBK2CMCIfens0dJG/CMD5TLzaIentW2
         17VBnMTm4rlBZ5QdubFh8oS3CbUa4ZmbDTIGOC9FkU7th4WiC/4zGdT7G0ReSnl1bHqw
         rfuUnH4vxPn9v3336kcYk973Or5NY480XwdBpZOKj+Z6ZU49xdxE1EHkUt9YZuCfEWla
         0t1yzUGHYzyYtjIFqEPWyLdYqMv/PxfEOTPbUWdx6PrZ2SKW5dGMj0BejOHVXdYnbnM6
         FwltbYAb47zQcLNDJirBeaB3XZfXIC6RCwi0reuODxSYCnn9LFl0FXr/ZOQpqiyE4tFh
         0/NQ==
X-Gm-Message-State: AOJu0YxmKTigUx1AUmI1AabFuS67xsOCP3k+CTmWe8uzLM3kN2zViAOh
	MN31n4LmSFWZrM+SalKbnhBz7IeDmA1/JK/3B+s=
X-Google-Smtp-Source: AGHT+IGvqZhuGUzghuCgRTdw8nzHr7yWqaQrQuwn8ONfiGyvA+qkhe62QMOAppYdO1mnHKbC+DcbuA==
X-Received: by 2002:a17:903:41d1:b0:1c0:bf60:ba89 with SMTP id u17-20020a17090341d100b001c0bf60ba89mr1599ple.60.1692801435509;
        Wed, 23 Aug 2023 07:37:15 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.37.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:37:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/36] mdadm: add util-linux-blockdev ptest dependency
Date: Wed, 23 Aug 2023 04:35:57 -1000
Message-Id: <7190ea3b70a9b36ecf48f948e792ac2ce6eca1e3.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:37:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186608

From: Ovidiu Panait <ovidiu.panait@windriver.com>

07revert-inplace test logs contain the following:
func.sh: line 335: /sbin/blockdev: No such file or directory

Add the missing util-linux-blockdev dependency.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit a15cd04f528d137d428a572f15d1ec5ebbbd81f0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 307e7abd9e..e4b98f82c1 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -105,7 +105,14 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
+RDEPENDS:${PN}-ptest += " \
+    bash \
+    e2fsprogs-mke2fs \
+    util-linux-lsblk \
+    util-linux-losetup \
+    util-linux-blockdev \
+    strace \
+"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     kernel-module-loop \
-- 
2.34.1


