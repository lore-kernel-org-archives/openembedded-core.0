Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.2627.1629829117675918647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 11:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MQc+rj0l;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id c4so12730368plh.7
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O2s110LSCIBFVEpvvzys74T44AOmsiy0H5rOxBsu7Es=;
        b=MQc+rj0liGdkgDfz8dsi8Elg5EJd+vAegODw14S8WNmSxoj8f/uFrmwDgFAExqchnL
         zsSWpQT8S2MNVdg/VLrcz0mWCRUZWFXwdAs3VqQVAeNQSP3ZoCiu2QiOHj03T1+ARM07
         IX0DPr0YG+YJ8Xp2TuGotxdfzTSgDi1KH3hBSTbyth4y5C2tnqdL8Ml3fBv/ceqklpG3
         xEGuRdBq7VNFtagJw6ds/wbzT5YaZmrGLrxMhKpKaucg3QBLlkbI0WfpMS4Q6aPVpHHw
         YlIBkD3AYSqUQATh8kmI2jAHZa6HYaqCGFHUaLMJr4gjHiGLHCEyUyRcwDzvS9WmI2bY
         U7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O2s110LSCIBFVEpvvzys74T44AOmsiy0H5rOxBsu7Es=;
        b=qhVhs3MKqImB3A2pkZ4IjrM+zH2R848R23p/1ZyFa+8CbmVxwMCqgiuxqfTeWzSYX/
         w7hOGEVIQISmXeBCqB3byFhSNiPrBD+t9yLMatFIVBtbNGlMGqr8Qv8rRCp7aBo2tGQZ
         +MZB4F8KvGp2HwAYGEzd/U9ZiC77hwz1qE28FfgBzsQMDNBYGOzZuveyYVQ5y8dtdfUy
         7XWmVAP5V815Kb4GIMV1uhzBawgOCyJb641/ID6dBA0J//1oUHFq3v9cKDDtYjRsd+qq
         diWKFM8r4MCXb6M6LuuioOwTXG0Q8EOWrJPRy1p2YnWcwE0iV7STGVGhbq6TFiOEPgFn
         C0hw==
X-Gm-Message-State: AOAM533xq+jL5i3FZHn0pPyepQ748ns6/CcH6FHW8VSg+fMTdHjPkDHv
	xIsfAE9Tvk+LdvyWGpLL3z1keXRFa7U=
X-Google-Smtp-Source: ABdhPJyJbMKmTsO+B8/WlpmTE3+UIXojFRFBdzOcZfqD5jugo8LXExfpb9zLk915h6VYWCMVMeWutg==
X-Received: by 2002:a17:902:8d8a:b0:12d:b9b5:b53f with SMTP id v10-20020a1709028d8a00b0012db9b5b53fmr34079477plo.78.1629829117088;
        Tue, 24 Aug 2021 11:18:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:35b6:3d86:f2de:f7d2])
        by smtp.gmail.com with ESMTPSA id g26sm23416734pgb.45.2021.08.24.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 11:18:36 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sakib Sajal <sakib.sajal@windriver.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [Dunfell][PATCH 4/4] qemu: fix CVE-2021-3608
Date: Tue, 24 Aug 2021 11:18:31 -0700
Message-Id: <20210824181831.1045731-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824181831.1045731-1-akuster808@gmail.com>
References: <20210824181831.1045731-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Source: http://git.yoctoproject.org/cgit/poky.git
MR: 112749
Type: Security Fix
Disposition: Backport from http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-devtools/qemu?h=hardknott&id=f5e77d70e2eb35751f5bad5572b6eb8a3ab14422
ChangeID: 4496341da3af9126c9c67170e1a2cce929c29828
Description:

(From OE-Core rev: 5e05ee8ff363eac84edec568039b86bcd716c6ce)

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f5e77d70e2eb35751f5bad5572b6eb8a3ab14422)
[Refreshed patch]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3608.patch             | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6066418a7b..c8c170dda0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -83,6 +83,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3527-2.patch \
            file://CVE-2021-3582.patch \
            file://CVE-2021-3607.patch \
+           file://CVE-2021-3608.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
new file mode 100644
index 0000000000..7055ec3d23
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3608.patch
@@ -0,0 +1,40 @@
+From 66ae37d8cc313f89272e711174a846a229bcdbd3 Mon Sep 17 00:00:00 2001
+From: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+Date: Wed, 30 Jun 2021 14:52:46 +0300
+Subject: [PATCH] pvrdma: Fix the ring init error flow (CVE-2021-3608)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Do not unmap uninitialized dma addresses.
+
+Fixes: CVE-2021-3608
+Reviewed-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Tested-by: VictorV (Kunlun Lab) <vv474172261@gmail.com>
+Signed-off-by: Marcel Apfelbaum <marcel@redhat.com>
+Message-Id: <20210630115246.2178219-1-marcel@redhat.com>
+Tested-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+
+CVE: CVE-2021-3608
+Upstream-Status: Backport [66ae37d8cc313f89272e711174a846a229bcdbd3]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/rdma/vmw/pvrdma_dev_ring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: qemu-4.2.0/hw/rdma/vmw/pvrdma_dev_ring.c
+===================================================================
+--- qemu-4.2.0.orig/hw/rdma/vmw/pvrdma_dev_ring.c
++++ qemu-4.2.0/hw/rdma/vmw/pvrdma_dev_ring.c
+@@ -41,7 +41,7 @@ int pvrdma_ring_init(PvrdmaRing *ring, c
+     atomic_set(&ring->ring_state->cons_head, 0);
+     */
+     ring->npages = npages;
+-    ring->pages = g_malloc(npages * sizeof(void *));
++    ring->pages = g_malloc0(npages * sizeof(void *));
+ 
+     for (i = 0; i < npages; i++) {
+         if (!tbl[i]) {
-- 
2.25.1

