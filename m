Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47464C4707F
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.3164.1650419969153817065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=C7SCP674;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419969; x=1681955969;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=kN2wqN2wpqnW8CVwA2DaKwkjNGxXq6GZTufKVmRZIAU=;
  b=C7SCP674U0gWahcNPJ1XupQwvZ/kg3wtUR6YscphX+puDgc7q3/uw7Tb
   xW5ihTfp2aDYXAPs2Rva4QHJxH8JOWHlhxVFXMjkUzWt48R057FXIv6Hl
   nWdBd9D25pfdL2UR4h1gHdPVNCQPAlDiRUxsso9QZO+GojLqVyNfT3dq/
   y7kF2s9OriDoVE0b8rv+qpI/Xv69Qs+uiGUa3Y4BLci/ucbBskr+nPa8j
   9FNWXQYFPryowhx//TN/cwvCbxaRMj1gWJP8Dz+uVG6TRg+YbimWC8Ihs
   ID6aUrZfZuBTDCKDuwKsO9qqNE62O6tEQTUORHfONX6FN8VlbRKlDsAtp
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350364618"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="350364618"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:28 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071387"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 01/11] scripts/runqemu: Fix memory limits for
 qemux86-64
Date: Wed, 20 Apr 2022 09:59:06 +0800
Message-Id: 
 <ad7a8bf827a24f195df55a5d49e3ace949b6e23e.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164640

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When setting memory to 4GB, qemu is only running with 2GB for x86_64.
Avoid this by removing the mem= option to the kernel and letting the
qemu configuration handle it for x86 in a similar way to mips.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2fd53417eba354c31c058c4bb066bb882e098add)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/runqemu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 66e035c9af..1663fd829d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -805,7 +805,7 @@ class BaseConfig(object):
         self.set('QB_MEM', qb_mem)
 
         mach = self.get('MACHINE')
-        if not mach.startswith('qemumips'):
+        if not mach.startswith(('qemumips', 'qemux86')):
             self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
 
         self.qemu_opt_script += ' %s' % self.get('QB_MEM')
-- 
2.35.1


