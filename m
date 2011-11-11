Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROmhO-0000NG-Nm
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 09:42:59 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2011 00:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,494,1315206000"; d="scan'208";a="89010334"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.157])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2011 00:36:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 00:36:28 -0800
Message-Id: <3e7120d6a9fd5e46214673d0a6e1085a7314ff42.1321000451.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321000451.git.sgw@linux.intel.com>
References: <cover.1321000451.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 2/9] rootfs_rpm.bbclass: Enable pre and post install scripts
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
X-List-Received-Date: Fri, 11 Nov 2011 08:42:59 -0000

From: Mark Hatle <mark.hatle@windriver.com>

[YOCTO #1755]

We change the want the RPM rootfs install works to install pre and post install
scripts.  The new method uses a script helper that is invoked by RPM outside
of the normal chroot.

The wrapper is dynamically generated prior to the install starting.  It will
check the return code of the script.  If the script fails, it will store a copy
to be executed on the first system boot.  This is similar to the previous
mechanism.

In addition, a line of debug was added to the scripts as written by package_rpm
to list which package and which script for later debugging, if necessary.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass                   |   33 ++++-
 meta/classes/rootfs_rpm.bbclass                    |   25 +---
 .../rpm/rpm/rpm-scriptletexechelper.patch          |  159 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 4 files changed, 199 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2c5545c..2ace053 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -382,13 +382,39 @@ package_install_internal_rpm () {
 	cat ${target_rootfs}/install/install_solution.manifest > ${target_rootfs}/install/total_solution.manifest
 	cat ${target_rootfs}/install/install_multilib_solution.manifest >> ${target_rootfs}/install/total_solution.manifest
 
+	# Construct install scriptlet wrapper
+	cat << EOF > ${WORKDIR}/scriptlet_wrapper
+#!/bin/bash
+
+export PATH="${PATH}"
+export D="${target_rootfs}"
+export OFFLINE_ROOT="\$D"
+export IPKG_OFFLINE_ROOT="\$D"
+export OPKG_OFFLINE_ROOT="\$D"
+
+\$2 \$1/\$3 \$4
+if [ \$? -ne 0 ]; then
+  mkdir -p \$1/etc/rpm-postinsts
+  num=100
+  while [ -e \$1/etc/rpm-postinsts/\${num} ]; do num=\$((num + 1)); done
+  echo "#!\$2" > \$1/etc/rpm-postinsts/\${num}
+  echo "# Arg: \$4" >> \$1/etc/rpm-postinsts/\${num}
+  cat \$1/\$3 >> \$1/etc/rpm-postinsts/\${num}
+  chmod +x \$1/etc/rpm-postinsts/\${num}
+fi
+EOF
+
+	chmod 0755 ${WORKDIR}/scriptlet_wrapper
+
 	# Attempt install
 	${RPM} --root ${target_rootfs} \
 		--predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+		-D "_var ${localstatedir}" \
 		-D "_dbpath ${rpmlibdir}" \
-		--noscripts --notriggers --noparentdirs --nolinktos --replacepkgs \
+		--noparentdirs --nolinktos --replacepkgs \
 		-D "__dbi_txn create nofsync private" \
+		-D "_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper" \
 		-Uhv ${target_rootfs}/install/total_solution.manifest
 }
 
@@ -685,6 +711,7 @@ python write_specfile () {
 			elif script == 'postrm':
 				spec_scriptlets_bottom.append('%%postun -n %s' % splitname)
 				scriptvar = wrap_uninstall(scriptvar)
+			spec_scriptlets_bottom.append('# %s - %s' % (splitname, script))
 			spec_scriptlets_bottom.append(scriptvar)
 			spec_scriptlets_bottom.append('')
 
@@ -762,19 +789,23 @@ python write_specfile () {
 
 	if srcpreinst:
 		spec_scriptlets_top.append('%pre')
+		spec_scriptlets_top.append('# %s - preinst' % srcname)
 		spec_scriptlets_top.append(srcpreinst)
 		spec_scriptlets_top.append('')
 	if srcpostinst:
 		spec_scriptlets_top.append('%post')
+		spec_scriptlets_top.append('# %s - postinst' % srcname)
 		spec_scriptlets_top.append(srcpostinst)
 		spec_scriptlets_top.append('')
 	if srcprerm:
 		spec_scriptlets_top.append('%preun')
+		spec_scriptlets_top.append('# %s - prerm' % srcname)
 		scriptvar = wrap_uninstall(srcprerm)
 		spec_scriptlets_top.append(scriptvar)
 		spec_scriptlets_top.append('')
 	if srcpostrm:
 		spec_scriptlets_top.append('%postun')
+		spec_scriptlets_top.append('# %s - postrm' % srcname)
 		scriptvar = wrap_uninstall(srcpostrm)
 		spec_scriptlets_top.append(scriptvar)
 		spec_scriptlets_top.append('')
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 95e9455..b3875a4 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -20,8 +20,6 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 
-AWKPOSTINSTSCRIPT = "${COREBASE}/scripts/rootfs_rpm-extract-postinst.awk"
-
 RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; package_generate_rpm_conf; "
 RPM_POSTPROCESS_COMMANDS = ""
 
@@ -108,19 +106,9 @@ EOF
 
 	${ROOTFS_POSTINSTALL_COMMAND}
 
-	mkdir -p ${IMAGE_ROOTFS}/etc/rpm-postinsts/
-	${RPM} --root ${IMAGE_ROOTFS} -D '_dbpath ${rpmlibdir}' -qa \
-		-D "__dbi_txn create nofsync private" \
-		--qf 'Name: %{NAME}\n%|POSTIN?{postinstall scriptlet%|POSTINPROG?{ (using %{POSTINPROG})}|:\n%{POSTIN}\n}:{%|POSTINPROG?{postinstall program: %{POSTINPROG}\n}|}|' \
-		> ${IMAGE_ROOTFS}/etc/rpm-postinsts/combined
-	awk -f ${AWKPOSTINSTSCRIPT} < ${IMAGE_ROOTFS}/etc/rpm-postinsts/combined
-	rm ${IMAGE_ROOTFS}/etc/rpm-postinsts/combined	
-
-	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*.sh; do
-		if [ -f $i ] && sh $i; then
-			# rm $i
-			mv $i $i.done
-		fi
+	# Report delayed package scriptlets
+	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*; do
+		echo "Delayed package scriptlet: `head -n 3 $i | tail -n 1`"
 	done
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
@@ -128,11 +116,10 @@ EOF
 	i=\$i
 	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure << EOF
 #!/bin/sh
-for i in /etc/rpm-postinsts/*.sh; do
+for i in /etc/rpm-postinsts/*; do
 	echo "Running postinst $i..."
-	if [ -f $i ] && sh $i; then
-		# rm $i
-		mv $i $i.done
+	if [ -f $i ] && $i; then
+		rm $i
 	else
 		echo "ERROR: postinst $i failed."
 	fi
diff --git a/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
new file mode 100644
index 0000000..e4db0e4
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch
@@ -0,0 +1,159 @@
+Enable a cross-install scriptlet helper.
+
+The helper is called from outside of the chroot with the arguments:
+
+<root> <prog> <script> <arg1> [<arg2> ... <argN>]
+
+The helper script is used by oe-core to facilitate shell script actions that
+can not be run from within a chroot on a foreign target system during a
+cross install.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff -ur rpm-5.4.0.orig/lib/psm.c rpm-5.4.0/lib/psm.c
+--- rpm-5.4.0.orig/lib/psm.c	2010-12-29 07:42:11.000000000 -0600
++++ rpm-5.4.0/lib/psm.c	2011-11-08 13:38:48.132791154 -0600
+@@ -792,6 +792,10 @@
+     int xx;
+     int i;
+ 
++#ifdef RPM_VENDOR_POKY
++    const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++#endif
++    
+     if (psm->sstates != NULL && ix >= 0 && ix < RPMSCRIPT_MAX)
+ 	ssp = psm->sstates + ix;
+     if (ssp != NULL)
+@@ -858,14 +862,29 @@
+ 		(F_ISSET(psm, UNORDERED) ? "a" : ""));
+ 
+     if (Phe->p.argv == NULL) {
+-	argv = alloca(5 * sizeof(*argv));
+-	argv[0] = "/bin/sh";
+-	argc = 1;
++	argv = alloca(7 * sizeof(*argv));
++	argc = 0;
++    } else {
++	argv = alloca((Phe->c + 6) * sizeof(*argv));
++	argc = 0;
++    }
++
++#ifdef RPM_VENDOR_POKY
++    if (scriptletWrapper && *scriptletWrapper) {
++        argv[argc++] = scriptletWrapper;
++	argv[argc] = rpmtsRootDir(ts);
++	if (!argv[argc] || !*argv[argc])
++	   argv[argc] = "/";
++	argc++;
++    }
++#endif
++
++    if (Phe->p.argv == NULL) {
++        argv[argc++] = "/bin/sh";
+ 	ldconfig_done = 0;
+     } else {
+-	argv = alloca((Phe->c + 4) * sizeof(*argv));
+-	memcpy(argv, Phe->p.argv, Phe->c * sizeof(*argv));
+-	argc = Phe->c;
++	memcpy((argv + argc), Phe->p.argv, Phe->c * sizeof(*argv));
++	argc += Phe->c;
+ 	ldconfig_done = (ldconfig_path && !strcmp(argv[0], ldconfig_path)
+ 		? 1 : 0);
+     }
+@@ -916,7 +935,12 @@
+ 	    goto exit;
+ 
+ 	if (rpmIsDebug() &&
+-	    (!strcmp(argv[0], "/bin/sh") || !strcmp(argv[0], "/bin/bash")))
++	    (!strcmp(argv[0], "/bin/sh") || !strcmp(argv[0], "/bin/bash"))
++#ifdef RPM_VENDOR_POKY
++	    || (scriptletWrapper && *scriptletWrapper && !strcmp(argv[1], "/bin/sh"))
++	    || (scriptletWrapper && *scriptletWrapper && !strcmp(argv[1], "/bin/bash"))
++#endif
++	   )
+ 	{
+ 	    static const char set_x[] = "set -x\n";
+ 	    nw = Fwrite(set_x, sizeof(set_x[0]), sizeof(set_x)-1, fd);
+@@ -1051,12 +1075,22 @@
+ 
+ 	{   const char * rootDir = rpmtsRootDir(ts);
+ 	    if (!rpmtsChrootDone(ts) && rootDir != NULL &&
++#ifdef RPM_VENDOR_POKY
++		!(scriptletWrapper && *scriptletWrapper) &&
++#endif
+ 		!(rootDir[0] == '/' && rootDir[1] == '\0'))
+ 	    {
+ 		/*@-modobserver@*/
+ 		xx = Chroot(rootDir);
+ 		/*@=modobserver@*/
+ 	    }
++#ifdef RPM_VENDOR_POKY
++	    if (!rpmtsChrootDone(ts) && rootDir != NULL &&
++		(scriptletWrapper && *scriptletWrapper) &&
++		!(rootDir[0] == '/' && rootDir[1] == '\0'))
++		xx = Chdir(rootDir);
++	    else 
++#endif
+ 	    xx = Chdir("/");
+ 	    rpmlog(RPMLOG_DEBUG, D_("%s: %s(%s)\texecv(%s) pid %d\n"),
+ 			psm->stepName, sln, NVRA,
+@@ -2961,6 +2995,13 @@
+     case PSM_SCRIPT:	/* Run current package scriptlets. */
+ 	/* XXX running %verifyscript/%sanitycheck doesn't have psm->te */
+     {	rpmtxn _parent = (psm && psm->te ? psm->te->txn : NULL);
++
++#ifdef RPM_VENDOR_POKY
++        const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++	if (scriptletWrapper && *scriptletWrapper)
++	     rc = rpmpsmNext(psm, PSM_CHROOT_OUT);
++#endif
++
+ 	xx = rpmtxnBegin(rpmtsGetRdb(ts), _parent, NULL);
+ 	rc = runInstScript(psm);
+ 	if (rc)
+@@ -2968,11 +3009,24 @@
+ 	else
+ 	     xx = rpmtxnCommit(rpmtsGetRdb(ts)->db_txn);
+ 	rpmtsGetRdb(ts)->db_txn = NULL;
++#ifdef RPM_VENDOR_POKY
++	if (scriptletWrapper && *scriptletWrapper)
++	     rc = rpmpsmNext(psm, PSM_CHROOT_IN);
++#endif
+     }	break;
+     case PSM_TRIGGERS:
+ 	/* Run triggers in other package(s) this package sets off. */
+ 	if (rpmtsFlags(ts) & RPMTRANS_FLAG_TEST)	break;
++#ifdef RPM_VENDOR_POKY
++        const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++	if (scriptletWrapper && *scriptletWrapper)
++	     rc = rpmpsmNext(psm, PSM_CHROOT_OUT);
++#endif
+ 	rc = runTriggers(psm);
++#ifdef RPM_VENDOR_POKY
++	if (scriptletWrapper && *scriptletWrapper)
++	     rc = rpmpsmNext(psm, PSM_CHROOT_IN);
++#endif
+ 	break;
+     case PSM_IMMED_TRIGGERS:
+ 	/* Run triggers in this package other package(s) set off. */
+@@ -2982,7 +3036,18 @@
+ 	    F_SET(psm, GOTTRIGGERS);
+ 	}
+ 	if (psm->triggers != NULL)
++#ifdef RPM_VENDOR_POKY
++	{
++            const char * scriptletWrapper = rpmExpand("%{?_cross_scriptlet_wrapper}", NULL);
++	    if (scriptletWrapper && *scriptletWrapper)
++	         rc = rpmpsmNext(psm, PSM_CHROOT_OUT);
++#endif
+ 	    rc = runImmedTriggers(psm);
++#ifdef RPM_VENDOR_POKY
++	    if (scriptletWrapper && *scriptletWrapper)
++	         rc = rpmpsmNext(psm, PSM_CHROOT_IN);
++	}
++#endif
+ 	break;
+ 
+     case PSM_RPMIO_FLAGS:
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index bbef0be..f8fe836 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r22"
+PR = "r23"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -63,6 +63,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-fileclass.patch \
 	   file://rpm-canonarch.patch \
 	   file://rpm-no-loopmsg.patch \
+	   file://rpm-scriptletexechelper.patch \
 	   file://pythondeps.sh \
 	  "
 
-- 
1.7.6.4



