Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 440897E1CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 08:07:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5D8764u010902
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2019 01:07:27 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 13 Jun 2019 01:07:03 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jun 2019 04:06:24 -0400
Message-ID: <1560413184-99289-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] diffutils/run-ptest: support to run at arbitrary path
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
X-List-Received-Date: Thu, 13 Jun 2019 08:07:36 -0000
Content-Type: text/plain

1. Run run-ptest at arbitrary path

2. Fix large-subopt.in1 not found
...
|diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in1:
No such file or directory
|diff: /lib32-diffutils/3.7-r0/build/../diffutils-3.7/tests/large-subopt.in2:
No such file or directory
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/diffutils/diffutils/run-ptest | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/diffutils/diffutils/run-ptest b/meta/recipes-extended/diffutils/diffutils/run-ptest
index 695c5e8a7b..ad467d9bd0 100644
--- a/meta/recipes-extended/diffutils/diffutils/run-ptest
+++ b/meta/recipes-extended/diffutils/diffutils/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-make -C tests check-TESTS
+abs_ptestdir=`echo "$(cd "$(dirname "$0")"; pwd)"`
+make -C $abs_ptestdir/tests check-TESTS abs_top_srcdir="$abs_ptestdir"
-- 
2.17.1


