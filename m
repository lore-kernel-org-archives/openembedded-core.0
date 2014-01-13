Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 537046BFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 08:21:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0D8LZGF027823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 00:21:35 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 13 Jan 2014 00:21:35 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 16:20:00 +0800
Message-ID: <4c2a0d56fcc360553ae8c0c1464ab9f546dd8eca.1389600626.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389600626.git.Chong.Lu@windriver.com>
References: <cover.1389600626.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] acl: enable ptest support
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
X-List-Received-Date: Mon, 13 Jan 2014 08:21:34 -0000
Content-Type: text/plain

Install acl test suite and run it as ptest.
nfs test cases need depend on nfs service. So exclude them order to
make ptest all pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/attr/acl.inc                  |  15 +-
 .../attr/acl/acl-make-ptest-pass.patch             | 272 +++++++++++++++++++++
 meta/recipes-support/attr/acl/run-ptest            |   5 +
 3 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/acl/acl-make-ptest-pass.patch
 create mode 100644 meta/recipes-support/attr/acl/run-ptest

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index a461232..18d630c 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -9,7 +9,10 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
                     file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
 
 DEPENDS = "attr"
-SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
+           file://run-ptest \
+           file://acl-make-ptest-pass.patch \
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
index 0000000..36f01d1
--- /dev/null
+++ b/meta/recipes-support/attr/acl/acl-make-ptest-pass.patch
@@ -0,0 +1,272 @@
+acl: make ptest pass
+
+Upstream-Status: Inappropriate [embedded specific]
+
+The daemon user must be a member in the bin group, else permissions.test
+will fail. So add daemon user to bin group.
+Delete `sed' filter of `ls -l' and modify entries of `getfacl', else we
+would get nonmatched result.
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ test/Makefile           |    2 +-
+ test/cp.test            |    2 +-
+ test/misc.test          |   44 ++++++++++++++++++++++----------------------
+ test/sbits-restore.test |    6 +++---
+ 4 files changed, 27 insertions(+), 27 deletions(-)
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
+index 0867f63..a888c04 100644
+--- a/test/cp.test
++++ b/test/cp.test
+@@ -9,7 +9,7 @@ The cp utility should only copy ACLs if `-p' is given.
+ 	> -rw-rw-r--+
+ 	
+ 	$ cp f g
+-	$ ls -l g | awk -- '{ print $1 }' | sed 's/\.$//g'
++	$ ls -l g | awk -- '{ print $1 }'
+ 	> -rw-r--r--
+ 	
+ 	$ rm g
+diff --git a/test/misc.test b/test/misc.test
+index 6e98053..6754be3 100644
+--- a/test/misc.test
++++ b/test/misc.test
+@@ -79,8 +79,8 @@ Multiple users
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+-	> user:bin:rw-
+ 	> user:daemon:r--
++	> user:bin:rw-
+ 	> group::r--
+ 	> mask::rw-
+ 	> other::r--
+@@ -94,8 +94,8 @@ Multiple groups
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+-	> user:bin:rw-
+ 	> user:daemon:r--
++	> user:bin:rw-
+ 	> group::r--
+ 	> group:daemon:r--
+ 	> group:users:rw-
+@@ -111,8 +111,8 @@ Remove one group
+ 
+ 	$ getfacl --omit-header f
+ 	> user::rw-
+-	> user:bin:rw-
+ 	> user:daemon:r--
++	> user:bin:rw-
+ 	> group::r--
+ 	> group:daemon:r--
+ 	> mask::rw-
+@@ -146,8 +146,8 @@ Default ACL
+ 
+ 	$ getfacl --omit-header d
+ 	> user::rwx
+-	> user:bin:rwx
+ 	> user:daemon:rw-
++	> user:bin:rwx
+ 	> group::r-x
+ 	> mask::rwx
+ 	> other::---
+@@ -236,16 +236,16 @@ Add some users and groups
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
+@@ -254,7 +254,7 @@ Add some users and groups
+ Symlink in directory with default ACL?
+ 	 
+ 	$ ln -s d d/l
+-	$ ls -dl d/l | awk '{print $1}' | sed 's/\.$//g'
++	$ ls -dl d/l | awk '{print $1}'
+ 	> lrwxrwxrwx
+ 
+ 	$ ls -dl -L d/l | awk '{print $1}'
+@@ -262,16 +262,16 @@ Symlink in directory with default ACL?
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
+@@ -287,16 +287,16 @@ Does mask manipulation work?
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
+@@ -308,16 +308,16 @@ Does mask manipulation work?
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
+@@ -333,8 +333,8 @@ Remove the default ACL
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
+@@ -373,14 +373,14 @@ Now, chmod should change the group_obj entry
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
+@@ -392,14 +392,14 @@ Now, chmod should change the group_obj entry
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
+@@ -411,14 +411,14 @@ Now, chmod should change the group_obj entry
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


