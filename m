Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFE8D6D6A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 07:14:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA47E82k019985
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Nov 2013 23:14:08 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Sun, 3 Nov 2013 23:14:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Nov 2013 15:13:56 +0800
Message-ID: <41d756b2c747f54fe1becef434e9a18b821a505d.1383549031.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1383549031.git.hongxu.jia@windriver.com>
References: <cover.1383549031.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/4] nfs-utils: fix QA issue
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
X-List-Received-Date: Mon, 04 Nov 2013 07:14:06 -0000
Content-Type: text/plain

...
WARNING: QA Issue: nfs-utils: Found a reference to /usr/ in /home/jiahongxu/yocto/build-20131025-gcc5/bitbake_build/tmp/work/x86_64-wrs-linux/nfs-utils/1.2.8-r1/packages-split/nfs-utils/sbin/osd_login
WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix
...

Move osd_login from ${base_sbindir} to ${sbindir} fixed this issue

[YOCTO #5142]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index e3e8136..5329822 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -89,4 +89,6 @@ do_install_append () {
 	rm -f ${D}${sbindir}/rpcdebug
 	rm -f ${D}${sbindir}/rpcgen
 	rm -f ${D}${sbindir}/locktest
+
+	mv ${D}${base_sbindir}/osd_login ${D}${sbindir}/osd_login
 }
-- 
1.8.1.2


