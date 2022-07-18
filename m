Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51D8C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:42 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.28250.1658155778552114127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BV5AKFJD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id g126so10836386pfb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=P7W1Nf7AIT/UcA9V/grN2EYj/kDEw82ne4rUyQkQwtY=;
        b=BV5AKFJDE8LanCQeOI65SiPtVgMGDWfMxuu4AxeJRANoE87a17m4tzxHiNWenx3qvp
         pUndmj/mucoY1o4Eq0xvQCTn+zmr69gUKCI26DSROzTmUMBnT+DyeDZ2zFoFqZNJM/MC
         z8R7doZZ307Asq42V7/UTUHBqZPBU56mqdd+Q4wtkxwM060Air6Wyl2+2G2QlbV3kzmD
         e4xJcd+tdcLCnhnxNo6HMDfh56IWk1aUaINkLrDtEkSk2bCBrJ+AHqoMJPn1w1w+i7QC
         M9zSxG950Bk6nnpdcPeo/hOYKnpTopF4679/1jEqd5QG/4C1vrxVzOfhwYwy2j1IAZnK
         neEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7W1Nf7AIT/UcA9V/grN2EYj/kDEw82ne4rUyQkQwtY=;
        b=CXYUb97iHRTtmDBKABINUwVG+gCE5Q1J58hJy2vFp+dNF8/sIGIzbeCMY9V1oWJ+kj
         pXifhhupuQKA+MEYcI+znl5gqqDB3zA8KESXDqru0XqIuLiDaz06AZkBUD8A0yMQ/uwM
         M8+0O/iPEp8jU60Pq83W58U5t0cf9JAX+s98oFe5YGpuzk1i6sjPZetHwG1GssQrDutD
         4VhdJPDxiNI8DX1manCVEkGOzTAYmK9rX0G21zpoSw+M8rFbiFUFsnHEV1B3Kx6tMR9p
         qbPNTdByRnO+L+O7/Xfj5i4ON6XXhJmJuKU32ozRZKo3EfuTCAuSYmy0EtSltZTmKtHm
         ebYA==
X-Gm-Message-State: AJIora8lrxcxjlYgXy2DN/Jb18MqDtk4GoIvv9NZlHOfeRfQvubxpyPA
	H4+9haKHqjxP/KvGeyq51GL/gWXJMchLO9G1
X-Google-Smtp-Source: 
 AGRyM1vkvdRGRVQDiAbuS6tuyerDByHYO7IxdTo8tYuF0DdaUaQuRLqmL4/Lh4bGNAj6UDKGS+X8pg==
X-Received: by 2002:a63:81c1:0:b0:415:bbd5:794f with SMTP id
 t184-20020a6381c1000000b00415bbd5794fmr24297643pgd.546.1658155779614;
        Mon, 18 Jul 2022 07:49:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/35] udev-extraconf/mount.sh: ignore lvm in
 automount
Date: Mon, 18 Jul 2022 04:48:34 -1000
Message-Id: 
 <9d90c89bd964bfabb31e64424e7000ac88a2697b.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168209

From: Muhammad Hamza <Muhammad_Hamza@mentor.com>

Failure message is shown in boot logs when trying to
mount lvm as automounter does not handle cases where
lvm is mounted. This simply skips lvm while automounting
to avoid failure message in boot logs.

Signed-off-by: Ansar Rasool <ansar_rasool@mentor.com>
Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit b1d18072ed9a8b0bca0f20f8e5deefa73ab6acbe)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 537828e3e3..8b6ce77741 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -76,6 +76,8 @@ automount_systemd() {
         ;;
     swap)
         return ;;
+    lvm*|LVM*)
+        return ;;
     # TODO
     *)
         ;;
@@ -129,6 +131,8 @@ automount() {
 		;;
 	swap)
 		return ;;
+	lvm*|LVM*)
+                return ;;
 	# TODO
 	*)
 		;;
-- 
2.25.1


