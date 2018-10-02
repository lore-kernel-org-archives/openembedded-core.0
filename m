Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E75DF745B4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 17:07:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w92H7vh6011537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Oct 2018 10:07:57 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 2 Oct 2018 10:07:56 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 3 Oct 2018 00:27:12 +0800
Message-ID: <d8b088bc333a8f776c1d0b3461d0cda6d9ac0517.1538492159.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538492159.git.kai.kang@windriver.com>
References: <cover.1538492159.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] man-db: fix multilib install file conflict
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
X-List-Received-Date: Tue, 02 Oct 2018 17:07:57 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The first line of config file man_db.conf is the package name. It causes
multilib install file conflict. So add a patch to remove the line.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...nf-avoid-multilib-install-file-conflict.patch | 16 ++++++++++++++++
 meta/recipes-extended/man-db/man-db_2.8.3.bb     |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/man-db/files/man_db.conf-avoid-multilib-install-file-conflict.patch

diff --git a/meta/recipes-extended/man-db/files/man_db.conf-avoid-multilib-install-file-conflict.patch b/meta/recipes-extended/man-db/files/man_db.conf-avoid-multilib-install-file-conflict.patch
new file mode 100644
index 0000000000..03273d3b49
--- /dev/null
+++ b/meta/recipes-extended/man-db/files/man_db.conf-avoid-multilib-install-file-conflict.patch
@@ -0,0 +1,16 @@
+The first line of man_db.conf will be replaced by package name. And it causes
+multilib install file conflict. Remove the line to avoid the issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/src/man_db.conf.in b/src/man_db.conf.in
+index bc8bb7e..04cfb31 100644
+--- a/src/man_db.conf.in
++++ b/src/man_db.conf.in
+@@ -1,4 +1,3 @@
+-# @config_file_basename@
+ #
+ # This file is used by the man-db package to configure the man and cat paths.
+ # It is also used to provide a manpath for those without one by examining
diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb b/meta/recipes-extended/man-db/man-db_2.8.3.bb
index 97e5a3d6fb..cd8d27c33e 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343
                     file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
-           file://99_mandb"
+           file://99_mandb \
+           file://man_db.conf-avoid-multilib-install-file-conflict.patch"
 SRC_URI[md5sum] = "6f3055e18fdd1ce5cbbdb30403991ec7"
 SRC_URI[sha256sum] = "5932a1ca366e1ec61a3ece1a3afa0e92f2fdc125b61d236f20cc6ff9d80cc4ac"
 
-- 
2.18.0


