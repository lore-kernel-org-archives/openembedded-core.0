Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2BECA0FE1
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:37 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.717.1755790830046085519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=APDxkNYY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b471740e488so918183a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790829; x=1756395629; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f30i8ur4h3597xhrfJZeqRNgFYXKdDCsVs7SbVH4W+8=;
        b=APDxkNYYjkQoPDHpuQ8LxEqYZgyECp8clI7/Qasr/gkAiQUiD3uopCxQgbgJSxm8qQ
         1+0ezWd/1of8RLuUOVf8/o0i6eu6/lc7B661stusIi0NrwfGA9o+4ZvPbn+hiXVqbIIh
         ibGUshXk2XM0JSiAiLvrQ5V2QKGpjy1Knvz/n5rGm3qzOieEhuUmHKUWKhc8r/q+x/2r
         8VLvvG1+2wnJHopodGmHv+fI/lwqy/lBUiJaiyMW4RthzT3O5fUm+i+XBcS7aix2Tbxg
         Q8nvjSC3a+q41KNNGCGZ8TIsEctQaMHMhbVfNjywf0f/s+cOcw5HNiJlYTkLgvIEemg7
         vHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790829; x=1756395629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f30i8ur4h3597xhrfJZeqRNgFYXKdDCsVs7SbVH4W+8=;
        b=eSKLtGTGeLTxOSs1pXONFgEvUci9r1HjjdoRKfUDsj/n6a9b57mjdnGg/oFXlOVb9L
         A4RCRATvI1nwKRb30pzhHw7/KaCi706FYQd6PADzuGy+k8kUUSHk54qclIkQhBM8E+j1
         hXMhAOs+qWzJkGIaR8KtLRtzx8b/pj0sN7U3AXO8klp5gIhhu8O+eUY63u83Ob1PYBfD
         iyTfG6HZSSe2rDK5fpFtNFUcr/N09dJFX1Ro4nROqX+0UHOYLtrOE198qM4ol0iFTxLQ
         qQ+c7/xCp8qm2ADhHIT8vJG++7ku+pIT79L5RXbObti21gzqWjBHEsl3yuO/Ydyngeiy
         EK8Q==
X-Gm-Message-State: AOJu0Yzue023waxnFoONood6lhkOhhEiR/rDXzl2fQipMrj9UJvVi+zJ
	GlRa8Eq6ck5ezAbiSCQqGMn3WKmxjPSwXWo+wjxWLQgkVXBg07cPzVkAm2/QywNKSIMvNcbp6t6
	DHhc8
X-Gm-Gg: ASbGnctwhb/WqU+qsQDHO4jyHqDWvHBFeqRvERZz+hGg8oGvAmIWpU1ZQzAk0ZxA6jp
	cYxJ1z8E+gH5X8jc7tXdGieZ/PHl9ohuTt8r16gSCxIM+lUEa/wd/CMLi8TslmHZ49bb6fkLdMa
	Ac+4EX8F7GjSlOxAUZ/MbpcCY1/gevPQviRHcOvEMna1K5FnpqrRs3ULk7LX1jnpfTcZVLpdAHn
	Jr6exkCz0AAkuUYojDiiC/sjFGBIhf+hP6Fi7xL7kG3c3MWYdizOvoRurXxxfzs3x6aaBXzUA43
	Kbv4xOEawmOtW/8wLnugtviDaT4j8WXbLZRYrY+pAtc1PGBWnE5aHrKvC7B0sI+ZA/VNdTOOQda
	xA03PXWpRfW2usQ==
X-Google-Smtp-Source: AGHT+IHEKixM7J2kfDGwn3mXWQvhqM1tiHg37fpKgl9Dbl8tesV8xin+2AOIlj1k3MyRx3dlbSSv6w==
X-Received: by 2002:a17:902:d487:b0:240:38f8:ed05 with SMTP id d9443c01a7336-245fed6924fmr46092675ad.36.1755790829137;
        Thu, 21 Aug 2025 08:40:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 15/15] linux-firmware: fix FILES to drop RDEPENDS on full package
Date: Thu, 21 Aug 2025 08:39:56 -0700
Message-ID: <4b785d2d416944a78bf4c09e85a508ae80e35ca4.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755790385.git.steve@sakoman.com>
References: <cover.1755790385.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222264

From: Patryk Seregiet <patryk.seregiet@gmail.com>

linux-firmware-rtl8723 and linux-firmware-adsp-sst
contain symlinks to files that were previously
packaged only in the main linux-firmware package.
This caused both subpackages to inherit an unintended
RDEPENDS on the full package. This change resolves the
issue by ensuring all required files are correctly
included in their respective subpackages.

Thanks to Peter Kjellerstedt for figuring out the rootcause.

(From OE-Core rev: cf27c7d040e7a5f1bbc60fb36c98686704bd7dc5)

Signed-off-by: Patryk Seregiet <patryk.seregiet@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(master rev: cf27c7d040e7a5f1bbc60fb36c98686704bd7dc5)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20250311.bb               | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
index 675d378376..a4814d80d1 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250311.bb
@@ -1253,6 +1253,7 @@ FILES:${PN}-rtl8723 = " \
 FILES:${PN}-rtl8821 = " \
   ${nonarch_base_libdir}/firmware/rtlwifi/rtl8821*.bin* \
   ${nonarch_base_libdir}/firmware/rtw88/rtw8821*.bin* \
+  ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821*.bin \
 "
 FILES:${PN}-rtl8761 = " \
   ${nonarch_base_libdir}/firmware/rtl_bt/rtl8761*.bin* \
@@ -1756,7 +1757,10 @@ RDEPENDS:${PN}-ice      = "${PN}-ice-license"
 FILES:${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE:${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE:${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-FILES:${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
+FILES:${PN}-adsp-sst              = "\
+    ${nonarch_base_libdir}/firmware/intel/dsp_fw* \
+    ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin \
+"
 RDEPENDS:${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For QAT
-- 
2.43.0


