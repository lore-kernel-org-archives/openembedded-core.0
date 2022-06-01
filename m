Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F12C43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 19:31:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.2342.1654111868574462540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 12:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q/6hG0Oi;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id r129so1498529wmr.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 12:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ltZxNUfXpVRzirpa92AjP7amu4SVmpa0t7h/NUUbpco=;
        b=Q/6hG0OixuMzYagcLzXpzspk2yeTuu+GhjRPgFdHDHbg/qp9tRmdK7OAk3Rcdmb3Gu
         9DyyFnGFvjVQ5lRVUWTVX9KCqKxoImpYUUysy8QHLksQWBfpNQ0BRTzF4gJgZ8IDwZxA
         KHxXz5xF81wMqqklwqYDFkqZqZ3fzFNPT8MpZ/8avu7/I9Df7IK7yeRe1x/VW48SOG24
         YmQsakIXVaAZPTpTBDZ88aFop+TgZvhQbd/Z9GIpm+7cvpdFpcLDGDihPBl0Ej08M0az
         NDB03PCdHlvtbLTQgf+SVlT+VZHCBR+cz/t0K6sjybmOIgsYYsvW+5+F36me5mRsmkAW
         3/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ltZxNUfXpVRzirpa92AjP7amu4SVmpa0t7h/NUUbpco=;
        b=oQagprV3SlrMbpzU/CPJh5ytgN/e1BSB4zfhmA1ecg/KbRidd7sLf27e0ymwtN5kBm
         5smg1/THnYuuil69CRvYHZN7WN1Zaw+ColMn4YT/jHYIyvXih/nq0gkmkGbbjT1PPdEL
         az7i6YyftDZRGqgH/9WaOl3yXzx7zKKf/9u2qHhYRqTwCQ7rF5L/NFAXrMUVzLaAHyc8
         0kUEV0ppGieqbTvM6tFlU1PKfbcJeNTe6z+nq+A76/OTnj8hLyvNpyhIaS/5h9QgG+k6
         Hzn6+scSGVf7+prhklodruJrTGZgbZKg8ODhZsiraZ0+9yZVMHlgBl06psGOrWEpeOwN
         stWw==
X-Gm-Message-State: AOAM532U8okcjgvSjFTmujtbgsha9fq+31C2bjs8DB3uTNaBm5V7nJoX
	3NWEQH9sZXOZcEEaRwPq3BZZxMhkUiuzgGat
X-Google-Smtp-Source: 
 ABdhPJzeB7Vz+qEufZBOsLnjKWtCFHNeLIlTj4wRieE5nhD+NiQ5eP5iJ7ktQD/WzP7+AbAEaZhi3w==
X-Received: by 2002:a05:600c:501f:b0:397:74e2:caa1 with SMTP id
 n31-20020a05600c501f00b0039774e2caa1mr30143019wmr.89.1654111866539;
        Wed, 01 Jun 2022 12:31:06 -0700 (PDT)
Received: from developer.localdomain
 (dslb-002-205-242-088.002.205.pools.vodafone-ip.de. [2.205.242.88])
        by smtp.gmail.com with ESMTPSA id
 j22-20020a05600c485600b0039756cdc8e1sm2914262wmo.37.2022.06.01.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:31:06 -0700 (PDT)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vyacheslav Yurkov <v.yurkov@precitec.de>
Subject: [PATCH 1/2] files: rootfs-postcommands: move helper commands to
 script
Date: Wed,  1 Jun 2022 21:30:10 +0200
Message-Id: <20220601193011.1172771-1-uvv.mail@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 19:31:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166439

From: Vyacheslav Yurkov <v.yurkov@precitec.de>

OverlayFS systemd helper unit might require more pre-processing
commands. It gets more complicated to embed them in a unit file, because
systemd shell subset is limited and might require additional escaping.
Move the command to a separate script, thus simplifying systemd unit.

Signed-off-by: Vyacheslav Yurkov <v.yurkov@precitec.de>
---
 meta/classes/rootfs-postcommands.bbclass    | 13 ++++++++++++-
 meta/files/overlayfs-create-dirs.service.in |  3 +--
 meta/files/overlayfs-create-dirs.sh         |  8 ++++++++
 3 files changed, 21 insertions(+), 3 deletions(-)
 create mode 100644 meta/files/overlayfs-create-dirs.sh

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index d302c23cf4..3f9fdb602d 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -39,7 +39,7 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check;", "", d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "overlayfs", "overlayfs_qa_check; overlayfs_postprocess;", "", d)}'
 
 inherit image-artifact-names
 
@@ -422,3 +422,14 @@ python overlayfs_qa_check() {
     if not allUnitExist:
         bb.fatal('Not all mount paths and units are installed in the image')
 }
+
+python overlayfs_postprocess() {
+    import shutil
+
+    # install helper script
+    helperScriptName = "overlayfs-create-dirs.sh"
+    helperScriptSource = oe.path.join(d.getVar("COREBASE"), "meta/files", helperScriptName)
+    helperScriptDest = oe.path.join(d.getVar("IMAGE_ROOTFS"), "/usr/sbin/", helperScriptName)
+    shutil.copyfile(helperScriptSource, helperScriptDest)
+    os.chmod(helperScriptDest, 0o755)
+}
diff --git a/meta/files/overlayfs-create-dirs.service.in b/meta/files/overlayfs-create-dirs.service.in
index 61b2b9321b..c949a6dc73 100644
--- a/meta/files/overlayfs-create-dirs.service.in
+++ b/meta/files/overlayfs-create-dirs.service.in
@@ -6,8 +6,7 @@ DefaultDependencies=no
 
 [Service]
 Type=oneshot
-ExecStart=mkdir -p {DATA_MOUNT_POINT}/upper{LOWERDIR}
-ExecStart=mkdir -p {DATA_MOUNT_POINT}/workdir{LOWERDIR}
+ExecStart=/usr/sbin/overlayfs-create-dirs.sh {LOWERDIR} {DATA_MOUNT_POINT}
 RemainAfterExit=true
 StandardOutput=journal
 
diff --git a/meta/files/overlayfs-create-dirs.sh b/meta/files/overlayfs-create-dirs.sh
new file mode 100644
index 0000000000..06c7587a6b
--- /dev/null
+++ b/meta/files/overlayfs-create-dirs.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+# This script is intended to be used sorely by overlayfs-create-dirs.service
+# Usage: overlayfs-create-dirs.sh <LOWERDIR> <DATA_MOUNT_POINT>
+
+lowerdir=$1
+datamountpoint=$2
+mkdir -p ${datamountpoint}/upper${lowerdir}
+mkdir -p ${datamountpoint}/workdir${lowerdir}
-- 
2.30.2


