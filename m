Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T9CFL-00020S-CZ
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 11:50:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q859bhio006499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 02:37:43 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 5 Sep 2012 02:37:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 17:31:40 +0800
Message-ID: <4a36b4005fc384ac817023873b2febc854c4415d.1346837268.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1346837268.git.liezhi.yang@windriver.com>
References: <cover.1346837268.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [RFC PATCH 1/2] opkg svn: Add the --force-arch option
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
X-List-Received-Date: Wed, 05 Sep 2012 09:50:07 -0000
Content-Type: text/plain

If there are more than one candidate which has the same pkg name in the
candidate list, for example, the same pkg with different versions, then
it will use the last one which is the highest version in the list

Add the "--force-arch" (just like the --force-downgrade) option to let
it use the higher arch priority package when enabled. the default is no.

[YOCTO #2575]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/opkg/opkg/force-arch.patch |  103 ++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb           |    3 +-
 2 files changed, 105 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/force-arch.patch

diff --git a/meta/recipes-devtools/opkg/opkg/force-arch.patch b/meta/recipes-devtools/opkg/opkg/force-arch.patch
new file mode 100644
index 0000000..4f4e9c9
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/force-arch.patch
@@ -0,0 +1,103 @@
+Add the --force-arch option
+
+If there are more than one candidate which has the same pkg name in the
+candidate list, for example, the same pkg with different versions, then
+it will use the last one which is the highest version in the list
+
+Add the "--force-arch" (just like the --force-downgrade) option to let
+it use the higher arch priority package when enabled. the default is no.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libopkg/opkg_conf.h |    1 +
+ libopkg/pkg_hash.c  |   18 +++++++++++++++---
+ src/opkg-cl.c       |    8 ++++++++
+ 3 files changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
+index 3a60bc5..c425219 100644
+--- a/libopkg/opkg_conf.h
++++ b/libopkg/opkg_conf.h
+@@ -77,6 +77,7 @@ struct opkg_conf
+      int force_removal_of_essential_packages;
+      int force_postinstall;
+      int force_remove;
++     int force_arch;
+      int check_signature;
+      int nodeps; /* do not follow dependencies */
+      char *offline_root;
+diff --git a/libopkg/pkg_hash.c b/libopkg/pkg_hash.c
+index a99cf6b..63a67d6 100644
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
++             if (good_pkg_by_name && conf->force_arch) {
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
+index 1b927e5..4d3995f 100644
+--- a/src/opkg-cl.c
++++ b/src/opkg-cl.c
+@@ -42,6 +42,7 @@ enum {
+ 	ARGS_OPT_FORCE_SPACE,
+ 	ARGS_OPT_FORCE_POSTINSTALL,
+ 	ARGS_OPT_FORCE_REMOVE,
++	ARGS_OPT_FORCE_ARCH,
+ 	ARGS_OPT_ADD_ARCH,
+ 	ARGS_OPT_ADD_DEST,
+ 	ARGS_OPT_NOACTION,
+@@ -83,6 +84,8 @@ static struct option long_options[] = {
+ 	{"force_postinstall", 0, 0, ARGS_OPT_FORCE_POSTINSTALL},
+ 	{"force-remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
+ 	{"force_remove", 0, 0, ARGS_OPT_FORCE_REMOVE},
++	{"force-arch", 0, 0, ARGS_OPT_FORCE_ARCH},
++	{"force_arch", 0, 0, ARGS_OPT_FORCE_ARCH},
+ 	{"noaction", 0, 0, ARGS_OPT_NOACTION},
+ 	{"download-only", 0, 0, ARGS_OPT_DOWNLOAD_ONLY},
+ 	{"nodeps", 0, 0, ARGS_OPT_NODEPS},
+@@ -173,6 +176,9 @@ args_parse(int argc, char *argv[])
+ 		case ARGS_OPT_FORCE_REMOVE:
+ 			conf->force_remove = 1;
+ 			break;
++		case ARGS_OPT_FORCE_ARCH:
++			conf->force_arch= 1;
++			break;
+ 		case ARGS_OPT_NODEPS:
+ 			conf->nodeps = 1;
+ 			break;
+@@ -281,6 +287,8 @@ usage()
+ 	printf("\t--force-space		Disable free space checks\n");
+ 	printf("\t--force-postinstall	Run postinstall scripts even in offline mode\n");
+ 	printf("\t--force-remove	Remove package even if prerm script fails\n");
++	printf("\t--force-arch		Use the higher arch priority package rather than the\n");
++	printf("\t			higher version one if more than one candidate is found.\n");
+ 	printf("\t--noaction		No action -- test only\n");
+ 	printf("\t--download-only	No action -- download only\n");
+ 	printf("\t--nodeps		Do not follow dependencies\n");
+-- 
+1.7.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index a0667ac..4922d2a 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -7,6 +7,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://offline_postinstall.patch\
            file://track_parents.patch \
            file://conf_override.patch \
+           file://force-arch.patch \
 "
 
 S = "${WORKDIR}/trunk"
@@ -14,4 +15,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
-- 
1.7.1



