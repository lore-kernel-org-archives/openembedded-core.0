Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF85C433F5
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:34 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.6284.1639137033648532394
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kUacBQVp;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id i5so14507898wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tom0WCrscSxhltcd5si/W/BP0pbyWIJrwfiDNe+10wQ=;
        b=kUacBQVpFPYwujOKTGDCDwr5hpRJbhHdiufDdv3J2QevZlHs7HfmH29cViOADCYZ11
         pDoErRpJhK9b1GLLLOb/o9/pl+tJ+tGTOd4wiLiKCPheJxF3Mmy8/DCnZxxqWnock39V
         QHsVKJpC0rG8WSCo1wRSXrE9P7AQAb2UatkI2ysmogcc+VIviGg0WPJHK9nGOHhXyV5S
         +CWCOhWv1z+RcCt3ALyTGoft3kD0H4Dt9rwnUNmLoVEoqJf5qXGKy9JuMdUn1kGa+DGR
         uYvyxu2MXD0ntDplL0u32MapNSBI+CsCSUCHmfXtEMNslr36Jy7yautzYCrtnvDPZmZ6
         Acdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tom0WCrscSxhltcd5si/W/BP0pbyWIJrwfiDNe+10wQ=;
        b=1rTKme9I8lBY5ENfQbSqJPhiLYXoGtXfmy8E5d1nlEaub4YRNf8ErfhqAGo8gn2qVj
         A9GMQOW/lOZuYGz387Nm1AKpAIn1xfeyf75UKy7l2c5g6XxmoYLX+IIdNPNffVEYz7st
         tKD9cqC2VkMSuFWQtl1Y3b3IHHhDrpsaDASW02AM6rAuV4NjyG5RNQ8xFQ+g0KwKNXwQ
         jBjkuKlak1ngryi476AJpp+rwGdEsm2r9I9RfGnb0LayqkbAGh1VGalQoPAmQ6AnQpj5
         XLephdO9z8Nbt7HJ6Q9cg0QlFlAVw9yXKAZj88EpaOmWTnQDIU8rultiKoTV4HX2ZZV+
         k57A==
X-Gm-Message-State: AOAM531I/ny4c+QjOh544eG34/EO6SDchTTGrSoJv/P4iJlCYwCM2gXF
	xLCMyC8hC1KEjkqlRqCIqvwoXIEpC+nh0A==
X-Google-Smtp-Source: 
 ABdhPJx5rsesWSTvDm1rmTAyLGve5j+QgtbPVmOo3cZfmS0ANATfqf5T3/S2/+UAV8hFwhUwRi1FlQ==
X-Received: by 2002:a5d:4575:: with SMTP id
 a21mr13910223wrc.193.1639137031805;
        Fri, 10 Dec 2021 03:50:31 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:31 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] files: add preinit.sh.in
Date: Fri, 10 Dec 2021 12:50:20 +0100
Message-Id: 
 <375fb52dba5ec14ef42748139ea90fabaee87131.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159499

A template init script for overlayfs-etc class

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta/files/preinit.sh.in | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta/files/preinit.sh.in

diff --git a/meta/files/preinit.sh.in b/meta/files/preinit.sh.in
new file mode 100644
index 0000000000..2ebb6c9224
--- /dev/null
+++ b/meta/files/preinit.sh.in
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


