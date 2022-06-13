Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640C6CCA47C
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:17 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web12.6527.1655130135054308991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YJn14Kqr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id i64so5880528pfc.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vT1lSDy7VHTCXKlPG43+plFUYVfIGWcvnxpeVZag7Mc=;
        b=YJn14KqrComZGKj5iKfMXXPQC8C+ACv9mXx2tQsXYz76gesYjbMUjd1Kzi7gvf6c2M
         AVOzgYvuLZ8bfqvIhvyT6vobU/gO7/Zc/rsLlbXN24epX3OgykrugiOimVPMnjRT6W76
         WzZ6kpy9MfxFzRjg7P6kI2RXDpjJ+9Yc8aJMdkkWCzHDfqEDQG18oJWB0Pd7S7PVu+2t
         CnUIhVS+Q8RGMRpcAigOLijCJkgATcxWbtXHIoWGfFyIstArCjOZVcylLs5gA2WRLnag
         IfX845hKcHEWrUWLfH15LXX6T2zh9RbmaHB9Ku3mAUXdqB1vGWFreQD8CPVsfrkWcrtE
         4DNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vT1lSDy7VHTCXKlPG43+plFUYVfIGWcvnxpeVZag7Mc=;
        b=Nm7nhgXm7xiofwcCSL6CJbpbugx44yqCzfDYh4cQWSzuUis8fdO0NZVx3whhDeMPIC
         qZ/paEeMggNdquVh+N6rk9zjLAVgrHbE1owvhi5EKaOtqbwZx5ArRTROS5iU6AUGGaHB
         qRVDDG/q1T+jV5tD+F/YzlQjrpdUuO/w/MGphTkYpZRKNahDqxSXc0BiOZHj31ZPz0dX
         DNjIPv3q/KLyp4vzLkSWkplkut77dp61ItQnUajPfzcyPjIRcia9CKjwhL3eSAdf7FR+
         yZenIx/feti4sC2Vb2EqvySw0WCjlnOQ8CW6rAOdAMHm5vyJ0+s8+6AKaTaRpSM6cGRa
         UMcg==
X-Gm-Message-State: AOAM532MZkTQH07rY770M8MxL8Qu9ZDP7SAdWvHCI9BS3NWWY9PLuzQG
	Vq7kI3ZRTidHMfPKKPTcLKKtIh0snQqVsZYq
X-Google-Smtp-Source: 
 ABdhPJxrBJPoVMT8kzXfh5seuq6sV/yk1xKpkeySX9TQ5+HP3HX4ycmDhs2U9LeOlBBeFUiCaCMsiA==
X-Received: by 2002:a63:e114:0:b0:3fd:97a1:7a5 with SMTP id
 z20-20020a63e114000000b003fd97a107a5mr37953860pgh.178.1655130134020;
        Mon, 13 Jun 2022 07:22:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/20] bitbake.conf: Make TCLIBC and TCMODE lazy
 assigned
Date: Mon, 13 Jun 2022 04:21:36 -1000
Message-Id: 
 <e30ef926e440b505e93e404c056034d86364a241.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166849

From: Pavel Zhukov <pavel@zhukoff.net>

This allows two level of overriding (distro level and local.conf/shell
variable). Previous settings blocked shell variables overring
if it was overriden on distro level.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de6c3f9cb2c589aecbf8d9d25fa83cd18bf80891)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0e939aca4f..2a3cf6f8aa 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -386,8 +386,8 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
 # General work and output directories for the build system.
 ##################################################################
 
-TCMODE ?= "default"
-TCLIBC ?= "glibc"
+TCMODE ??= "default"
+TCLIBC ??= "glibc"
 TMPDIR ?= "${TOPDIR}/tmp"
 
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
-- 
2.25.1


