Return-Path: <juro.bystricky@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id BE493744E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 20:27:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2018 13:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,378,1517904000"; d="scan'208";a="212448288"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga005.jf.intel.com with ESMTP; 29 Mar 2018 13:27:04 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 13:27:02 -0700
Message-Id: <1522355222-4935-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libpcre-ptest: skip locale test
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
X-List-Received-Date: Thu, 29 Mar 2018 20:27:04 -0000

If a fr_FR locale is found, it is automatically tested. The test
will fail if the locale is UTF-8, as the test blindly assumes
(and expects) a non-UTF fr_FR locale.
The remedy is to skip the test.

[YOCTO #12215]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-support/libpcre/libpcre_8.41.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libpcre/libpcre_8.41.bb b/meta/recipes-support/libpcre/libpcre_8.41.bb
index 0eaed18..0187c08 100644
--- a/meta/recipes-support/libpcre/libpcre_8.41.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.41.bb
@@ -80,4 +80,8 @@ do_install_ptest() {
 	for i in RunTest RunGrepTest test-driver; \
 	  do cp ${S}/$i $t; \
 	done
+	# Skip the fr_FR locale test. If the locale fr_FR is found, it is tested.
+	# If not found, the test is skipped. The test program assumes fr_FR is non-UTF-8
+	# locale so the test fails if fr_FR is UTF-8 locale.
+	sed -i -e 's:do3=yes:do3=no:g' ${D}${PTEST_PATH}/RunTest 
 }
-- 
2.7.4


