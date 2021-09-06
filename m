Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.17762.1630897608440755017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 20:06:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10098"; a="219925644"
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="219925644"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:48 -0700
X-IronPort-AV: E=Sophos;i="5.85,271,1624345200"; 
   d="scan'208";a="522846503"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.236.127])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2021 20:06:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 3/4] kernel: Fix interaction when packaging disabled
Date: Mon,  6 Sep 2021 11:06:23 +0800
Message-Id: <b8f81d137798fd48eaf7dc2ec6d9c98f712709a6.1630897275.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630897275.git.anuj.mittal@intel.com>
References: <cover.1630897275.git.anuj.mittal@intel.com>
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
index f405b6e523..b03a286ed4 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -90,6 +90,8 @@ python __anonymous () {
     imagedest = d.getVar('KERNEL_IMAGEDEST')
 
     for type in types.split():
+        if bb.data.inherits_class('nopackages', d):
+            continue
         typelower = type.lower()
         d.appendVar('PACKAGES', ' %s-image-%s' % (kname, typelower))
         d.setVar('FILES_' + kname + '-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
-- 
2.31.1

