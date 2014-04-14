Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA0E65D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Apr 2014 01:22:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3E1MCP8013743
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Apr 2014 18:22:12 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 13 Apr 2014 18:22:12 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Apr 2014 18:22:12 -0700
Message-ID: <1397438532-16886-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] pixbuff.bbclass: check for gdk-pixbuf-query-loaders errors
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
X-List-Received-Date: Mon, 14 Apr 2014 01:22:15 -0000
Content-Type: text/plain

If we do not see all the bits we need during populate_sysroot_setscene,
we do not want to keep quiet about it and let somebody get screwed
later.  By error exiting, we let bitbake try to recover by
rebuilding the package.  This will, hopefully, fix any dependency
issues, etc, but if not, at least we tried.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/classes/pixbufcache.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index 414fd30..edbb948 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -53,7 +53,10 @@ SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
 pixbufcache_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
-		gdk-pixbuf-query-loaders --update-cache
+		if ! gdk-pixbuf-query-loaders --update-cache
+		then
+			exit 1
+		fi
 	fi
 }
 
-- 
1.7.3.4


