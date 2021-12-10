Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2019BC433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 13:01:53 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.6756.1639141312532765710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aluOEer1;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id t9so14798644wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 05:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TwbPp4Fb7Ob9Led3y7jnHXxVROuvh5PHVzvG0vCjjYk=;
        b=aluOEer1Ui1cVNyNAnL/QIt1jEeK5oQtK0o2faWS3kXaF34y6J7Yj8jqQ5Ub6UvjR6
         anJ2Mm8Ox2MQA8zCFcnU10MNjRL5ZETY8wB9w1WNUrZuZ1FuLdku+wUvN1wvVMWv6Gk2
         ym2AMJD+c43cZoBzPJmGu/5mIiSVSxqBQ3DnZCdausI4u+y81cQkThr/ChNnAVl01jLd
         wb8/8/rv4v/uPUDlN0N+uuPqiAj/z7A/GuaQENEcbGBtFe+BKbDoHgbXvjHBBKUhntuf
         LBL7u62DPuRGXkfxhijt0ygkD9QJNnFyfhMU+6PpMqEJl/x2OLv7FJr2ypHRGRoGgJRi
         wAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwbPp4Fb7Ob9Led3y7jnHXxVROuvh5PHVzvG0vCjjYk=;
        b=3dPQad5hufaLf3YVSivx1Mzbnh3XI17x6Uqb3YwsocuRtm9MFfvLiu4vFW6o9U6/8D
         TXXWExoye5rvqLJqo3ujjVX5/u7i8AXX5oZ6pk4LspAaFDNNUXEgFYl7ysIIWew5XyjM
         yr2y610Nj1m9Z8d5yj2TpQa7s0hfmUqhYLk8gCKmS8aVmfEFACYBLJsD1kGUyJE3zU5I
         8liKCzLY3XEmjtEbTO8wKRNjPgORWVNoI4RchEWCmJqnh5Vyxi0/4fcfEt5LKezt7Eoo
         vbdfKibo4f4cQXiblxGmXtK57RFRtdHBZCryGVNA2NzR+pwn8yHjb5u0cro53LxUlW26
         SHpw==
X-Gm-Message-State: AOAM5311D5h0UsU3eHEMNPsMdgZF2Hr8C+i1VXOvVNUmn1SC85Pvub+T
	GRIBy/oAMI3OiYJjbSUEBev67JFpczPUgQ==
X-Google-Smtp-Source: 
 ABdhPJwfxKiA2cmTvPS1WmT7Z3jA+jOX3sksMxJDy7zloD8bOOKAATH7wA2S+iBURN2qIEvqbYTBsA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr13859730wrs.237.1639141310423;
        Fri, 10 Dec 2021 05:01:50 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 d2sm2899653wmb.31.2021.12.10.05.01.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 05:01:49 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] files: add overlayfs-etc-preinit.sh.in
Date: Fri, 10 Dec 2021 14:01:38 +0100
Message-Id: 
 <d16f95b60820a8f3b4c12c78fbf0f328bdfd83dc.1639141237.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639141237.git.uvv.mail@gmail.com>
References: <cover.1639141237.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 13:01:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159510

A template init script for overlayfs-etc class

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/files/overlayfs-etc-preinit.sh.in | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/files/overlayfs-etc-preinit.sh.in

diff --git a/meta/files/overlayfs-etc-preinit.sh.in b/meta/files/overlayfs-etc-preinit.sh.in
new file mode 100644
index 0000000000..2ebb6c9224
--- /dev/null
+++ b/meta/files/overlayfs-etc-preinit.sh.in
@@ -0,0 +1,29 @@
+#!/bin/sh
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
-- 
2.28.0


