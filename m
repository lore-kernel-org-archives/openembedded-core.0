Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15108C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 04:36:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4107.1785472595299569817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 21:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MVnrh+Tf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785472595; x=1817008595;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=03rSvrR16Xy+JOep4kCyq9xfx7WPzD8n0x8FUJbx2xM=;
  b=MVnrh+TfHrZ0j4XCXy/ihBedmENfUk03wKPk+elImypElWXR5c+C18kI
   vLPbOP3WINZ+lcCcgILGCSQW/pzHNZ4JMlxssyMo28lHZSvu83wxnRkJG
   BsDz+8/9g1ihtB7iYsdwwkA1FpFF/OADA1JRRnSkHFOSc2RX6IRkPcyde
   rsIwRs7mYWXZDuJYRBU2zm3OO1y+93OA67IaPzlSuvGtqb5GxK3R9inRP
   xlWAA3jTwZiOievvZDcs9r9cXccWrd2mRF+2yICvPFW1Zj8dYTjVrShQ2
   y2aFxUcv+kfhhcyVVcUMahSy3ip33LIsCpJ60tMH99/THWhd+L8RQ3XtR
   g==;
X-CSE-ConnectionGUID: wZez9fgCQLyY9iADrBQhBw==
X-CSE-MsgGUID: nh3HPdJoRe2+Vdenip7XBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="228098713"
X-IronPort-AV: E=Sophos;i="6.25,195,1779116400"; 
   d="scan'208";a="228098713"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 13:36:33 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 645BB42A309
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 04:36:33 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 17B8D18019B3
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 04:36:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 29AB340F8CE;
	Fri, 31 Jul 2026 04:36:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kernel-devsrc: Install sources required for BPF host tools
Date: Fri, 31 Jul 2026 12:36:28 +0800
Message-ID: <20260731043628.1566-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 04:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242391

From: Wang Mingyu <wangmy@fujitsu.com>

When CONFIG_DEBUG_INFO_BTF is enabled in the kernel, building external
modules that use BPF requires the 'resolve_btfids' host tool. This tool
and its dependencies were not included in the kernel-devsrc package.
 
This can cause a build failure in an SDK environment when 'make scripts'
is run, for example:
 
  make[4]: *** No rule to make target '.../tools/bpf/resolve_btfids/main.o'
 
To fix this, unconditionally install the minimal set of source files
required to build the 'resolve_btfids' tool and its library dependencies.
This avoids coupling the recipe to specific kernel CONFIG symbols while
also ensuring only necessary files are included in the package.
 
The copy operations ignore errors to prevent build failures on older
kernel versions where these files may not exist.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
V1: https://lists.openembedded.org/g/openembedded-core/message/242225
Changes in v2:
  - Remove conditional copy based on CONFIG_DEBUG_INFO_BTF.
  - Copy a minimal set of files instead of entire directories.
  - Make copy operations robust against non-existent files.

---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 237dec6b12..ca1a08cba3 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -176,6 +176,18 @@ do_install() {
             cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneldir/build/
         fi
 
+        # For v5.2+ when BTF is enabled, scripts prepare may rebuild the
+        # resolve_btfids host tool. Copy the minimal sources it needs instead
+        # of coupling this recipe to a specific kernel CONFIG_ symbol.
+        cp -a --parents tools/bpf/resolve_btfids/* $kerneldir/build/ 2>/dev/null || :
+        cp -a --parents tools/lib/bpf/* $kerneldir/build/ 2>/dev/null || :
+        cp -a --parents tools/lib/subcmd/* $kerneldir/build/ 2>/dev/null || :
+        cp -a --parents tools/lib/ctype.c tools/lib/rbtree.c tools/lib/str_error_r.c \
+            tools/lib/string.c tools/lib/zalloc.c $kerneldir/build/ 2>/dev/null || :
+        cp -a --parents tools/build/Build.include tools/build/Build tools/build/fixdep.c \
+            tools/scripts/Makefile.arch tools/scripts/Makefile.include \
+            tools/scripts/utilities.mak $kerneldir/build/ 2>/dev/null || :
+
         if [ "${ARCH}" = "arm64" ]; then
             # arch/arm64/include/asm/xen references arch/arm
             cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
-- 
2.43.0


