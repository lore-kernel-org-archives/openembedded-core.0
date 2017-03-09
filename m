Return-Path: <jobol@nonadev.net>
Received: from erza.lautre.net (erza.lautre.net [80.67.160.89])
	by mail.openembedded.org (Postfix) with ESMTP id 0BDC471A5A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 14:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by erza.lautre.net (Postfix) with ESMTP id 225CAF6B87;
	Thu,  9 Mar 2017 15:07:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1489068433;
	bh=E5eWsXWTVyf25FphLDqMDkUdWYd9XQqzhbyBtAS/NvA=;
	h=From:To:Cc:Subject:Date;
	b=R5Di9Q7CiXi6LyI7us3ojYcFvBDiuBNiBtDMi9r9RV1FAKq+j/uIix+Cegt8nfgdG
	7Vd4v/7OzwI284IuoM2ZLPvZwC/U3TmPqrPJbY/RasA4mC+gmjqVrFCXq5tuS+rkr1
	3uV4njUTlajMRamPnGN1Dr6F7/4HMVTMuwMYm6W4=
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
	with ESMTP id tc5MoC1N_Sdt; Thu,  9 Mar 2017 15:07:11 +0100 (CET)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	by erza.lautre.net (Postfix) with ESMTPA id 9CF41F6B86;
	Thu,  9 Mar 2017 15:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1489068431;
	bh=E5eWsXWTVyf25FphLDqMDkUdWYd9XQqzhbyBtAS/NvA=;
	h=From:To:Cc:Subject:Date;
	b=qyiAC9rn41XDB3tDJaG3cpuomijmIhpzqCDOA4lHLUaEHniFnfQD6AFMxP53kRYkf
	87YsYtW2i89S+5zq9avikgLK+ikvpXsUnaE7HRiS9mxz2Qg0eAkYjq95dUHO+zQTVX
	DA8jELq6Qs1waAP8p+e5u0M8h51s2F8YIDVzR7iU=
From: jobol@nonadev.net
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 15:07:06 +0100
Message-Id: <20170309140706.19814-1-jobol@nonadev.net>
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
X-List-Received-Date: Thu, 09 Mar 2017 14:07:14 -0000
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

This includes 2 patches to implement the behaviour:
one for the target and one for the native.

The patch for the target was submitted upstream (see
http://lists.alioth.debian.org/pipermail/pkg-shadow-commits/2017-March/003804.html)

The patch for the native couldn't be submitted upstream
because it applies after the patch specific to open-embedded
that creates the parent directories:
  0001-useradd.c-create-parent-directories-when-necessary.patch

Also, attr are activated for native tools.
This is needed when users are created during image creation.

Signed-off-by: José Bollo <jose.bollo@iot.bzh>
---
 ...d-copy-extended-attributes-of-home-native.patch | 46 +++++++++++++++++++++
 ...-useradd-copy-extended-attributes-of-home.patch | 47 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  4 +-
 3 files changed, 96 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home-native.patch
 create mode 100644 meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch

diff --git a/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home-native.patch b/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home-native.patch
new file mode 100644
index 0000000..e93693e
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home-native.patch
@@ -0,0 +1,46 @@
+From 008637fc8bd7f601eb6554d572bba025613913b7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Jos=C3=A9=20Bollo?= <jose.bollo@iot.bzh>
+Date: Wed, 8 Mar 2017 14:10:10 +0100
+Subject: [PATCH] useradd: copy extended attributes of home (native)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The Home directory wasn't getting the extended attributes
+of /etc/skel. This patch fixes that issue and adds the copy
+of the extended attributes of the root of the home directory.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: José Bollo <jose.bollo@iot.bzh>
+---
+ src/useradd.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/useradd.c b/src/useradd.c
+index 4c418af..8ba8af6 100644
+--- a/src/useradd.c
++++ b/src/useradd.c
+@@ -55,6 +55,9 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <time.h>
++#ifdef WITH_ATTR
++#include <attr/libattr.h>
++#endif
+ #include "chkname.h"
+ #include "defines.h"
+ #include "faillog.h"
+@@ -1950,6 +1953,9 @@ static void create_home (void)
+ 	chown (user_home, user_id, user_gid);
+ 	chmod (user_home,
+ 	       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
++#ifdef WITH_ATTR
++	attr_copy_file (def_template, user_home, NULL, NULL);
++#endif
+ 	home_added = true;
+ #ifdef WITH_AUDIT
+ 	audit_logger (AUDIT_ADD_USER, Prog,
+-- 
+2.9.3
+
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
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index e59ff64..62531df 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -22,6 +22,7 @@ SRC_URI_append_class-target = " \
            file://login_defs_pam.sed \
            file://shadow-update-pam-conf.patch \
            file://shadow-relaxed-usernames.patch \
+           file://0001-useradd-copy-extended-attributes-of-home.patch \
            "
 
 SRC_URI_append_class-native = " \
@@ -29,6 +30,7 @@ SRC_URI_append_class-native = " \
            file://allow-for-setting-password-in-clear-text.patch \
            file://commonio.c-fix-unexpected-open-failure-in-chroot-env.patch \
            file://0001-useradd.c-create-parent-directories-when-necessary.patch \
+           file://0001-useradd-copy-extended-attributes-of-home-native.patch \
            "
 SRC_URI_append_class-nativesdk = " \
            file://0001-Disable-use-of-syslog-for-sysroot.patch \
@@ -76,7 +78,7 @@ PAM_PLUGINS = "libpam-runtime \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
-PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-- 
2.9.3


