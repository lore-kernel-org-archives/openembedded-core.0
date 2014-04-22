Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7F518609B1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 18:00:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3MI0gnE001369
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 11:00:42 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Apr 2014 11:00:42 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Apr 2014 11:00:41 -0700
Message-ID: <1398189641-16698-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [V2][PATCH 1/1] pixbufcache: add error exit in pixbufcache_sstate_postinst
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
X-List-Received-Date: Tue, 22 Apr 2014 18:00:42 -0000
Content-Type: text/plain

In order to attempt recovery of a failed populate_sysroot_setscene,
we need to explicitly error exit an SSTATEPOSTINSTFUNC.  So, we test
the return value of gdk-pixbuf-query-loaders.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/pixbufcache.bbclass |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 922174d..b8d75bd 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -46,14 +46,16 @@ python populate_packages_append() {
 }
 
 #
-# Add a sstate postinst hook to update the cache for native packages
+# Add an sstate postinst hook to update the cache for native packages.
+# An error exit during populate_sysroot_setscene allows bitbake to
+# try to recover by re-building the package.
 #
 SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
 
 pixbufcache_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
-		GDK_PIXBUF_FATAL_LOADER=1 gdk-pixbuf-query-loaders --update-cache
+		GDK_PIXBUF_FATAL_LOADER=1 gdk-pixbuf-query-loaders --update-cache || exit 1
 	fi
 }
 
-- 
1.7.3.4


