Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA02739C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 09:23:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2A9NFla008292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 02:23:16 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 10 Mar 2015 02:23:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Mar 2015 02:23:13 -0700
Message-ID: <620478a60aaf4644f3cfd5bfb8978fad601d86d5.1425979323.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1425979323.git.liezhi.yang@windriver.com>
References: <cover.1425979323.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] mtd-utils: disable parallel build
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
X-List-Received-Date: Tue, 10 Mar 2015 09:23:15 -0000
Content-Type: text/plain

Disable parallel build because of:
git/.compr.c.dep:46: warning: NUL character seen; rest of line ignored
git/.compr.c.dep:47: *** missing separator.  Stop.

Because both mkfs.jffs2 and mkfs.ubifs depend on compr.c, and
.compr.c.dep may generate twice at the same time.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 267d1e9..f934b17 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -30,3 +30,7 @@ FILES_mtd-utils-ubifs = "${sbindir}/mkfs.ubifs ${sbindir}/ubi*"
 FILES_mtd-utils-misc = "${sbindir}/nftl* ${sbindir}/ftl* ${sbindir}/rfd* ${sbindir}/doc* ${sbindir}/serve_image ${sbindir}/recv_image"
 
 BBCLASSEXTEND = "native"
+
+# git/.compr.c.dep:46: warning: NUL character seen; rest of line ignored
+# git/.compr.c.dep:47: *** missing separator.  Stop.
+PARALLEL_MAKE = ""
-- 
1.7.9.5


