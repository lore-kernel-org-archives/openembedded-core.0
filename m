Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F36926BC3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 03:26:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2D3QZRV017316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Mar 2019 20:26:35 -0700 (PDT)
Received: from localhost (128.224.163.192) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 12 Mar 2019 20:26:34 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <jose.bollo@iot.bzh>, <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Mar 2019 11:26:31 +0800
Message-ID: <1552447591-24070-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.192]
Subject: [PATCH] shadow: drop inappropriate patch
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
X-List-Received-Date: Wed, 13 Mar 2019 03:26:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The 0001-useradd-copy-extended-attributes-of-home.patch (oe-core commit:
eed66e85af5ca6bbdd80cc3d5cf8453e8d8880bc) introduced a runtime failure
when enable SELinux.

When enable SELinux, The directory /home/user will get the extended
attributes of /etc/skel. However, the SELinux lable for /etc/skel is
etc_t which is also copied to /home/user. It will cause the user can not
write their home directory because the SELinux lable for /home/user
should be user_home_dir_t.

See discussion: http://lists.openembedded.org/pipermail/openembedded-core/2018-January/146039.html

The solution at the moment is to drop this patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-useradd-copy-extended-attributes-of-home.patch | 41 ----------------------
 ...-create-parent-directories-when-necessary.patch | 14 +++-----
 meta/recipes-extended/shadow/shadow.inc            |  1 -
 3 files changed, 5 insertions(+), 51 deletions(-)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch

diff --git a/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch b/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch
deleted file mode 100644
index 474b3a2..0000000
--- a/meta/recipes-extended/shadow/files/0001-useradd-copy-extended-attributes-of-home.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Subject: [PATCH] useradd: copy extended attributes of home
-
-The Home directory wasn't getting the extended attributes
-of /etc/skel. This patch fixes that issue and adds the copy
-of the extended attributes of the root of the home directory.
-
-Upstream-Status: Pending
-
-Signed-off-by: José Bollo <jose.bollo@iot.bzh>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/useradd.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/useradd.c b/src/useradd.c
-index e721e52..c74e491 100644
---- a/src/useradd.c
-+++ b/src/useradd.c
-@@ -54,6 +54,9 @@
- #include <sys/wait.h>
- #include <time.h>
- #include <unistd.h>
-+#ifdef WITH_ATTR
-+#include <attr/libattr.h>
-+#endif
- #include "chkname.h"
- #include "defines.h"
- #include "faillog.h"
-@@ -2042,6 +2045,9 @@ static void create_home (void)
- 		(void) chown (prefix_user_home, user_id, user_gid);
- 		chmod (prefix_user_home,
- 		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
-+#ifdef WITH_ATTR
-+	               attr_copy_file (def_template, user_home, NULL, NULL);
-+#endif
- 		home_added = true;
- #ifdef WITH_AUDIT
- 		audit_logger (AUDIT_ADD_USER, Prog,
--- 
-2.11.0
-
diff --git a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
index 7024136..faa6f68 100644
--- a/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
+++ b/meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
@@ -4,11 +4,11 @@ Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- src/useradd.c | 82 +++++++++++++++++++++++++++++++++++++++--------------------
- 1 file changed, 54 insertions(+), 28 deletions(-)
+ src/useradd.c | 80 +++++++++++++++++++++++++++++++++++++++--------------------
+ 1 file changed, 53 insertions(+), 27 deletions(-)
 
 diff --git a/src/useradd.c b/src/useradd.c
-index 7214e72..3aaf45c 100644
+index 00a3c30..9ecbb58 100644
 --- a/src/useradd.c
 +++ b/src/useradd.c
 @@ -2021,6 +2021,35 @@ static void usr_update (void)
@@ -47,7 +47,7 @@ index 7214e72..3aaf45c 100644
   * create_home - create the user's home directory
   *
   *	create_home() creates the user's home directory if it does not
-@@ -2038,42 +2067,39 @@ static void create_home (void)
+@@ -2038,39 +2067,36 @@ static void create_home (void)
  			fail_exit (E_HOMEDIR);
  		}
  #endif
@@ -74,16 +74,12 @@ index 7214e72..3aaf45c 100644
 -		(void) chown (prefix_user_home, user_id, user_gid);
 -		chmod (prefix_user_home,
 -		       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
+-		home_added = true;
 +		fail_exit (E_HOMEDIR);
 +	}
 +	(void) chown (prefix_user_home, user_id, user_gid);
 +	chmod (prefix_user_home,
 +	       0777 & ~getdef_num ("UMASK", GETDEF_DEFAULT_UMASK));
- #ifdef WITH_ATTR
--	               attr_copy_file (def_template, user_home, NULL, NULL);
-+	attr_copy_file (def_template, user_home, NULL, NULL);
- #endif
--		home_added = true;
 +	home_added = true;
  #ifdef WITH_AUDIT
 -		audit_logger (AUDIT_ADD_USER, Prog,
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2b20bdc..4de21ac 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -11,7 +11,6 @@ DEPENDS = "virtual/crypt"
 UPSTREAM_CHECK_URI = "https://github.com/shadow-maint/shadow/releases"
 SRC_URI = "https://github.com/shadow-maint/shadow/releases/download/${PV}/${BP}.tar.gz \
            file://shadow-4.1.3-dots-in-usernames.patch \
-           file://0001-useradd-copy-extended-attributes-of-home.patch \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
2.7.4


