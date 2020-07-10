Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web10.6718.1594371979175956080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 02:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HOSoaaS0;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id dm19so4037672edb.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 02:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqlqt8KNtxPWK/apfixYW8KBPAK3+7xX3k+nr3BWc1E=;
        b=HOSoaaS0HPxpM6ZkrauxQ9rAqPlhjaWhZ/z51FrBuD6cIMzNVvL4rTS68EpIzPbl2y
         sxz4iX9P6VTXn5PwrJQgYPLPjeeXavA2Bde3F79nq9You9OCzLFh5VDkQaYQ2iZ4eyrN
         o1iHZech9zfddVj4ygUzjnuQ7g4R/aWugR+JK6DFyXF0Q+iDgkaLGU/cfdQYnQmyw4r+
         D8/1tGkLqnHgyyeXarACpo3RIdGmsnKN1SlJ6x8lBflyyzubVCFeMpDoXTJ66K/UkYHY
         SZy4G5AFCtgxskPOXhKbuwIYrymkS37JBSmweeamfs7/oAvzGTaI9qZKBTGmAYPkvikG
         ZkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqlqt8KNtxPWK/apfixYW8KBPAK3+7xX3k+nr3BWc1E=;
        b=O5FF7cIgovWDjSucRRtmA51pyUnh9IyACfKB/+z/3CebJKmajHsKIXIsWjlCO4FT22
         wKPitZg47Rto1vTEEc1fYXPaxbGK1NZsyCZ1nRGC0ZpH85lx2VW+NAp6hReFJKY0B0B6
         mEE9CiOXMs/LEQPwrSKpcSAZIDVmA34iWWxS4yK2NkIiFpInRhZf1KhqJ5kI2+1bS1Y8
         N7Q9DsKpzGQfEpFn6Q+ZJ7ZJiUlpGVfIqGrzLPNHgDGRvsTQIXcU2WgBnZDIyyZtqqzb
         jS45wnRBIzOq4NXGKvobw+Lt3aRAjTPil4xeUj2SuwlDYBWIu0FFYLKgwjSPcvplfGNd
         HfpQ==
X-Gm-Message-State: AOAM530mfNNU6Nub6GSQ2gstbq6FemtjXPa4kntsoaj/LhGB0RyWnxyY
	brFp2HsGneR8ERg9vBb4NBLlPuLK
X-Google-Smtp-Source: ABdhPJzh940V/vJM4eVhd1RTIDoyNNCztYG81S6HJnEFwPUbaQrRFyysTF7kgCJuS3ogKBOHaVd2sQ==
X-Received: by 2002:aa7:d3c8:: with SMTP id o8mr69576254edr.294.1594371977550;
        Fri, 10 Jul 2020 02:06:17 -0700 (PDT)
Return-Path: <max.oss.09@gmail.com>
Received: from linuxdev2.toradex.int (31-10-206-124.static.upc.ch. [31.10.206.124])
        by smtp.gmail.com with ESMTPSA id d22sm3249773ejc.90.2020.07.10.02.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 02:06:17 -0700 (PDT)
From: "Max Krummenacher" <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [OE-core][Patch 1/2] kernel-yocto.bbclass: set +e in do_configme
Date: Fri, 10 Jul 2020 11:05:13 +0200
Message-Id: <20200710090514.440-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script test the error code to give usefull debug output.
Aborting right after the failing process prevents that output.

This partly reverts commit ec281a948a ("kernel-yocto.bbclass:
do_kernel_configme: don't use +errexit, merge_config_build.log
and fail when /.config wasn't created")

Cc: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/classes/kernel-yocto.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 54a1a1627a..7cedb05e93 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -338,6 +338,7 @@ do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_po
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
+	set +e
 	# translate the kconfig_mode into something that merge_config.sh
 	# understands
 	case ${KCONFIG_MODE} in
-- 
2.20.1

