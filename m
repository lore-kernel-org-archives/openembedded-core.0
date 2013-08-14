Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF4C6B7AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTTdG021929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:29:29 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:30:08 -0500
Message-ID: <1376512209-11622-11-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 10/11] opkg: Add support for excluding packages from the install
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:28 -0000
Content-Type: text/plain

This adds a new argument to opkg-cl, --add-exclude, which is
used to add package names to the list of packages to exclude
from the install.

If an excluded package is needed for the install to resolve,
an error will be generated.  Recommended packages will not
generate an error.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/opkg/opkg/add-exclude.patch | 99 +++++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb            |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/add-exclude.patch

diff --git a/meta/recipes-devtools/opkg/opkg/add-exclude.patch b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
new file mode 100644
index 0000000..ca433a5
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/add-exclude.patch
@@ -0,0 +1,99 @@
+Add a way to exclude specific packages from the install
+
+When an excluded package is required by another package an error
+will be generated.  If the excluded package is only recommended,
+no error will be generated.
+
+The lifespan of the exclude_list covers the execution of the process,
+so there is no need to free the data.
+
+Upstream-status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: trunk/libopkg/opkg_conf.h
+===================================================================
+--- trunk.orig/libopkg/opkg_conf.h
++++ trunk/libopkg/opkg_conf.h
+@@ -49,6 +49,8 @@ struct opkg_conf
+      pkg_dest_list_t pkg_dest_list;
+      pkg_dest_list_t tmp_dest_list;
+      nv_pair_list_t arch_list;
++     size_t exclude_count;
++     char ** exclude_list;
+ 
+      int restrict_to_default_dest;
+      pkg_dest_t *default_dest;
+Index: trunk/libopkg/pkg_depends.c
+===================================================================
+--- trunk.orig/libopkg/pkg_depends.c
++++ trunk/libopkg/pkg_depends.c
+@@ -212,6 +212,22 @@ pkg_hash_fetch_unsatisfied_dependencies(
+ 			 continue;
+ 		    }
+ 
++		    /* Check for excluded packages */
++		    if (satisfying_pkg != NULL && conf->exclude_list) {
++			int i, exclude = 0;
++			for (i = 0; i < conf->exclude_count; i++) {
++			    if (!strcmp(satisfying_pkg->name, conf->exclude_list[i])) {
++				opkg_msg(NOTICE, "%s: exclude required package %s"
++					"at users request\n",
++					pkg->name, satisfying_pkg->name);
++				exclude = 1;
++				break;
++			    }
++			}
++			if (exclude)
++			    continue;
++		    }
++
+ 		    opkg_msg(DEBUG, "satisfying_pkg=%p\n", satisfying_pkg);
+ 		    if (satisfying_pkg != NULL) {
+ 			 satisfier_entry_pkg = satisfying_pkg;
+Index: trunk/src/opkg-cl.c
+===================================================================
+--- trunk.orig/src/opkg-cl.c
++++ trunk/src/opkg-cl.c
+@@ -45,6 +45,7 @@ enum {
+ 	ARGS_OPT_PREFER_ARCH_TO_VERSION,
+ 	ARGS_OPT_ADD_ARCH,
+ 	ARGS_OPT_ADD_DEST,
++	ARGS_OPT_ADD_EXCLUDE,
+ 	ARGS_OPT_NOACTION,
+ 	ARGS_OPT_DOWNLOAD_ONLY,
+ 	ARGS_OPT_NODEPS,
+@@ -95,6 +96,7 @@ static struct option long_options[] = {
+ 	{"offline-root", 1, 0, 'o'},
+ 	{"add-arch", 1, 0, ARGS_OPT_ADD_ARCH},
+ 	{"add-dest", 1, 0, ARGS_OPT_ADD_DEST},
++	{"add-exclude", 1, 0, ARGS_OPT_ADD_EXCLUDE},
+ 	{"test", 0, 0, ARGS_OPT_NOACTION},
+ 	{"tmp-dir", 1, 0, 't'},
+ 	{"tmp_dir", 1, 0, 't'},
+@@ -198,6 +200,17 @@ args_parse(int argc, char *argv[])
+ 			}
+ 			free(tuple);
+ 			break;
++		case ARGS_OPT_ADD_EXCLUDE:
++			tuple = xstrdup(optarg);
++			if (!conf->exclude_list) {
++				conf->exclude_count = 1;
++				conf->exclude_list = malloc(sizeof(char *) * conf->exclude_count);
++				conf->exclude_list[conf->exclude_count - 1] = tuple;
++			} else {
++				conf->exclude_count++;
++				conf->exclude_list = realloc(conf->exclude_list, sizeof(char *) * conf->exclude_count);
++				conf->exclude_list[conf->exclude_count - 1] = tuple;
++			}
+ 		case ARGS_OPT_NOACTION:
+ 			conf->noaction = 1;
+ 			break;
+@@ -282,6 +295,7 @@ usage()
+ 	printf("\t--offline-root <dir>	offline installation of packages.\n");
+ 	printf("\t--add-arch <arch>:<prio>	Register architecture with given priority\n");
+ 	printf("\t--add-dest <name>:<path>	Register destination with given path\n");
++	printf("\t--add-exclude <name>		Register package to be excluded from install\n");
+ 	printf("\t--prefer-arch-to-version\t 	Use the architecture priority package rather\n");
+ 	printf("\t				than the higher version one if more\n");
+ 	printf("\t				than one candidate is found.\n");
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index dbfca0f..bc10491 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -2,6 +2,7 @@ require opkg.inc
 
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://no-install-recommends.patch \
+           file://add-exclude.patch \
 "
 
 S = "${WORKDIR}/trunk"
-- 
1.8.1.2.545.g2f19ada


