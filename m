Return-Path: <Baogen.Shang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 483356002A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 07:55:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0Q7tmto015396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 23:55:48 -0800 (PST)
Received: from pek-bshang-d1.wrs.com (128.224.162.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Sat, 25 Jan 2014 23:55:47 -0800
From: Baogen Shang <baogen.shang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jan 2014 15:55:05 +0800
Message-ID: <1390722905-9709-1-git-send-email-baogen.shang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] curl:Fix multilib header conflict - curl/curlbuild.h
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
X-List-Received-Date: Sun, 26 Jan 2014 07:55:47 -0000
Content-Type: text/plain

curl/curlbuild.h conflicts between 32-bit and 64-bit versions.

Signed-off-by: Baogen Shang <baogen.shang@windriver.com>
---
 meta/recipes-support/curl/curl_7.34.0.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.34.0.bb b/meta/recipes-support/curl/curl_7.34.0.bb
index c4e722d..b49c6e4 100644
--- a/meta/recipes-support/curl/curl_7.34.0.bb
+++ b/meta/recipes-support/curl/curl_7.34.0.bb
@@ -21,7 +21,7 @@ SRC_URI += " file://configure_ac.patch"
 SRC_URI[md5sum] = "88491df2bb32e9146e776ae6ac2f8327"
 SRC_URI[sha256sum] = "10beade56b48311499e444783df3413405b22f20a147ed4a1d8a8125f1cc829b"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig multilib_header
 
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --without-libssh2 \
@@ -41,6 +41,10 @@ do_configure_prepend() {
 	sed -i s:OPT_GNUTLS/bin:OPT_GNUTLS:g ${S}/configure.ac
 }
 
+do_install_append() {
+	oe_multilib_header curl/curlbuild.h
+}
+
 PACKAGES =+ "${PN}-certs libcurl libcurl-dev libcurl-staticdev libcurl-doc"
 
 FILES_${PN}-certs = "${datadir}/curl/curl-*"
-- 
1.7.9.5


