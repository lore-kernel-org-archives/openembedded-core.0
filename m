Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE40760A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 19:42:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0VJgRNx001386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 31 Jan 2016 11:42:27 -0800 (PST)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 31 Jan 2016 11:42:26 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 14:42:15 -0500
Message-ID: <1454269335-30127-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: Joe MacDonald <joe_macdonald@mentor.com>
Subject: [PATCH] inetutils: fix up recent build fails due to phantom empty directory
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
X-List-Received-Date: Sun, 31 Jan 2016 19:42:38 -0000
Content-Type: text/plain

Recently I started getting this error:

| rmdir: failed to remove 'build/tmp/work/core2-64-overc-linux/inetutils/1.9.4-r0/image/usr/lib64': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at build/tmp/work/core2-64-overc-linux/inetutils/1.9.4-r0/temp/log.do_install.23373)
ERROR: Task 2 (meta-openembedded/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb, do_install) failed with exit code '1'
NOTE: Tasks Summary: Attempted 818 tasks of which 723 didn't need to be rerun and 1 failed.

Looking at the surrounding code, it seems the empty status of this dir was
always considered optional.  It is unclear to me why it would have just
started to vanish however.

Since it was optional, make the return code from its removal also of
no relevance using a crime I've seen committed in other recipes.

Others are free to dig deeper into the true root cause if their time
permits them to do so.

Cc: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 50aedd30d461..68487eab7d58 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -79,7 +79,7 @@ do_install_append () {
 
     rm -rf ${D}${libexecdir}/
     # remove usr/lib if empty
-    rmdir ${D}${libdir}
+    rmdir ${D}${libdir} || true
 }
 
 PACKAGES =+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
-- 
2.1.4


