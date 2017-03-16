Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F26DA606CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:21:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GEL8vX009181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:21:08 -0700
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:21:07 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:20:52 -0400
Message-ID: <1489674056-21470-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489674056-21470-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] gdb: don't bundle bfd.info -- leave that to binutils.
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
X-List-Received-Date: Thu, 16 Mar 2017 14:21:09 -0000
Content-Type: text/plain

We see:

  file /usr/share/info/bfd.info conflicts between attempted installs
  of gdb-doc-7.12.1-r0.core2_64 and binutils-doc-2.28-r0.core2_64

You can't really have gdb and not binutils, so there is no need
to do alternatives here ; just clobber the one from gdb and let
the binutils one be the default.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 5b8087c3ba8f..239b37586b77 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -47,11 +47,12 @@ do_configure () {
 }
 
 # we don't want gdb to provide bfd/iberty/opcodes, which instead will override the
-# right bits installed by binutils.
+# right bits installed by binutils.  Same for bfd.info -- also from binutils.
 do_install_append() {
 	rm -rf ${D}${libdir}
 	rm -rf ${D}${includedir}
 	rm -rf ${D}${datadir}/locale
+	rm -f ${D}${infodir}/bfd.info
 }
 
 RRECOMMENDS_gdb_append_linux = " glibc-thread-db "
-- 
2.7.4


