Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D480C369D7
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:03:25 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.3479.1745395403460407517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=MYSSsRGi;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499c5d9691so6873294e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745395401; x=1746000201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVpsXTohc152hYkidOUqMjAySOP1W9akjeQTQyAFQOk=;
        b=MYSSsRGiz+iMPYcAvGb7v0VfYor4hPu9oMngqVK4Jmymsa2l0CsfepDZxc3rbckNSR
         PGOKZMQQ42hMve4Fq6M/kMIO/hp61hX6y449466xE1uG9WCf+cPN6WVzr6+2TF0MaQ3o
         Z/x4i1Qo/LdqRVQbhFvi0i6GPuS9U90wUoSpWoRbIuxdXL2w//1+aSREeevCiRAZAAp2
         lNrI2mDfwXJVY2iIIGTKmsV718nscgVcjeBWcdvuQiUCCoinlH4ySayJPWnVwkmAcCH+
         Cv5RdKVZb82woZ0y8HfCI5765oQhvesf0oDu4tmDgjbfhWFL5Bxi2v7vIVBYntA0Z2RF
         +Opw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745395401; x=1746000201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVpsXTohc152hYkidOUqMjAySOP1W9akjeQTQyAFQOk=;
        b=Ya177uiupra1ArS8HIszkrn+xFIHm5X9ZQFb4VGu4NqmwdihyWaL/txBofLno3K6kg
         pIne+yldTqXyRyhhNwAVA8F4QiKNQZfqkYVDEb0YD2gX7X1OXUseSJVzUqtiu4Ag38ml
         MXVlZXeLwZW+HlFFOJ8Iz/1NSrZKZpgkW550CV751jjrbf9cIN5QxWAuvxBlmse38raZ
         t8i73cZmVJD86sFBcDqSfibAenBfO/UvMACOjn1pdv7kqC8jxoz18ZcMyeRD4n5+vZTu
         dpEPvVAM/SBRPtuU7F7FiiDjzVfAC2fcUwIIwwRqNdZknQvoTGNSAHqwAPbAdmYNZoyP
         BK4w==
X-Gm-Message-State: AOJu0Ywfrs0GVcRNpXFJCGhMuy4Kc5TFppNDd+Z8YuzU3aaDsiNsS4+7
	QJJmIoNT0Hr7kCyER94TdGmP2grjUOKbGiX/n5dtenQRIHDo5ibLLhXb4wtBXSDGKxMsFhcBlXG
	xq/c=
X-Gm-Gg: ASbGncsvcC17ylCumjh+Wc/29KyXiAVU3ivs2EXqdDAB54ur31EdnrssxUJBVDjkT7K
	sBa/ZpWU3PGH2+XnlidB6IebDEdv++SEcFbOeAakSPk27wFJxgwer1Lgv7C0D727YBLLAMndqRY
	H7KWLlzKbwLiN3A+QbwJncP8+kyiSEvKJ0o2W4RMlo3DkPgm02ekTITfZHzcdFC/6yVaS4xeUV6
	788fGIHYFm2JoRh6PQvICUJtcB/eDQNhqq5WjesHmVVPix6uWUN9a2ayAT/98aziz4Q357R2vmc
	dRZAlbMio5/1MQkq9iQIuxSJmV2TxWtfX0RbQg3wJpG78FYq3yjiJIQi0FlDBX3mNgYi4nlzUpR
	p/OByX+etZsBHNTxg0g==
X-Google-Smtp-Source: AGHT+IGuMhc2JdThrnSy57+oee34XOWET8K51MV8zGH6H9Q9IRWUlxcd7Cpcxf81dsxwv6o/QwJFWw==
X-Received: by 2002:a2e:bc29:0:b0:30c:1002:faa8 with SMTP id 38308e7fff4ca-310904c63eemr47848231fa.7.1745395401487;
        Wed, 23 Apr 2025 01:03:21 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3109075f2aesm16951581fa.23.2025.04.23.01.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:03:21 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: poky@lists.yoctoproject.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/3] kernel-yocto.bbclass: support modular kernel configs
Date: Wed, 23 Apr 2025 11:02:45 +0300
Message-ID: <20250423080246.128723-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423080246.128723-1-mikko.rapeli@linaro.org>
References: <20250423080246.128723-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215265

Compile many kernel drivers as modules when recipe sets

MODULAR_KERNEL = "true"

This likely requires support for initramfs which includes
kernel modules needed to mount the rootfs.

SCC_OPTS can be used to add arguments to scc kernel config
generation call.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/kernel-yocto.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index cef6b9ec3f..f98720bcec 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -26,6 +26,12 @@ KCONF_BSP_AUDIT_LEVEL ?= "0"
 KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
 
+# most drivers as built in (default), or as modules
+MODULAR_KERNEL = "false"
+
+# options to scc
+SCC_OPTS ?= "${@bb.utils.contains('MODULAR_KERNEL', 'true', '-DMODULE_OR_Y=m', '', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
@@ -298,7 +304,7 @@ do_kernel_metadata() {
 		elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
 		if [ -n "${elements}" ]; then
 			echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
-			scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
+			scc ${SCC_OPTS} --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
 			if [ $? -ne 0 ]; then
 				bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 			fi
-- 
2.43.0


