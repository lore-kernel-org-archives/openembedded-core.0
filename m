Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.37355.1614009665427621233
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: N7Y9KFqKu1fEigy+TpNOsVbVvTtdTQEzE1Zk1+Jv1JOLE/yIVrLXqSUfPsNEYHf8ZdvmJNAJxm
 cWIWAoZJEY+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706039"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706039"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:07 -0800
IronPort-SDR: BDh4qwmwWZg/e+HofL++gEVUMHIqC1lr6gU7QNq+RX/prfKlbzZVLGOD7plXJi/AX3FhFlakoa
 onv75aRy1hFg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301988"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:06 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/30] deb: export INTERCEPT_DIR for remove actions
Date: Tue, 23 Feb 2021 00:00:21 +0800
Message-Id: <697c75071932a48ec8d34b778fca68e18bec433a.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Leitner <richard.leitner@skidata.com>

During the do_populate_sdk task apt-get purge is called by deb's remove
function. This fails with error messages similiar to the following one
if any of the included packages uses intercepts as the INTERCEPT_DIR
isn't exported:

.../*.postinst: line 4: /postinst_intercept: No such file or directory

Therefore fix it by exporting the INTERCEPT_DIR variable within the
remove function.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f18adf53dd4bf5dd3adef82b2dcc34a6cdfd0c89)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/package_manager/deb/__init__.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index 26157f591a..5120920e70 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -312,6 +312,8 @@ class DpkgPM(OpkgDpkgPM):
         if not pkgs:
             return
 
+        os.environ['INTERCEPT_DIR'] = self.intercepts_dir
+
         if with_dependencies:
             os.environ['APT_CONFIG'] = self.apt_conf_file
             cmd = "%s purge %s" % (self.apt_get_cmd, ' '.join(pkgs))
-- 
2.29.2

