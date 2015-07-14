Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 592F875874
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 05:48:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6E5mPMn007809
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 22:48:25 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.132) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Mon, 13 Jul 2015 22:48:25 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jul 2015 13:50:54 +0800
Message-ID: <1436853054-26245-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.4
eate: Mon, 13 Jul 2015 14:01:01 +0800
MIME-Version: 1.0
Subject: [PATCH v2] logrotate: move binary logrotate back to /usr/sbin
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
X-List-Received-Date: Tue, 14 Jul 2015 05:48:29 -0000
Content-Type: text/plain

Binary logrotate should be installed in /usr/sbin, at the very
beginning, it was there. While with commit a46d3646a3e1781be44:
...
logrotate: obey our flags

Needed to quiet GNU_HASH warnings, and some minor fixes.
...

Part of its modification as below:
...
-    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
+    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir} BINDIR=${bindir}
...
moves it to /usr/bin. It is not correct, so move it back to
/usr/sbin with ${sbindir}. 

Upstream-Status: pending

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
index 7d0a159..6c2e222 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
@@ -53,7 +53,7 @@ do_compile_prepend() {
 }
 
 do_install(){
-    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir} BINDIR=${bindir}
+    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir} BINDIR=${sbindir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
     mkdir -p ${D}${sysconfdir}/cron.daily
     mkdir -p ${D}${localstatedir}/lib
-- 
1.8.5.2.233.g932f7e4


