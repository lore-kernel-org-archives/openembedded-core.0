Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739BDC3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 21:42:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.8064.1742938922724565455
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 14:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFXmAGFl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso60538845e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 14:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742938921; x=1743543721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KV5dUU5CVKd4N4V08uGG3V2Zcx7+hkdknKz53f0IxPk=;
        b=MFXmAGFllgaabEB5AfU5ztrhJpsKWpOO8sdYkbSq2T4JXFoNw7Z1zc8Ch2wsZjZi/n
         e4oO14l5D3rTXv3Zrwuoyi1sq3OPtg10uZyXLHWZP94HxDr3hRVLv1pZnIgzaWsSsrau
         7+K1z02/sq166iJmkDGvQAyTKohXN04j3Q5JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742938921; x=1743543721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KV5dUU5CVKd4N4V08uGG3V2Zcx7+hkdknKz53f0IxPk=;
        b=GMLgxRhkfLNnoYdPNSRqCbr5ETfEWwIokCSE+kzyyvac/xlzNJvuNFHVAT+VG0GP2r
         D+QrTGBK+fF3eY10MGlOEL9iJS4XyRFi5WOSNnWGtyLV6XMKjHzD9Phk1pRfhFLVjx0X
         Z0Akp3zxsMf/EN6xjnceJoIuv4Vjx3dmR/VCqo9pbeehT1yeJE6T52JjuxBluLbwowkT
         SNCsBpxdw/6B4v1Nnm0WL7lCO1c/0YQsdlUQNVHSNOvTtoEe92WGhdaWxErw0WY/kiZC
         UUoYwRwk+lPkqpJnSKs1VKgWiPxsGHQUpqDSRnc6zT2lV/SvCbDtmDgCdeWEXApySmCk
         33aQ==
X-Gm-Message-State: AOJu0YwI9bZ5OEFs4/yWYeMDBzwTP2iOKVvrVSutVbsoX7hJM1WJSu9u
	P8NU1YousQ05gCL2bxUHGpFj+f613Vs5RHrzfGdVaP/ScRueMB4nVkO1jyw+Iy7uKj1ZPdBcFK2
	3
X-Gm-Gg: ASbGncsXuNbhVez4EE+5rRPiefdOQsvLjIsQRyVCry7a5EOB/BimretygJORgjptAHg
	5TOu+ifAJ7vfBez+lsBrDe/IkhNgdV3/GrF213BogSlNyrJN37a0cgBtPkicPp3uhsJgn1Oc6aC
	1He+jbs7gbNpyz1x3CAt7nZGQpzdTgzZv2BK4KygnYNmZLuRp9VUfcJgODImrgss0favGwY/8kl
	6tJ0euWHMdVY4zw2X7XUYkXIrXHixDoV8GplKx1c3hxAVYehUFjpW+dm2q2sQc2ivzVVCa+3zq/
	AhXxFKzy1wV3AeN2AlC97Zs+tMrkqdaOQ6I5iSxtjeeGt2NEs+M7ImZHtSlhieEe0i++TmAEaA=
	=
X-Google-Smtp-Source: AGHT+IHC/Eht7eroA9Cd4ItabEdzmN7B40JSn8JfkBf/KyQ+S2+R5TFDBcVVFwTcOgICRhzTj8lXiA==
X-Received: by 2002:a05:600c:46c3:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-43d5e6fc3b6mr97756745e9.29.1742938920453;
        Tue, 25 Mar 2025 14:42:00 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:367a:5014:d4b0:4e9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995423sm14628537f8f.20.2025.03.25.14.41.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 14:41:59 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] meta/conf: Start to populate autobuilder config fragments
Date: Tue, 25 Mar 2025 21:41:58 +0000
Message-ID: <20250325214158.641463-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 21:42:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213619

This populates the fragments directory with:

a) the default set of variables used in all autobuilder builds
b) the default resource related variables used in all autobuilder builds
c) three different multilib test configurations used by the autobuilder

The aim here is to start to make some of the autobuilder configuration more
visable and patchable by users, and to allow some test confiturations to
be user selectable if appropriate and needed for debugging.

The main aautobuilder fragment is probably not directly reusable by most
users, it contains the resource limits as used on the autobuilder itself. I
can see arguments both way for whether this should be included in OE-Core or not
but having an example of how we configure this is probably useful.

Not all configuration in the autobuilder is being moved, this set of variables
is just a basic starting point. Some variables may ultimately make more sense
being migrated elsewhere, perhaps updating the main defaults for poky or nodistro.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../autobuilder-resource-constraints.conf     | 26 +++++++++++++++++++
 .../yocto-autobuilder/autobuilder.conf        | 14 ++++++++++
 .../multilib-mips64-n32.conf                  |  8 ++++++
 .../yocto-autobuilder/multilib-x86-lib32.conf |  6 +++++
 .../yocto-autobuilder/multilib-x86-lib64.conf |  6 +++++
 5 files changed, 60 insertions(+)
 create mode 100644 meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
 create mode 100644 meta/conf/fragments/yocto-autobuilder/autobuilder.conf
 create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf
 create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf
 create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf

diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
new file mode 100644
index 00000000000..58cadd92b64
--- /dev/null
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder-resource-constraints.conf
@@ -0,0 +1,26 @@
+BB_CONF_FRAGMENT_SUMMARY = "Resource constraint variables used on the Yocto Projects autobuilder"
+BB_CONF_FRAGMENT_DESCRIPTION = "Resource constraint variables used on the Yocto Projects autobuilder"
+
+BB_NUMBER_THREADS = '16'
+BB_NUMBER_PARSE_THREADS = '16'
+BB_SERVER_TIMEOUT = '60'
+PARALLEL_MAKE = '-j 16 -l 75'
+BB_PRESSURE_MAX_CPU = '20000'
+BB_PRESSURE_MAX_IO = '20000'
+BB_LOADFACTOR_MAX = '1.5'
+XZ_MEMLIMIT = '5%'
+XZ_THREADS = '8'
+ZSTD_THREADS = '8'
+BB_TASK_NICE_LEVEL = '5'
+BB_TASK_NICE_LEVEL:task-testimage = '0'
+BB_TASK_IONICE_LEVEL = '2.7'
+BB_TASK_IONICE_LEVEL:task-testimage = '2.1'
+TEST_QEMUBOOT_TIMEOUT = '1500'
+BB_DISKMON_DIRS ?= 'STOPTASKS,${TMPDIR},1G,100K STOPTASKS,${DL_DIR},1G STOPTASKS,${SSTATE_DIR},1G STOPTASKS,/tmp,100M,30K HALT,${TMPDIR},100M,1K HALT,${DL_DIR},100M HALT,${SSTATE_DIR},100M HALT,/tmp,10M,1K'
+RUNQEMU_TMPFS_DIR = '/home/pokybuild/tmp'
+BB_HEARTBEAT_EVENT ?= '60'
+BB_LOG_HOST_STAT_ON_INTERVAL = '1'
+BB_LOG_HOST_STAT_CMDS_INTERVAL = 'oe-time-dd-test.sh -c 100 -t 3'
+BB_LOG_HOST_STAT_ON_FAILURE = '1'
+BB_LOG_HOST_STAT_CMDS_FAILURE = 'oe-time-dd-test.sh -l'
+
diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
new file mode 100644
index 00000000000..cdccc1390a3
--- /dev/null
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -0,0 +1,14 @@
+BB_CONF_FRAGMENT_SUMMARY = "Default variables used on the Yocto Projects autobuilder builds"
+BB_CONF_FRAGMENT_DESCRIPTION = "Default variables used on the Yocto Projects autobuilder builds"
+
+QEMU_USE_KVM ?= 'True'
+INHERIT += 'report-error'
+PREMIRRORS = ''
+BB_GENERATE_MIRROR_TARBALLS = '1'
+IMAGE_CLASSES += 'testimage'
+SANITY_TESTED_DISTROS = ''
+SDK_EXT_TYPE = 'minimal'
+SDK_INCLUDE_TOOLCHAIN = '1'
+ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
+SDK_TOOLCHAIN_LANGS += 'rust'
+
diff --git a/meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf b/meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf
new file mode 100644
index 00000000000..ec076b59f9f
--- /dev/null
+++ b/meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf
@@ -0,0 +1,8 @@
+BB_CONF_FRAGMENT_SUMMARY = "Enable a MIPS64 triarch multilib"
+BB_CONF_FRAGMENT_DESCRIPTION = "Enable a MIPS64 triarch multilib"
+
+require conf/multilib.conf
+MULTILIBS = 'multilib:lib64 multilib:lib32'
+DEFAULTTUNE = 'mips64-n32'
+DEFAULTTUNE:virtclass-multilib-lib64 = 'mips64'
+DEFAULTTUNE:virtclass-multilib-lib32 = 'mips32r2'
diff --git a/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf
new file mode 100644
index 00000000000..9b0e2578ac9
--- /dev/null
+++ b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf
@@ -0,0 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "Enable an x86 lib32 multilib"
+BB_CONF_FRAGMENT_DESCRIPTION = "Enable an x86 lib32 multilib"
+
+require conf/multilib.conf
+MULTILIBS = 'multilib:lib32'
+DEFAULTTUNE:virtclass-multilib-lib32 = 'x86'
diff --git a/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf
new file mode 100644
index 00000000000..1986b994e4b
--- /dev/null
+++ b/meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf
@@ -0,0 +1,6 @@
+BB_CONF_FRAGMENT_SUMMARY = "Enable an x86 lib64 multilib"
+BB_CONF_FRAGMENT_DESCRIPTION = "Enable an x86 lib64 multilib"
+
+require conf/multilib.conf
+MULTILIBS = 'multilib:lib64'
+DEFAULTTUNE:virtclass-multilib-lib64 = 'x86-64'

