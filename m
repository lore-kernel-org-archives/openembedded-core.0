Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13ABFC54F5C
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 02:44:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3029.1785293066228312866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 19:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aAi8mqdc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785293069; x=1816829069;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nkE06lWjV04TPuts2tQ36W06pOwgO86QKIElz0Y58VY=;
  b=aAi8mqdcCLDF5qC+qDM4LU9HOwgv5LccHGxyOwG9jqV17oIzw0+SbwXD
   QtFKlRpxgRE/7MUCuv9NNYkvSzyaKln/5p72qwWjJhBUq4mgDQI7bEDzr
   fYZinbI8xGPgfT6t04D/IfdOdzW4NHh8sANHnC21/MQhTV243kgu9t1pp
   /1xhVMAfTTyV0W1bpRio5OI5g7E/FxUsKDp4/cxINwf4F47xF1oqYvI38
   YfC6jssmeTyHwTRfVas42UNzRBJt4D7kI49FkkPoiv2BGu3gc8bU+3uom
   lVwNv6Ryu9xN6sVhXjQo7JHVnG1EXbpfI7VNfHjbc7cbqQiVmOCoUlHSj
   g==;
X-CSE-ConnectionGUID: Z+8Nvd93QaGtkgXRwSKhiw==
X-CSE-MsgGUID: G9B4XLqrT0iquupMs1C8+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="248864033"
X-IronPort-AV: E=Sophos;i="6.25,191,1779116400"; 
   d="scan'208";a="248864033"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 11:44:27 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D653D551D
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:23 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 951FD1C00116
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id B68B91800B16;
	Wed, 29 Jul 2026 02:44:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kernel-devsrc: include tools needed for BTF when enabled
Date: Wed, 29 Jul 2026 10:44:16 +0800
Message-ID: <20260729024416.1443-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 02:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242224

From: Wang Mingyu <wangmy@fujitsu.com>

When CONFIG_DEBUG_INFO_BTF is enabled in the kernel, building external
modules that use BPF requires the 'resolve_btfids' host tool. This tool
and its dependencies live in tools/bpf/ and tools/lib/, but were not
included in the kernel-devsrc package.

This caused a build failure in the SDK when running 'make scripts prepare':

  make[4]: *** No rule to make target '.../tools/bpf/resolve_btfids/main.o'

Copy tools/bpf/ and tools/lib/ into the devsrc build directory when
CONFIG_DEBUG_INFO_BTF=y is detected in the kernel config, matching the
existing pattern for the 'rust' directory and for objtool.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 237dec6b12..23779ed107 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -176,6 +176,19 @@ do_install() {
             cp -a --parents $(find tools/arch/${ARCH}/ -type f) $kerneldir/build/
         fi
 
+        # In sdk, when CONFIG_DEBUG_INFO_BTF is enabled, building external modules
+        # that use BPF may require the 'resolve_btfids' host tool. This tool
+        # and others require sources from tools/bpf/ and tools/lib/ to be built
+        # within the SDK environment.
+        if grep -q "CONFIG_DEBUG_INFO_BTF=y" ${B}/.config; then
+            echo "NOTE: CONFIG_DEBUG_INFO_BTF is enabled, including BPF host tools sources in kernel-devsrc."
+            # The 'rust' example copies the whole dir. We do the same for consistency.
+            # This includes resolve_btfids and other potential BPF tools.
+            cp -r tools/bpf ${kerneldir}/build/tools/
+            # This also requires the shared tools/lib directory.
+            cp -r tools/lib ${kerneldir}/build/tools/
+        fi
+
         if [ "${ARCH}" = "arm64" ]; then
             # arch/arm64/include/asm/xen references arch/arm
             cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
-- 
2.43.0


