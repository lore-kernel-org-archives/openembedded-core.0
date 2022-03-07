Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A441C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:13:59 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.26508.1646662438266182811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:13:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DP1m/xka;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662438; x=1678198438;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HtfUgPyvOo6YGJEnyf57WmCSXxRWznKweZIiC2EhOSw=;
  b=DP1m/xka2sna4wjkBq2uwt92quSDGeOfKqPYOG5FPgAkjVqLhXe8cQrb
   vgHjrY5UbQwWzWULcuLqzY6cAL1FE857fVtFCUm/8w/lh+FCIVkl1Uf1d
   +4VmHj/JDlzV2i8rVXCdmJsnA/POmKhzdLv0JEQobYCc+ql0ke2MNWoBH
   iY4Um9TuoWoS+Wd2yltartXitwE84Y54hl1Ru6oT+Bvu5IOQRPdK2dMpm
   +QpJQ74ovELATx6kl03BQOEjGM2ytqosF5us/+BI3+1v8KRZQd9Jx88sY
   gCuVYGZkIll5TozyCB2A8zqHUBFBftfhkHV1jeI/GA0mIaUcJh0J9V65P
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112503"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112503"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:22 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070806"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:21 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/25] depmodwrapper-cross: add config directory
 option
Date: Mon,  7 Mar 2022 22:09:45 +0800
Message-Id: 
 <b929726440b35505cb58fadb8f9bd12444424947.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:13:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162830

From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>

Native depmod by default try to find config files from the following
directories:
```
${STAGING_ETCDIR_NATIVE}/depmod.d
/run/depmod.d
/usr/local/lib/depmod.d
/lib/depmod.d
```

but none of them is correct, change to load config files from
${sysconfdir}/depmod.d of basedir.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa03d77f009af2b03246554566de2a1eea3f5e2f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index 9a172675af..04fc14a6d2 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -32,9 +32,9 @@ fi
 
 if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
     echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
-    exec env depmod "\$1" "\$2" "\$3" "\$4"
+    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
-- 
2.35.1


