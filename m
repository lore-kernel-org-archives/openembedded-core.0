Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043458"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043458"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:24 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776399"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:23 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/22] kernel: Fix interaction when packaging disabled
Date: Sat,  3 Jul 2021 00:19:51 +0800
Message-Id: <8068eaccf89779d374791837215895432e45e85d.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When packaging is disabled using the nopackages class, ensure we don't
add to PACKAGES. This fixes builds where we have an unpackaged kernel
alongside a packaged kernel.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2522daf22e2c27dd9c7926feda0345978217c6c3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 379bed44f2..846b19663b 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -92,6 +92,8 @@ python __anonymous () {
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
+        if bb.data.inherits_class('nopackages', d):
+            continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-- 
2.31.1

