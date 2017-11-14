Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05C4671AB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 07:59:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vAE7xAqp002330
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 23:59:10 -0800
Received: from pek-lpg-core1.windriver.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 13 Nov 2017 23:59:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Nov 2017 15:57:47 +0800
Message-ID: <480b881c0ad08618fbc5e9d9d0de4bf6da5dc26d.1510646201.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1510646201.git.liezhi.yang@windriver.com>
References: <cover.1510646201.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa: make OEHasPackage() check multilib package
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
X-List-Received-Date: Tue, 14 Nov 2017 07:59:09 -0000
Content-Type: text/plain

Make OEHasPackage() check multilib package when test multilib image, for
example, OEHasPackage(['dnf']) should check lib32-dnf when test
lib32-core-image-sato, this can make
"bitbake lib32-core-image-sato -ctestimage" work, otherwise the testcases
would be skipped.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/runtime/decorator/package.py | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index aa6ecb6..1a8bc00 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -32,11 +32,20 @@ class OEHasPackage(OETestDecorator):
         need_pkgs = set()
         unneed_pkgs = set()
         pkgs = strToSet(self.need_pkgs)
+        # Conver to multilib
+        mlprefix = self.case.tc.td['MLPREFIX']
         for pkg in pkgs:
             if pkg.startswith('!'):
-                unneed_pkgs.add(pkg[1:])
+                pkg_name = pkg[1:]
+                if mlprefix and not pkg_name.startswith(mlprefix):
+                    unneed_pkgs.add('%s%s' % (mlprefix, pkg_name))
+                else:
+                    unneed_pkgs.add(pkg_name)
             else:
-                need_pkgs.add(pkg)
+                if mlprefix and not pkg.startswith(mlprefix):
+                    need_pkgs.add('%s%s' % (mlprefix, pkg))
+                else:
+                    need_pkgs.add(pkg)
 
         if unneed_pkgs:
             msg = 'Checking if %s is not installed' % ', '.join(unneed_pkgs)
-- 
2.7.4


