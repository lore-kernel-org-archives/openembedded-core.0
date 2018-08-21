Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC27C78DC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 05:44:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7L5iwWC022887
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2018 22:44:58 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 20 Aug 2018 22:44:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2018 13:44:55 +0800
Message-ID: <1534830295-5057-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python/python3: add virtual/crypt to DEPENDS
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
X-List-Received-Date: Tue, 21 Aug 2018 05:44:59 -0000
Content-Type: text/plain

Since  `6146b8c glibc: Disable crypt support in glibc' in oe-core,
python2/3 could not find symbol crypt which caused import crypt failed.
[snip]
>>> import crypt
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python3.5/crypt.py", line 3, in <module>
    import _crypt
ImportError: /usr/lib64/python3.5/lib-dynload/_crypt.cpython-35m-x86_64-linux-gnu.so: undefined symbol: crypt
[snip]

Add virtual/crypt to DEPENDS, and python's build system (setup.py)
will search libcrypt.so in recipe-sysroot and add `-lcrypt' if it
exists.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/python/python3_3.5.5.bb | 4 +++-
 meta/recipes-devtools/python/python_2.7.15.bb | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index beaf3dc..bfe91fb 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -1,6 +1,8 @@
 require recipes-devtools/python/python.inc
 
-DEPENDS = "python3-native libffi bzip2 gdbm openssl sqlite3 zlib virtual/libintl xz qemu-native qemu-helper-native"
+DEPENDS = "python3-native libffi bzip2 gdbm openssl \
+           sqlite3 zlib virtual/libintl xz qemu-native \
+           qemu-helper-native virtual/crypt"
 
 PR = "${INC_PR}.0"
 PYTHON_MAJMIN = "3.5"
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index 3044c3d..43d9ff5 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -1,6 +1,7 @@
 require python.inc
 
-DEPENDS = "python-native libffi bzip2 gdbm openssl readline sqlite3 zlib"
+DEPENDS = "python-native libffi bzip2 gdbm openssl \
+           readline sqlite3 zlib virtual/crypt"
 
 PR = "${INC_PR}"
 
-- 
2.7.4


