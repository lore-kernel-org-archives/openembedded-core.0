Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 090C07E5C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 06:41:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5O6fLAT009959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 23:41:31 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 23 Jun 2019 23:41:10 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Jun 2019 14:41:09 +0800
Message-ID: <1561358469-99812-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] quilt: run-ptest remove Interactive Input
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
X-List-Received-Date: Mon, 24 Jun 2019 06:41:41 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

adduser in busybox and adduser under meta-openembeded have different
behavior, adduser under meta-openembeded need Interactive Input like
below if you manually run ptest.

Enter the new value, or press ENTER for the default
	Full Name []:
	Room Number []:
        ...

remove the "Interactive Input" by add --gecos "" to align the behavior
also it is better for automation without interactive input

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/quilt/quilt/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/quilt/quilt/run-ptest b/meta/recipes-devtools/quilt/quilt/run-ptest
index 4b808ae..d2de5c8 100755
--- a/meta/recipes-devtools/quilt/quilt/run-ptest
+++ b/meta/recipes-devtools/quilt/quilt/run-ptest
@@ -2,7 +2,7 @@
 
 THIS_SH=/bin/sh
 ln -sf /bin/ed /usr/bin/ed
-/usr/sbin/adduser --disabled-password quilttest
+/usr/sbin/adduser --disabled-password --gecos "" quilttest
 su -c "${THIS_SH} ./test.sh" quilttest
 /usr/sbin/deluser quilttest
 rm -f /usr/bin/ed
-- 
2.7.4


