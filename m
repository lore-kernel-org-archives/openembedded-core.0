Return-Path: <trevor@toganlabs.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id E5DB579908
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 15:46:37 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id u13-v6so6165958iti.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=WpzgH+Qe7AVFVeOCU15ptdbBm7ydbMW/6vIA6LLk60A=;
	b=G2adw6mmEibLksdnKDJgZ2SmJfBZonHEEB4lqXpn9m8NUuXmH0eJniXnKR3LmrLTeG
	rSwoeDznotFqArlTnGMLKhwVSELw+WlbrE9azw6/6yV9D4d8ljzfQCecszrAqSOEthXY
	6KF/AkX76v36S+MQwB0VvlB4CjjI5hbacFs96yuAPGHUPWRRMwkEOdTUejjTOghrwduA
	rYaJFAomvPcEjZdeEEB5IijP4FRLcZ1h40/4na2L4Od90/7aa93375ppnaMyLMswhGbU
	JCKTEMrnqQ8OUvjnaKCx8txV1ew0tkp8QyCJw9GX7/0qdPifCLMUW4s4lTTpuaEJzQlD
	yQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=WpzgH+Qe7AVFVeOCU15ptdbBm7ydbMW/6vIA6LLk60A=;
	b=s6JhdpxXdVLKcD73TOhkeHUeDNgb3pDLlY65tYSkvhBLJYBJRstmJTgfSfsBxJSEzt
	jI14rtDmnuhLFNqJi0KYFgLVH5N4wuxN66vzrC+g2cgtsbF1ygQWU4ypod0N0Wx55q13
	LSgQp46mr9yCfZf9oEsARby8SK/2eVomRDiVOU4KlYFlsFz/hZ0Az77zTO6XILE88HLl
	4lqRjt6abudph2C4Oh6Aum0QrHgmw/qpmzj8voLxdtCX1sSt+bbyKa9JlhYHpaWek2iu
	5fWJYSjYcZtWeu7rKrSPL4kC8k+jPm0LsZCHXOe6q2RUmPurEK1SYNpp9AKFOOu+t2bY
	lN1A==
X-Gm-Message-State: APzg51CVxrQGyJmg3NYYaTo62MrlGoY/wBt4zH1fLUDza/p6ZMdlSWrS
	ajyJXqIfgmHwRyCyBJiLPCiB+sv83GM=
X-Google-Smtp-Source: ANB0VdY8/zG9PmzoZZNQoUqpCcqt+N0KlCtj4uTqogoSK5Ol54BjnJKS3uaL6TI+aaS0JCKvVuqmiQ==
X-Received: by 2002:a24:8085:: with SMTP id
	g127-v6mr5304211itd.120.1537026398745; 
	Sat, 15 Sep 2018 08:46:38 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	t24-v6sm970451ite.12.2018.09.15.08.46.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 15 Sep 2018 08:46:38 -0700 (PDT)
From: Trevor Woerner <trevor@toganlabs.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Sep 2018 11:46:34 -0400
Message-Id: <20180915154634.6468-1-trevor@toganlabs.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [PATCH] image_types.bbclass: set parallelism for compression
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
X-List-Received-Date: Sat, 15 Sep 2018 15:46:38 -0000

Make use of BB_NUMBER_THREADS when setting the parallelism for compression.

Signed-off-by: Trevor Woerner <trevor@toganlabs.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 00a00d318f..35ba775cca 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -281,8 +281,8 @@ COMPRESSIONTYPES ?= ""
 
 CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vdi qcow2 ${COMPRESSIONTYPES}"
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
-CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
+CONVERSION_CMD_gz = "pigz -f -9 -n -c -p${BB_NUMBER_THREADS} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
+CONVERSION_CMD_bz2 = "pbzip2 -f -k -p${BB_NUMBER_THREADS} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-- 
2.17.0.582.gccdcbd54c


