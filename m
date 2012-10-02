Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ2Ov-0001kO-CB for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 15:20:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92D7eei015761;
	Tue, 2 Oct 2012 14:07:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15584-01; Tue,  2 Oct 2012 14:07:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92D7WFX015755
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 14:07:33 +0100
Message-ID: <1349183256.15753.145.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 02 Oct 2012 14:07:36 +0100
In-Reply-To: <20121002080430.GF3454@jama.jama.net>
References: <1348866282-30437-1-git-send-email-koen@dominion.thruhere.net>
	<1348867656.15753.86.camel@ted>
	<BCD7AC26-F8DD-4A25-92CC-9E8324C9AC09@dominion.thruhere.net>
	<1349097681.15753.100.camel@ted> <20121002080430.GF3454@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: [PATCH] opkg: Convert select-higher-version option to prefer-arch-to-version
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
X-List-Received-Date: Tue, 02 Oct 2012 13:20:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This converts the option to maintain the existing behaviour unless the option is
specified. We do specify the option during the builds themselves to ensure what
the users expects is built.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 019bd7c..4bf1b10 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -139,7 +139,7 @@ package_install_internal_ipk() {
 
 	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
 
-	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite --force_postinstall"
+	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite --force_postinstall --prefer-arch-to-version"
 
 	opkg-cl ${ipkg_args} update
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 46e8d60..9d716fb 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -14,9 +14,9 @@ do_rootfs[recrdeptask] += "do_package_write_ipk"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
-IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
+IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite --prefer-arch-to-version"
 # The _POST version also works when constructing the matching SDK
-IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force-overwrite"
+IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force-overwrite --prefer-arch-to-version"
 
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
 
diff --git a/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch b/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
index 46d11b0..a9b039c 100644
--- a/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
+++ b/meta/recipes-devtools/opkg/opkg/0008-select_higher_version.patch
@@ -1,12 +1,9 @@
-Add the --select-higher-version option
+Add the --prefer-arch-to-version option
 
 If there were more than one candidate which had the same pkg name in the
 candidate list, for example, the same pkg with different versions, then
 it would use the last one which was the highest version one in the past,
-but it will use the higher arch priority one now.
-
-Add the "--select-higher-version" option to let it use the higher
-version package when enabled. the default is no.
+but it will use the higher arch priority when this option is specified.
 
 Upstream-Status: Pending
 
@@ -24,7 +21,7 @@ diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
       int force_removal_of_essential_packages;
       int force_postinstall;
       int force_remove;
-+     int select_higher_version;
++     int prefer_arch_to_version;
       int check_signature;
       int nodeps; /* do not follow dependencies */
       char *offline_root;
@@ -44,7 +41,7 @@ diff --git a/libopkg/pkg_hash.c b/libopkg/pkg_hash.c
 +                 break;
 +             }
 +             /* Respect to the arch priorities when given alternatives */
-+             if (good_pkg_by_name && !conf->select_higher_version) {
++             if (good_pkg_by_name && conf->prefer_arch_to_version) {
 +                 if (matching->arch_priority >= good_pkg_by_name->arch_priority) {
 +                     good_pkg_by_name = matching;
 +                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
@@ -64,7 +61,7 @@ diff --git a/src/opkg-cl.c b/src/opkg-cl.c
  	ARGS_OPT_FORCE_SPACE,
  	ARGS_OPT_FORCE_POSTINSTALL,
  	ARGS_OPT_FORCE_REMOVE,
-+	ARGS_OPT_SELECT_HIGHER_VERSION,
++	ARGS_OPT_PREFER_ARCH_TO_VERSION,
  	ARGS_OPT_ADD_ARCH,
  	ARGS_OPT_ADD_DEST,
  	ARGS_OPT_NOACTION,
@@ -72,8 +69,8 @@ diff --git a/src/opkg-cl.c b/src/opkg-cl.c
  	{"force_postinstall", 0, 0, ARGS_OPT_FORCE_POSTINSTALL},
  	{"force-remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
  	{"force_remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
-+	{"select-higher-version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
-+	{"select_higher_version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
++	{"prefer-arch-to-version", 0, 0, ARGS_OPT_PREFER_ARCH_TO_VERSION},
++	{"prefer-arch-to-version", 0, 0, ARGS_OPT_PREFER_ARCH_TO_VERSION},
  	{"noaction", 0, 0, ARGS_OPT_NOACTION},
  	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
  	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
@@ -81,8 +78,8 @@ diff --git a/src/opkg-cl.c b/src/opkg-cl.c
  		case ARGS_OPT_FORCE_REMOVE:
  			conf->force_remove = 1;
  			break;
-+		case ARGS_OPT_SELECT_HIGHER_VERSION:
-+			conf->select_higher_version = 1;
++		case ARGS_OPT_PREFER_ARCH_TO_VERSION:
++			conf->prefer_arch_to_version = 1;
 +			break;
  		case ARGS_OPT_NODEPS:
  			conf->nodeps = 1;
@@ -91,8 +88,8 @@ diff --git a/src/opkg-cl.c b/src/opkg-cl.c
  	printf("\t--offline-root <dir>	offline installation of packages.\n");
  	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
  	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
-+	printf("\t--select-higher-version\t 	Use the higher version package rather\n");
-+	printf("\t				than the higher arch priority one if more\n");
++	printf("\t--prefer-arch-to-version\t 	Use the architecture priority package rather\n");
++	printf("\t				than the higher version one if more\n");
 +	printf("\t				than one candidate is found.\n");
  
  	printf("\nForce Options:\n");
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 59bb2d9..4e83cfb 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -19,4 +19,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.6"
+PR = "${INC_PR}.7"




