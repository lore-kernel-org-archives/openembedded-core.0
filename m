Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7254E71503
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:44:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9iApV020338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 01:44:11 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:44:10 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Nov 2014 04:44:04 -0500
Message-ID: <b042b26c0b227bcac4766d3446f5a9333216bda6.1415957951.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1415957951.git.wenzong.fan@windriver.com>
References: <cover.1415957951.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] e2fsprogs: clean host path in compile_et, mk_cmds
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
X-List-Received-Date: Fri, 14 Nov 2014 09:44:10 -0000
Content-Type: text/plain

From: Shiqun Lin <Shiqun.Lin@windriver.com>

* /usr/bin/compile_et
* /usr/bin/mk_cmds

Signed-off-by: Shiqun Lin <Shiqun.Lin@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index f89e5ac..1fb4a6cd 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -54,6 +54,12 @@ do_install () {
 	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
 }
 
+do_install_append_class-target() {
+	# Clean host path in compile_et, mk_cmds
+	sed -i -e "s,ET_DIR=\"${S}/lib/et\",ET_DIR=\"${datadir}/et\",g" ${D}${bindir}/compile_et
+	sed -i -e "s,SS_DIR=\"${S}/lib/ss\",SS_DIR=\"${datadir}/ss\",g" ${D}${bindir}/mk_cmds
+}
+
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
 RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
 
-- 
1.7.9.5


