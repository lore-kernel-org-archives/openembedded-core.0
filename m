Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 74E387C37F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 08:27:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBR8RKnP016821
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2019 00:27:20 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 27 Dec 2019 00:27:08 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Dec 2019 16:27:05 +0800
Message-ID: <20191227082705.29041-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] dummy-sdk-package: append RREPLACES with DUMMYPROVIDES
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
X-List-Received-Date: Fri, 27 Dec 2019 08:27:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When multilib is enabled and installs lib32-perl to image, such as set

  IMAGE_INSTALL_append = " lib32-perl"

it fails to run task populate_sdk of images:

| Problem: package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
|   conflicts with lib32-perl provided by lib32-perl-5.30.1-r0.i586

Append ${DUMMYPROVIDES} rather than ${DUMMYPROVIDES_PACKAGES} to
variable RREPLACES that variable DUMMYPROVIDES contains multilib
variants of the packages.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/meta/dummy-sdk-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/dummy-sdk-package.inc b/meta/recipes-core/meta/dummy-sdk-package.inc
index 61afab1d76..91466a36e9 100644
--- a/meta/recipes-core/meta/dummy-sdk-package.inc
+++ b/meta/recipes-core/meta/dummy-sdk-package.inc
@@ -25,6 +25,6 @@ python populate_packages_prepend() {
     p = d.getVar("PN")
     d.appendVar("RPROVIDES_%s" % p, "${DUMMYPROVIDES}")
     d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}")
-    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES_PACKAGES}")
+    d.appendVar("RREPLACES_%s" % p, "${DUMMYPROVIDES}")
 }
 
-- 
2.17.1


