Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDA3C18E7C
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:12 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.9077.1740493805606542020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aVwgFudx;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-220c4159f87so80996485ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493805; x=1741098605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnG66/CZM8QfudBsICiL+00CUq777B7N1zux1dMytgQ=;
        b=aVwgFudx5o+lPy790WsAyFkmR1WNpci1IMKKUiJsgM924lbRk325I+LTDB5xjN9r5S
         aq8n6KgS1R+CJUM8c6e91JSh8uMaNIWUUgaTHS/VQUXQ0CY+jMXfOrUwHkOYiSmL4mSs
         luTOeCZzIWs7oFoRKhm7a9RUOMNW7gBgDZpbhiuoY4p9fd2GOVL+Z2LhnQH4xqu76owf
         8jNlR6eIIqL96Diof9vVnxcGaPhrObH9HCIJTMfPNVoPDprYISxqDBmynvVeTZJvTiEj
         fk7h9m/LAPwFzCYHd7f5eWGfrj9X+un0WqgISz7ECMWU6y5Td87GOfEUrjAnGThSvGzG
         +gFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493805; x=1741098605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnG66/CZM8QfudBsICiL+00CUq777B7N1zux1dMytgQ=;
        b=nqNIDXTEUCZalbJFUSrNfmCvE9lDrrqPr5+yR9RVLkoEcK0JvrFbMW+qoeJdE4TGeX
         tdZAnNs76aKDb2NVBxydR9koCwuJLv5nAl5JTLPpsoQmohTur5PIoeoHjFfR5vGRHMC1
         91nZqDs5uAf15233YGzKzKkEZMwu1pm2FkpEgEOFqFNx5CZS3bPxUiZacbIaBdtPm9+k
         4/OeBvbSqb+3KRnPqWzF29VxbNCJi9iCTfOkKYtzyrq0mDsDzQgp8CfE+asFzv/UFQdU
         +++Ffn1cB8uB26VdR3ud0zPf+WCB7nph0cuWodMQKl7TO43+LXxJ8Z0RJVjmSVEaY4aP
         TnMg==
X-Gm-Message-State: AOJu0YwsuFcn3J5356P7LBNsDhJqJ0CStkDPtML2aX0g5ipZud8LOW5+
	5Dfoh+KWV6jxOvgvJxz16dNG58RmYoQczjzORjJZEFpDZBpm90syi4cXtg3JDhOR240hIOS8ZyM
	/
X-Gm-Gg: ASbGncsqkeooLEDzkSvy3y/qY5tp9w6Y9xiOtR61a6kUhhqhara74jgAdibUtX/VpSs
	QYEsE2sJcPUSp3XcCuNLesXqwJFXHnIhqRlPGbzBK+M4MkqYzZm3gVUM1v3l/ZT9AxZ8zLPt9WI
	G/Ml80O2m2ftTx8h9I7xx+pcfHBUko3LV63cjZElljT50NkuU8fR+G23Be6I+aGI//0FSFPnVUU
	c7FBji9Ju2QnQ5ng+g2/SmTGC5gIyLqlr7d/7deCC1bGM+Lzev8mmvN16Asj4ck0JodD8gqBJu7
	lhGdSbvsA9xVC0iM/g==
X-Google-Smtp-Source: AGHT+IGkGlRpnmL4iSXvBzuk5r6H06XAgLUI809+xO7Kn0LCp3M3fusMga+gZzzYGCvx3VPmx4hnKQ==
X-Received: by 2002:a05:6a00:3cc4:b0:734:b8f:a425 with SMTP id d2e1a72fcca58-734791abe45mr5565894b3a.23.1740493804707;
        Tue, 25 Feb 2025 06:30:04 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/22] u-boot: Fix CVE-2022-30767
Date: Tue, 25 Feb 2025 06:29:36 -0800
Message-ID: <b7072637ba110718714745a01d67e1b6b0096165.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211886

From: Carlos Dominguez <carlos.dominguez@windriver.com>

This patch mitigates the vulnerability identified via CVE-2019-14196.
The previous patch was bypassed/ineffective, and now the vulnerability
is identified via CVE-2022-30767. The patch removes the sanity check
introduced to mitigate CVE-2019-14196 since it's ineffective.
filefh3_length is changed to unsigned type integer, preventing negative
numbers from being used during comparison with positive values during
size sanity checks.

Signed-off-by: Carlos Dominguez <carlos.dominguez@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../u-boot/files/0001-CVE-2022-30767.patch    | 44 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch b/meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch
new file mode 100644
index 0000000000..aee7f05ab4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-CVE-2022-30767.patch
@@ -0,0 +1,44 @@
+From bdbf7a05e26f3c5fd437c99e2755ffde186ddc80 Thr Jun 2 00:00:00 2022
+From: Andrea zi0Black Cappa <zi0Black@protonmail.com>
+Date: Tue, 14 Jun 2022 17:16:00 +0200
+Subject: [PATCH] net: nfs: Fix CVE-2022-30767 (old CVE-2019-14196)
+
+This patch mitigates the vulnerability identified via CVE-2019-14196.
+The previous patch was bypassed/ineffective, and now the vulnerability
+is identified via CVE-2022-30767. The patch removes the sanity check
+introduced to mitigate CVE-2019-14196 since it's ineffective.
+filefh3_length is changed to unsigned type integer, preventing negative
+numbers from being used during comparison with positive values during
+size sanity checks.
+
+CVE: CVE-2019-14196
+
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/bdbf7a05e26f3c5fd437c99e2755ffde186ddc80]
+Signed-off-by: Andrea zi0Black Cappa <zi0Black@protonmail.com>
+Signed-off-by: Carlos Dominguez <carlos.dominguez@windriver.com>
+---
+ net/nfs.c |    4 +---
+ 1 file changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/net/nfs.c b/net/nfs.c
+index 70d0e08bde..3003f54aac 100644
+--- a/net/nfs.c
++++ b/net/nfs.c
+@@ -57,7 +57,7 @@ static ulong nfs_timeout = NFS_TIMEOUT;
+ 
+ static char dirfh[NFS_FHSIZE];	/* NFSv2 / NFSv3 file handle of directory */
+ static char filefh[NFS3_FHSIZE]; /* NFSv2 / NFSv3 file handle */
+-static int filefh3_length;	/* (variable) length of filefh when NFSv3 */
++static unsigned int filefh3_length;	/* (variable) length of filefh when NFSv3 */
+ 
+ static enum net_loop_state nfs_download_state;
+ static struct in_addr nfs_server_ip;
+@@ -578,8 +578,6 @@ static int nfs_lookup_reply(uchar *pkt, unsigned len)
+ 		filefh3_length = ntohl(rpc_pkt.u.reply.data[1]);
+ 		if (filefh3_length > NFS3_FHSIZE)
+ 			filefh3_length  = NFS3_FHSIZE;
+-		if (((uchar *)&(rpc_pkt.u.reply.data[0]) - (uchar *)(&rpc_pkt) + filefh3_length) > len)
+-			return -NFS_RPC_DROP;
+ 		memcpy(filefh, rpc_pkt.u.reply.data + 2, filefh3_length);
+ 	}
+ 
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index c4cfcbca19..cd40ad1a7d 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -7,6 +7,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://0001-fs-squashfs-sqfs_read-Prevent-arbitrary-code-executi.patch \
                    file://0001-net-Check-for-the-minimum-IP-fragmented-datagram-siz.patch \
                    file://0001-fs-squashfs-Use-kcalloc-when-relevant.patch \
+                   file://0001-CVE-2022-30767.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.43.0


