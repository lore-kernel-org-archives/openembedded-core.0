Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E797C54E68
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:31 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.34079.1710728542155120811
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Bp91N3f7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6e67d42422aso1472079a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728541; x=1711333341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTiUdAn5NBgO0iw2m4OC/pEPvCzQ0nD8xwk349lYvrA=;
        b=Bp91N3f7l779fWcIWsJ/i9UAuNllQpxlvJbOql6AlDfUYxMPUyWxDyKsGMDpWIZJ0i
         Davg6BjDs2Q3QXze6l6QL0qCD1KAbrHZiV7ZjRgRn3Nv2y/cNF8u+BqZmXKzTEKY5cfF
         8hIfVXONN+krYF1Tr3HModiPtzx4BZOhDNA1bNyz4hBrxozg4gutISV/lwOj+NSOM8bh
         FGa4gcLifvLxoWo8srtqkfzCtJZqXxiVUM1Mc75GigxhDzd1QeqC8fWzDpGx3w6u6puc
         oRpybgdqsTPgZIJ/SJPR8EVBNIyYaFGaPlEjzMC/4Mg/e1yksTmyA96aAye+PneZBu1A
         CY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728541; x=1711333341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTiUdAn5NBgO0iw2m4OC/pEPvCzQ0nD8xwk349lYvrA=;
        b=gZ8rcbESQ1YvypUTFTr8xJca1EjpnQOZwh3Xiy5PE2HPSdq+tXReraHotJGqti2Iak
         VwFt7kapniK5CsYoaINGdvG9R8r0Cweb3iF/TyArgL9id18ZpuB364ixEy3eoRnusMP1
         kqKLVT0GiHKxE4MEJRBpsfdWDHnyZI+rCg9DjiBXCWb9dXzw0bqfzyfx3ZkIvKLuGd6X
         PFSn5E/izop9SxVRgZhY5abN8p/kt3k5yDwmsmBqUduXSjLnGTmsmPgYeKfz7Ps+QVEL
         N/X8eCBmFBCNcV0n9TQhFDFOmcQielpY6CjSm2+GxupnPem2TuklkjG4wJutyiS7mKEb
         Mm4A==
X-Gm-Message-State: AOJu0YyPpWlejpwMCoSPGxaUZXI3XPugRcZh5GXIQmTm4wOPG1Awq5FP
	EZAJ+hj+uP2LV8D//CkLwq73+13E4HLibfp20yC/eMK3/ZtY8Ued7VIxcQ9Q3pE2PDATbh86odj
	ARagWBg==
X-Google-Smtp-Source: AGHT+IEZKQWU8c82ibMVKfCzDXd2iVc7GvpJwhK/Azuh9N92Ip4ygkqCenjCOZ4Loz5FIdHi7zu+zw==
X-Received: by 2002:a05:6830:1608:b0:6e6:8521:b72a with SMTP id g8-20020a056830160800b006e68521b72amr4686749otr.17.1710728541283;
        Sun, 17 Mar 2024 19:22:21 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 11/14] linux-firmware: upgrade 20231211 -> 20240220
Date: Sun, 17 Mar 2024 16:21:55 -1000
Message-Id: <0d506b892d299eaf9aeefb614245108128ce480e.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197286

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit add81ef0299ea5260f9bdc59ffc8f5cc0e74276f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...inux-firmware_20231211.bb => linux-firmware_20240220.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231211.bb => linux-firmware_20240220.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
index 0ed4d91f8a..490c0ab89f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240220.bb
@@ -91,7 +91,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0 \
                     file://LICENCE.cavium;md5=c37aaffb1ebe5939b2580d073a95daea \
                     file://LICENCE.chelsio_firmware;md5=819aa8c3fa453f1b258ed8d168a9d903 \
-                    file://LICENSE.cirrus;md5=bb18d943382abf8e8232a9407bfdafe0 \
+                    file://LICENSE.cirrus;md5=662ea2c1a8888f7d79ed7f27c27472e1 \
                     file://LICENCE.cnm;md5=93b67e6bac7f8fec22b96b8ad0a1a9d0 \
                     file://LICENCE.cw1200;md5=f0f770864e7a8444a5c5aa9d12a3a7ed \
                     file://LICENCE.cypress;md5=48cd9436c763bf873961f9ed7b5c147b \
@@ -151,7 +151,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
+WHENCE_CHKSUM  = "a344e6c28970fc7daafa81c10247aeb6"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -237,7 +237,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
+SRC_URI[sha256sum] = "bf0f239dc0801e9d6bf5d5fb3e2f549575632cf4688f4348184199cb02c2bcd7"
 
 inherit allarch
 
-- 
2.34.1


