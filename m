Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1E3678673
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 10:23:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7GANWGN028365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 03:23:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 03:23:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 18:28:10 +0800
Message-ID: <7751264307b6966841699d05c26c8d643fcff3ef.1502879234.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1502879234.git.Qi.Chen@windriver.com>
References: <cover.1502879234.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] shadow: fix CVE-2017-12424
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
X-List-Received-Date: Wed, 16 Aug 2017 10:23:35 -0000
Content-Type: text/plain

Backport a patch to fix CVE-2017-12424.

In shadow before 4.5, the newusers tool could be made to manipulate
internal data structures in ways unintended by the authors.

Reference link: https://nvd.nist.gov/vuln/detail/CVE-2017-12424

CVE: CVE-2017-12424

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../shadow/files/0001-shadow-CVE-2017-12424        | 46 ++++++++++++++++++++++
 meta/recipes-extended/shadow/shadow.inc            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424

diff --git a/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424 b/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
new file mode 100644
index 0000000..4d3e1e0
--- /dev/null
+++ b/meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
@@ -0,0 +1,46 @@
+From 954e3d2e7113e9ac06632aee3c69b8d818cc8952 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tmraz@fedoraproject.org>
+Date: Fri, 31 Mar 2017 16:25:06 +0200
+Subject: [PATCH] Fix buffer overflow if NULL line is present in db.
+
+If ptr->line == NULL for an entry, the first cycle will exit,
+but the second one will happily write past entries buffer.
+We actually do not want to exit the first cycle prematurely
+on ptr->line == NULL.
+Signed-off-by: Tomas Mraz <tmraz@fedoraproject.org>
+
+CVE: CVE-2017-12424
+Upstream-Status: Backport
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ lib/commonio.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/lib/commonio.c b/lib/commonio.c
+index b10da06..31edbaa 100644
+--- a/lib/commonio.c
++++ b/lib/commonio.c
+@@ -751,16 +751,16 @@ commonio_sort (struct commonio_db *db, int (*cmp) (const void *, const void *))
+ 	for (ptr = db->head;
+ 	        (NULL != ptr)
+ #if KEEP_NIS_AT_END
+-	     && (NULL != ptr->line)
+-	     && (   ('+' != ptr->line[0])
+-	         && ('-' != ptr->line[0]))
++	     && ((NULL == ptr->line)
++	         || (('+' != ptr->line[0])
++	             && ('-' != ptr->line[0])))
+ #endif
+ 	     ;
+ 	     ptr = ptr->next) {
+ 		n++;
+ 	}
+ #if KEEP_NIS_AT_END
+-	if ((NULL != ptr) && (NULL != ptr->line)) {
++	if (NULL != ptr) {
+ 		nis = ptr;
+ 	}
+ #endif
+-- 
+2.1.0
+
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5e6b0bd..cc18964 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-Do-not-read-login.defs-before-doing-chroot.patch \
            file://check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch \
            file://0001-useradd-copy-extended-attributes-of-home.patch \
+           file://0001-shadow-CVE-2017-12424 \
            ${@bb.utils.contains('PACKAGECONFIG', 'pam', '${PAM_SRC_URI}', '', d)} \
            "
 
-- 
1.9.1


