Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E0166D843
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 09:02:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAE926fc005390
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Nov 2013 01:02:06 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 01:02:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Nov 2013 17:02:01 +0800
Message-ID: <ac4248f073a505534a6fc9b7c9922b6781b85685.1384419666.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384419666.git.hongxu.jia@windriver.com>
References: <cover.1384419666.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] lib32-packagegroup-core-nfs: fix qa issue - install files into a shared area when those files already exist
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
X-List-Received-Date: Thu, 14 Nov 2013 09:02:06 -0000
Content-Type: text/plain

By default, packagegroup-core-nfs do not depend on a certain architecture,
there will be qa warning while multilib enabled.

$ bitbake packagegroup-core-nfs
$ bitbake lib32-packagegroup-core-nfs
...
WARNING: The recipe lib32-packagegroup-core-nfs is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
tmp/deploy/rpm/all/packagegroup-core-nfs-server-1.0-r2.0.all.rpm
Matched in manifest-allarch-packagegroup-core-nfs.deploy-rpm
Please verify which package should provide the above files.
...

Set PACKAGE_ARCH with MACHINE_ARCH fixed this issue.

[YOCTO #5532]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-nfs.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
index 531eceb..b57ef63 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-nfs.bb
@@ -7,6 +7,7 @@ LICENSE = "MIT"
 PR = "r2"
 
 inherit packagegroup
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES = "${PN}-server"
 
-- 
1.8.1.2


