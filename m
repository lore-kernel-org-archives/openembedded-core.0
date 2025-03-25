Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CD2C36005
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 21:50:12 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.8248.1742939404991006912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 14:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C8MAbIGf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso41765545e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 14:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742939403; x=1743544203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cf6rZ3u4EX+V5jdUIfm6V05sBZxRCgvzDzqw88ZPmnI=;
        b=C8MAbIGfpAbvhBc8cDuiZKSwg20763THlFdRTlu7aIlqq3HINwat59pGYFbaY0zoQY
         IzdRYgNiUVfU6c2TcFuUDqFmwjBcxagdHR9Ifza2be6tccuojahqnl8t4+T/XejVg63n
         pG05kca7SGs/BRqkSMLbiN5Hdnf25JbqNylEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939403; x=1743544203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cf6rZ3u4EX+V5jdUIfm6V05sBZxRCgvzDzqw88ZPmnI=;
        b=WOhwUYl2h/nH7B2D0cYEmVFnVXm/iGiFzZkSX1TDz1HwiG8iUaZ3HabsEjbZ2kG7bm
         FgzcpDR0eYFSuHgE69BOhIOdxTFWON9niuEhufQENu6jBhPQx9gQEKrSQtJmO7I27TgX
         Vh4dG3w+L2YaEK51ZBlev8bPeF9FGptQAMcA8n7vJUw8PjknwJQzE79JlOzEtg+90v4T
         xvUbKBFUa4Oee3SZhr/E+0ezKQgbx+o7oZOSr3cctRx8HkvvWNlhRt8iabaZ/vE2i/l+
         yFr2OSTZSdG4P9FwiamaFDFCG0Z6Vkm5FaJMwmmedyNRfjI2m1ephYZr7xlAJrQNKGt3
         x+Ow==
X-Gm-Message-State: AOJu0Yxsp6eFFaG/gv89nWiMM1M3UPWTELOoYnHJmauDVw5TkFTN6F9I
	GebJky3caJAUhFhbmflFDEBZgLk42xfk8SzynNl/HXlxZhERWL5pr+Kij52oxUCT/TjvwwsEZ/8
	v
X-Gm-Gg: ASbGncuLrjHXpRDS3EVRLMZblrmwCxqdeK3AIffxoF9G9AGPR7Yxgg4PLhNKKLNU2lc
	8AalbZ0PcxqApKX2vzH+oQekd1BAvGnmKgzE0fbVCraUPNYEXAINJGxzwzyATB3bjXtxsqOeurQ
	QAe13ZqcVqM+SROpJ4wqFDmYAsqslsmnvCePhSTvCGj4VAUsSDY8N8sdXs0f/yxC2iaGdQSiZBd
	2OuKr4L2og76zalHlP/AUB/lbrn1GGYf98zrEzE1xev9f/+nYoUsKm/e2vyrsA4IcM1tm/bkf6g
	qVq51wUn6v+MjF9SZoy2JmWJ3Jw679SG35Ijys6hbY83Z6hFLeeCFuh4y2blKAIwOuQUA2Ntqu4
	Ac6z20ETN
X-Google-Smtp-Source: AGHT+IGnAj9i5phfNfWyh+Cz4vU/TJJXdytl39HfOC+r/wpG6UYJHaGWUX2/B7hOiGWNNK4OtR1RvA==
X-Received: by 2002:a05:600c:3ca5:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-43d509e663cmr142382585e9.1.1742939402800;
        Tue, 25 Mar 2025 14:50:02 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:367a:5014:d4b0:4e9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f55750sm216955795e9.21.2025.03.25.14.50.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 14:50:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] meta/conf: Start to populate autobuilder config fragments
Date: Tue, 25 Mar 2025 21:50:01 +0000
Message-ID: <20250325215001.643993-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Mar 2025 21:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213620

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
 .../yocto-autobuilder/autobuilder.conf        | 13 ++++++++++
 .../multilib-mips64-n32.conf                  |  8 ++++++
 .../yocto-autobuilder/multilib-x86-lib32.conf |  6 +++++
 .../yocto-autobuilder/multilib-x86-lib64.conf |  6 +++++
 5 files changed, 59 insertions(+)
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
index 00000000000..e3bac343390
--- /dev/null
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -0,0 +1,13 @@
+BB_CONF_FRAGMENT_SUMMARY = "Default variables used on the Yocto Projects autobuilder builds"
+BB_CONF_FRAGMENT_DESCRIPTION = "Default variables used on the Yocto Projects autobuilder builds"
+
+QEMU_USE_KVM ?= 'True'
+INHERIT += 'report-error'
+PREMIRRORS = ''
+BB_GENERATE_MIRROR_TARBALLS = '1'
+IMAGE_CLASSES += 'testimage'
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

