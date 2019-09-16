Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 93B947C873
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 13:23:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r3so8729375wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 06:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PVW+r0UOrOTXmc6Zr4W5p6RF0QZOnWad3R01tP/WU0A=;
	b=GCd9DufvQnFNT92Ck3mkEZVEdPVgCe9fUX9PA+mQq5868PE/H17CCkc2RuyCu3JxnI
	0Mn0RZAfV+EFjf4xcI1UbUoBAgK2xSZQZlpMKDjnHyQHfuC68R4h3HMXZ/lgYyB/ri98
	ani8TePURREx6aiPtPkIyCS8yb0zgvu9MswlVGJ0Pdq+5iOglqtifKWgF+qRdQVtaT+X
	pc/woU1qaQq/2oqRP4z46SRU5P2peSwzGnSoTWQ1KMJYm2jpStOEMcMiFhtH8qMBLpW+
	8AAQx8eWOPp3iheoZGfsn4UbPJOPT2I/PnCRJYRbMbJ8XhGLZ8Am04RtlgdYaib1K+Ps
	kv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PVW+r0UOrOTXmc6Zr4W5p6RF0QZOnWad3R01tP/WU0A=;
	b=Iq4udoHSQCLYe84kfguYCy1LmLoqGKA8bSJ9NeXhkYoPSPk7PQERr6QF4efy7EbJ4N
	yleYWk7CtR+D+d8X3GSmOEcoFkPMOonhI1B7ykscSluSZLVtjloGiYGLylUslbjLhqNO
	1Rt7YWJj9JVZJXEzRRROerG4CuTsfZL/3lE9hY0W4eovB0BzoD/vJFgNc1WahMwrBA8J
	5yUzltsITJrkt30fAzI4Q9CYQH0yrP9P8DxJcV76szmhU2zV2hy0bpFKwwDccz9PSMCG
	6cd4UES86DnyK/BYwag9kuKM/3Zktx4zYB9vAVXNW2CXFvPuJPhZRG/CSIUVGW/0Kk7H
	ZK5Q==
X-Gm-Message-State: APjAAAXCx/QAS01S5gaqmYnOxz8+koBtZK5sokYF8724xdpnE77Bwrj+
	EA8orr4iHLM44H3FDKYRFPOEgdFYfCoFiw==
X-Google-Smtp-Source: APXvYqzsvqPykFT36Z/eLEXeyO6ytrS8BAawMRO8Pyl2VTETi/mJjfJVAgOKIWNy2ByZyKKlc4A9qw==
X-Received: by 2002:adf:f011:: with SMTP id j17mr11767246wro.131.1568640207865;
	Mon, 16 Sep 2019 06:23:27 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it.
	[217.133.17.98]) by smtp.gmail.com with ESMTPSA id
	f186sm19462765wmg.21.2019.09.16.06.23.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 06:23:26 -0700 (PDT)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 15:23:15 +0200
Message-Id: <20190916132315.15704-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] initramfs-framework: support PARTLABEL option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2019 13:23:28 -0000
Content-Transfer-Encoding: 8bit

Since commit (kernel >= 4.20):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f027c34d844013d9d6c902af8fa01a82d6e5073d
specifying rootfs by PARTLABEL is supported. This commit adds support to
specify root by GPT partition label.

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 76fa84d354..61baf73a60 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -31,6 +31,11 @@ rootfs_run() {
 				bootparam_root="/dev/disk/by-partuuid/$root_uuid"
 			fi
 
+			if [ "`echo ${bootparam_root} | cut -c1-10`" = "PARTLABEL=" ]; then
+				root_uuid=`echo $bootparam_root | cut -c11-`
+				bootparam_root="/dev/disk/by-partlabel/$root_uuid"
+			fi
+
 			if [ "`echo ${bootparam_root} | cut -c1-6`" = "LABEL=" ]; then
 				root_label=`echo $bootparam_root | cut -c7-`
 				bootparam_root="/dev/disk/by-label/$root_label"
-- 
2.21.0


