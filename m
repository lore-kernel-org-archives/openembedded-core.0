Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2C4179987
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:25:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T6OoX8015417
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 23:25:00 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:24:39 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:43:49 +0800
Message-ID: <e264c183d7ab6ce4087ac6fca6bd6cadff6026c4.1538199671.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/10] man-db: fix multilib install file conflict
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
X-List-Received-Date: Sat, 29 Sep 2018 06:25:24 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The first line of config file man_db.conf is the package name. It causes
multilib install file conflict. So remove the first line.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/man-db/man-db_2.8.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/man-db/man-db_2.8.3.bb b/meta/recipes-extended/man-db/man-db_2.8.3.bb
index 97e5a3d6fb..da6d291011 100644
--- a/meta/recipes-extended/man-db/man-db_2.8.3.bb
+++ b/meta/recipes-extended/man-db/man-db_2.8.3.bb
@@ -26,6 +26,9 @@ do_install() {
 	        install -d ${D}/etc/default/volatiles
 		install -m 0644 ${WORKDIR}/99_mandb ${D}/etc/default/volatiles
 	fi
+
+    # the 1st line of man_db.conf is package name which causes multilib install file conflict
+    sed -i '1d' ${D}${sysconfdir}/man_db.conf
 }
 
 do_install_append_libc-musl() {
-- 
2.18.0


