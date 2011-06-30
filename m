Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QcPxP-0003WO-4b
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:43:35 +0200
Received: from localhost.localdomain (c-98-246-160-194.hsd1.or.comcast.net
	[98.246.160.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 1A2A52FEF4;
	Thu, 30 Jun 2011 18:39:47 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 15:39:39 -0700
Message-Id: <1db24b664bf6fb292d8a84dd6398e330305f18fd.1309473383.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309473383.git.scott.a.garman@intel.com>
References: <cover.1309473383.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1309473383.git.scott.a.garman@intel.com>
References: <cover.1309473383.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 1A2A52FEF4.8FC44
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 2/3] useradd.bbclass: new class for managing user/group permissions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Jun 2011 22:43:35 -0000

This class is to be used by recipes that need to set up specific
user/group accounts and set custom file/directory permissions.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |  161 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 161 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/useradd.bbclass

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
new file mode 100644
index 0000000..5891641
--- /dev/null
+++ b/meta/classes/useradd.bbclass
@@ -0,0 +1,161 @@
+USERADDPN ?= "${PN}"
+
+# base-passwd-cross provides the default passwd and group files in the
+# target sysroot, and shadow -native and -sysroot provide the utilities
+# and support files needed to add and modify user and group accounts
+DEPENDS_append = " base-passwd shadow-native shadow-sysroot"
+RDEPENDS_${USERADDPN}_append = " base-passwd shadow"
+
+# This preinstall function will be run in two contexts: once for the
+# native sysroot (as invoked by the useradd_sysroot() wrapper), and
+# also as the preinst script in the target package.
+useradd_preinst () {
+OPT=""
+SYSROOT=""
+
+if test "x$D" != "x"; then
+	# Installing into a sysroot
+	SYSROOT="${STAGING_DIR_TARGET}"
+	OPT="--root ${STAGING_DIR_TARGET}"
+
+	# Add groups and users defined for all recipe packages
+	GROUPADD_PARAM="${@get_all_cmd_params(d, 'group')}"
+	USERADD_PARAM="${@get_all_cmd_params(d, 'user')}"
+else
+	# Installing onto a target
+	# Add groups and users defined only for this package
+	GROUPADD_PARAM="${GROUPADD_PARAM}"
+	USERADD_PARAM="${USERADD_PARAM}"
+fi
+
+# Perform group additions first, since user additions may depend
+# on these groups existing
+if test "x$GROUPADD_PARAM" != "x"; then
+	echo "Running groupadd commands..."
+	# Invoke multiple instances of groupadd for parameter lists
+	# separated by ';'
+	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
+	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
+	while test "x$opts" != "x"; do
+		eval $PSEUDO groupadd -f $OPT $opts
+
+		if test "x$opts" = "x$remaining"; then
+			break
+		fi
+		opts=`echo "$remaining" | cut -d ';' -f 1`
+		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+	done
+fi 
+
+if test "x$USERADD_PARAM" != "x"; then
+	echo "Running useradd commands..."
+	# Invoke multiple instances of useradd for parameter lists
+	# separated by ';'
+	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1`
+	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2-`
+	while test "x$opts" != "x"; do
+		# useradd does not have a -f option, so we have to check if the
+		# username already exists manually
+		username=`echo "$opts" | awk '{ print $NF }'`
+		user_exists=`grep "^$username:" $SYSROOT/etc/passwd || true`
+		if test "x$user_exists" = "x"; then
+			eval $PSEUDO useradd $OPT $opts
+		else
+			echo "Note: username $username already exists, not re-creating it"
+		fi
+
+		if test "x$opts" = "x$remaining"; then
+			break
+		fi
+		opts=`echo "$remaining" | cut -d ';' -f 1`
+		remaining=`echo "$remaining" | cut -d ';' -f 2-`
+	done
+fi
+}
+
+useradd_sysroot () {
+	export PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
+	export PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
+
+	# Explicitly set $D since it isn't set to anything
+	# before do_install
+	D=${D}
+	useradd_preinst
+}
+
+useradd_sysroot_sstate () {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
+	then
+		useradd_sysroot
+	fi
+}
+
+do_install[prefuncs] += "useradd_sysroot"
+SSTATEPOSTINSTFUNCS += "useradd_sysroot_sstate"
+
+# Recipe parse-time sanity checks
+def update_useradd_after_parse(d):
+	if bb.data.getVar('USERADD_PACKAGES', d) == None:
+		if bb.data.getVar('USERADD_PARAM', d) == None and bb.data.getVar('GROUPADD_PARAM', d) == None:
+			raise bb.build.FuncFailed, "%s inherits useradd but doesn't set USERADD_PARAM or GROUPADD_PARAM" % bb.data.getVar('FILE', d)
+
+python __anonymous() {
+	update_useradd_after_parse(d)
+}
+
+# Return a single [GROUP|USER]ADD_PARAM formatted string which includes the
+# [group|user]add parameters for all packages in this recipe
+def get_all_cmd_params(d, cmd_type):
+	import string
+	
+	localdata = bb.data.createCopy(d)
+	param_type = cmd_type.upper() + "ADD_PARAM_%s"
+	params = []
+
+	pkgs = localdata.getVar('USERADD_PACKAGES', True)
+	if not pkgs:
+		pkgs = localdata.getVar('USERADDPN', True)
+		packages = (localdata.getVar('PACKAGES', True) or "").split()
+		if packages and pkgs not in packages:
+			pkgs = packages[0]
+
+	for pkg in pkgs.split():
+		param = localdata.getVar(param_type % pkg, True)
+		if param:
+			params.append(param)
+
+	return string.join(params, "; ")
+
+# Adds the preinst script into generated packages
+fakeroot python populate_packages_prepend () {
+	def update_useradd_package(pkg):
+		bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
+		localdata = bb.data.createCopy(d)
+		overrides = localdata.getVar("OVERRIDES", True)
+		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
+		bb.data.update_data(localdata)
+
+		"""
+		useradd preinst is appended here because pkg_preinst may be
+		required to execute on the target. Not doing so may cause
+		useradd preinst to be invoked twice, causing unwanted warnings.
+		"""
+		preinst = localdata.getVar('pkg_preinst', True)
+		if not preinst:
+			preinst = '#!/bin/sh\n'
+		preinst += localdata.getVar('useradd_preinst', True)
+		bb.data.setVar('pkg_preinst_%s' % pkg, preinst, d)
+
+	# We add the user/group calls to all packages to allow any package
+	# to contain files owned by the users/groups defined in the recipe.
+	# The user/group addition code is careful not to create duplicate
+	# entries, so this is safe.
+	pkgs = d.getVar('USERADD_PACKAGES', True)
+	if pkgs == None:
+		pkgs = d.getVar('USERADDPN', True)
+		packages = (d.getVar('PACKAGES', True) or "").split()
+		if not pkgs in packages and packages != []:
+			pkgs = packages[0]
+	for pkg in pkgs.split():
+		update_useradd_package(pkg)
+}
-- 
1.7.1



