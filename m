Return-Path: <jobol@nonadev.net>
Received: from erza.lautre.net (erza.lautre.net [80.67.160.89])
	by mail.openembedded.org (Postfix) with ESMTP id 610C46025E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 09:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by erza.lautre.net (Postfix) with ESMTP id 3CDB2F7121;
	Mon, 13 Mar 2017 10:57:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1489399053;
	bh=XGw4lWhLrqATnwFSRHDKo74qBQ61iN8dGILVUlsu08Q=;
	h=From:To:Cc:Subject:Date;
	b=rFazyIjXgEi+S3EZWFzGz6/04wlytF31y6jl9kvMYvKJCHyAL/WUhCMXm4EVBiXr1
	pSyddEwH9IqNNbGcan0l5g6/5bAna6NIjD8wttp4EsiZEMnZaieRZGb4KJCpVS4Ep7
	kniVTvGj8pv+2GEkQD9aFba7u179htwId6Xl1pio=
X-Virus-Scanned: Debian amavisd-new at erza.lautre.net
X-Spam-Flag: NO
X-Spam-Score: -3
X-Spam-Level: 
X-Spam-Status: No, score=-3 tagged_above=-10 required=5.31
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1] autolearn=ham autolearn_force=no
Received: from erza.lautre.net ([127.0.0.1])
	by localhost (erza.admin.lautre.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id E_4WD_u1uEfJ; Mon, 13 Mar 2017 10:57:29 +0100 (CET)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	by erza.lautre.net (Postfix) with ESMTPA id C8BBFF711F;
	Mon, 13 Mar 2017 10:57:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1489399049;
	bh=XGw4lWhLrqATnwFSRHDKo74qBQ61iN8dGILVUlsu08Q=;
	h=From:To:Cc:Subject:Date;
	b=uCCcDmQ4RbIgdMt+2fJzA70M8Y3Dp+8Bqm/8CuL86sT8YTCVMCY1aOygWsLP9nH6H
	GM2E0Ug7uiJrxJ0LaHT2HJW+QRm8PaOW00vfmbIrju3fsqN4TroItT9OGk+TIfbtWL
	iXd+joQe8wa6LqJBvSzHEkkBu1xqUJGIgOB51xSE=
From: jobol@nonadev.net
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 10:57:23 +0100
Message-Id: <20170313095723.14273-1-jobol@nonadev.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Jos=C3=A9=20Bollo?= <jose.bollo@iot.bzh>
Subject: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Mon, 13 Mar 2017 09:57:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: José Bollo <jose.bollo@iot.bzh>

The copy of extended attributes is interesting for
Smack systems because it allows to set the security
template of the user's home directories without
modifying the tools (useradd here). But the version
of useradd that copies the extended attributes doesn't
copy the extended attributes of the root. This can make
use of homes impossible! This patch corrects the issue
by copying the extended attributes of the root directory:
/home/user will get the extended attributes of /etc/skel.

The patch is submitted upstream (see
http://lists.alioth.debian.org/pipermail/pkg-shadow-commits/2017-March/003804.html)

The existing patch specific to open-embedded is updated:
  0001-useradd.c-create-parent-directories-when-necessary.patch

Also, attr are activated for native tools.
This is needed when users are created during image creation.

Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 ...-useradd-copy-extended-attributes-of-home.patch | 47 ++++++++++++++++++++++
 ...-create-parent-directories-when-necessary.patch | 10 ++++-
 .../allow-for-setting-password-in-clear-text.patch |  8 ++--
 meta/recipes-extended/shadow/shadow.inc            |  3 +-
 4 files changed, 61 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch

diff --git a/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch b/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch
new file mode 100644
index 0000000..60a46e1
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch
@@ -0,0 +1,47 @@
+From acec93540eba6899661c607408498ac72ab07a47 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Bollo?= <jose.bollo@iot.bzh>
+Date: Tue, 7 Mar 2017 16:03:03 +0100
+Subject: [PATCH] useradd: copy extended attributes of home
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Home directory wasn't getting the extended attributes
+of /etc/skel. This patch fixes that issue and adds the copy
+of the extended attributes of the root of the home directory.
+
+Upstream-Status: Submitted [http://lists.alioth.debian.org/pipermail/pkg-shadow-commits/2017-March/003804.html]
+
+Change-Id: Icd633f7c6c494efd2a30cb8f04c306f749ad0c3b
+Signed-off-by: José Bollo <jose.bollo@iot.bzh>
+---
+ src/useradd.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/useradd.c b/src/useradd.c
+index a8a1f76..8aefb9c 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -52,6 +52,9 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <time.h>
++#ifdef WITH_ATTR
++#include <attr/libattr.h>
++#endif
+ #include "chkname.h"
+ #include "defines.h"
+ #include "faillog.h"
+@@ -1915,6 +1918,9 @@ static void create_home (void)
+ 		chown (user_home, user_id, user_gid);
+ 		chmod (user_home,
+ 		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
++#ifdef WITH_ATTR
++		attr_copy_file (def_template, user_home, NULL, NULL);
++#endif
+ 		home_added = true;
+ #ifdef WITH_AUDIT
+ 		audit_logger (AUDIT_ADD_USER, Prog,
+-- 
+2.9.3
+
diff --git a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
index 85dde8e..2f084b4 100644
--- a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
+++ b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
@@ -11,7 +11,7 @@ diff --git a/src/useradd.c b/src/useradd.c
 index 4bd969d..cb5dd6c 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
-@@ -1893,6 +1893,35 @@ static void usr_update (void)
+@@ -1896,6 +1896,35 @@ static void usr_update (void)
  }
  
  /*
@@ -47,7 +47,7 @@ index 4bd969d..cb5dd6c 100644
   * create_home - create the user's home directory
   *
   *	create_home() creates the user's home directory if it does not
-@@ -1907,36 +1936,33 @@ static void create_home (void)
+@@ -1910,39 +1939,36 @@ static void create_home (void)
  			fail_exit (E_HOMEDIR);
  		}
  #endif
@@ -67,6 +67,9 @@ index 4bd969d..cb5dd6c 100644
 -		chown (user_home, user_id, user_gid);
 -		chmod (user_home,
 -		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
+-#ifdef WITH_ATTR
+-		attr_copy_file (def_template, user_home, NULL, NULL);
+-#endif
 -		home_added = true;
 +		mkdir_p(user_home);
 +	}
@@ -88,6 +91,9 @@ index 4bd969d..cb5dd6c 100644
 +	chown (user_home, user_id, user_gid);
 +	chmod (user_home,
 +	       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
++#ifdef WITH_ATTR
++	attr_copy_file (def_template, user_home, NULL, NULL);
++#endif
 +	home_added = true;
 +#ifdef WITH_AUDIT
 +	audit_logger (AUDIT_ADD_USER, Prog,
diff --git a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
index 68da25f..615c6e0 100644
--- a/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
+++ b/meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
@@ -118,7 +118,7 @@ diff --git a/src/useradd.c b/src/useradd.c
 index b3bd451..4416f90 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
-@@ -773,6 +773,7 @@ static void usage (int status)
+@@ -776,6 +776,7 @@ static void usage (int status)
  	(void) fputs (_("  -o, --non-unique              allow to create users with duplicate\n"
  	                "                                (non-unique) UID\n"), usageout);
  	(void) fputs (_("  -p, --password PASSWORD       encrypted password of the new account\n"), usageout);
@@ -126,7 +126,7 @@ index b3bd451..4416f90 100644
  	(void) fputs (_("  -r, --system                  create a system account\n"), usageout);
  	(void) fputs (_("  -R, --root CHROOT_DIR         directory to chroot into\n"), usageout);
  	(void) fputs (_("  -s, --shell SHELL             login shell of the new account\n"), usageout);
-@@ -1047,6 +1048,7 @@ static void process_flags (int argc, char **argv)
+@@ -1050,6 +1051,7 @@ static void process_flags (int argc, char **argv)
  			{"no-user-group",  no_argument,       NULL, 'N'},
  			{"non-unique",     no_argument,       NULL, 'o'},
  			{"password",       required_argument, NULL, 'p'},
@@ -134,7 +134,7 @@ index b3bd451..4416f90 100644
  			{"system",         no_argument,       NULL, 'r'},
  			{"root",           required_argument, NULL, 'R'},
  			{"shell",          required_argument, NULL, 's'},
-@@ -1059,9 +1061,9 @@ static void process_flags (int argc, char **argv)
+@@ -1062,9 +1064,9 @@ static void process_flags (int argc, char **argv)
  		};
  		while ((c = getopt_long (argc, argv,
  #ifdef WITH_SELINUX
@@ -146,7 +146,7 @@ index b3bd451..4416f90 100644
  #endif				/* !WITH_SELINUX */
  		                         long_options, NULL)) != -1) {
  			switch (c) {
-@@ -1227,6 +1229,9 @@ static void process_flags (int argc, char **argv)
+@@ -1230,6 +1232,9 @@ static void process_flags (int argc, char **argv)
  				}
  				user_pass = optarg;
  				break;
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index e59ff64..25283a9 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -15,6 +15,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://fix-installation-failure-with-subids-disabled.patch \
            file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
            file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
+           file://0001-useradd-copy-extended-attributes-of-home.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
@@ -76,7 +77,7 @@ PAM_PLUGINS = "libpam-runtime \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
-PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-- 
2.9.3


