Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03E2B60684
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 07:46:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA17k6QA027255
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2016 00:46:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 1 Nov 2016 00:46:05 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2016 15:39:42 +0800
Message-ID: <20d9918c64b28177c657e8e30ed1fcd3de526b45.1477985510.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1477985510.git.kai.kang@windriver.com>
References: <cover.1477985510.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] dbus-test: correct paths in service and conf files
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
X-List-Received-Date: Tue, 01 Nov 2016 07:46:08 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Build path ${B} exists in some service and conf files of ptest. Replace
with right directory.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/dbus/dbus-test_1.10.10.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus-test_1.10.10.bb b/meta/recipes-core/dbus/dbus-test_1.10.10.bb
index 650b7ab..29d7f91 100644
--- a/meta/recipes-core/dbus/dbus-test_1.10.10.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.10.10.bb
@@ -54,5 +54,8 @@ do_install_ptest() {
 	for i in $l; do install ${B}/bus/.libs/test-$i ${D}${PTEST_PATH}/test; done
 	install ${B}/dbus/.libs/test-dbus ${D}${PTEST_PATH}/test
 	cp -r ${B}/test/data ${D}${PTEST_PATH}/test
+
+	# set right path in service and conf files
+	find ${D} -type f -not -executable -exec sed -i 's#${B}#${PTEST_PATH}#' {} \;
 }
 RDEPENDS_${PN}-ptest += "bash"
-- 
2.10.1


