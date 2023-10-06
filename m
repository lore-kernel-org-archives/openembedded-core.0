Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C03E7E81DE2
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 11:21:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10238.1696591282764854532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 04:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89697C15;
	Fri,  6 Oct 2023 04:22:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00D103F5A1;
	Fri,  6 Oct 2023 04:21:21 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] qemuboot: reduce default size of software I/O translation buffer
Date: Fri,  6 Oct 2023 12:21:19 +0100
Message-Id: <20231006112119.1081596-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 11:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188756

From: Ross Burton <ross.burton@arm.com>

With 6.5+ (specifically, if DMA_BOUNCE_UNALIGNED_KMALLOC is set) the
SWIOTLB is used, and it defaults to 64MB. This is too much when there's
only 256MB of RAM, so request 0 slabs and lets the kernel round up to
the appropriate minimum (1MB on aarch64, typically). In virtual hardware
there's very little need for these bounce buffers, so the 64MB would be
mostly wasted.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/qemuboot.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/q=
emuboot.bbclass
index e30b380c3dc..5c4bbd67371 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -107,6 +107,13 @@ QB_ROOTFS_EXTRA_OPT ?=3D ""
 QB_GRAPHICS ?=3D ""
 QB_NFSROOTFS_EXTRA_OPT ?=3D ""
=20
+# With 6.5+ (specifically, if DMA_BOUNCE_UNALIGNED_KMALLOC is set) the S=
W IO TLB
+# is used, and it defaults to 64MB. This is too much when there's only 2=
56MB of
+# RAM, so request 0 slabs and lets the kernel round up to the appropriat=
e minimum
+# (1MB, typically). In virtual hardware there's very little need for the=
se bounce
+# buffers, so the 64MB would be mostly wasted.
+QB_KERNEL_CMDLINE_APPEND:append =3D " swiotlb=3D0"
+
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?=3D "/dev/sd"
=20
--=20
2.34.1


