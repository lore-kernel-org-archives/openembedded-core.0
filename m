Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A06C3DA7D
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:38:55 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.16471.1672594727441328625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nKFV6fu9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d15so27154752pls.6
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiWnAmZxlD6hh0W7k0eOTdWHprieL+NnOYLyuTsqdZA=;
        b=nKFV6fu9uvBxA11uALFJWf6wVX3ppMrZ9POQsk96WyXxu5hlQKIM4NwZL6rktg0Iqf
         Nw0M6xOJwEj9VOJuoI40ytTTfuCY/hZyOTEcZcEecBZIiwgKFLaHWKJZJQsugopxj8RV
         DFpcXEVkbB0CMYWIyg1/hMsG3Y3F69YK5nQ1YaS4Q+Olg48dr/Vl437i5TszlHZ763/C
         rV6StQROnZxZhiRXDecQ/vscqqUvDLuaAA0+PF83l/Yx7ngnYlioNtiC756K/HkMZJ6o
         q/BOCCVAl0e9EpTeL3jbqVhGOukizmx0wX7tsOQWc8JNpItxIN359VKbtjEtKR/ci6OF
         JdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiWnAmZxlD6hh0W7k0eOTdWHprieL+NnOYLyuTsqdZA=;
        b=1C0IFGbYmR6y1ImCxK/wvm6O2KQE5s/JjA/G0QUGCOiPceSPYT9ejKKjT8jvlSIA8j
         zLH5IF2V07425Lr/UyLPUBIE55rYLXJGdDZIZ4HOHgARrKBBJKeud8Tqc5eX4kBaBfSd
         rPJzfP9seCeEKDCzu9y0tUgdQrXLBQMgy/OdpN4f22I20TiE7BrL6pSLpLBGePD28hvX
         3g3WURi0U0+44gW5oBJwuyYedvWmAVGA35bfgWllMxKeAl7yeYUE5592pcmbr7ZGaMXl
         DUpRh7iV0MZY5sPzFpM+oLcRMY2MtR0VZYvP5pqv3jhW2cVR8mRULlM0Nww/Q6W2IaXI
         Cw7Q==
X-Gm-Message-State: AFqh2krkfZlEVRB/CyXlwHtdRcxxTU70yiJVevwAEmDyQ+MAN3th2hVn
	cCcypIRxMlfFzJbROooF3h0bkpp12m165tqWQK0=
X-Google-Smtp-Source: AMrXdXty4W+jUrPL3PXWyWPpFnLwucxEXdpcv9jIqEzNmbV9WFRuP6yfXLzsajDl7lYFz2HpANfcvA==
X-Received: by 2002:a05:6a20:670a:b0:a7:8b3e:1207 with SMTP id q10-20020a056a20670a00b000a78b3e1207mr58001509pzh.13.1672594726529;
        Sun, 01 Jan 2023 09:38:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id v63-20020a626142000000b005828071bf7asm102299pfb.22.2023.01.01.09.38.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:38:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/29] kernel.bbclass: remove empty module directories to prevent QA issues
Date: Sun,  1 Jan 2023 07:37:47 -1000
Message-Id: <6fc179de3789c87aa661ec90f51c637cb8ed70c1.1672594521.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594521.git.steve@sakoman.com>
References: <cover.1672594521.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175213

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Currently, allyesconfig test runs for x86_64 fail with:
ERROR: linux-yocto-5.19.17+gitAUTOINC+0cba9aa404_aaf4490d18-r0 do_package:
QA Issue: linux-yocto: Files/directories were installed but not shipped in any
package:
  /lib/modules/5.19.17/kernel/drivers/nvdimm

With CONFIG_NVDIMM_TEST_BUILD=m, an empty nvdimm directory is created during
modules_install, which triggers the QA issue.

Extend kernel_do_install() to also remove inner empty directories that might
get created by modules_install.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 7120b09a33af4c9a18063c0f2e51fb598697e39c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3e7264fb98..54b006550d 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -444,8 +444,8 @@ kernel_do_install() {
 		oe_runmake DEPMOD=echo MODLIB=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${nonarch_base_libdir}/firmware modules_install
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
 		rm "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
-		# If the kernel/ directory is empty remove it to prevent QA issues
-		rmdir --ignore-fail-on-non-empty "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel"
+		# Remove empty module directories to prevent QA issues
+		find "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type d -empty -delete
 	else
 		bbnote "no modules to install"
 	fi
-- 
2.25.1


