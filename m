Return-Path: <m.glembo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AA2C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 16:39:50 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.782.1713803984109159099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 09:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aejIEu7U;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: m.glembo@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so7000629a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713803982; x=1714408782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7uHp37Nq/0JUnW8dqw1rmN8CZdcY6lZ9RgNxNhC0TZI=;
        b=aejIEu7USN/kf1ERrS2cFDB10qPaoNUCBMzuSS+a0+0XLKcvk7JeD4GWAwl2pSa1rM
         mTadEqszqpzoY8RtQgDLMMIQ4cgqj5GCHV8kksNiBG+mGp2jzKG9BVOT6tCSv+YgxuMM
         MBK9pZWOcSdNA6z8ndt/VvAFmupECDiNo16RkukIeRk2ghzrhdi4ldkKrn5jSHqk7mmw
         GBX9qbkVRVH97G3vtCnmKbK+L0gxQrpXO6ozl37E0zyXCtctnrcahO5HM07U3QSm28Dg
         oHY9vAJJ+zGTOrTSS2qnR0JwrQQGGZT2EfCeS2ncar2jGyV1htdu1m87z/g7xnKTfJbi
         as1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713803982; x=1714408782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7uHp37Nq/0JUnW8dqw1rmN8CZdcY6lZ9RgNxNhC0TZI=;
        b=j6hCKclRRY0PkXNRCjUKBHX1l03qhIkys4yIPBCL5R+lukDtyICCo0RvNrS43FFeSQ
         F3+TLPsG3IPYBPZ91l3fg89MZT770LEqarCAxoaV/s3zmMhXlYXd7GzRho+ewdX7nd5k
         yFfrxeBnYVAzsevuKn6Bw6jYuj4uRZgO8YAzgXlG1Ma6GkKJC5JKmKtZ/Xt4L7c9DgYC
         QTAHqvBhIyxfvhP+IS45JUXTH71jvdvcZ18pVyvZrJeiLInvKKxzbGnkJUEViFhR2XQV
         j7Fd5Hv1siiYRd+zmidphAJtCboP0UEdT/bkgT3KaEProQ9eucj0DWTC8CDGpiCeTltr
         7iOA==
X-Gm-Message-State: AOJu0YzhyVYrgRNkINE624aMSxWb05J+TF1JUvvNIExhR9TsyYu2GNIB
	k20PBvRwGZ3TJBo94wTpH3Tx9//5i07AUK+CqDx4MZ9sD5ZIvG6eSO+omg==
X-Google-Smtp-Source: AGHT+IHOXGXBVB9VpaKAFleRkp1XBjx05E1AHO7J5YmKdsIvXb+d1lwI/llSri2dsosqpg/bhGlr7Q==
X-Received: by 2002:a17:906:3645:b0:a55:75f7:435c with SMTP id r5-20020a170906364500b00a5575f7435cmr10284074ejb.16.1713803981604;
        Mon, 22 Apr 2024 09:39:41 -0700 (PDT)
Received: from PC-2635.irisgmbh.local ([2a02:8108:96c0:76fc::9c30])
        by smtp.gmail.com with ESMTPSA id ah2-20020a1709069ac200b00a4e393b6349sm5886313ejc.5.2024.04.22.09.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 09:39:41 -0700 (PDT)
From: Michael Glembotzki <m.glembo@gmail.com>
X-Google-Original-From: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
Subject: [master][scarthgap][poky][PATCH] rootfs-postcommands.bbclass: Only set DROPBEAR_RSAKEY_DIR once
Date: Mon, 22 Apr 2024 18:39:38 +0200
Message-ID: <20240422163938.85557-1-Michael.Glembotzki@iris-sensing.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 16:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198602

If DROPBEAR_RSAKEY_DIR has already been set before, e.g. by overwriting
the file dropbear.default, the line will still be appended a second time.

DROPBEAR_RSAKEY_DIR="/path/to/dropbear"
DROPBEAR_EXTRA_ARGS="-B"
DROPBEAR_RSAKEY_DIR=/var/lib/dropbear

Signed-off-by: Michael Glembotzki <Michael.Glembotzki@iris-sensing.com>
---
 meta/classes-recipe/rootfs-postcommands.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/classes-recipe/rootfs-postcommands.bbclass
index e81b69a239..920da94ba2 100644
--- a/meta/classes-recipe/rootfs-postcommands.bbclass
+++ b/meta/classes-recipe/rootfs-postcommands.bbclass
@@ -206,7 +206,9 @@ read_only_rootfs_hook () {
 		# Also tweak the key location for dropbear in the same way.
 		if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
 			if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
-				echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+				if ! grep -q "^DROPBEAR_RSAKEY_DIR=" ${IMAGE_ROOTFS}/etc/default/dropbear ; then
+					echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
+				fi
 			fi
 		fi
 	fi
-- 
2.44.0


