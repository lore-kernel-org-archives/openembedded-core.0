Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FB4C55165
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 22:17:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.945.1785449845537044802
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 15:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=b7ipS+rh;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso113618f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785449843; x=1786054643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80og3dMiaIIfWBRPJkN6VGAu17CtNlJH3GK1TRy6u2c=;
        b=b7ipS+rhdAFDAD31uF8HjDGYpFbPizad8jxMN2mhZC2c8YE+TVoII/goWykf/JM9I7
         LxE8uSvNTbwvAJVG1hTlDxjgqWSkYHUFyNk7HhJs1g+YA5pB/XClW0/USb+RdpSMPv2U
         NVmBT3LkZEG4leR9Y5OHCKgIvrBMpB0iwzzDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785449843; x=1786054643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80og3dMiaIIfWBRPJkN6VGAu17CtNlJH3GK1TRy6u2c=;
        b=OYONTV+MTADo16nqAvj8JQ0DYaCE/UJThY+/na5tc88Mfs2lPny6nEzaX+RlaqPXP1
         7eXTU48WXHFrfJG3R2IYbAdy4Z9vobfRcYrxLvRKb/ttaE3ieto0iOFO7gMFNwMkNkxQ
         GpKiSIDvY57DsAj+cKNgyKK6Hr0HZEYQ5hJMA1CayJMXm0myG+mp4SdcB80geGxw/OSK
         yiQhLAZoMviUyjSmz/FqWgQLUCsoIizs9y5jyN3X/NAXaj8tH5/nr+Z3z/7zZ5zVt6L8
         VoBMVraY0/tt+iqWIiTZVY5TEQ7I2ssbV/0PL/AxPiIEYVpfwXgS6APC93PS19/uiFQ7
         pLyA==
X-Gm-Message-State: AOJu0YylwYnv33J5hUpc2VspB1qL9a/mXT3dSyz10PxUe726Ueodbieq
	p8O/OkR/XGa84pk+4XoC42Ze9Kq7dTJKZaloR94dynlKoJLeJqOvkCVAMN8Ry4zeaW0cWd+LIBW
	PqjNB4gc=
X-Gm-Gg: AR+sD13iDFYvrwt062UutXZRcTF9QiW5HSCl2uw769kwQXdurpeblLmbKW/029q0Ncd
	5ApKQRn9aErhFz9txSUXYxmbK8GZnJmDlYXMCVCnfcpOXrwy049w8uzmYKelScV3nEUnyKVXueV
	rWc2CQhXizOFpXdbe8Bqb5OfA6HLA1mxAT7bRHc4NGcxu0VU5wjWC2gztp/Uw6HA1m9AK7v50iL
	r6blDaZhlE7cmfiq7XTpcIfC4KARx2DfUuxX9Y7qZHuIdl3+iaIxo4qnFFgcoiIrYyNm8EoLljL
	yQogKtQQ5C6CQjk/KPcf+vnMV92LTSeoLwVTPhNXvfF8m5m3ScqemxD+bLVt6uVthDDkTUlzGEG
	lQyRWme3ep3K7wb1GjWHCJHrrMFNJhFLqH+lAdhHU3DfRVdMFVSw5CdlAN5YXOtIzKSeZbd4MCl
	sY9ve0lNMTboojQkEthuf1XiBWmmAeVyBfKdG2+Cj3VVb4ZVkMqkxLmm9TABwrJ3NgtT5SWBQtF
	MfGZmEaV8M0qtMTkx0iFXUIhQQtTnpJlRzWxdtbOqkFPFqo+f/fK1wHmTZI9jZC+w==
X-Received: by 2002:a05:600c:5486:b0:495:6788:c21b with SMTP id 5b1f17b1804b1-49800eb1b08mr63585975e9.27.1785449843515;
        Thu, 30 Jul 2026 15:17:23 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00dd417ef569a828a8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dd41:7ef5:69a8:28a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aade3sm97820295e9.14.2026.07.30.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:17:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-core ML <openembedded-core@lists.openembedded.org>
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] selftest: uboot: remove duplicated KVM presence test
Date: Fri, 31 Jul 2026 00:16:59 +0200
Message-ID: <20260730221700.130855-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 22:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242380

From: Yoann Congal <yoann.congal@smile.fr>

test_boot_uboot_kvm_to_full_target test, needs a working KVM.
It checked it with the kvm-ok tool but that tool is not documented as a
requirement. Also, the check is also done by runqemu called later in the
test.

Remove it from the test and let runqemu have the responsibility of
checking for KVM.

Note that the KVM check now happens *after* the image build instead of
before it.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/uboot.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
index 2e4530fddda..847fa205a13 100644
--- a/meta/lib/oeqa/selftest/cases/uboot.py
+++ b/meta/lib/oeqa/selftest/cases/uboot.py
@@ -9,7 +9,7 @@ import os
 import textwrap
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars, runCmd
+from oeqa.utils.commands import bitbake, runqemu, get_bb_var, get_bb_vars
 from oeqa.core.decorator.data import skipIfNotArch, skipIfNotBuildArch
 from oeqa.core.decorator import OETestTag
 
@@ -51,11 +51,9 @@ QEMU_USE_KVM = "False"
     def test_boot_uboot_kvm_to_full_target(self):
         """
         Tests building u-boot and booting it with QEMU and KVM.
-        Requires working KVM on build host. See "kvm-ok" output.
+        Requires working KVM on build host.
         """
 
-        runCmd("kvm-ok")
-
         image = "core-image-minimal"
         vars = get_bb_vars(['HOST_ARCH', 'BUILD_ARCH'], image)
         host_arch = vars['HOST_ARCH']

