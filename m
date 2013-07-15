Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8DF36A959
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 10:02:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6FA1hbm019887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 03:01:55 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 15 Jul 2013 03:01:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jul 2013 18:01:22 +0800
Message-ID: <d286aa3737442a72ce766dc8ef71f763209f39b8.1373881980.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373881980.git.jackie.huang@windriver.com>
References: <cover.1373881980.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] acl: fix the acl self contained test cases issue
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
X-List-Received-Date: Mon, 15 Jul 2013 10:02:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

misc.test: fix the order of expected output of getfacl
root/permissions.test: this test requires that the daemon
user is in groups bin and daemon, so add it into bin group
before testing start.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/attr/acl.inc                  |    4 +-
 .../attr/files/fix-acl-test-cases.patch            |  210 ++++++++++++++++++++
 2 files changed, 213 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/attr/files/fix-acl-test-cases.patch

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index b504517..6b6ecbf 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
                     file://doc/COPYING.LGPL;md5=9e9a206917f8af112da634ce3ab41764"
 
 DEPENDS = "attr"
-SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz"
+SRC_URI = "http://download.savannah.gnu.org/releases/acl/${BP}.src.tar.gz \
+           file://fix-acl-test-cases.patch \
+"
 
 require ea-acl.inc
 
diff --git a/meta/recipes-support/attr/files/fix-acl-test-cases.patch b/meta/recipes-support/attr/files/fix-acl-test-cases.patch
new file mode 100644
index 0000000..0c003b0
--- /dev/null
+++ b/meta/recipes-support/attr/files/fix-acl-test-cases.patch
@@ -0,0 +1,210 @@
+misc.test: fix the order of expected output of getfacl
+
+Upstream-Status: Pending
+
+root/permissions.test: this test requires that the daemon
+user is in groups bin and daemon, so add it into bin group
+before testing start.
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ test/misc.test             |   38 +++++++++++++++++++-------------------
+ test/root/permissions.test |    1 +
+ 2 files changed, 20 insertions(+), 19 deletions(-)
+
+diff --git a/test/misc.test b/test/misc.test
+index eab9d17..6754be3 100644
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
+diff --git a/test/root/permissions.test b/test/root/permissions.test
+index afaf5f0..5365e2b 100644
+--- a/test/root/permissions.test
++++ b/test/root/permissions.test
+@@ -6,6 +6,7 @@ listed in parentheses.
+ 	bin (bin)
+ 	daemon (bin, daemon)
+
++	$ usermod -a -G bin daemon
+
+ Cry immediately if we are not running as root.
+
+--
+1.7.4
+
-- 
1.7.4.1


