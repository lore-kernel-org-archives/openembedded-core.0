Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724EEC433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:13 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13168.1635347816645315769
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456772"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456772"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:12 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617107"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:11 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/36] gobject-introspection: Don't write $HOME
 into scripts
Date: Wed, 27 Oct 2021 23:16:19 +0800
Message-Id: 
 <e9c71a121f05b07fcd5ef2acbfac3c2dc9685384.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157527

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Writing an expanded version of $HOME into the wrapper script breaks
reproducibility. We don't need this here so don't.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5df092524e93cd7d0eaa633ec8a5689d4c0d018d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gobject-introspection/gobject-introspection_1.66.1.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
index 3b884f03e9..8b752f7e7d 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb
@@ -94,7 +94,7 @@ EOF
         # from the target sysroot.
         cat > ${B}/g-ir-scanner-wrapper << EOF
 #!/bin/sh
-# This prevents g-ir-scanner from writing cache data to $HOME
+# This prevents g-ir-scanner from writing cache data to user's HOME dir
 export GI_SCANNER_DISABLE_CACHE=1
 
 g-ir-scanner --lib-dirs-envvar=GIR_EXTRA_LIBS_PATH --use-binary-wrapper=${STAGING_BINDIR}/g-ir-scanner-qemuwrapper --use-ldd-wrapper=${STAGING_BINDIR}/g-ir-scanner-lddwrapper --add-include-path=${STAGING_DATADIR}/gir-1.0 --add-include-path=${STAGING_LIBDIR}/gir-1.0 "\$@"
-- 
2.31.1


