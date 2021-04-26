Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.909.1619398455294766979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: s/q8vSy2YtAMaMYoaEwjel4KhKqb6pJnq7l6A8QmuuhJhff/NXyYq6LZX6jdfXfJR/t7arYlQm
 dy6A3gSs1pIQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818096"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818096"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:22 -0700
IronPort-SDR: yLlna9Q0OdR7nIjqjViIo5GZM39YvidYUIMw6xyjTiIViPv9hp2BGihestPs4k9MVR+AeQQgwd
 BzkbIPYSPnNw==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067352"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:21 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/64] scripts/oe-debuginfod: correct several issues
Date: Mon, 26 Apr 2021 08:52:51 +0800
Message-Id: <77deac8501990ac8071eb11d4bec6aec4be948b7.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Particularly:
- nesting subprocess.run() inside subprocess.check_output() does not work at all.
How was this tested?
- -R and -U options can be combined; no need to separate the invocations based
on packaging format
- both exception handlers are unnecessary; we can simply print the hint if
invocation did not succeed
- to run debuginfod from its own sysroot, '-c addto_recipe_sysroot' for elfutils-native
must be executed

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9e57bf636ec63e74d56f1ac48b5a27c5b80f1877)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/oe-debuginfod | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/scripts/oe-debuginfod b/scripts/oe-debuginfod
index 967dd5807c..5560769888 100755
--- a/scripts/oe-debuginfod
+++ b/scripts/oe-debuginfod
@@ -20,12 +20,7 @@ if __name__ == "__main__":
         package_classes_var = "DEPLOY_DIR_" + tinfoil.config_data.getVar("PACKAGE_CLASSES").split()[0].replace("package_", "").upper()
         feed_dir = tinfoil.config_data.getVar(package_classes_var, expand=True)
 
-    try:
-        if package_classes_var == "DEPLOY_DIR_RPM":
-            subprocess.check_output(subprocess.run(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', feed_dir]))
-        else:
-            subprocess.check_output(subprocess.run(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-U', feed_dir]))
-    except subprocess.CalledProcessError:
-        print("\nTo use the debuginfod server Please ensure that this variable PACKAGECONFIG_pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
-    except KeyboardInterrupt:
-            sys.exit(1)
+    subprocess.call(['bitbake', '-c', 'addto_recipe_sysroot', 'elfutils-native'])
+
+    subprocess.call(['oe-run-native', 'elfutils-native', 'debuginfod', '--verbose', '-R', '-U', feed_dir])
+    print("\nTo use the debuginfod server please ensure that this variable PACKAGECONFIG_pn-elfutils-native = \"debuginfod libdebuginfod\" is set in the local.conf")
-- 
2.30.2

