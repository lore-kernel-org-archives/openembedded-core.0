Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.3687.1610640597381759287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:09:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9PFg1ldvGT0BizYPXQkLkKOFrLg65jiVSsh297dn6Keol405F9zwbtRWU5Nz2GdCdlkigfEu8i
 XwMcS4B3RKaA==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062595"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062595"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:09:54 -0800
IronPort-SDR: nFGcwJciF5weylTsosrcmD7zDzClLgovoQ5/JtB3THwpqJlHqFF63nJgmWIIQ8zHsgYKQWWdCa
 IVScFFTNwC6w==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986472"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:09:53 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/14] license.bbclass: Add COMMON_LICENSE_DIR and LICENSE_PATH dirs to PSEUDO_IGNORE_PATHS
Date: Fri, 15 Jan 2021 00:09:35 +0800
Message-Id: <d850874e865f2cb2417d520820c3c5288cae38c5.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

* now without ${COREBASE}/meta in PSEUDO_IGNORE_PATHS after:
  73d538f207 bitbake.conf: Prevent pyc file generation in pseudo context
  the do_package tasks are failing when LICENSE_CREATE_PACKAGE is enabled
  pseudo.log shows that it's because of license texts copied from
  ${COREBASE}/meta:
  path mismatch [46 links]: ino 96733640 db '/OE/build/tmp-glibc/work/all-oe-linux/foo/1.0/image/usr/share/licenses/foo/generic_Apache-2.0' req '/OE/build/openembedded-core/meta/files/common-licenses/Apache-2.0'.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index f90176d6c0..dc91118340 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -31,6 +31,7 @@ python do_populate_lic() {
             f.write("%s: %s\n" % (key, info[key]))
 }
 
+PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '')).split())}"
 # it would be better to copy them in do_install_append, but find_license_filesa is python
 python perform_packagecopy_prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
-- 
2.29.2

