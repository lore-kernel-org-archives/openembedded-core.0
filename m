Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C94C4450A
	for <webhook@archiver.kernel.org>; Sun, 12 Jul 2026 05:51:49 +0000 (UTC)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9338.1783835500259714958
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 22:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=TNYdCcCq;
 spf=pass (domain: underview.tech, ip: 74.125.224.44, mailfrom: vince@underview.tech)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6649ffb1d01so3069875d50.1
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1783835499; x=1784440299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtORirhu8WMo5JEeSHe9Cg+10FDL9Pk5F/e13RwIwqw=;
        b=TNYdCcCqOMPL4DSuN2D+B2McTrKj8CYd5Y6kxD6eOHmGXQJLIOl6rLe1sOmiNOVC9I
         xewGxkB6QB6tQMx0xsqF/Ki2JfKaav0H2xF+/hRABe1IACwT2d/0KyT0Vsd0VtMqpMdO
         4MiM2mn4ZVQJrJqD8SD8Jdhq7g1B1COnBUgzUXufQGqhZwe2UcKaq0GyThwDEfjaWeKD
         Oc8nawDXhxw8eeqnx1wGpQ2UJ7sQxVlB+Io2lNLYrMpiWcNL/YXOtfQ9M6A1ZXsrMebz
         gx0pn0gR7ETdPYbyIpKaEr2oFLqi0MwA89NiNK+LuSjsfWB+G8KkmKozu23sUS4SNjha
         lpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783835499; x=1784440299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gtORirhu8WMo5JEeSHe9Cg+10FDL9Pk5F/e13RwIwqw=;
        b=UCUkbxRqtyEbf+iNqU8LqPMMprXL2HEcdHts9ceJs0kITcTOXVPnoR2jwPVyESNc2z
         bNwX3BT+mZsOvx1LFkWHmla1RDecZZLolJGZa0J6KlZcCtEEIKfm9/uSN5X3l0wTOiae
         TAwKO65P9VHSEmekkTEevjU5WUcRKT9KNSc9rUu6vKSFH/0zEaJvxGMIYOxqGFjMqxcu
         nsKG5q3t3geGSHVC/BlKkKSu06C0jlebI6k4yidwtJMzAmZTFFtaWa0IduxUgj7nssNr
         bWqf+oPBWY54wtKdi+lWYXpWVvhhr4jTEc61frF8CHlX6WWERD75aUPVwNfkNVOFGEgW
         DbCg==
X-Gm-Message-State: AOJu0Ywwfbc+32Rss/KR7ExnZ1byOd+pZdv4NTBFjhNmpUQ0GJ53RV1I
	rmqcnTtNd8oOsSNBpXugp1GClhmxKWzXZipCw3ZJX0WCH5gLtw0//H+CSLKJEXYAFxh0i/+Snnx
	arhghfwo=
X-Gm-Gg: AfdE7ckrdQK/gMAnavgtOMEGeCBu8U9oFg1DlzQe3LH0frkq0aWSjoJYERORvu05AQM
	Hcsd8MEljhpo/MMOomhlfJgSshnr32f1QEufIfPZvhP5epth1Qa3OXJvn9K4yfaVME75dpnpuLO
	cKUAOTdJ/9NjjjZc9IHTJFqJZli7k94HWSAnk3CHbmzkF6N6/DkLMx8lZH1BaAuKl3ttUvcHvnm
	JYg2e48q8uOjg9IrsNFHOm9Gid/AiYJkGTgQ1JsMhuapINuAwCWGzc1kcmYJQL4pUHdmqBDsoR0
	RLiI2B/uRgLUL1POGbH/CSkFpgmXF1dEwtRmi0qEkhVCY50B21aia5cSrb1FSiwlJmjf6jATAwH
	z/IPnZ5xlxGHen3pAr0G9SN/xd2Az+PWMTwEdaugjtRusjA+4zUDn1uD4kSieeNhSb4epYRuw5h
	dIAPynf8rypG/+Zg==
X-Received: by 2002:a05:690e:134c:b0:667:e148:ad94 with SMTP id 956f58d0204a3-667e148ae11mr1765221d50.51.1783835499290;
        Sat, 11 Jul 2026 22:51:39 -0700 (PDT)
Received: from vince-server.attlocal.net ([2600:1700:b540:3af0::42])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6678779e37fsm10764901d50.5.2026.07.11.22.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 22:51:38 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2 12/26] nfs-utils: rename kernel prefix
Date: Sun, 12 Jul 2026 01:49:40 -0400
Message-ID: <20260712054954.4063745-12-vince@underview.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260712054954.4063745-1-vince@underview.tech>
References: <20260712054954.4063745-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jul 2026 05:51:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240737

Utilize preset variable KERNEL_PACKAGE_NAME
to ensure uniformity with builds if
KERNEL_PACKAGE_NAME variable were to
change.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 6f00bee0d8..76002d2d3c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 # util-linux for libblkid
 DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2 libnl"
 RDEPENDS:${PN} = "netbase ${PN}-client"
-RRECOMMENDS:${PN} = "kernel-module-nfsd"
+RRECOMMENDS:${PN} = "${KERNEL_PACKAGE_NAME}-module-nfsd"
 
 inherit useradd
 
@@ -28,7 +28,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
 
 SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
-# Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
+# Only ${KERNEL_PACKAGE_NAME}-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-client"
-- 
2.43.0


