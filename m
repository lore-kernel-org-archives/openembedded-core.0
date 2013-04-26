Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UVdux-0005Bn-4c
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 10:22:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Apr 2013 01:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,556,1363158000"; d="scan'208";a="293336385"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 26 Apr 2013 01:04:09 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2013 11:04:01 +0300
Message-Id: <9598feae862629ccc35b18018b2f3762ef51c0e5.1366962026.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1366962026.git.laurentiu.palcu@intel.com>
References: <cover.1366962026.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1366962026.git.laurentiu.palcu@intel.com>
References: <cover.1366962026.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 4/5] scripts/postinst-intercepts: create separete hooks for multilib
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
X-List-Received-Date: Fri, 26 Apr 2013 08:22:35 -0000

When using multilib, the hooks for lib32/lib64 must be different because
the libdir/base_libdir point to different locations. Postinstalls
calling postint_intercept script must pass the mlprefix in the 3rd
argument.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 scripts/postinst-intercepts/postinst_intercept |   23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/scripts/postinst-intercepts/postinst_intercept b/scripts/postinst-intercepts/postinst_intercept
index ed32f27..27c2568 100755
--- a/scripts/postinst-intercepts/postinst_intercept
+++ b/scripts/postinst-intercepts/postinst_intercept
@@ -5,21 +5,40 @@
 # is valid. Also, if one wants to pass any variables to the intercept script from
 # the postinstall itself, they will be added immediately after the shebang line.
 #
-# Usage: postinst_intercept <intercept_script_name> <package_name> <var1=...> ... <varN=...>
+# Usage: postinst_intercept <intercept_script_name> <package_name> <mlprefix=...> <var1=...> ... <varN=...>
 #  * intercept_script_name - the name of the intercept script we want to change;
 #  * package_name - add the package_name to list of packages the intercept script
 #                   is used for;
+#  * mlprefix=... - this one is needed in order to have separate hooks for multilib.
 #  * var1=... - var1 will have the value we provide in the intercept script. This
 #               is useful when we want to pass on variables like ${libdir} to
 #               the intercept script;
 #
-[ $# -lt 2 ] && exit 1
+[ $# -lt 3 ] && exit 1
 
 intercept_script=$INTERCEPT_DIR/$1 && shift
 package_name=$1 && shift
+mlprefix=$(echo $1 |sed -ne "s/^mlprefix=\(.*\)-/\1/p") && shift
 
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



