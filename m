Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: amQYbS0j+enKHC8HX5N7R6YzE0D/7BSeBIwUk4U3UVjXcXxBBO6zYj9AseJ0/WmEsR6HazP1oV
 nhyxL74zjHIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719966"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719966"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:22 -0800
IronPort-SDR: UpynKiajWGQPvf4eeC54CP629Ihis8qNDy7EwtV8KPmsAXV54k3F8xV8ys+p6vJKLPdu07P8Jd
 Vv1DzKa0diTg==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802954"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/19] kernel-module-split.bbclass: identify kernel modconf files as configuration files
Date: Tue, 17 Nov 2020 23:35:54 +0800
Message-Id: <eb42ef100c52b243eee55b950f3dc7d4010ea1f2.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gratian Crisan <gratian.crisan@ni.com>

Currently the modconf fragments representing the configuration for
kernel modules are written out to appropriate .conf files and added to
the FILES variable. However they are not identified as 'configuration
files' and installing a new version of a kernel module results in a
conflict and a failed installed because the respective .conf file is
already in place from a previous install.

Add the generated .conf files to the CONFFILES variable denoting their
true nature.

Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a70a92d1f1006be115429a4262259c9084f484d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel-module-split.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 221022b7bc..c8ede26996 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,6 +120,7 @@ python split_kernel_module_packages () {
         files = d.getVar('FILES_%s' % pkg)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
         d.setVar('FILES_%s' % pkg, files)
+        d.setVar('CONFFILES_%s' % pkg, files)
 
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION_' + pkg) or ""
-- 
2.28.0

