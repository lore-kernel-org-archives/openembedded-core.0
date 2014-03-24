Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C77E76FAF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 08:12:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2O8Cooq028516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 01:12:50 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 24 Mar 2014 01:12:50 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Mar 2014 16:12:47 +0800
Message-ID: <4ca2922918a8b6c115da47e5b73ea7819024fb55.1395648707.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395648707.git.Chong.Lu@windriver.com>
References: <cover.1395648707.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] acl: fix the order of expected output of getfacl
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
X-List-Received-Date: Mon, 24 Mar 2014 08:12:50 -0000
Content-Type: text/plain

The result of getfacl is sorted by user id.
In Centos or RHEL, bin user id is 1 and daemon user id is 2.
But in our image, bin user id is 2 and daemon user id is 1.
The patch fixes this issue to make ptest pass.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-support/attr/acl.inc                  |   1 +
 ...x-the-order-of-expected-output-of-getfacl.patch | 198 +++++++++++++++++++++
 2 files changed, 199 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index 04967a6..355dbdd 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
 DEPENDS = "attr"
 SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
            file://run-ptest \
+           file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
 "
 
 require ea-acl.inc
diff --git a/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch b/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
new file mode 100644
index 0000000..cf765fd
--- /dev/null
+++ b/meta/recipes-support/attr/acl/acl-fix-the-order-of-expected-output-of-getfacl.patch
@@ -0,0 +1,198 @@
+acl: fix the order of expected output of getfacl
+
+The result of getfacl is sorted by user id.
+In Centos or RHEL, bin user id is 1 and daemon user id is 2.
+But in our image, bin user id is 2 and daemon user id is 1.
+The patch fixes this issue to make ptest pass.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ test/misc.test |   38 +++++++++++++++++++-------------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/test/misc.test b/test/misc.test
+index 6e98053..53ae5b0 100644
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
+-- 
+1.7.9.5
+
-- 
1.8.1.2


