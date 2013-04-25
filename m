Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVLVz-0002d3-3H
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 14:43:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2013 05:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,550,1363158000"; d="scan'208";a="292207942"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 25 Apr 2013 05:24:13 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Apr 2013 15:24:00 +0300
Message-Id: <f0a9ef998eba08dce22e9a931e34f89c6c2c34e7.1366892003.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366892003.git.laurentiu.palcu@intel.com>
References: <cover.1366892003.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/4] scripts/postinst-intercepts: create separete hooks for multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Apr 2013 12:43:31 -0000

When using multilib, the hooks for lib32/lib64 must be different because
the libdir/base_libdir point to different locations. Nothing has to be
done in the postinstalls for this. When a hook is installed, it will be
detected automatically if this is a ML package (from the libXX- package
prefix) and a separate hook will be created.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/postinst-intercepts/postinst_intercept |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
index ed32f27..5969eba 100755
--- a/scripts/postinst-intercepts/postinst_intercept
+++ b/scripts/postinst-intercepts/postinst_intercept
@@ -17,9 +17,27 @@
 
 intercept_script=$INTERCEPT_DIR/$1 && shift
 package_name=$1 && shift
+mlprefix=$(echo $package_name|sed -rn 's/^(lib32|lib64|libx32)-.*/\1/p')
 
+# if the hook we want to install does not exist, then there's nothing we can do
 [ -f "$intercept_script" ] || exit 1
 
+# if the postinstall wanting to install the hook belongs to a multilib package,
+# then we'd better have a separate hook for this because the default ${libdir} and
+# ${base_libdir} will point to the wrong locations
+if [ -n "$mlprefix" ]; then
+	ml_intercept_script=$intercept_script-$mlprefix
+	# if the multilib hook does not exist, create it from the default one
+	if [ ! -f "$ml_intercept_script" ]; then
+		cp $intercept_script $ml_intercept_script
+
+		# clear the ##PKGS: line and the already set variables
+		[ -x "$ml_intercept_script" ] && sed -i -e "2,$(($#+1)) {/.*/d}" -e "/^##PKGS: .*/d" $ml_intercept_script
+	fi
+
+	intercept_script=$ml_intercept_script
+fi
+
 chmod +x "$intercept_script"
 
 pkgs_line="$(cat $intercept_script|grep "##PKGS:")"
-- 
1.7.9.5



