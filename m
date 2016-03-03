Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 435C56FF69
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 07:16:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u237Gj0W002162
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Mar 2016 23:16:45 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Mar 2016 23:16:44 -0800
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Mar 2016 02:16:43 -0500
Message-ID: <1456989403-114222-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] acl: Fix re pattern in test cases
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
X-List-Received-Date: Thu, 03 Mar 2016 07:16:45 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

ls adds a '.' at the end of the permission field list on SELinux
machines, filter this out so root tests work on SELinux machines.
And backport one patch for other tests.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-support/attr/acl.inc                  |   2 +
 .../acl/test-fix-insufficient-quoting-of.patch     | 108 +++++++++++++++++++++
 ...ps-on-SELinux-machines-for-root-testcases.patch |  84 ++++++++++++++++
 3 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
 create mode 100644 meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index b2bc8ba..198fb4f 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -12,6 +12,8 @@ DEPENDS = "attr"
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
            file://run-ptest \
            file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
+           file://test-fix-insufficient-quoting-of.patch \
+           file://test-fixups-on-SELinux-machines-for-root-testcases.patch \
 "

 require ea-acl.inc
diff --git a/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch b/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
new file mode 100644
index 0000000..59e4629
--- /dev/null
+++ b/meta/recipes-support/attr/acl/test-fix-insufficient-quoting-of.patch
@@ -0,0 +1,108 @@
+From e98ce8acf84d12ea67a3ac76bf63c6d87d9af86d Mon Sep 17 00:00:00 2001
+From: Kamil Dudka <kdudka@redhat.com>
+Date: Mon, 20 May 2013 16:38:06 +0200
+Subject: [PATCH] test: fix insufficient quoting of '\'
+
+This is a follow-up to 7f2c91b8369242a8dbc2b304a5b71b2a85f5b855, which
+caused sbits-restore.test to fail in the following way in case SELinux
+was disabled:
+
+*** sbits-restore.test ***
+[3] $ umask 022 -- ok
+[4] $ mkdir d -- ok
+[5] $ touch d/g -- ok
+[6] $ touch d/u -- ok
+[7] $ chmod u+s d/u -- ok
+[8] $ chmod g+s d/g -- ok
+[9] $ chmod +t d -- ok
+[10] $ getfacl -R d > d.acl -- ok
+[11] $ rm -R d -- ok
+[12] $ mkdir d -- ok
+[13] $ touch d/g -- ok
+[14] $ touch d/u -- ok
+[15] $ setfacl --restore d.acl -- ok
+[16] $ ls -dl d | awk '{print $1}' | sed 's/.$//g' -- failed
+drwxr-xr-                             != drwxr-xr-t
+[18] $ ls -dl d/u | awk '{print $1}' | sed 's/.$//g' -- failed
+-rwSr--r-                             != -rwSr--r--
+[20] $ ls -dl d/g | awk '{print $1}' | sed 's/.$//g' -- failed
+-rw-r-Sr-                             != -rw-r-Sr--
+[22] $ rm -Rf d -- ok
+17 commands (14 passed, 3 failed)
+
+Upstream-Status: Backport
+http://git.savannah.gnu.org/cgit/acl.git/commit/?id=e98ce8acf84d12ea67a3ac76bf63c6d87d9af86d
+
+Signed-off-by: Kamil Dudka <kdudka@redhat.com>
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ test/cp.test            | 2 +-
+ test/misc.test          | 6 +++---
+ test/sbits-restore.test | 6 +++---
+ 3 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/test/cp.test b/test/cp.test
+index 0867f63..a927195 100644
+--- a/test/cp.test
++++ b/test/cp.test
+@@ -9,7 +9,7 @@ The cp utility should only copy ACLs if `-p' is given.
+ 	> -rw-rw-r--+
+
+ 	$ cp f g
+-	$ ls -l g | awk -- '{ print $1 }' | sed 's/\.$//g'
++	$ ls -l g | awk -- '{ print $1 }' | sed 's/\\.$//g'
+ 	> -rw-r--r--
+
+ 	$ rm g
+diff --git a/test/misc.test b/test/misc.test
+index 6e98053..29372b7 100644
+--- a/test/misc.test
++++ b/test/misc.test
+@@ -254,7 +254,7 @@ Add some users and groups
+ Symlink in directory with default ACL?
+
+ 	$ ln -s d d/l
+-	$ ls -dl d/l | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d/l | awk '{print $1}' | sed 's/\\.$//g'
+ 	> lrwxrwxrwx
+
+ 	$ ls -dl -L d/l | awk '{print $1}'
+@@ -343,7 +343,7 @@ Remove the default ACL
+ Reset to base entries
+
+ 	$ setfacl -b d
+-	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
+ 	> drwxr-x---
+
+ 	$ getfacl --omit-header d
+@@ -355,7 +355,7 @@ Reset to base entries
+ Now, chmod should change the group_obj entry
+
+ 	$ chmod 775 d
+-	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
+ 	> drwxrwxr-x
+
+ 	$ getfacl --omit-header d
+diff --git a/test/sbits-restore.test b/test/sbits-restore.test
+index de21340..5899b0a 100644
+--- a/test/sbits-restore.test
++++ b/test/sbits-restore.test
+@@ -13,10 +13,10 @@ Ensure setting of SUID/SGID/sticky via --restore works
+ 	$ touch d/g
+ 	$ touch d/u
+ 	$ setfacl --restore d.acl
+-	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
+ 	> drwxr-xr-t
+-	$ ls -dl d/u | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d/u | awk '{print $1}' | sed 's/\\.$//g'
+ 	> -rwSr--r--
+-	$ ls -dl d/g | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d/g | awk '{print $1}' | sed 's/\\.$//g'
+ 	> -rw-r-Sr--
+ 	$ rm -Rf d
+--
+1.9.1
+
diff --git a/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch b/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
new file mode 100644
index 0000000..8b40751
--- /dev/null
+++ b/meta/recipes-support/attr/acl/test-fixups-on-SELinux-machines-for-root-testcases.patch
@@ -0,0 +1,84 @@
+From d2f49ee6fe4850b8dda5b08676b36201d3c43710 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Wed, 2 Mar 2016 15:46:57 +0800
+Subject: [PATCH] test: fixups on SELinux machines for root testcases
+
+ls adds a '.' at the end of the permission field list on SELinux
+machines, filter this out so root tests work on SELinux machines.
+
+Upstream-Status: Accepted
+http://git.savannah.gnu.org/cgit/acl.git/commit/?id=26a87d36f80d5e98bccb5878834d9e69dadfe3e9
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ test/root/permissions.test | 8 ++++----
+ test/root/restore.test     | 2 +-
+ test/root/setfacl.test     | 2 +-
+ 3 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/test/root/permissions.test b/test/root/permissions.test
+index 9b9e3de..665339a 100644
+--- a/test/root/permissions.test
++++ b/test/root/permissions.test
+@@ -19,7 +19,7 @@ defined permissions.
+ 	$ cd d
+ 	$ umask 027
+ 	$ touch f
+-	$ ls -l f | awk -- '{ print $1, $3, $4 }'
++	$ ls -l f | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
+ 	> -rw-r----- root root
+
+
+@@ -39,7 +39,7 @@ Now, change the ownership of the file to bin:bin and verify that this
+ gives user bin write access.
+
+ 	$ chown bin:bin f
+-	$ ls -l f | awk -- '{ print $1, $3, $4 }'
++	$ ls -l f | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
+ 	> -rw-r----- bin bin
+ 	$ su bin
+ 	$ echo bin >> f
+@@ -256,12 +256,12 @@ directories if the file has an ACL and only CAP_FOWNER would grant them.
+ 	$ mkdir -m 600 x
+ 	$ chown daemon:daemon x
+ 	$ echo j > x/j
+-	$ ls -l x/j | awk -- '{ print $1, $3, $4 }'
++	$ ls -l x/j | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
+ 	> -rw-r----- root root
+
+ 	$ setfacl -m u:daemon:r x
+
+-	$ ls -l x/j | awk -- '{ print $1, $3, $4 }'
++	$ ls -l x/j | awk -- '{ print $1, $3, $4 }' | sed 's/\\.//g'
+ 	> -rw-r----- root root
+ 	(With the bug this gives: `ls: x/j: Permission denied'.)
+
+diff --git a/test/root/restore.test b/test/root/restore.test
+index 63a9d01..c85097c 100644
+--- a/test/root/restore.test
++++ b/test/root/restore.test
+@@ -21,7 +21,7 @@ Cry immediately if we are not running as root.
+ 	$ chown bin passwd
+ 	$ chmod u+s passwd
+ 	$ setfacl --restore passwd.acl
+-	$ ls -dl passwd | awk '{print $1 " " $3 " " $4}'
++	$ ls -dl passwd | awk '{print $1 " " $3 " " $4}' | sed 's/\\.//g'
+ 	> -rwsr-xr-x root root
+
+ 	$ rm passwd passwd.acl
+diff --git a/test/root/setfacl.test b/test/root/setfacl.test
+index a46a9f4..7efbad7 100644
+--- a/test/root/setfacl.test
++++ b/test/root/setfacl.test
+@@ -12,7 +12,7 @@ Cry immediately if we are not running as root.
+ 	$ sg bin
+ 	$ umask 027
+ 	$ touch g
+-	$ ls -dl g | awk '{print $1}'
++	$ ls -dl g | awk '{print $1}' | sed 's/\\.//g'
+ 	> -rw-r-----
+
+ 	$ setfacl -m m:- g
+--
+1.9.1
+
--
1.9.1


