Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5AE7702D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:09:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U895rb008828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 01:09:05 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 30 Sep 2015 01:09:04 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 04:09:00 -0400
Message-ID: <0f0c78a80630cf1d7b8d7393f2e81c6525e11844.1443600210.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1443600210.git.wenzong.fan@windriver.com>
References: <cover.1443600210.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3 v2] gnutls: cleanup buildpaths from gnutls.pc
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
X-List-Received-Date: Wed, 30 Sep 2015 08:09:07 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

For multilib build, PKG_CONFIG_SYSROOT_DIR will be injected in values
that are returned by 'pkg-config --libs xxx', such as for zlib:

  dev-shell# pkg-config --libs zlib
  -L/path/to/tmp/sysroots/qemux86-64/usr/lib64 -lz

The values used by configure to generate various files from templates.

For gnutls, the buildpaths should be cleaned up from:

* gnutls.pc:
  generated from lib/gnutls.pc.in that includes @LTLIBZ@

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index e9b138a..3c8d4c9 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -38,6 +38,11 @@ PACKAGECONFIG ??= "zlib"
 PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
 PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
 
+do_install_append_class-target() {
+	# cleanup buildpaths from gnutls.pc
+	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${libdir}/pkgconfig/gnutls.pc
+}
+
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
-- 
1.9.1


