Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0189C48BDF
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:42 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.8916.1649758592173336660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FH+qQy9s;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so1303631wmn.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 03:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xQvbJOmmNcbUpjv+Ef9QTWVVtlxU6FhsumDUsjTz34g=;
        b=FH+qQy9slMRIylWtV4dbbSC0+DYMruoQimk44S29fccjDvTTBkYZjbEe1zR9YeFkjY
         WieU/hJg5l2dl9FEL175IBWvNKLGbGQEfWWBb2dItbZmgVFI9UsoZFiyxFj72/udEOj7
         ZF6pbjKqCXiX0HP80TFtmt9vdcnMN4SNQpZIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xQvbJOmmNcbUpjv+Ef9QTWVVtlxU6FhsumDUsjTz34g=;
        b=BhIZS7y+pAKwMOjhZqkUZBkPFe+cuheH56wrwlGW6e96k6wruimg11/Szdk5m7Q3bB
         c5Mnz9XzU/wVXfbWFXoFVpfTFqVRCMzadFPHgur5K1Q3bxu70LjiERg1CWot0rI50A6C
         RUpWxG63Yfv0TDoxgOqWJG+VRYt8cY/K/+352M6WZ66ji81YcOuEdmKcgdJmDLCSbiZV
         /XfhwW94h74VIoT26+Xd4MzRi7LF9NbkCU5edqSTUlLtTNDJYYmz4IOZBrC2K46W4jOd
         Fx8Je+BYkkr52caJf4mxaoQG1u4/bwd80reAvwYCyLcitJNTMT6XIsGFlLwbBMUUlEvY
         +0TA==
X-Gm-Message-State: AOAM530/5MPazpdZVL09pAps4pfz4RR3M3r5Dak3mQIa6+ibbjz1GcrT
	0tQoGiZnByvfddkQ17drCbCwXVHLdqGHrg==
X-Google-Smtp-Source: 
 ABdhPJy2FeFrSCQlr8PT+g141KXLsTYKMR9XdMKlnDJ6r7x54ETcXlwQJBknamngg14AYjNzIxDffw==
X-Received: by 2002:a05:600c:19c8:b0:38e:a5cb:f144 with SMTP id
 u8-20020a05600c19c800b0038ea5cbf144mr3382049wmq.110.1649758590117;
        Tue, 12 Apr 2022 03:16:30 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:b168:4a11:27d6:cd01])
        by smtp.gmail.com with ESMTPSA id
 bi7-20020a05600c3d8700b0038eb78569aasm1886532wmb.20.2022.04.12.03.16.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 03:16:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qemu: Add fix for CVE-2022-1050
Date: Tue, 12 Apr 2022 11:16:27 +0100
Message-Id: <20220412101628.2122117-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164260

Add a fix queued upstream for the issue in this CVE:

"""
Guest driver might execute HW commands when shared buffers are not yet
allocated.
This might happen on purpose (malicious guest) or because some other
guest/host address mapping.
We need to protect againts such case.
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc          |  1 +
 meta/recipes-devtools/qemu/qemu/pvrdma.patch | 45 ++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/pvrdma.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9f2fa4322e9..4e94c4b2bf4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0001-vhost-vsock-detach-the-virqueue-element-in-case-of-e.patch \
            file://0002-virtio-net-fix-map-leaking-on-error-during-receive.patch \
+           file://pvrdma.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/pvrdma.patch b/meta/recipes-devtools/qemu/qemu/pvrdma.patch
new file mode 100644
index 00000000000..7b0335b1dc9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/pvrdma.patch
@@ -0,0 +1,45 @@
+hw/pvrdma: Protect against buggy or malicious guest driver
+
+Guest driver might execute HW commands when shared buffers are not yet
+allocated.
+This might happen on purpose (malicious guest) or because some other
+guest/host address mapping.
+We need to protect againts such case.
+
+Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+
+CVE: CVE-2022-1050
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05197.html]
+
+Index: qemu-6.2.0/hw/rdma/vmw/pvrdma_cmd.c
+===================================================================
+--- qemu-6.2.0.orig/hw/rdma/vmw/pvrdma_cmd.c
++++ qemu-6.2.0/hw/rdma/vmw/pvrdma_cmd.c
+@@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
+ 
+     dsr_info = &dev->dsr_info;
+ 
++    if (!dsr_info->dsr) {
++            /* Buggy or malicious guest driver */
++            rdma_error_report("Exec command without dsr, req or rsp buffers");
++            goto out;
++    }
++
+     if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
+                       sizeof(struct cmd_handler)) {
+         rdma_error_report("Unsupported command");
+Index: qemu-6.2.0/hw/rdma/vmw/pvrdma_main.c
+===================================================================
+--- qemu-6.2.0.orig/hw/rdma/vmw/pvrdma_main.c
++++ qemu-6.2.0/hw/rdma/vmw/pvrdma_main.c
+@@ -249,7 +249,8 @@ static void init_dsr_dev_caps(PVRDMADev
+ {
+     struct pvrdma_device_shared_region *dsr;
+ 
+-    if (dev->dsr_info.dsr == NULL) {
++    if (!dev->dsr_info.dsr) {
++        /* Buggy or malicious guest driver */
+         rdma_error_report("Can't initialized DSR");
+         return;
+     }
-- 
2.32.0


