Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 61EFB6AC95
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 05:35:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0R5Zm8U026065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jan 2015 21:35:48 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 26 Jan 2015 21:35:47 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 13:35:46 +0800
Message-ID: <1422336953-26386-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] cmake-native: disable check for acl.h
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
X-List-Received-Date: Tue, 27 Jan 2015 05:35:47 -0000
Content-Type: text/plain

We build cmake-native without acl support. However, the acl.h header
is still being checked which would sometimes cause the following error
during do_compile:

     archive_read_disk_entry_from_file.c:38:21: fatal error: sys/acl.h: No such file or directory
     |  #include <sys/acl.h>
     |                      ^
     | compilation terminated.

This happens when the sysroot parts of acl-native is removed between
do_configure and do_compile tasks of cmake-native.

To reproduce the problem manually, execute the following command:

bitbake cmake-native -c cleansstate && bitbake acl-native -c cleansstate && \
bitbake	acl-native && bitbake cmake-native -c configure	&& \
bitbake acl-native -c cleansstate && bitbake cmake-native -c compile

This patch fixes the above problem by explicitly disable the checking for
acl.h header file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
index cd6b1d8..e40dfdd 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
@@ -15,4 +15,5 @@ SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a
 CMAKE_EXTRACONF = "\
     -DBUILD_CursesDialog=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
+    -DHAVE_SYS_ACL_H=0 \
 "
-- 
1.9.1


