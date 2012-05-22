Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SWmHe-0005NI-UB
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 12:25:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4MAFYm9009902
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 03:15:34 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 22 May 2012 03:15:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 18:15:33 +0800
Message-ID: <dc94c1bb359b466c779a11fd8559851a8c6ea5d2.1337681343.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1337681343.git.liezhi.yang@windriver.com>
References: <cover.1337681343.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] tune-core2.inc: PACKAGE_EXTRA_ARCHS causes wrong packages install into image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 May 2012 10:25:43 -0000
Content-Type: text/plain

There is a bug if we:
1) bitbake diffutils with MACHINE=crownbay
2) bitbake diffutils with MACHINE=qemux86
3) bitbake core-image-sato with MACHINE=crownbay

Then the diffutils.i586 would be installed to the crownbay's image, this
is because diffutils.i586 is newer than diffutils.core2, both of
deploy/rpm/i586 and deploy/rpm/core2 are in the dbpath, so rpm will
select the newer one (diffutils.i586). This caused by:

PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586 i686 core2"

The PACKAGE_EXTRA_ARCHS will cause the deploy/rpm/i586 in the crownbay's
dbpath, so any pkg which is needed by the image of both crownbay and
qemux86, if the i586 one is newer than the core2, it would be installed
into crownbay's image.

This is for yocto 1.2.1, if it is OK, I think the master branch also
needs it.

[YOCTO #2360]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/tune-core2.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 338ba73..aabdf9c 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -11,7 +11,7 @@ AVAILTUNES += "core2"
 TUNE_FEATURES_tune-core2 = "${TUNE_FEATURES_tune-x86} core2"
 BASE_LIB_tune-core2 = "lib"
 TUNE_PKGARCH_tune-core2 = "core2"
-PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-x86} i386 i486 i586 i686 core2"
+PACKAGE_EXTRA_ARCHS_tune-core2 = "${PACKAGE_EXTRA_ARCHS_tune-x86} core2"
 
 AVAILTUNES += "core2-64"
 TUNE_FEATURES_tune-core2-64 = "${TUNE_FEATURES_tune-x86-64} core2"
-- 
1.7.1



