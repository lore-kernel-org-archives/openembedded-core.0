Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF68A60720
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 07:49:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w697nt3O022749
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2018 00:49:55 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 9 Jul 2018 00:49:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jul 2018 15:49:52 +0800
Message-ID: <1531122592-221110-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] coreutils: fix compile error since use wrong libnss_nis.so
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
X-List-Received-Date: Mon, 09 Jul 2018 07:49:54 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
file libnsl.so.1 with link time reference

Recent glibc change removed libnss-nis module from glibc and
a new recipe libnss-nis.bb was added. After this change,
we need to include native libnss_nis in coreutils. otherwise,
with "nis" in host /etc/nssswitch.conf, id will use host
libnss_nis.so, which will cause above error

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_8.29.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.29.bb b/meta/recipes-core/coreutils/coreutils_8.29.bb
index 4704f32..eb9686b 100644
--- a/meta/recipes-core/coreutils/coreutils_8.29.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.29.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;beginline=1;endline=15;md5=1c3f9411e1842a062ce5ce9210beee0e"
 DEPENDS = "gmp libcap"
-DEPENDS_class-native = ""
+DEPENDS_class-native = "libnss-nis-native"
 
 inherit autotools gettext texinfo
 
-- 
2.7.4


