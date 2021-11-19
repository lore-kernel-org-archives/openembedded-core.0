Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C291BC433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 06:15:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.5283.1637302527995285611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YXr5sUbI;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id c4so16147495wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vJTK79rcDMcexnQPOZaVW/ko9GLoSXsAaLOETHEKYUE=;
        b=YXr5sUbIVgi5Fmb4BbbwjzzmzPO+ewJFKT4HL3aeUjQH9sVV7CeJz1En9O3REtbzEq
         gagOtFMsWm+AK7mF71upPG8Blj/LBAf7tfc3rxCerqPoge1flqxRlNjG8GGsN9UwZhdK
         irLJo6FY78FuDOcE3K0dWfHJg5LPMibiKx9PNfywLYR2ZolsswJVR1RSF7oHulRr+bhd
         NYKWgFpHhPnQAWXT9lOJugU18njwiS0r64QIHd8cpdlepA5H1pXLlQNvXmxQG26ttJ34
         hf7Tvr0gVIWeyOJmIqBoCZKciyIBWDdV2aEsVPJ3dCZaKFVs64Z7F/xXl7/ubjKoD9Ev
         WWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vJTK79rcDMcexnQPOZaVW/ko9GLoSXsAaLOETHEKYUE=;
        b=AM1PU/o0KHap5dBtBN1T/CTjcbmqNioWCYQLlTh+c1N/2RIXg+N7V5aSzMuzd99tpN
         nv6E42K681nD50Bfmt82ZV796IbpGZi3ZCXJhc1J+q+lyQLRidRMuws4ieGx+Bm0Mg2l
         xt7uK630KGJ2OBkeHkSOz6DnCpV+j2j6Fijle21VBSpniA3qmJWmYiMMqA1txEuOXNOc
         ZKAMSOY1mxY+nVaL9hSGx+AuI+BnGWjgLLcj68ETsLN063/zSID65a+t4HXLDwbagxHP
         rme0A284HdUNhANu4UkKTpWbAl1d4O61TVDjcHhe4Pr/2PWNbsg+GhlauUXe0gK92Gig
         kmEQ==
X-Gm-Message-State: AOAM531Q2t4uE/c9C0sq9HdtqSTod3PPTLQLPBmR1mHNrlnVlQl/FeL1
	kj0ecVdD8cuEUNwV42QRHpjPmwSIG8t17Q==
X-Google-Smtp-Source: 
 ABdhPJyUTM1/pPHZR/bqzrV72oVdDNfKNx+DxwiLHjHqiqT9jGffxw7YfTi4yo6c/yw5S5TSbHspuA==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr4467539wru.366.1637302526128;
        Thu, 18 Nov 2021 22:15:26 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 z14sm2039249wrp.70.2021.11.18.22.15.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:15:25 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] overlayfs-etc: mount etc as overlayfs
Date: Fri, 19 Nov 2021 07:15:02 +0100
Message-Id: 
 <83e41a0b7b5e1dc41fa89ffb4d3a8105299f7b1c.1637301667.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1637301667.git.uvv.mail@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 06:15:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158493

This class provides an image feature that mounts /etc as an overlayfs
file system. This is an extension for existing overlayfs class, which
doesn't support /etc

Signed-off-by: Alfred Schapansky <alfred.schapansky@avantys.de>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs-etc.bbclass | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 meta/classes/overlayfs-etc.bbclass

diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-etc.bbclass
new file mode 100644
index 0000000000..78caf0211b
--- /dev/null
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -0,0 +1,93 @@
+# Class for setting up /etc in overlayfs
+#
+# In order to have /etc directory in overlayfs a special handling at early boot stage is required
+# The idea is to supply a custom init script that mounts /etc before launching actual init program,
+# because the latter already requires /etc to be mounted
+#
+# The configuration must be machine specific. You should at least set these two variables if you
+# are not happy with default values:
+#   OVERLAYFS_ETC_MOUNT_POINT ?= "/data"
+#   OVERLAYFS_ETC_DEVICE ?= "/dev/mmcblk0p2"
+#
+# To control more mount options you should consider also setting file system type and mount options:
+#   OVERLAYFS_ETC_FSTYPE ?= "ext4"
+#   OVERLAYFS_ETC_MOUNT_OPTIONS ?= "defaults"
+#
+# The class provides two options for /sbin/init generation
+# 1. Default option is to rename original /sbin/init to /sbin/init.orig and place generated init under
+#    original name, i.e. /sbin/init. It has an advantage that you won't need to change any kernel
+#    parameters in order to make it work, but it poses a restriction that package-management can't
+#    be used, becaause updating init manager would remove generated script
+# 2. If you are would like to keep original init as is, you can set
+#    OVERLAYFS_ETC_USE_ORIG_INIT_NAME = "0"
+#    Then generated init will be named /sbin/preinit and you would need to extend you kernel parameters
+#    manually in your bootloader configuration.
+#
+# Regardless which mode you choose, update and migration strategy of configuration files under /etc
+# overlay is out of scope of this class
+
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "overlayfs-etc", "create_overlayfs_etc_preinit;", "", d)}'
+IMAGE_FEATURES_CONFLICTS_overlayfs-etc = "package-management"
+
+OVERLAYFS_ETC_MOUNT_POINT ?= "/data"
+OVERLAYFS_ETC_FSTYPE ?= "ext4"
+OVERLAYFS_ETC_DEVICE ?= "/dev/mmcblk0p2"
+OVERLAYFS_ETC_USE_ORIG_INIT_NAME ?= "1"
+OVERLAYFS_ETC_MOUNT_OPTIONS ?= "defaults"
+
+python create_overlayfs_etc_preinit() {
+    PreinitTemplate = """#!/bin/sh
+
+echo "PREINIT: Start"
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+mount -o remount,rw /
+
+mkdir -p /proc
+mkdir -p /sys
+mkdir -p /run
+mkdir -p /var/run
+
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+
+[ -z "$CONSOLE" ] && CONSOLE="/dev/console"
+
+mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}
+if mount -n -t {OVERLAYFS_ETC_FSTYPE} -o {OVERLAYFS_ETC_MOUNT_OPTIONS} {OVERLAYFS_ETC_DEVICE} {OVERLAYFS_ETC_MOUNT_POINT}
+then
+    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper
+    mkdir -p {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work
+    mount -n -t overlay -o upperdir={OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper,lowerdir=/etc,workdir={OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/work {OVERLAYFS_ETC_MOUNT_POINT}/overlay-etc/upper /etc || echo "PREINIT: Mounting etc-overlay failed!"
+else
+    echo "PREINIT: Mounting </data> failed!"
+fi
+
+echo "PREINIT: done; starting </sbin/init>"
+exec {SBIN_INIT_NAME}
+"""
+
+    useOrigInit = oe.types.boolean(d.getVar('OVERLAYFS_ETC_USE_ORIG_INIT_NAME'))
+    preinitPath = oe.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("base_sbindir"), "preinit")
+    initBaseName = oe.path.join(d.getVar("base_sbindir"), "init")
+    origInitNameSuffix = ".orig"
+
+    args = {
+        'OVERLAYFS_ETC_MOUNT_POINT': d.getVar('OVERLAYFS_ETC_MOUNT_POINT'),
+        'OVERLAYFS_ETC_MOUNT_OPTIONS': d.getVar('OVERLAYFS_ETC_MOUNT_OPTIONS'),
+        'OVERLAYFS_ETC_FSTYPE': d.getVar('OVERLAYFS_ETC_FSTYPE'),
+        'OVERLAYFS_ETC_DEVICE': d.getVar('OVERLAYFS_ETC_DEVICE'),
+        'SBIN_INIT_NAME': initBaseName + origInitNameSuffix if useOrigInit else initBaseName
+    }
+
+    if useOrigInit:
+        # rename original /sbin/init
+        origInit = oe.path.join(d.getVar("IMAGE_ROOTFS"), initBaseName)
+        bb.debug(1, "rootfs path %s, init path %s, test %s" % (d.getVar('IMAGE_ROOTFS'), origInit, d.getVar("IMAGE_ROOTFS")))
+        bb.utils.rename(origInit, origInit + origInitNameSuffix)
+        preinitPath = origInit
+
+    with open(preinitPath, 'w') as f:
+        f.write(PreinitTemplate.format(**args))
+    os.chmod(preinitPath, 0o755)
+}
-- 
2.28.0


