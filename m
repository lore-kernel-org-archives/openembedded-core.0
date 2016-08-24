Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D12C73D46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 09:28:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7O9SAeZ023991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 02:28:10 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 24 Aug 2016 02:28:09 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2016 17:26:37 +0800
Message-ID: <1958d06a6f3885b5d7f767c3eb955054d2b40ec1.1472030722.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1472030722.git.kai.kang@windriver.com>
References: <cover.1472030722.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bash: fix interpreter of ptest script
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
X-List-Received-Date: Wed, 24 Aug 2016 09:28:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The interpreter of bash ptest script tests/getopts5.sub is
/local/bin/bash which is not suitable for oe. Use /bin/bash instead.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/bash/bash.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 1d08526..d299a4a 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -54,6 +54,8 @@ do_install_ptest () {
 	cp ${B}/Makefile ${D}${PTEST_PATH}
         sed -i -e 's/^Makefile/_Makefile/' -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
 	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" ${D}${PTEST_PATH}/Makefile
+
+	sed -i -e 's:/local\(/bin/bash\):\1:' ${D}${PTEST_PATH}/tests/getopts5.sub
 }
 
 pkg_postinst_${PN} () {
-- 
2.9.3


