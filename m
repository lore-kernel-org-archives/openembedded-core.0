Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 562B16093F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491839997; x=1523375997;
	h=from:to:cc:subject:date:message-id;
	bh=BVda/X1IFqVj/vsWvBytDlNmnVCU/b9tTWbkmockRfA=;
	b=OXSEyasc9f3WxepShXBl+HjbqxU3tPALE43EOXVl4zSd922zQvY98FSS
	COaty7oiLdSNWP4v23CsoNmI+VS/dg==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2017 08:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,182,1488873600"; d="scan'208";a="86978306"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 10 Apr 2017 08:59:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Apr 2017 18:59:28 +0300
Message-Id: <20170410155928.7461-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] openssl: fix the reference to native perl in ptests
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
X-List-Received-Date: Mon, 10 Apr 2017 15:59:55 -0000

This was causing a couple of ptest failures.

[YOCTO #10840]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 481a4445605..fcaf2318085 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -205,6 +205,10 @@ do_install () {
 
 do_install_ptest () {
 	cp -r -L Makefile.org Makefile test ${D}${PTEST_PATH}
+
+        # Replace the path to native perl with the path to target perl
+        sed -i 's,^PERL=.*,PERL=/usr/bin/perl,' ${D}${PTEST_PATH}/Makefile
+
 	cp Configure config e_os.h ${D}${PTEST_PATH}
 	cp -r -L include ${D}${PTEST_PATH}
 	ln -sf ${libdir}/libcrypto.a ${D}${PTEST_PATH}
-- 
2.11.0


