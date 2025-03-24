Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9BEC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 17:09:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.44658.1742836155558425921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 10:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LkHYSgoY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4429549f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 10:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742836153; x=1743440953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITWuDAYT30pknR5TFWloNT+F6NUeOsk7zYE74mYkZB8=;
        b=LkHYSgoYNGkTzjXP0FPluuDoLuJgmG+g3ytbTwUNOeBfUEgK27N0AHoG1sqSJIoHRw
         vNJ+JrfPHXyG9pS8Y6aOF4HyeQSb8R2PkWTp5iGrYawx9ICRGTdgjzZyYIWdmkdhiTNK
         0h+Ekj9oOrFHBYu+eEr8l6wYMWS8G97cu9h38=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742836153; x=1743440953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITWuDAYT30pknR5TFWloNT+F6NUeOsk7zYE74mYkZB8=;
        b=ZjxhGB+AjzQX4Ur4pZSOD1JGs4H55Uk6TVU3wtuw/OEwjmv5rMtjtOwkiC0qLwrUp+
         CHP9wckh5URFTTPyTD9oXbd/a+kz2xwyMMGxN9fQGRXLIrrQC5jom1U3hJEUqOP8SoUN
         JWwKHtJzWSYR3GcVJSO2M8WZXH1HGbyde0n0s/IvPKInr9FMG546075hIHLmsbPvcpgn
         2MASrA817FA/e8BEt8qeKSNYx/4Od9NdlCpsut7OKZYGxwMYXrCXd1d0zoeCqCpGLVB7
         0pMqTCHzq4pJKB0k/QNSRJ4n0AHzyDFdr5M+8nz/KMfnqdwekK/qVwTJyYTrKU9urvAD
         3EsA==
X-Gm-Message-State: AOJu0YxhdyRcgAFYS0KoV73tm/QGxDSFRjOa+xgF7aU46ssAOmqz7O2R
	tbS8Hp+bC8MxqZxGfKEAheaZMUGSDWogQBSAxI+W/MOSFnLQJtRff94dxbQriHbEiL/u0g42Whg
	W
X-Gm-Gg: ASbGnctLn2zRsjbJ9Kp3tcRwlD+EjfBKZLB9QAbRj77+mZgjQMqJEviItAwP5tBxeGC
	70m8dNb1jdIry827nPwZZOSCmm9ICSWzVg+w68sK014vsErrHxYNsaUdmBKnluuhQIPe/RNz/FG
	yN0h/1U/sQlgF4LVPiUzA7x9gDQIy0Is4zDdKTSUaxNL2FQfx0k0vwz6YvOI3xBODZNt0TABmzO
	MscD1tXRn5bp7jcPMZdzTtNWD2/sjRpNcDUYfKebRWHHXpIV+jQMccWbfUOe0mLJkiKjV0EZb2o
	mIWtG+CIveA2aDp5X1svpNZY44gFyAiC8DFwgXpxPIS7RR9V6KVplCe3arfPkfNc7hPxHnZe6XM
	h8JiDYc0=
X-Google-Smtp-Source: AGHT+IGd/eOvMV/GQqIKNi3oGzcc8tpuwMuM/igkei/yioPbNtcyvCxvMW1k1vAvDhixRRlfvLFxOQ==
X-Received: by 2002:a05:6000:418a:b0:391:3fa7:bf77 with SMTP id ffacd0b85a97d-3997f9148eemr8549543f8f.31.1742836153117;
        Mon, 24 Mar 2025 10:09:13 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24f9:315d:dc7:9e14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6445sm11507402f8f.71.2025.03.24.10.09.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:09:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta/conf: Start to populate autobuilder config fragments
Date: Mon, 24 Mar 2025 17:09:11 +0000
Message-ID: <20250324170911.391159-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 17:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213560

This populates the fragments directory with:

a) the default set of variables used in all autobuilder builds
b) three different multilib test configurations used by the autobuilder

The aim here is to start to make some of the autobuilder configuration more
visable and patchable by users, and to allow some test confiturations to
be user selectable if appropriate and needed for debugging.

The main aautobuilder fragment is probably not directly reusable by most
users, it contains the resource limits as used on the autobuilder itself. I
can see arguments both way for whether this should be included in OE-Core or not
but having an example of how we configure this is probably useful.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../yocto-autobuilder/autobuilder.conf        | 35 +++++++++++++++++++
 .../multilib-mips64-n32.conf                  |  8 +++++
 .../yocto-autobuilder/multilib-x86-lib32.conf |  6 ++++
 .../yocto-autobuilder/multilib-x86-lib64.conf |  6 ++++
 4 files changed, 55 insertions(+)
 create mode 100644 meta/conf/fragments/yocto-autobuilder/autobuilder.conf
 create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-mips64-n32.conf
 create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-x86-lib32.conf
 create mode 100644 meta/conf/fragments/yocto-autobuilder/multilib-x86-lib64.conf

diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
new file mode 100644
index 00000000000..4a7a5f8ef7f
--- /dev/null
+++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
@@ -0,0 +1,35 @@
+BB_CONF_FRAGMENT_SUMMARY = "Default variables used on the Yocto Projects autobuilder builds"
+BB_CONF_FRAGMENT_DESCRIPTION = "Default variables used on the Yocto Projects autobuilder builds"
+
+QEMU_USE_KVM = 'True'
+INHERIT += 'report-error'
+PREMIRRORS = ''
+BB_GENERATE_MIRROR_TARBALLS = '1'
+BB_NUMBER_THREADS = '16'
+BB_NUMBER_PARSE_THREADS = '16'
+PARALLEL_MAKE = '-j 16 -l 75'
+BB_PRESSURE_MAX_CPU = '20000'
+BB_PRESSURE_MAX_IO = '20000'
+XZ_MEMLIMIT = '5%'
+XZ_THREADS = '8'
+ZSTD_THREADS = '8'
+BB_TASK_NICE_LEVEL = '5'
+BB_TASK_NICE_LEVEL:task-testimage = '0'
+BB_TASK_IONICE_LEVEL = '2.7'
+BB_TASK_IONICE_LEVEL:task-testimage = '2.1'
+IMAGE_CLASSES += 'testimage'
+TEST_QEMUBOOT_TIMEOUT = '1500'
+SANITY_TESTED_DISTROS = ''
+SDK_EXT_TYPE = 'minimal'
+SDK_INCLUDE_TOOLCHAIN = '1'
+ESDK_LOCALCONF_REMOVE:append = 'BB_HASHSERVE'
+BB_DISKMON_DIRS ?= 'STOPTASKS,${TMPDIR},1G,100K STOPTASKS,${DL_DIR},1G STOPTASKS,${SSTATE_DIR},1G STOPTASKS,/tmp,100M,30K HALT,${TMPDIR},100M,1K HALT,${DL_DIR},100M HALT,${SSTATE_DIR},100M HALT,/tmp,10M,1K'
+RUNQEMU_TMPFS_DIR = '/home/pokybuild/tmp'
+BB_HEARTBEAT_EVENT ?= '60'
+BB_LOG_HOST_STAT_ON_INTERVAL = '1'
+BB_LOG_HOST_STAT_CMDS_INTERVAL = 'oe-time-dd-test.sh -c 100 -t 3'
+BB_LOG_HOST_STAT_ON_FAILURE = '1'
+BB_LOG_HOST_STAT_CMDS_FAILURE = 'oe-time-dd-test.sh -l'
+SDK_TOOLCHAIN_LANGS += 'rust'
+BB_SERVER_TIMEOUT = '60'
+BB_LOADFACTOR_MAX = '1.5'
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

