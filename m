Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED09C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:35 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.6286.1639137034290647822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MiZzNaIc;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id q3so14478765wru.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1H7s2iPl5Q0MKvO27Xp6O1+olRjrbFBOpjsIaXBt3Qg=;
        b=MiZzNaIcrOY3u6/rGf35xfmYSiFh8P2bZNHa8PhWixsV3GW7vFQitRuGXILRZsoyZu
         mm89RFM4P/FikKod9DHeJri0aWlbjm+Mtpc93YJSHMQAenBXbOpwsT1nq5sJuuO5yHCX
         YQj1ezkPh8Onq69Bqun+mhVspgiNq/3kkOSEHg1jlXbdrpAT1dXA7EG3brPms1Eidp8K
         T5tTXlQx5273UgDiq2WJ6kg5mLoRVanha9WxPQ+4lj24raotlLI/97HLsFRkb1YNTI4m
         dWa4Lw2SAyQQx9pTquRn/0e/P7gAAax8LGXdZecCXiLlG7Pd3L5HIjOxye0n+CqgT72Y
         DrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1H7s2iPl5Q0MKvO27Xp6O1+olRjrbFBOpjsIaXBt3Qg=;
        b=jOg9VUTTAJRMT+0LIcLT4HuF6BfaEyHK5jZncZ5j/WDS/ARw4Pp3FYLvd6q3qYOcN3
         bJhXyJ9GkKm6UBDCwy51mTXZWckTWepJkciB5MVEXkHfKdwm9wAdkSCAh+LH+jBiOyDY
         GbQNTA6IuIl+jNvco/FtbsvIOcNXJOUAheVUhgG2+UFYFzgf7qV+yHbkyCuBfRbxAx0q
         dT+5CXzXAgHhj0S41gpvR0g3gnotEUxNzL7nMdvWZ4vHTlTpY6g6GY4gxxrZko0x9FEy
         mwfcEWA3atRYf4aQ/KRdetE9Uy7C3r16QnSeoKGIaqa0aoBGLq2WDRPMmlq/sqbXpc2G
         /OFg==
X-Gm-Message-State: AOAM530L/Q4n6CvX3btCeTdO0E3rYn6Jt2HDJeWRPKcfXb9eCaffieMD
	8X2hW7peAAQteq0pyuYx1oN5j4rNQljr9Q==
X-Google-Smtp-Source: 
 ABdhPJyDWakLyh/Qd1q6OVBCI8C0miz+mFhESSHq3E2NGKzDVwpkP48gRyUjUfjgy6MhlQaNjsJAlw==
X-Received: by 2002:a5d:6dc1:: with SMTP id d1mr13222368wrz.282.1639137032547;
        Fri, 10 Dec 2021 03:50:32 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:32 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] overlayfs-etc: mount etc as overlayfs
Date: Fri, 10 Dec 2021 12:50:21 +0100
Message-Id: 
 <28b7b8f434ffa0b4dd43a6cd369097e9b39708fd.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159500

This class provides an image feature that mounts /etc as an overlayfs
file system. This is an extension for existing overlayfs class, which
doesn't support /etc

Signed-off-by: Alfred Schapansky <alfred.schapansky@avantys.de>
Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/classes/overlayfs-etc.bbclass | 76 ++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)
 create mode 100644 meta/classes/overlayfs-etc.bbclass

diff --git a/meta/classes/overlayfs-etc.bbclass b/meta/classes/overlayfs-etc.bbclass
new file mode 100644
index 0000000000..5e89339269
--- /dev/null
+++ b/meta/classes/overlayfs-etc.bbclass
@@ -0,0 +1,76 @@
+# Class for setting up /etc in overlayfs
+#
+# In order to have /etc directory in overlayfs a special handling at early boot stage is required
+# The idea is to supply a custom init script that mounts /etc before launching actual init program,
+# because the latter already requires /etc to be mounted
+#
+# The configuration must be machine specific. You should at least set these three variables:
+#   OVERLAYFS_ETC_MOUNT_POINT ?= "/data"
+#   OVERLAYFS_ETC_FSTYPE ?= "ext4"
+#   OVERLAYFS_ETC_DEVICE ?= "/dev/mmcblk0p2"
+#
+# To control more mount options you should consider setting mount options:
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
+OVERLAYFS_ETC_MOUNT_POINT ??= ""
+OVERLAYFS_ETC_FSTYPE ??= ""
+OVERLAYFS_ETC_DEVICE ??= ""
+OVERLAYFS_ETC_USE_ORIG_INIT_NAME ??= "1"
+OVERLAYFS_ETC_MOUNT_OPTIONS ??= "defaults"
+OVERLAYFS_ETC_INIT_TEMPLATE ??= "${COREBASE}/meta/files/preinit.sh.in"
+
+python create_overlayfs_etc_preinit() {
+    overlayEtcMountPoint = d.getVar("OVERLAYFS_ETC_MOUNT_POINT")
+    overlayEtcFsType = d.getVar("OVERLAYFS_ETC_FSTYPE")
+    overlayEtcDevice = d.getVar("OVERLAYFS_ETC_DEVICE")
+
+    if not overlayEtcMountPoint:
+        bb.fatal("OVERLAYFS_ETC_MOUNT_POINT must be set in your MACHINE configuration")
+    if not overlayEtcDevice:
+        bb.fatal("OVERLAYFS_ETC_DEVICE must be set in your MACHINE configuration")
+    if not overlayEtcFsType:
+        bb.fatal("OVERLAYFS_ETC_FSTYPE should contain a valid file system type on {0}".format(overlayEtcDevice))
+
+    with open(d.getVar("OVERLAYFS_ETC_INIT_TEMPLATE"), "r") as f:
+        PreinitTemplate = f.read()
+
+    useOrigInit = oe.types.boolean(d.getVar('OVERLAYFS_ETC_USE_ORIG_INIT_NAME'))
+    preinitPath = oe.path.join(d.getVar("IMAGE_ROOTFS"), d.getVar("base_sbindir"), "preinit")
+    initBaseName = oe.path.join(d.getVar("base_sbindir"), "init")
+    origInitNameSuffix = ".orig"
+
+    args = {
+        'OVERLAYFS_ETC_MOUNT_POINT': overlayEtcMountPoint,
+        'OVERLAYFS_ETC_MOUNT_OPTIONS': d.getVar('OVERLAYFS_ETC_MOUNT_OPTIONS'),
+        'OVERLAYFS_ETC_FSTYPE': overlayEtcFsType,
+        'OVERLAYFS_ETC_DEVICE': overlayEtcDevice,
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


