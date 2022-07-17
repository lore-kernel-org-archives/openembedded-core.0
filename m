Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410A5CCA480
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 12:57:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web08.15572.1658062626091943937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ROSLUIXH;
 spf=pass (domain: gmail.com, ip: 209.85.167.50,
 mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id z25so15220787lfr.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 05:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vwLbzCTRXdn9A1MmX4C3Aq8R7Yll596udAk7bSBd3/M=;
        b=ROSLUIXHd+K8/7SmtF8G9NV6HS/kWV0cLzl9c+4V/9ruJSiycy+kkG22QtzZbtpIfA
         TLKdAMWVZK/BqYWjw4yCYN0+I3lLMpbFH5hwKwR0cr5OM+EDK6xMgeD+tG8yS+ImyDxp
         019umx2X9a6HbbwH+cSm5urOiugDOjsodAM3THsxURBJrcLcsgCJD8dXz38LmkSaEN9X
         2aO5SEE4TT5zcPLFEdtstGNNfWaayrXGmzFE3T5rhoQUQPhT2Aog8jEzboMq8ttjlIJt
         LzcOWgh5kcp6/s5kBpl+tVJZJnLizKNaB+JLeckznN3ajzocEixzXYj/FAteM8DF9XOA
         Km8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwLbzCTRXdn9A1MmX4C3Aq8R7Yll596udAk7bSBd3/M=;
        b=0CFy3ilYJTTEd2TrDPP8wYgqjmM/cEgYMG0hBt0clF1f17f238pcYGOPbQPQuOWKnr
         8Z02Ezu8EOZOk+KH+qDzZ4m+4DDR1nKUFgNEFSNtD5WwYsRJm+6t7G20iPKjCUVnd1Eo
         yFrerj1g/3nZHqhpFD7/gLWg6goxNIJN2gytEav5G9vyQJTLf7HSr9o0j/+iB47Mnku1
         pg+RGFe3KlcPwvYmtX1w/ue2yqd7CmStLwIk/sCzp6ITimLfiA9KYE/Y87+XVVlIrpAS
         EOzdsnQ3kWFTxEjw+kmGX8HF+mcm4QICMbfyCBc9Qnlj00qsvnHsh8l/GicHss5HkOUd
         fykw==
X-Gm-Message-State: AJIora/25wGCxPWoMF3FMCAEYIdcUyjO7aB3XzLk1kgQMBVTKmeQObWt
	m0kWVPRatv3JdE7KeTcO49G8cV76fVs=
X-Google-Smtp-Source: 
 AGRyM1s6fA89w2XQ5RN9Kk15Zn8cdVK0YriD+Ixb5Wm6xYDOQHKy9LFr3AQqJKRmGR4xTBmUEl4gTw==
X-Received: by 2002:a05:6512:23a3:b0:489:dd50:9b18 with SMTP id
 c35-20020a05651223a300b00489dd509b18mr12082247lfv.341.1658062637364;
        Sun, 17 Jul 2022 05:57:17 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com
 (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05651203ab00b00483e5f01698sm2023056lfp.65.2022.07.17.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:57:16 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ming Liu <liu.ming50@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core] [kirkstone] [PATCH 9/9] udev-extraconf:mount.sh: fix path
 mismatching issues
Date: Sun, 17 Jul 2022 14:56:48 +0200
Message-Id: <20220717125648.2942046-10-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220717125648.2942046-1-liu.ming50@gmail.com>
References: <20220717125648.2942046-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 12:57:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168157

From: Ming Liu <liu.ming50@gmail.com>

Since commit f077befd5f36ad88623aaf6a38b1a837ecb18650:
[ udev-extraconf: let automount base directory configurable ]

the mount base directory was configurable, we need drop 'run-media'
usage as well, change to figure it out from MOUNT_BASE.

Also 'get_label_name' function needs to be called ealier in
automount_systemd before checking '/tmp/.automount-$name', otherwise
they would never match.

(From OE-Core rev: c013b33162546fb5bd4bcc1daac75aa65d0be1a3)

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ed210054b3e253d5a67075bb9d4768d1661bef1)
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 8b6ce77741..43acb3a7a0 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -40,11 +40,14 @@ automount_systemd() {
     name="`basename "$DEVNAME"`"
 
     # Skip already mounted partitions
-    if [ -f /run/systemd/transient/run-media-$name.mount ]; then
+    if [ -f /run/systemd/transient/$(echo $MOUNT_BASE | cut -d '/' -f 2- | sed 's#/#-#g')-*$name.mount ]; then
         logger "mount.sh/automount" "$MOUNT_BASE/$name already mounted"
         return
     fi
 
+    # Get the unique name for mount point
+    get_label_name "${DEVNAME}"
+
     # Only go for auto-mounting when the device has been cleaned up in remove
     # or has not been identified yet
     if [ -e "/tmp/.automount-$name" ]; then
@@ -61,9 +64,6 @@ automount_systemd() {
         grep "^[[:space:]]*$tmp" /etc/fstab && return
     done
 
-    # Get the unique name for mount point
-    get_label_name "${DEVNAME}"
-
     [ -d "$MOUNT_BASE/$name" ] || mkdir -p "$MOUNT_BASE/$name"
 
     MOUNT="$MOUNT -o silent"
-- 
2.25.1


