Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB4AC4167D
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:27 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web12.5853.1651048823508880251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MIO79i97;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id p18so1086654edr.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YEuOB7ogfRJsSEaV/GCCIiSRGkrpxhfaq1V0JPSes/Q=;
        b=MIO79i97Ze6irKjfr68E2JFtxOFOvxzNJtaY+ECXOAN5BcDSi2qgfu+uK4LIszYAC5
         enwiUs4TUlFINm8dBTRc4N+J2OT/me1htGZ154L99/kNrAl83AhM8ikAmN3vxog1e4mm
         nuH5TQv0ytOM00FYqOCtKbXhuaVEkcUcm+rPjhXr4bszdL6ahd6PEQj6G5QzPv1xsW2g
         HMs228D35x85P9PlSIvJ+6r0oZ1yd1+nz/WEmXFCBiH8+dwUQl9zc2h7ah3/h/W+wWwp
         dNPZ+I8HnZ/0+XYHDtEjBy7oy1BGC3HgWoYUIodYbnF0eYaMQxLX2vcLL1Y4VLoFRsWD
         XC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YEuOB7ogfRJsSEaV/GCCIiSRGkrpxhfaq1V0JPSes/Q=;
        b=4DOezZIWegTDqIcBQuM8ambc3T4obNutS2mtPyOYtbj0KubB2tgVOs8HhdX9/QPy4n
         mC5mYLt4RVDu8ne2pd0gBYe7j6PhONOq01EmYnAOSNiBt8VFtt2fDrylxnpxmmuk31KM
         BJ+/wnKQt6FU9TLJdRYHKQHbwHU5zuYUkKyGcfAzwv3yByWs5k3eRRdrbRJ/wuweqmAD
         DStJ1adZZzCEC7KeARo3WpwkpWihluEfOmQk4tvYGsE81LrtDSNPK9iEpfM+TTsXXKVm
         TWNKn7cSgFL9NiSvUigqy02WZ2Kw88503bMdiR49LEp2coJhUWntfcvHwb1sJc749BVR
         6mrg==
X-Gm-Message-State: AOAM53138lKHlNuDcQWn2ZMJ3tv9/iAq3VGaVJkUrsLTIIt6Jq8V1A2i
	dM4ap9ds6tIkVhqPl8Ag4suFTiEJppE=
X-Google-Smtp-Source: 
 ABdhPJwXm6Sw4d+cyLTE65Ov+Yh6ptJ16oySwK8qHsuvqRFIfr/zpOOK/CAiEZ7l5OtajWcxhLq/xg==
X-Received: by 2002:a05:6402:e9f:b0:41c:df21:b113 with SMTP id
 h31-20020a0564020e9f00b0041cdf21b113mr29493315eda.217.1651048822042;
        Wed, 27 Apr 2022 01:40:22 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:21 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/18] llvm: update 14.0.0 -> 14.0.1
Date: Wed, 27 Apr 2022 10:40:02 +0200
Message-Id: <20220427084009.3406717-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164902

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-devtools/llvm/llvm_git.bb      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2200af5b60..3f28514554 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -26,7 +26,7 @@ QEMUVERSION ?= "6.2%"
 GOVERSION ?= "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
-LLVMVERSION ?= "14.0.0"
+LLVMVERSION ?= "14.0.1"
 RUSTVERSION ?= "1.59%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index e10348a7f2..53ae1abd57 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,14 +19,14 @@ inherit cmake pkgconfig
 
 PROVIDES += "llvm${PV}"
 
-PV = "14.0.0"
+PV = "14.0.1"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "329fda39c507e8740978d10458451dcdb21563be"
+SRCREV = "c62053979489ccb002efe411c3af059addcb5d7d"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-- 
2.30.2


