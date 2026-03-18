Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA4E1088E5D
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 23:31:15 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28201.1773876673682153106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 16:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=2D1yQCcL;
 dkim=pass header.i=@valla.it header.s=default header.b=cws5Rpwo;
 spf=pass (domain: valla.it, ip: 185.56.87.0, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; s=arckey; t=1773876673;
	 b=KxQpDTEsORLbv1UhUdcIk8Onont2e77UkuII7fC5hPPUsgMuAOBEKkAtpoaTxsTM+1hHzxw3va
	  9aTuFHUZZ6cnTA54WLOYgbZQh9VIoB1Bd4hU67lkUSA/dWdxkCnN4VKOHhWUtl6LfRITGzB9iB
	  oi0h8LTc8Y5b7jKE4I0VV8qkO4zWaxC7VI32uDXTa+JXYuutOl3U0bFMvxdLn2CC9zCTDb0nhv
	  P+gZPkuji+S2ZhTdv+HFDQNa5IKzrZqCYC8A9JNB7MSzCVUyDoM1zWHlltTCRda6c+gjbYZyA1
	  ARzlw4q9diIQdK75FcVrIKHgcD18Rq0Lt4Cmost1x3SNQg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com; s=arckey; t=1773876673;
	bh=Vw9mGtbDOhJ329QqCYKT2+fJMnTnLr4YQNo5LgarFLs=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=dXIjm/cj4tpMbh/w/NTQFY7F8st30psTp0uixGVxDypzgE6TAWTGjBnLv8UO9RVzd8klYb/2B/
	  d2W3guxV+qCR9kzQ2N8oDtkLsaMFSnNkgnFB071VfyH8oJmIzBdFACfNXQ7yrqZDrf4P8chupm
	  CaNIa88lBhSUaLmGE7qeY7ffp0pajYVxZHyEebFlviB47bLOs4Ji81vaGxj425yWc6ZyeBd5EA
	  PBkOcMBkFbm0C6+NrMG8vvCpFJPwfQ12rOIMFJ+AAxXM/ZlBqU4b8WGo46bdZn+iGxIfqxTIo3
	  yppCEJyqc+cqudJDaeGTy/hUYANrcj6seK/2mBIIDNeJOA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=hXSTLfHN7RA+qZbxOxhvqelSM6H625s5MZPQ6MLcb1c=; b=2D1yQCcL2IcA1oR2T38CKWhLIT
	txNSBRTTljYekp/HMx1QkNSOOE6cJJyGT2xzGwc1E4O3tk6frHjXt+BZBy9oarQ5HCOzz63qjj2B+
	5MVOnl2LUU08OT9rM08KoEpEf4V+k+45QCLMKH0T4VK5cEKKNot7cJbYwdmSfRxwUA/g=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Lx-00000002v0B-2BmE
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Mar 2026 23:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=hXSTLfHN7RA+qZbxOxhvqelSM6H625s5MZPQ6MLcb1c=; b=cws5RpworKRBWYQco6dM4GsviH
	xTAe9rlyx+RnAOzbBaCB3ij0OTvSA84fMiPSVghtyJUQo9xyy+2lVMbSy7IDcH9x5X3dd70PWpymN
	kVZ+9sDE8me0Dmms6xO/FDhlLkWE8oTXM0HAltRcfoyUFqtBr20L0iXeAAZO0JLqPYLA=;
Received: from [82.57.88.19] (port=60381 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Lr-00000000OEU-2vzj;
	Wed, 18 Mar 2026 23:30:59 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 19 Mar 2026 00:30:49 +0100
Subject: [PATCH RFC 1/4] bootconfig: add recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-bootconfig-v1-1-a4d467c3f0ba@valla.it>
References: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
In-Reply-To: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=francesco@valla.it;
 h=from:subject:message-id; bh=Vw9mGtbDOhJ329QqCYKT2+fJMnTnLr4YQNo5LgarFLs=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJm7TTc1Pk95FhU498W2oP0nLIzWKu7a2Zao8V3ldSD7n
 pkLTQQvdZSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQATsfNg+Gfbqp64UZlJa9IO
 o4kbuja9z65ryPGcVX7onegFA421bNIMf6UTvpQuW2e5fmFIZMi30z+YQq7/sOpL1FK1s0qYdiM
 imhMA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 9a8a90d00fe595008f659b536e084428
X-AntiAbuse: ID - 9a8a90d00fe595008f659b536e084428
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w30Lx-00000002v0B-2BmE-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-q0dl.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 23:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233451

Add a new recipe for the bootconfig tool, with source coming directly
from the kernel shared workdir.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/recipes-kernel/bootconfig/bootconfig.bb | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/meta/recipes-kernel/bootconfig/bootconfig.bb b/meta/recipes-kernel/bootconfig/bootconfig.bb
new file mode 100644
index 0000000000000000000000000000000000000000..77ee70dd1839ef90a292cf829f4f3a4353f85c28
--- /dev/null
+++ b/meta/recipes-kernel/bootconfig/bootconfig.bb
@@ -0,0 +1,44 @@
+SUMMARY = "Apply, delete or show boot config"
+DESCRIPTION = "bootconfig is a tool that can be used to add a boot config block \
+at the end of a kernel initramfs, as well as remove it or show its content."
+LICENSE = "GPL-2.0-only"
+
+inherit kernelsrc kernel-arch
+
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+EXTRA_OEMAKE = "\
+    -C ${S}/tools/bootconfig \
+    O=${B} \
+    CROSS=${TARGET_PREFIX} \
+    CC="${CC} ${DEBUG_PREFIX_MAP} -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} ${CFLAGS}" \
+    HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}" \
+    LD="${LD}" \
+    AR=${AR} \
+    ARCH=${ARCH} \
+    V=1 \
+    'DESTDIR=${D}' \
+    'prefix=${prefix}' \
+    'bindir=${bindir}' \
+"
+
+do_compile() {
+	oe_runmake ${B}/bootconfig
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	oe_runmake install
+}
+
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+python do_package:prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION").split("-")[0])
+}
+
+B = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"

-- 
2.53.0


