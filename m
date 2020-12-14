Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: U78/VSyS0VB6V6N1zHLpYArlb23hFLMem22kzYq+Oe7G+y0sXq0zxMLgSaRKIFhbImDwYd4Qag
 urK71xPIXRng==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752415"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752415"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:43 -0800
IronPort-SDR: 10Bto1UxYuKiq6w3cArzbU3cfC6l0/MhNuc0+lgxLZ8uw2BJ61/v9MBO5VNTiYaVZClDK/bPv7
 +Df6QecjHKbA==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670821"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:42 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/19] kernel-module-split.bbclass: fix kernel modules getting marked as CONFFILES
Date: Mon, 14 Dec 2020 11:35:14 +0800
Message-Id: <6cc93de69fc53af0a3b7fb8d6c6201d4911e78b9.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gratian Crisan <gratian.crisan@ni.com>

Yi pointed out that commit 1a70a92d1f10 ("kernel-module-split.bbclass:
identify kernel modconf files as configuration files") is
unintentionally adding the actual kernel /lib/modules .ko files to the
CONFFILES variable.

The root cause is the re-use of the 'files' variable in that commit.
Fix it by using a separate variable to keep track of the generated
module .conf files that need to be marked as configuration files.

Fixes: 1a70a92d1f10 ("kernel-module-split.bbclass: identify kernel modconf files as configuration files")
Reported-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit db5f2ca532db4f0d2e05b7cb5f9d146e1dd76ab3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel-module-split.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index c8ede26996..baa32e0a90 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,7 +120,10 @@ python split_kernel_module_packages () {
         files = d.getVar('FILES_%s' % pkg)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
         d.setVar('FILES_%s' % pkg, files)
-        d.setVar('CONFFILES_%s' % pkg, files)
+
+        conffiles = d.getVar('CONFFILES_%s' % pkg)
+        conffiles = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (conffiles, basename, basename)
+        d.setVar('CONFFILES_%s' % pkg, conffiles)
 
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION_' + pkg) or ""
-- 
2.29.2

