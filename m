Return-Path: <rogerio.borin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEA3C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 17:07:18 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.128.1748020034015638462
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 10:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hnKRm6Qf;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: rogerio.borin@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7cee9f0af46so2735385a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 10:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748020032; x=1748624832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QgY+yB06Sdr7msKo/qfAi71Lby4I6w7DtQobJ+lYKRQ=;
        b=hnKRm6Qf9c8BaAasQEjR9Hyq77td5QXoOdWxxFgdzSaPsRDLkhGUoT+zDQyZMyDv1g
         qcIbSODGua5OnAKOCRpTbgTvmi9OS1qGwdOjUXrDVkQUXVRMl80V2P6cm7Zvcx9uKHzR
         mLIgmSU2EfCxraPq/uG4GBMh7S39otM/lIUEvIB0cTdsRrMqYELX8XCSxRzomM4GHEFp
         ohHiiBEkMpvYaZImDGPnQeS5cTLDCVUNRx/zvpLHZ0vl+vn1yjTMiJtSP7yPrPiWWNC9
         uR7EA6Il6NSUdYEAgdLeEPj51cumOxKMuhxOuTI0H4oPp8xG1L87SGwa5VzL0EpncgGH
         s9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020032; x=1748624832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgY+yB06Sdr7msKo/qfAi71Lby4I6w7DtQobJ+lYKRQ=;
        b=jk7kWXsnCjRaGRwl60aEY844pZ0LYXl5h1T1kBSnLM/3/5u1LU0TNAkgGU/E9A55h7
         t68HoPQhAAyydQfk/A2NastfJfzSMYSXzZQ4Vbr9ERZtzDOGob/viWDcSw0dFUI8fvCs
         VnsJY7pWjGRO47b/pjXdSWfKRJjVCqogHNPFN3DKedrSb9H5FARupkU4pm90ZrM9qPWL
         019Wm585onh/YSS9Ea4gvcDZLHoWggHjpyFlJ0uWEG1wTWZanypCeSDOU5Mkw3XL89OL
         06KOwJNzw+CpFshhksUpMu73537LfjU+H5bFbyHsKzeyPvZkuQg/dBR0jz08AfGfqiWL
         wmZw==
X-Gm-Message-State: AOJu0YztOOaq6NoTUIaxGWYZyCpRv3Ms0a1TAT9ySWN5Jobp4wFsuORb
	dhxXUcr9zEZs36lEmFPuWZPDN9PN3v7loakbkPoklzDpWQj1G4D2UicX9MonhOuJ
X-Gm-Gg: ASbGncveyoWEYkhXFj6khN9QW/atbMGX4vzHc+TTEiM3cNvDbncZZDH44uBWiZOoXJk
	iRAe+rUCvD3BGJdA46oa2+YitbnnUg6CMZs5Kg8MfZGJJuCm09CNmfKFUGeGmh3e/IFjqudVHLw
	hc892sRudbrouippy/dw0euCXA70REGqRUiVkhvNVG776WgI65pOZg5XFh8gFU9YnYK5cyPkgid
	34b7OWvBUBf9ZhePTB9RG9yGy4speoSnVwpav/clANpxRBh6oqvUTj8Jj/A7oV572LhtPS2JS+C
	anCBCMoAY11upW++1ungx0MuBOqfnkmNR8NteNMHdI9Hocm7KLp0ws0lE8Ek6vBN0v9FL2M=
X-Google-Smtp-Source: AGHT+IEGRQYNLJ3DChM0QaDYp8Q89Z9vTo0JRYx4a16vOZhyo2n4dl0UocixUJwwpX5c6bPLS/njJw==
X-Received: by 2002:a05:620a:410f:b0:7c5:9a6c:b7d3 with SMTP id af79cd13be357-7cee327b513mr529104785a.37.1748020032470;
        Fri, 23 May 2025 10:07:12 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:211:8d94:b225:aaff:fe3c:dc92])
        by smtp.googlemail.com with ESMTPSA id a1e0cc1a2514c-87bec1efc05sm12108430241.22.2025.05.23.10.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:07:11 -0700 (PDT)
From: Rogerio Guerra Borin <rogerio.borin@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Steve Sakoman <steve@sakoman.com>
Cc: Rogerio Guerra Borin <rogerio.borin@toradex.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] u-boot: ensure keys are generated before assembling U-Boot FIT image
Date: Fri, 23 May 2025 14:06:03 -0300
Message-Id: <20250523170603.3705353-1-rogerio.borin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 17:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217216

From: Rogerio Guerra Borin <rogerio.borin@toradex.com>

Add the task dependency:

do_uboot_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

to ensure the kernel FIT image signing keys are available when creating
the U-Boot DTB. This is done only if the signing of the kernel FIT image
is enabled (UBOOT_SIGN_ENABLE="1").

The lack of the dependency causes build errors when executing a build
with no kernel FIT keys initially present in the keys directory. In such
cases one would see an output like this in the Bitbake logs:

Log data follows:
| DEBUG: Executing shell function do_uboot_assemble_fitimage
| Couldn't open RSA private key: '/workdir/build/keys/fit/dev.key': No such file or directory
| Failed to sign 'signature' signature node in 'conf-1' conf node
| FIT description: Kernel Image image with one or more FDT blobs
| ...

This issue was introduced by commit 259bfa86f384 where the dependency
between U-Boot and the kernel was removed (for good reasons). Before
that commit the dependency was set via DEPENDS so that, in terms of
tasks, one had:

u-boot:do_configure -> virtual/kernel:do_populate_sysroot

and the chain leading to the key generation was:

virtual/kernel:do_populate_sysroot -> virtual/kernel:do_install
virtual/kernel:do_install -> virtual/kernel:do_assemble_fitimage
virtual/kernel:do_assemble_fitimage -> virtual/kernel:do_kernel_generate_rsa_keys

With the removal of the first dependency, no more guarantees exist that
the keys would be present when assembling the U-Boot FIT image. That's
the situation we are solving with the present commit.

(From OE-Core rev: 036f20156b3c7d0a8b912e90aa29a9b986106d5a)

Fixes: d7bd9c627661 ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled")
Signed-off-by: Rogerio Guerra Borin <rogerio.borin@toradex.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/uboot-sign.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 5c579a9fb0e..699db248e1e 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -94,6 +94,8 @@ python() {
     sign = d.getVar('UBOOT_SIGN_ENABLE') == '1'
     if d.getVar('UBOOT_FITIMAGE_ENABLE') == '1' or sign:
         d.appendVar('DEPENDS', " u-boot-tools-native dtc-native")
+    if d.getVar('FIT_GENERATE_KEYS') == '1' and sign:
+        d.appendVarFlag('do_uboot_assemble_fitimage', 'depends', ' virtual/kernel:do_kernel_generate_rsa_keys')
 }
 
 concat_dtb() {
-- 
2.34.1


