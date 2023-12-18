Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1326FC35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 22:23:54 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.4033.1702938233116137270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 14:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BOit4tB1;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-203afd69ba6so1349965fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702938231; x=1703543031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3jO+BQRsNHNmNWiWPSH2rOg0+eyeZoLb8wErdcEkzFU=;
        b=BOit4tB1M1tfrmpETSf+8GUSROlscCSDAaDbM7yailwU4wTO7Bpwqh5DEq4Fk04yYa
         TbwSPsfZYB0Y2QYBdehruHxLkfxF/jVmUw7LjuBPgxUK3uj1UOpjoPpTRCvWrvkZSjtN
         kgxGEbUWEYP9pmzEu4Ksuw2Btr4kjF1QWCwCES/baicQtohWTyzGPczUtzYAaiueQs6X
         2G8vw0p3eh1AkSFzd+Dvs+kxwR/BmVk3FmfgX4s+VBSndL3+s32lrmPSLik7Xq5pUFau
         lzlzxMR56u9YLTYFDw88j3cU3Bnl/ghNYMQXI08k3Q17bYKZftSScOk5dWFq37CKOzaB
         V5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702938231; x=1703543031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jO+BQRsNHNmNWiWPSH2rOg0+eyeZoLb8wErdcEkzFU=;
        b=sp4VqF9B2FKxDTfo0MmEvtSvWifR5C0+NfmwSP6jIdpgHS7RFNBIIYTB1O26lESwZH
         NCqB5VrQrcWl6NBCQmfgqYxs3ZxmgYWoSRhSsLbEnZQ4L3PsSV/UHE3d7mqWEkpDGr1E
         TBJiUcOXj/VTJSdLBkDEu6etJf8u/RnSRT8DhvWZHZhWzFFlB2TqklPd20sMdQ6U+oO+
         msT/uMH2l2oMdPPEoYlfv82HxVne80vuTS5gIeZvc5aMT1kv1Kb9mpBpaNs41i2uTVtR
         RK9hcxBIgWQhIarfB6SQZ3hQegAZxRlRbY+uM4BHxVNThoMjhOjJYY4arC28Cksm0r2N
         R/sg==
X-Gm-Message-State: AOJu0YzTHB3nnCHXcit7vzuCWTTrPiG4+fXTvFx0AQPetEJjAv0peE8t
	CCkYW++txL/05tmITgEbC1/SqEeYE+k=
X-Google-Smtp-Source: AGHT+IEqeXUIB9FFlWhMs6iD9EnkvoOjfNZrlaVTH+DhEgvWuSWIE5s+kSK0MC6PwLmCAYl98f35ig==
X-Received: by 2002:a05:6870:b28d:b0:1fb:75b:12eb with SMTP id c13-20020a056870b28d00b001fb075b12ebmr19454055oao.61.1702938231366;
        Mon, 18 Dec 2023 14:23:51 -0800 (PST)
Received: from localhost.localdomain ([2601:282:4300:19e0::35cb])
        by smtp.gmail.com with ESMTPSA id u14-20020a056830118e00b006d9a08c18fbsm4954042otq.43.2023.12.18.14.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 14:23:50 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] libinput: Add packageconfig for tests
Date: Mon, 18 Dec 2023 15:23:48 -0700
Message-Id: <20231218222348.4174140-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 22:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192678

Add packageconfig to control if tests are installed or not. Doing this
allows the libcheck dependency to be optional. The packageconfig
defaults to having tests enabled when PTEST_ENABLED == 1 to match the
previous behavior

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-graphics/wayland/libinput_1.24.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.24.0.bb b/meta/recipes-graphics/wayland/libinput_1.24.0.bb
index 49a1da2b22c..26ab1adaea0 100644
--- a/meta/recipes-graphics/wayland/libinput_1.24.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.24.0.bb
@@ -10,7 +10,7 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
-DEPENDS = "libevdev udev mtdev libcheck"
+DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
@@ -30,15 +30,15 @@ do_configure:append() {
     fi
 }
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true,-Dlibwacom=false,libwacom"
 PACKAGECONFIG[gui] = "-Ddebug-gui=true,-Ddebug-gui=false,cairo gtk+3"
+PACKAGECONFIG[tests] = "-Dtests=true -Dinstall-tests=true,-Dtests=false -Dinstall-tests=false,libcheck"
 
 UDEVDIR = "`pkg-config --variable=udevdir udev`"
 
 EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} \
                   -Ddocumentation=false \
-                  ${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtests=true -Dinstall-tests=true', '-Dtests=false -Dinstall-tests=false', d)} \
                   -Dzshcompletiondir=no"
 
 # package name changed in 1.8.1 upgrade: make sure package upgrades work
-- 
2.34.1


