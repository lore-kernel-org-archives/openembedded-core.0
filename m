Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TDzzZ-0001u8-6S
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 17:45:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8IFX05S001617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 08:33:00 -0700 (PDT)
Received: from usp-ub10.wrs.com (128.224.163.69) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 18 Sep 2012 08:32:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Sep 2012 23:25:10 +0800
Message-ID: <0ffb700ac0f8ae5e2d0f03ab3f30ae52e5973779.1347976732.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1347976732.git.liezhi.yang@windriver.com>
References: <cover.1347976732.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] opkg svn: respect to the arch priority
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
X-List-Received-Date: Tue, 18 Sep 2012 15:45:41 -0000
Content-Type: text/plain

This is for fixing the problem:
1) bitbake core-image-sato-sdk with MACHINE=qemux86
2) bitbake core-image-sato with with MACHINE=crownbay

The qemux86's PACKAGE_ARCH is i586, the crownbay's is core2, but several
i586 packages will be installed into crownbay's rootfs though there are
core2 packages. For example, there are:

xserver-xorg*_1.11.2-r7_i586.ipk
xserver-xorg*_1.9.3-r1_core2.ipk

The crownbay.conf says:
PREFERRED_VERSION_xserver-xorg ?= "1.9.3"

What the crownbay's image needs is xserver-xorg*_1.9.3-r1_core2.ipk, but
the xserver-xorg*_1.11.2-r7_i586.ipk will be installed, this is
incorrect.

This is caused by opkg's selecting mechanism: when more than one
candidate is found, it will use the higher version one and ignore the
arch priority.

we have several conf files which set the PREFERRED_VERSION_pkg = "..." ,
but there is no such a mechanism which can let us tell the opkg to
install the preferred version. When the preferred version is higher,
this is OK, but if the preferred version is lower, there would be
problems:

1) Most of the packages are core2 in the image, but several of them are
   i586, though we have built the core2 ones, this seems strange.

2) What's worse is that the image may not work since the preferred
   version pkg is not installed.

We have set the arch priority clearly in the opkg.conf, I think that
respect to the arch priority is reasonable during the image generation.

Add the "--select-higher-version" option to let the user have another
choice, the default is no.

[YOCTO #2575]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../opkg/opkg/select_higher_version.patch          |  102 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    3 +-
 2 files changed, 104 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/select_higher_version.patch

diff --git a/meta/recipes-devtools/opkg/opkg/select_higher_version.patch b/meta/recipes-devtools/opkg/opkg/select_higher_version.patch
new file mode 100644
index 0000000..46d11b0
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/select_higher_version.patch
@@ -0,0 +1,102 @@
+Add the --select-higher-version option
+
+If there were more than one candidate which had the same pkg name in the
+candidate list, for example, the same pkg with different versions, then
+it would use the last one which was the highest version one in the past,
+but it will use the higher arch priority one now.
+
+Add the "--select-higher-version" option to let it use the higher
+version package when enabled. the default is no.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libopkg/opkg_conf.h |    1 +
+ libopkg/pkg_hash.c  |   18 +++++++++++++++---
+ src/opkg-cl.c       |    9 +++++++++
+ 3 files changed, 25 insertions(+), 3 deletions(-)
+
+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
+--- a/libopkg/opkg_conf.h
++++ b/libopkg/opkg_conf.h
+@@ -77,6 +77,7 @@ struct opkg_conf
+      int force_removal_of_essential_packages;
+      int force_postinstall;
+      int force_remove;
++     int select_higher_version;
+      int check_signature;
+      int nodeps; /* do not follow dependencies */
+      char *offline_root;
+diff --git a/libopkg/pkg_hash.c b/libopkg/pkg_hash.c
+--- a/libopkg/pkg_hash.c
++++ b/libopkg/pkg_hash.c
+@@ -376,10 +376,22 @@ pkg_hash_fetch_best_installation_candidate(abstract_pkg_t *apkg,
+           if (constraint_fcn(matching, cdata)) {
+              opkg_msg(DEBUG, "Candidate: %s %s.\n",
+ 			     matching->name, matching->version) ;
+-             good_pkg_by_name = matching;
+ 	     /* It has been provided by hand, so it is what user want */
+-             if (matching->provided_by_hand == 1)
+-                break;
++             if (matching->provided_by_hand == 1) {
++                 good_pkg_by_name = matching;
++                 break;
++             }
++             /* Respect to the arch priorities when given alternatives */
++             if (good_pkg_by_name && !conf->select_higher_version) {
++                 if (matching->arch_priority >= good_pkg_by_name->arch_priority) {
++                     good_pkg_by_name = matching;
++                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
++                         matching->name, matching->version) ;
++                 } else
++                     opkg_msg(DEBUG, "%s %s wins by priority.\n",
++                         good_pkg_by_name->name, good_pkg_by_name->version) ;
++             } else
++                 good_pkg_by_name = matching;
+           }
+      }
+ 
+diff --git a/src/opkg-cl.c b/src/opkg-cl.c
+--- a/src/opkg-cl.c
++++ b/src/opkg-cl.c
+@@ -42,6 +42,7 @@ enum {
+ 	ARGS_OPT_FORCE_SPACE,
+ 	ARGS_OPT_FORCE_POSTINSTALL,
+ 	ARGS_OPT_FORCE_REMOVE,
++	ARGS_OPT_SELECT_HIGHER_VERSION,
+ 	ARGS_OPT_ADD_ARCH,
+ 	ARGS_OPT_ADD_DEST,
+ 	ARGS_OPT_NOACTION,
+@@ -83,6 +84,8 @@ static struct option long_options[] = {
+ 	{"force_postinstall", 0, 0, ARGS_OPT_FORCE_POSTINSTALL},
+ 	{"force-remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
+ 	{"force_remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
++	{"select-higher-version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
++	{"select_higher_version", 0, 0, ARGS_OPT_SELECT_HIGHER_VERSION},
+ 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
+ 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
+ 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
+@@ -173,6 +176,9 @@ args_parse(int argc, char *argv[])
+ 		case ARGS_OPT_FORCE_REMOVE:
+ 			conf->force_remove = 1;
+ 			break;
++		case ARGS_OPT_SELECT_HIGHER_VERSION:
++			conf->select_higher_version = 1;
++			break;
+ 		case ARGS_OPT_NODEPS:
+ 			conf->nodeps = 1;
+ 			break;
+@@ -271,6 +277,9 @@ usage()
+ 	printf("\t--offline-root <dir>	offline installation of packages.\n");
+ 	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
+ 	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
++	printf("\t--select-higher-version\t 	Use the higher version package rather\n");
++	printf("\t				than the higher arch priority one if more\n");
++	printf("\t				than one candidate is found.\n");
+ 
+ 	printf("\nForce Options:\n");
+ 	printf("\t--force-depends		Install/remove despite failed dependencies\n");
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 4146b7e..e21bcd5 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -7,6 +7,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://offline_postinstall.patch\
            file://track_parents.patch \
            file://conf_override.patch \
+           file://select_higher_version.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -14,4 +15,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
-- 
1.7.1



