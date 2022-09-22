Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A87C6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:40:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6565.1663850398554791425
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F16B91595;
	Thu, 22 Sep 2022 05:40:03 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F00833F73B;
	Thu, 22 Sep 2022 05:39:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] qemu: re-add the fix for CVE-2022-1050
Date: Thu, 22 Sep 2022 13:39:53 +0100
Message-Id: <20220922123954.2466959-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:40:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170972

This patch was accidentally dropped in the 7.1.0 upgrade, so bring it
back.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 ...t-against-buggy-or-malicious-guest-d.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protec=
t-against-buggy-or-malicious-guest-d.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index f22de74ea41..14e2a792353 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -26,8 +26,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://0007-qemu-Determinism-fixes.patch \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-f=
ile.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
+           file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-gues=
t-d.patch \
            "
-BAR =3D "           file://0010-hw-pvrdma-Protect-against-buggy-or-malic=
ious-guest-d.patch "
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
 SRC_URI[sha256sum] =3D "a0634e536bded57cf38ec8a751adb124b89c776fe0846f21=
ab6c6728f1cbbbe6"
diff --git a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-again=
st-buggy-or-malicious-guest-d.patch b/meta/recipes-devtools/qemu/qemu/001=
0-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
new file mode 100644
index 00000000000..810c74fabd3
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-bugg=
y-or-malicious-guest-d.patch
@@ -0,0 +1,43 @@
+CVE: CVE-2022-1050
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/202204030=
95234.2210-1-yuval.shaia.ml@gmail.com/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From dbdef95c272e8f3ec037c3db4197c66002e30995 Mon Sep 17 00:00:00 2001
+From: Yuval Shaia <yuval.shaia.ml@gmail.com>
+Date: Sun, 3 Apr 2022 12:52:34 +0300
+Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest dri=
ver
+
+Guest driver might execute HW commands when shared buffers are not yet
+allocated.
+This could happen on purpose (malicious guest) or because of some other
+guest/host address mapping error.
+We need to protect againts such case.
+
+Fixes: CVE-2022-1050
+
+Reported-by: Raven <wxhusst@gmail.com>
+Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
+---
+ hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
+index da7ddfa548..89db963c46 100644
+--- a/hw/rdma/vmw/pvrdma_cmd.c
++++ b/hw/rdma/vmw/pvrdma_cmd.c
+@@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
+=20
+     dsr_info =3D &dev->dsr_info;
+=20
++    if (!dsr_info->dsr) {
++            /* Buggy or malicious guest driver */
++            rdma_error_report("Exec command without dsr, req or rsp buf=
fers");
++            goto out;
++    }
++
+     if (dsr_info->req->hdr.cmd >=3D sizeof(cmd_handlers) /
+                       sizeof(struct cmd_handler)) {
+         rdma_error_report("Unsupported command");
+--=20
+2.34.1
+
--=20
2.34.1


