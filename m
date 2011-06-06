Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbM-0005m5-Qz
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:53 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7609023"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:20 -0700
Message-Id: <e72eef2d6a6df8f8ce4f2a3b1471fe3da443e2e3.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [CONSOLIDATED PULL 16/20] useradd.bbclass: new class for managing user/group permissions
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:53 -0000

From: Scott Garman <scott.a.garman@intel.com>

This class is to be used by recipes that need to set up specific
user/group accounts and set custom file/directory permissions.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/classes/useradd.bbclass |  163 ++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 163 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/useradd.bbclass

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
new file mode 100644
index 0000000..3f07e5e
--- /dev/null
+++ b/meta/classes/useradd.bbclass
@@ -0,0 +1,163 @@
+USERADDPN ?= "${PN}"
+
+# base-passwd-cross provides the default passwd and group files in the
+# target sysroot, and shadow-native provides the utilities needed to
+# add and modify user and group accounts
+DEPENDS_append = " base-passwd shadow-native"
+RDEPENDS_${USERADDPN}_append = " base-passwd shadow"
+
+PSEUDO="${STAGING_DIR_NATIVE}/usr/bin/pseudo"
+export PSEUDO
+PSEUDO_LOCALSTATEDIR="${STAGING_DIR_TARGET}/var/pseudo"
+export PSEUDO_LOCALSTATEDIR
+PSEUDO_PASSWD = "${STAGING_DIR_TARGET}"
+export PSEUDO_PASSWD
+
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
+	PSEUDO=""
+
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
+	pkgs = bb.data.getVar('USERADD_PACKAGES', d, 1)
+	if pkgs == None:
+		pkgs = bb.data.getVar('USERADDPN', d, 1)
+		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
+		if not pkgs in packages and packages != []:
+			pkgs = packages[0]
+
+	for pkg in pkgs.split():
+		param = bb.data.getVar(param_type % pkg, localdata, 1)
+		params.append(param)
+
+	return string.join(params, "; ")
+
+# Adds the preinst script into generated packages
+fakeroot python populate_packages_prepend () {
+	def update_useradd_package(pkg):
+		bb.debug(1, 'adding user/group calls to preinst for %s' % pkg)
+		localdata = bb.data.createCopy(d)
+		overrides = bb.data.getVar("OVERRIDES", localdata, 1)
+		bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
+		bb.data.update_data(localdata)
+
+		"""
+		useradd preinst is appended here because pkg_preinst may be
+		required to execute on the target. Not doing so may cause
+		useradd preinst to be invoked twice, causing unwanted warnings.
+		"""
+		preinst = bb.data.getVar('pkg_preinst', localdata, 1)
+		if not preinst:
+			preinst = '#!/bin/sh\n'
+		preinst += bb.data.getVar('useradd_preinst', localdata, 1)
+		bb.data.setVar('pkg_preinst_%s' % pkg, preinst, d)
+
+	# We add the user/group calls to all packages to allow any package
+	# to contain files owned by the users/groups defined in the recipe.
+	# The user/group addition code is careful not to create duplicate
+	# entries, so this is safe.
+	pkgs = bb.data.getVar('USERADD_PACKAGES', d, 1)
+	if pkgs == None:
+		pkgs = bb.data.getVar('USERADDPN', d, 1)
+		packages = (bb.data.getVar('PACKAGES', d, 1) or "").split()
+		if not pkgs in packages and packages != []:
+			pkgs = packages[0]
+	for pkg in pkgs.split():
+		update_useradd_package(pkg)
+}
-- 
1.7.3.4



