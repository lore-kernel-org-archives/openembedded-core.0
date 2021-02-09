Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LFXK4kWXs+/PdQZ1cH1yKxCSYh0m+7YKgh1VjPT2VCgqQe7MneReajmNgmHwesCXqWwtqplyN9
 qmjJdz2+zvAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968580"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968580"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:41 -0800
IronPort-SDR: PaE5GBLv2WvGOCd3Z57IAODBjtON44dRazhvT3Te0mLKqnehlIMqA3TlPek+/VFCIvmFvPdHQg
 g7wqNzQpKnBQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215428"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:40 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/35] npm.bbclass: use python3 for npm config
Date: Tue,  9 Feb 2021 23:51:49 +0800
Message-Id: <5cc15f53d55923815a859009a1ffe6cff145b6d7.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vyacheslav Yurkov <uvv.mail@gmail.com>

python2-native executable is not available in sysroot anymore, which
causes compilation of some nodejs modules to fail. Switch to python3 as a
default python version.

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d21f50ecf8e8683a92b7d234fa8225c2c1470595)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/npm.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index d3dd1a9ab8..79f55febcc 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -17,6 +17,8 @@
 #  NPM_INSTALL_DEV:
 #       Set to 1 to also install devDependencies.
 
+inherit python3native
+
 DEPENDS_prepend = "nodejs-native "
 RDEPENDS_${PN}_prepend = "nodejs "
 
@@ -248,9 +250,7 @@ python npm_do_compile() {
         sysroot = d.getVar("RECIPE_SYSROOT_NATIVE")
         nodedir = os.path.join(sysroot, d.getVar("prefix_native").strip("/"))
         configs.append(("nodedir", nodedir))
-        bindir = os.path.join(sysroot, d.getVar("bindir_native").strip("/"))
-        pythondir = os.path.join(bindir, "python-native", "python")
-        configs.append(("python", pythondir))
+        configs.append(("python", d.getVar("PYTHON")))
 
         # Add node-pre-gyp configuration
         args.append(("target_arch", d.getVar("NPM_ARCH")))
-- 
2.29.2

