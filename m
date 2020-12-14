Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: pzQ4NtJwalFGmALy4tUZ+nYUWmqxVSaMfIwql8lnRkPeJP5Ia+DGAYxlRhjfyA5nUOwQH6lXA/
 8MgMyEzVVNng==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752393"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752393"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:36 -0800
IronPort-SDR: 0CDdgzOAmRzVPGi+r3RwykcC+SKVec6iatArJ7tjqKlLgqrHn9W/qvhPSFGIEDnUTp044pzFGG
 kc94xq2DN87Q==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670777"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 12/19] populate_sdk_ext: use SDK_CUSTOM_TEPLATECONF variable to enable custom templateconf.cfg
Date: Mon, 14 Dec 2020 11:35:09 +0800
Message-Id: <c59ffcc4ba70cec8b6342a0205b880953919cba7.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chandana kalluri <ckalluri@xilinx.com>

The current implementation will always pick an existing templateconf.cfg if
present else it will use the one from OE.  A user might not always want to pick
an existing tempalteconf.cfg even if its present.  Introduce
SDK_CUSTOM_TEMPLATECONF variable to provide an option for the user to specify if he
wants to use an existing custom templateconf.cfg or not

If SDK_CUSTOM_TEMPLATECONF=='1' then enable custom templateconf.cfg. By default
SDK_CUSTOM_TEMPLATECONF is set to '0'

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0f863a24d05bddeb21e181fb01fa0051c79d7d8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 6f35b612c2..e6bf27cf38 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -24,6 +24,7 @@ SDK_INCLUDE_NATIVESDK ?= "0"
 SDK_INCLUDE_BUILDTOOLS ?= '1'
 
 SDK_RECRDEP_TASKS ?= ""
+SDK_CUSTOM_TEMPLATECONF ?= "0"
 
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
@@ -199,6 +200,9 @@ python copy_buildsystem () {
     buildsystem = oe.copy_buildsystem.BuildSystem('extensible SDK', d)
     baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
 
+    #check if custome templateconf path is set
+    use_custom_templateconf = d.getVar('SDK_CUSTOM_TEMPLATECONF')
+
     # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
     derivative = (d.getVar('SDK_DERIVATIVE') or '') == '1'
     if derivative:
@@ -390,7 +394,7 @@ python copy_buildsystem () {
         shutil.copyfile(builddir + '/cache/bb_unihashes.dat', baseoutpath + '/cache/bb_unihashes.dat')
 
     # Use templateconf.cfg file from builddir if exists
-    if os.path.exists(builddir + '/conf/templateconf.cfg'):
+    if os.path.exists(builddir + '/conf/templateconf.cfg') and use_custom_templateconf == '1':
         shutil.copyfile(builddir + '/conf/templateconf.cfg', baseoutpath + '/conf/templateconf.cfg')
     else:
         # Write a templateconf.cfg
-- 
2.29.2

