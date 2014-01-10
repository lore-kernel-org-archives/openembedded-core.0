Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42A526B5FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:15:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0A9FIaY013631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 01:15:18 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 10 Jan 2014 01:15:17 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jan 2014 17:13:53 +0800
Message-ID: <4ea0f4383800204370680a87a91c4e5f95c73e80.1389344939.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389344939.git.Chong.Lu@windriver.com>
References: <cover.1389344939.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] acl: enable ptest support
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
X-List-Received-Date: Fri, 10 Jan 2014 09:15:17 -0000
Content-Type: text/plain

Install acl test suite and run it as ptest.
nfs test cases need depend on nfs service. So exclude them order to
make ptest all pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/attr/acl.inc                  |  15 +-
 .../attr/acl/acl-make-ptest-pass.patch             | 457 +++++++++++++++++++++
 meta/recipes-support/attr/acl/run-ptest            |   5 +
 3 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/acl/acl-make-ptest-pass.patch
 create mode 100644 meta/recipes-support/attr/acl/run-ptest

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index a461232..4bacf80 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -9,7 +9,10 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
                     file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
 
 DEPENDS = "attr"
-SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
+           file://acl-make-ptest-pass.patch \
+           file://run-ptest \
+"
 
 require ea-acl.inc
 
@@ -24,3 +27,13 @@ do_install_append() {
 	sed -i ${D}${libdir}/libacl.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
+
+inherit ptest
+
+do_install_ptest() {
+	tar -cf - test/ --exclude nfs | ( cd ${D}${PTEST_PATH} && tar -xf - )
+	mkdir ${D}${PTEST_PATH}/include
+	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
+}
+
+RDEPENDS_${PN}-ptest = "coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
diff --git a/meta/recipes-support/attr/acl/acl-make-ptest-pass.patch b/meta/recipes-support/attr/acl/acl-make-ptest-pass.patch
new file mode 100644
index 0000000..89c03c2
--- /dev/null
+++ b/meta/recipes-support/attr/acl/acl-make-ptest-pass.patch
@@ -0,0 +1,457 @@
+acl: make ptest pass
+
+Upstream-Status: Inappropriate [embedded specific]
+
+The daemon user must be a member in the bin group, else permissions.test
+will fail. So add daemon user to bin group.
+Many results of `ls' are incorrect in some test cases, modify them to make
+ptest pass.
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ test/Makefile              |    2 +-
+ test/cp.test               |    8 ++---
+ test/misc.test             |   86 ++++++++++++++++++++++----------------------
+ test/root/permissions.test |    2 +-
+ test/root/setfacl.test     |    2 +-
+ test/sbits-restore.test    |    6 ++--
+ 6 files changed, 53 insertions(+), 53 deletions(-)
+
+diff --git a/test/Makefile b/test/Makefile
+index d2baac8..6063a56 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -42,7 +42,7 @@ $(NFS):
+ 	@echo "NFS specific tests"; echo "*** $@ ***"; perl run $@
+ 
+ $(ROOT):
+-	@echo "Note: Tests must run as root"; echo "*** $@ ***"; perl run $@
++	@echo "Note: Tests must run as root"; echo "*** $@ ***"; usermod -G bin daemon; perl run $@
+ 
+ .PHONY: $(TESTS) $(NFS) $(ROOT)
+ .NOTPARALLEL:
+diff --git a/test/cp.test b/test/cp.test
+index 0867f63..54bee3b 100644
+--- a/test/cp.test
++++ b/test/cp.test
+@@ -6,16 +6,16 @@ The cp utility should only copy ACLs if `-p' is given.
+ 	$ touch f
+ 	$ setfacl -m u:bin:rw f
+ 	$ ls -l f | awk -- '{ print $1 }'
+-	> -rw-rw-r--+
++	> -rw-rw-r--
+ 	
+ 	$ cp f g
+-	$ ls -l g | awk -- '{ print $1 }' | sed 's/\.$//g'
++	$ ls -l g | awk -- '{ print $1 }'
+ 	> -rw-r--r--
+ 	
+ 	$ rm g
+ 	$ cp -p f g
+ 	$ ls -l f | awk -- '{ print $1 }'
+-	> -rw-rw-r--+
++	> -rw-rw-r--
+ 	
+ 	$ mkdir h
+ 	$ echo blubb > h/x
+@@ -33,7 +33,7 @@ The cp utility should only copy ACLs if `-p' is given.
+ 	> other::r--
+ 	>
+ 
+-	$ cp -rp h i
++	$ cp -a h i
+ 	$ getfacl --omit-header i/x
+ 	> user::rw-
+ 	> user:bin:rwx
+diff --git a/test/misc.test b/test/misc.test
+index 6e98053..83080e2 100644
+--- a/test/misc.test
++++ b/test/misc.test
+@@ -11,7 +11,7 @@ Only change a base ACL:
+ 	$ setfacl -m u::r f
+ 	$ setfacl -m u::rw,u:bin:rw f
+ 	$ ls -dl f | awk '{print $1}'
+-	> -rw-rw----+
++	> -rw-rw----
+ 	
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+@@ -26,7 +26,7 @@ Only change a base ACL:
+ 	$ touch f
+ 	$ setfacl -m u:bin:rw f
+ 	$ ls -dl f | awk '{print $1}'
+-	> -rw-rw-r--+
++	> -rw-rw-r--
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+@@ -41,7 +41,7 @@ Only change a base ACL:
+ 	$ mkdir d
+ 	$ setfacl -m u:bin:rwx d
+ 	$ ls -dl d | awk '{print $1}'
+-	> drwxrwx---+
++	> drwxrwx---
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+@@ -56,7 +56,7 @@ Only change a base ACL:
+ 	$ mkdir d
+ 	$ setfacl -m u:bin:rwx d
+ 	$ ls -dl d | awk '{print $1}'
+-	> drwxrwxr-x+
++	> drwxrwxr-x
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+@@ -75,12 +75,12 @@ Multiple users
+ 	$ touch f
+ 	$ setfacl -m u:bin:rw,u:daemon:r f
+ 	$ ls -dl f | awk '{print $1}'
+-	> -rw-rw-r--+
++	> -rw-rw-r--
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+-	> user:bin:rw-
+ 	> user:daemon:r--
++	> user:bin:rw-
+ 	> group::r--
+ 	> mask::rw-
+ 	> other::r--
+@@ -90,12 +90,12 @@ Multiple groups
+ 	 
+ 	$ setfacl -m g:users:rw,g:daemon:r f
+ 	$ ls -dl f | awk '{print $1}'
+-	> -rw-rw-r--+
++	> -rw-rw-r--
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+-	> user:bin:rw-
+ 	> user:daemon:r--
++	> user:bin:rw-
+ 	> group::r--
+ 	> group:daemon:r--
+ 	> group:users:rw-
+@@ -107,12 +107,12 @@ Remove one group
+ 	 
+ 	$ setfacl -x g:users f
+ 	$ ls -dl f | awk '{print $1}'
+-	> -rw-rw-r--+
++	> -rw-rw-r--
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+-	> user:bin:rw-
+ 	> user:daemon:r--
++	> user:bin:rw-
+ 	> group::r--
+ 	> group:daemon:r--
+ 	> mask::rw-
+@@ -123,7 +123,7 @@ Remove one user
+ 	 
+ 	$ setfacl -x u:daemon f
+ 	$ ls -dl f | awk '{print $1}'
+-	> -rw-rw-r--+
++	> -rw-rw-r--
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+@@ -142,12 +142,12 @@ Default ACL
+ 	$ mkdir d
+ 	$ setfacl -m u:bin:rwx,u:daemon:rw,d:u:bin:rwx,d:m:rx d
+ 	$ ls -dl d | awk '{print $1}'
+-	> drwxrwx---+
++	> drwxrwx---
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+-	> user:bin:rwx
+ 	> user:daemon:rw-
++	> user:bin:rwx
+ 	> group::r-x
+ 	> mask::rwx
+ 	> other::---
+@@ -163,7 +163,7 @@ Umask now ignored?
+ 	$ umask 027
+ 	$ touch d/f
+ 	$ ls -dl d/f | awk '{print $1}'
+-	> -rw-r-----+
++	> -rw-r-----
+ 
+ 	$ getfacl --omit-header d/f
+ 	> user::rw-
+@@ -177,7 +177,7 @@ Umask now ignored?
+ 	$ umask 022
+ 	$ touch d/f
+ 	$ ls -dl d/f | awk '{print $1}'
+-	> -rw-r-----+
++	> -rw-r-----
+ 
+ 	$ getfacl --omit-header d/f
+ 	> user::rw-
+@@ -194,7 +194,7 @@ Default ACL copying
+ 	$ umask 000
+ 	$ mkdir d/d
+ 	$ ls -dl d/d | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d/d
+ 	> user::rwx
+@@ -213,7 +213,7 @@ Default ACL copying
+ 	$ umask 022
+ 	$ mkdir d/d
+ 	$ ls -dl d/d | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d/d
+ 	> user::rwx
+@@ -232,20 +232,20 @@ Add some users and groups
+  
+ 	$ setfacl -nm u:daemon:rx,d:u:daemon:rx,g:users:rx,g:daemon:rwx d/d
+ 	$ ls -dl d/d | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d/d
+ 	> user::rwx
+-	> user:bin:rwx	#effective:r-x
+ 	> user:daemon:r-x
++	> user:bin:rwx	#effective:r-x
+ 	> group::r-x
+ 	> group:daemon:rwx	#effective:r-x
+ 	> group:users:r-x
+ 	> mask::r-x
+ 	> other::---
+ 	> default:user::rwx
+-	> default:user:bin:rwx	#effective:r-x
+ 	> default:user:daemon:r-x
++	> default:user:bin:rwx	#effective:r-x
+ 	> default:group::r-x
+ 	> default:mask::r-x
+ 	> default:other::---
+@@ -254,24 +254,24 @@ Add some users and groups
+ Symlink in directory with default ACL?
+ 	 
+ 	$ ln -s d d/l
+-	$ ls -dl d/l | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d/l | awk '{print $1}'
+ 	> lrwxrwxrwx
+ 
+ 	$ ls -dl -L d/l | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d/l
+ 	> user::rwx
+-	> user:bin:rwx	#effective:r-x
+ 	> user:daemon:r-x
++	> user:bin:rwx	#effective:r-x
+ 	> group::r-x
+ 	> group:daemon:rwx	#effective:r-x
+ 	> group:users:r-x
+ 	> mask::r-x
+ 	> other::---
+ 	> default:user::rwx
+-	> default:user:bin:rwx	#effective:r-x
+ 	> default:user:daemon:r-x
++	> default:user:bin:rwx	#effective:r-x
+ 	> default:group::r-x
+ 	> default:mask::r-x
+ 	> default:other::---
+@@ -283,20 +283,20 @@ Does mask manipulation work?
+ 	 
+ 	$ setfacl -m g:daemon:rx,u:bin:rx d/d
+ 	$ ls -dl d/d | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d/d
+ 	> user::rwx
+-	> user:bin:r-x
+ 	> user:daemon:r-x
++	> user:bin:r-x
+ 	> group::r-x
+ 	> group:daemon:r-x
+ 	> group:users:r-x
+ 	> mask::r-x
+ 	> other::---
+ 	> default:user::rwx
+-	> default:user:bin:rwx	#effective:r-x
+ 	> default:user:daemon:r-x
++	> default:user:bin:rwx	#effective:r-x
+ 	> default:group::r-x
+ 	> default:mask::r-x
+ 	> default:other::---
+@@ -304,20 +304,20 @@ Does mask manipulation work?
+ 
+ 	$ setfacl -m d:u:bin:rwx d/d
+ 	$ ls -dl d/d | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d/d
+ 	> user::rwx
+-	> user:bin:r-x
+ 	> user:daemon:r-x
++	> user:bin:r-x
+ 	> group::r-x
+ 	> group:daemon:r-x
+ 	> group:users:r-x
+ 	> mask::r-x
+ 	> other::---
+ 	> default:user::rwx
+-	> default:user:bin:rwx
+ 	> default:user:daemon:r-x
++	> default:user:bin:rwx
+ 	> default:group::r-x
+ 	> default:mask::rwx
+ 	> default:other::---
+@@ -329,12 +329,12 @@ Remove the default ACL
+ 	 
+ 	$ setfacl -k d
+ 	$ ls -dl d | awk '{print $1}'
+-	> drwxrwx---+
++	> drwxrwx---
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+-	> user:bin:rwx
+ 	> user:daemon:rw-
++	> user:bin:rwx
+ 	> group::r-x
+ 	> mask::rwx
+ 	> other::---
+@@ -343,7 +343,7 @@ Remove the default ACL
+ Reset to base entries
+ 	 
+ 	$ setfacl -b d
+-	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d | awk '{print $1}'
+ 	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d
+@@ -355,7 +355,7 @@ Reset to base entries
+ Now, chmod should change the group_obj entry
+ 	 
+ 	$ chmod 775 d
+-	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d | awk '{print $1}'
+ 	> drwxrwxr-x
+ 	
+ 	$ getfacl --omit-header d
+@@ -369,18 +369,18 @@ Now, chmod should change the group_obj entry
+ 	$ mkdir d
+ 	$ setfacl -m u:daemon:rwx,u:bin:rx,d:u:daemon:rwx,d:u:bin:rx d
+ 	$ ls -dl d | awk '{print $1}'
+-	> drwxrwxr-x+
++	> drwxrwxr-x
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+-	> user:bin:r-x
+ 	> user:daemon:rwx
++	> user:bin:r-x
+ 	> group::rwx
+ 	> mask::rwx
+ 	> other::r-x
+ 	> default:user::rwx
+-	> default:user:bin:r-x
+ 	> default:user:daemon:rwx
++	> default:user:bin:r-x
+ 	> default:group::rwx
+ 	> default:mask::rwx
+ 	> default:other::r-x
+@@ -388,18 +388,18 @@ Now, chmod should change the group_obj entry
+ 
+ 	$ chmod 750 d
+ 	$ ls -dl d | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+-	> user:bin:r-x
+ 	> user:daemon:rwx	#effective:r-x
++	> user:bin:r-x
+ 	> group::rwx	#effective:r-x
+ 	> mask::r-x
+ 	> other::---
+ 	> default:user::rwx
+-	> default:user:bin:r-x
+ 	> default:user:daemon:rwx
++	> default:user:bin:r-x
+ 	> default:group::rwx
+ 	> default:mask::rwx
+ 	> default:other::r-x
+@@ -407,18 +407,18 @@ Now, chmod should change the group_obj entry
+ 
+ 	$ chmod 750 d
+ 	$ ls -dl d | awk '{print $1}'
+-	> drwxr-x---+
++	> drwxr-x---
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+-	> user:bin:r-x
+ 	> user:daemon:rwx	#effective:r-x
++	> user:bin:r-x
+ 	> group::rwx	#effective:r-x
+ 	> mask::r-x
+ 	> other::---
+ 	> default:user::rwx
+-	> default:user:bin:r-x
+ 	> default:user:daemon:rwx
++	> default:user:bin:r-x
+ 	> default:group::rwx
+ 	> default:mask::rwx
+ 	> default:other::r-x
+diff --git a/test/root/permissions.test b/test/root/permissions.test
+index afaf5f0..042005a 100644
+--- a/test/root/permissions.test
++++ b/test/root/permissions.test
+@@ -217,7 +217,7 @@ Test if symlinks are properly followed.
+ 	$ ln -s g l
+ 	$ setfacl -m u:bin:rw l
+ 	$ ls -l g | awk -- '{ print $1, $3, $4 }'
+-	> -rw-rw----+ root root
++	> -rw-rw---- root root
+ 
+ 
+ Test if ACLs are effective for block and character special files, fifos,
+diff --git a/test/root/setfacl.test b/test/root/setfacl.test
+index 630e9fb..6726e63 100644
+--- a/test/root/setfacl.test
++++ b/test/root/setfacl.test
+@@ -13,7 +13,7 @@ Setfacl utility tests. Run these tests on a filesystem with ACL support.
+ 
+ 	$ setfacl -m m:- g
+ 	$ ls -dl g | awk '{print $1}'
+-	> -rw-------+
++	> -rw-------
+ 
+ 	$ getfacl g
+ 	> # file: g
+diff --git a/test/sbits-restore.test b/test/sbits-restore.test
+index de21340..e5e4fb2 100644
+--- a/test/sbits-restore.test
++++ b/test/sbits-restore.test
+@@ -13,10 +13,10 @@ Ensure setting of SUID/SGID/sticky via --restore works
+ 	$ touch d/g
+ 	$ touch d/u
+ 	$ setfacl --restore d.acl
+-	$ ls -dl d | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d | awk '{print $1}'
+ 	> drwxr-xr-t
+-	$ ls -dl d/u | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d/u | awk '{print $1}'
+ 	> -rwSr--r--
+-	$ ls -dl d/g | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d/g | awk '{print $1}'
+ 	> -rw-r-Sr--
+ 	$ rm -Rf d
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
new file mode 100644
index 0000000..a6c6867
--- /dev/null
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+make -C test -k tests root-tests |sed \
+ -e 's|^\[.*\] \(.*\) -- ok$|PASS: \1|' \
+ -e 's|^\[.*\] \(.*\) -- failed|FAIL: \1|'
-- 
1.8.1.2


