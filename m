Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 081E672F56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 18:33:47 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3CIXkM3010738
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 12 Apr 2017 19:33:47 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cyN5O-00083i-3K; Wed, 12 Apr 2017 19:33:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 19:33:44 +0100
Message-Id: <1492022024-30940-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH] base-passwd/useradd: Various improvements to useradd with RSS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Apr 2017 18:33:48 -0000

Currently there are multiple issues with useradd:

* If base-passwd rebuilds, it wipes out recipe specific user/group additions
  to sysroots and causes errors
* If recipe A adds a user and recipe B depends on A, it can't see any of the
  users/groups A adds.

This patch changes base-passwd so it always works as a postinst script
within the sysroot and copies in the master files, then runs any
postinst-useradd-* scripts afterwards to add additional user/groups.

The postinst-useradd-* scripts are tweaked so that if /etc/passwd doesn't exist
they just exit, knowning they'll be executed later.

There is a problem where if recipe A adds a user an recipe B depends on A but
doesn't care about users, it may not have a dependency on the useradd/groupadd
tools which would therefore not be available in B's sysroot. We therefore also
tweak postinst-useradd-* scripts so that if the tools aren't present we simply
don't add users. If you need the users, you add a dependency on the tools in the
recipe and they'll be added.

We add postinst-* to SSTATE_SCAN_FILES since almost any postinst script of this
kind is going to need relocation help.

We also ensure that the postinst-useradd script is written into the sstate
object as the current script was only being added in a recipe local way.

Thanks to Peter Kjellerstedt <pkj@axis.com> for some pieces of this patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass                        |  2 +-
 meta/classes/useradd.bbclass                       | 24 +++++++++++++++++++
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb | 28 +++++++++++++++++-----
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index bc0ec54..4e30f3e 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -31,7 +31,7 @@ SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/
 # Archive the sources for many architectures in one deploy folder
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
 
-SSTATE_SCAN_FILES ?= "*.la *-config *_config"
+SSTATE_SCAN_FILES ?= "*.la *-config *_config postinst-*"
 SSTATE_SCAN_CMD ??= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
 SSTATE_SCAN_CMD_NATIVE ??= 'grep -Irl -e ${RECIPE_SYSROOT} -e ${RECIPE_SYSROOT_NATIVE} ${SSTATE_BUILDDIR}'
 
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 1f7afa4..3c9410a 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -106,6 +106,18 @@ useradd_sysroot () {
 	# before do_prepare_recipe_sysroot
 	D=${STAGING_DIR_TARGET}
 
+	# base-passwd's postinst may not have run yet in which case we'll get called later, just exit
+	if [ ! -f $D${sysconfdir}/passwd ]; then
+		exit 0
+	fi
+
+	# Its also possible we may be in a recipe which doesn't have useradd dependencies and hence the
+	# useradd/groupadd tools are unavailable. If there is no dependency, we assume we don't want to
+	# create users in the sysroot
+	if ! command -v useradd; then
+		exit 0
+	fi
+
 	# Add groups and users defined for all recipe packages
 	GROUPADD_PARAM="${@get_all_cmd_params(d, 'groupadd')}"
 	USERADD_PARAM="${@get_all_cmd_params(d, 'useradd')}"
@@ -122,6 +134,7 @@ python useradd_sysroot_sstate () {
     if task == "package_setscene":
         bb.build.exec_func("useradd_sysroot", d)
     elif task == "prepare_recipe_sysroot":
+        # Used to update this recipe's own sysroot so the user/groups are available to do_install
         scriptfile = d.expand("${RECIPE_SYSROOT}${bindir}/postinst-useradd-${PN}")
         bb.utils.mkdirhier(os.path.dirname(scriptfile))
         with open(scriptfile, 'w') as script:
@@ -130,12 +143,23 @@ python useradd_sysroot_sstate () {
             script.write("useradd_sysroot\n")
         os.chmod(scriptfile, 0o755)
         bb.build.exec_func("useradd_sysroot", d)
+    elif task == "populate_sysroot":
+        # Used when installed in dependent task sysroots
+        scriptfile = d.expand("${SYSROOT_DESTDIR}${bindir}/postinst-useradd-${PN}")
+        bb.utils.mkdirhier(os.path.dirname(scriptfile))
+        with open(scriptfile, 'w') as script:
+            script.write("#!/bin/sh\n")
+            bb.data.emit_func("useradd_sysroot", script, d)
+            script.write("useradd_sysroot\n")
+        os.chmod(scriptfile, 0o755)
 }
 
 do_prepare_recipe_sysroot[postfuncs] += "${SYSROOTFUNC}"
 SYSROOTFUNC_class-target = "useradd_sysroot_sstate"
 SYSROOTFUNC = ""
 
+SYSROOT_PREPROCESS_FUNCS += "${SYSROOTFUNC}"
+
 SSTATEPREINSTFUNCS_append_class-target = " useradd_sysroot_sstate"
 
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index e43bc0a..c6be1c1 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -43,16 +43,32 @@ do_install () {
 	install -p -m 644 ${S}/debian/copyright ${D}${docdir}/${BPN}/
 }
 
+basepasswd_sysroot_postinst() {
+#!/bin/sh
+
+# Install passwd.master and group.master to sysconfdir
+install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
+for i in passwd group; do
+	install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/\$i.master \
+		${STAGING_DIR_TARGET}${sysconfdir}/\$i
+done
+
+# Run any useradd postinsts
+for script in ${STAGING_DIR_TARGET}${bindir}/postinst-useradd-*; do
+	if [ -f \$script ]; then
+		\$script
+	fi
+done
+}
+
 SYSROOT_DIRS += "${sysconfdir}"
 SYSROOT_PREPROCESS_FUNCS += "base_passwd_tweaksysroot"
 
 base_passwd_tweaksysroot () {
-	# Install passwd.master and group.master to sysconfdir
-	install -d -m 755 ${SYSROOT_DESTDIR}${sysconfdir}
-	for i in passwd group; do
-		install -p -m 644 ${SYSROOT_DESTDIR}${datadir}/base-passwd/$i.master \
-			${SYSROOT_DESTDIR}${sysconfdir}/$i
-	done
+	mkdir -p ${SYSROOT_DESTDIR}${bindir}
+	dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
+	echo "${basepasswd_sysroot_postinst}" > $dest
+	chmod 0755 $dest
 }
 
 python populate_packages_prepend() {
-- 
2.7.4


