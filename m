Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402AAEB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:18 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.14570.1687447933916729163
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3K8Jjejm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-666edfc50deso594401b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447933; x=1690039933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWpUKyisWO/BDExBZU7x6KObQgi1+KnZMJovuuQjF3U=;
        b=3K8Jjejm46fbekPOKfUz79yVIMqvgnttDgN2ipJhi/um9Z3pru6z0P374AENc7evD0
         vH8RO7fXPBpqd0yBG0Er9q3nCG3Nj2lAQIrSj+mYkCkhVtDpXN7jWTMRbChAmOX9/231
         xX/m8oYieWC0dclNUOD9PAqfal2mPajnRI/3kHpJclZTZ8alnekjQGzeMKb6D75K8rj5
         PHWQiqk/YsHCWLOsvZvPvffKXDTSM7f3HGZKlg3sqiEeHqzRw2is5N55IOjzk0/lH+pn
         d9jJER6cgBGDUgTiN4an6ZmcjzPFlSC0ZfD1d7nBLxlDrf27nCli1dL9Y+9WiPG6lWKH
         KXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447933; x=1690039933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWpUKyisWO/BDExBZU7x6KObQgi1+KnZMJovuuQjF3U=;
        b=Re1KeIALIAciNCcWRyCHzBEosZMftler5P5FkZq1F8PA92DaHQq2OZQAOm7ho3f9b1
         8TiaD10srkK2rW+GzU3F66IjI4oJ8kX6r7faqLsy2vAZOc44BILJVM4lw9XD1UCrJQBl
         f4siBJfFf9+vSzAnzgfj/S7eZu9q2G5PonqpoXNgwgNmiWc4bunmJzebQCpBj0ln5b2v
         5JFrn8FC6MCNV0Q00G8UT2Jjx9zlOXQwSLrxt1eWC1yu3nArJpKttRLol5gqxbSh0ZQ1
         zjVm8XJlzOEc5a+Y8VOlyldJWOokjYK6h51o4x4dyzXRe/vjCOk0Hnd5RNAfqom1t9Rs
         fu5Q==
X-Gm-Message-State: AC+VfDw+MQJ+I5HJ/HrZk867BqJh7+HWAdMUKegbn12fL1vSvaEsAJbK
	6n9WIl5mj/8TpHu3Q0zZunKkSpq2WF9a684PumU=
X-Google-Smtp-Source: ACHHUZ5T1WmC4n6913GC4G22fn6bvvW+le4ynDuyl6JBqE+HuLztZvB/symev+7uu2P59EuU/nePaw==
X-Received: by 2002:a05:6a00:1305:b0:666:c1ab:d6e5 with SMTP id j5-20020a056a00130500b00666c1abd6e5mr24109352pfu.16.1687447933009;
        Thu, 22 Jun 2023 08:32:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] kernel-fitimage: use correct kernel image
Date: Thu, 22 Jun 2023 05:31:41 -1000
Message-Id: <8280c089b0df97368476b8bc54ed758e809f42f5.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183259

From: Andrej Valek <andrej.valek@siemens.com>

Even if initramfs_bundle_path was used, a wrong compression was reflected
in output its template file. Use linux.bin as universal kernel image.
The linux.bin file covers both cases because it's beying created from
vmlinux.

We know, that vmlinux is created inside compressed directory already,
so no external compression will be used.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Walter Schweizer <walter.schweizer@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport of 27fbbeaf972bb7e2535c1b23375cfa9d66b69db6 in master branch
Signed-off-by: Remi Peuvergne <remi.peuvergne@non.se.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 3b23138628..b88d7dbe4b 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -431,22 +431,7 @@ fitimage_assemble() {
 	fitimage_emit_section_maint ${1} imagestart
 
 	uboot_prep_kimage
-
-	if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
-		initramfs_bundle_path="arch/"${UBOOT_ARCH}"/boot/"${KERNEL_IMAGETYPE_REPLACEMENT}".initramfs"
-		if [ -e "${initramfs_bundle_path}" ]; then
-
-			#
-			# Include the kernel/rootfs bundle.
-			#
-
-			fitimage_emit_section_kernel ${1} "${kernelcount}" "${initramfs_bundle_path}" "${linux_comp}"
-		else
-			bbwarn "${initramfs_bundle_path} not found."
-		fi
-	else
-		fitimage_emit_section_kernel ${1} "${kernelcount}" linux.bin "${linux_comp}"
-	fi
+	fitimage_emit_section_kernel $1 $kernelcount linux.bin "$linux_comp"
 
 	#
 	# Step 2: Prepare a DTB image section
-- 
2.34.1


