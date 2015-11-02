Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1E18860232
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 08:33:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA28XYM0007007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Nov 2015 00:33:35 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 2 Nov 2015 00:33:35 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>
Date: Mon, 2 Nov 2015 16:33:27 +0800
Message-ID: <3669ff8a3e7cd747cb345814b7d9c24019ea9e73.1446453113.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446453113.git.hongxu.jia@windriver.com>
References: <cover.1446453113.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] logrotate: do not move binary logrotate to /usr/bin
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
X-List-Received-Date: Mon, 02 Nov 2015 08:33:37 -0000
Content-Type: text/plain

In oe-core commit a46d3646a3e1781be4423b508ea63996b3cfca8a
...
Author: Fahad Usman <fahad_usman@mentor.com>
Date:   Tue Aug 26 13:16:48 2014 +0500

    logrotate: obey our flags

    Needed to quiet GNU_HASH warnings, and some minor fixes.
...
it explicitly move logrotate to /usr/bin without any reason,
which is against the original Linux location /usr/sbin.

So partly revert the above commit which let logrotate be
kept in the original place /usr/sbin.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index 7d0a159..5f1a601 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -53,7 +53,7 @@ do_compile_prepend() {
 }
 
 do_install(){
-    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir} BINDIR=${bindir}
+    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
     mkdir -p ${D}${sysconfdir}/cron.daily
     mkdir -p ${D}${localstatedir}/lib
-- 
1.9.1


