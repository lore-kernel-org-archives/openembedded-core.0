Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1EB47344B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 08:15:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1D8FdWu022786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 00:15:39 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 13 Feb 2015 00:15:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Feb 2015 00:15:31 -0800
Message-ID: <60489a508f1e45bd3ed06c23076cc35ac9bccc48.1423808841.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423808841.git.liezhi.yang@windriver.com>
References: <cover.1423808841.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] openssl: fix and enable parallel build
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
X-List-Received-Date: Fri, 13 Feb 2015 08:15:38 -0000
Content-Type: text/plain

Fixed:
Cannot create directory image/usr: File exists
make: *** [install_sw] Error 17

Create /usr to avoid race issues.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |    3 +++
 .../recipes-connectivity/openssl/openssl_1.0.1j.bb |    3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 31dfd8f..439c475 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -152,6 +152,9 @@ do_compile_ptest () {
 }
 
 do_install () {
+	# Create ${D}/${prefix} to fix parallel issues
+	mkdir -p ${D}/${prefix}/
+
 	oe_runmake INSTALL_PREFIX="${D}" MANDIR="${mandir}" install
 
 	oe_libinstall -so libcrypto ${D}${libdir}
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
index 2da18ae..2bca400 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1j.bb
@@ -49,9 +49,6 @@ PACKAGES =+ " \
 FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
 FILES_${PN}-engines-dbg = "${libdir}/ssl/engines/.debug"
 
-PARALLEL_MAKE = ""
-PARALLEL_MAKEINST = ""
-
 do_configure_prepend() {
   cp ${WORKDIR}/find.pl ${S}/util/find.pl
 }
-- 
1.7.9.5


