Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 96EDE7404E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:04:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8OB4f38003316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 04:04:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 24 Sep 2015 04:04:40 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Sep 2015 07:04:39 -0400
Message-ID: <1443092679-216053-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gnutls: cleanup buildpaths from gnutls.pc
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
X-List-Received-Date: Thu, 24 Sep 2015 11:04:40 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* gnutls.pc:
  -L/path/to/tmp/sysroots/qemux86-64/lib64 -> -L/lib64

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index e9b138a..0a5e663 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -38,6 +38,11 @@ PACKAGECONFIG ??= "zlib"
 PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
 PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
 
+do_install_append() {
+	# cleanup buildpaths from gnutls.pc
+	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gnutls.pc
+}
+
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
-- 
1.9.1


