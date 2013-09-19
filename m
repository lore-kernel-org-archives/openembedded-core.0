Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45E9360579
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 23:47:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8JNl5Kk006880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 16:47:06 -0700 (PDT)
Received: from yow-rmacleod-lx1.wrs.com (128.224.146.103) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 19 Sep 2013 16:47:05 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Sep 2013 19:47:05 -0400
Message-ID: <1379634425-9499-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.8.1
MIME-Version: 1.0
Subject: [PATCH] pseudo: force NO32LIB to true for nativesdk
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
X-List-Received-Date: Thu, 19 Sep 2013 23:47:04 -0000
Content-Type: text/plain

The exported SDK only needs simulated root privileges for specific
tasks, such as the user-mode NFS server or rootfs extraction, and
oe-core does not support multilib builds in the generated SDK, so
it is neither necessary nor possible to build a 32-bit libpseudo.so
for a 64-bit SDK.

[YOCTO #5135]

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index 5451aa2..a4b7aaf 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -26,6 +26,7 @@ do_configure () {
 }
 
 NO32LIBS ??= "1"
+NO32LIBS_virtclass-nativesdk = "1"
 
 # Compile for the local machine arch...
 do_compile () {
-- 
1.8.1


