Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A3017F2A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2019 08:40:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x798e84T018858
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Aug 2019 01:40:18 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 9 Aug 2019 01:39:57 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Aug 2019 16:39:48 +0800
Message-ID: <1565339988-32571-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] db: add switch for building database verification
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
X-List-Received-Date: Fri, 09 Aug 2019 08:40:27 -0000
Content-Type: text/plain

Add switch for building database verification, enable
this, it will solve the following issue:

root@qemux86-64:~# db_verify /var/lib/rpm/Packages
db_verify: BDB0571 library build did not include support for database verification
BDB5105 Verification of /var/lib/rpm/Packages failed.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 8975647..761d80c 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -56,10 +56,12 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so ${libdir}/libdb_cxx.so"
 
 #configuration - set in local.conf to override
 # All the --disable-* options replace --enable-smallbuild, which breaks a bunch of stuff (eg. postfix)
-DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-verify --disable-compat185 --disable-sql"
+DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disable-replication --disable-compat185 --disable-sql"
 
 EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot STRIP=true"
 
+PACKAGECONFIG[verify] = "--enable-verify, --disable-verify"
+
 EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
 
 EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal -I${S}/dist/aclocal_java"
-- 
1.9.1


