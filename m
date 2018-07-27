Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3783478CCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 09:32:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6R9WD5Y020047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 02:32:13 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 02:32:13 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 17:32:11 +0800
Message-ID: <1532683931-416213-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] curl: support multilib installation
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
X-List-Received-Date: Fri, 27 Jul 2018 09:32:13 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

curl-config is generated to displays information about
the curl and libcurl installation. So the content is different
for 32bit and 64bit package. eg: maybe for 32bit, use
i686-linux-gnu-gcc, and for 64bit, use x86-64-linux-gnu-gcc.

Use update-alternatives to add base_libdir as suffix to create
seperate curl-config, so user can check both info of 32/64 bit
curl.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/curl/curl_7.61.0.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 03d627e..29e7d00 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -13,7 +13,7 @@ SRC_URI[md5sum] = "31d0a9f48dc796a7db351898a1e5058a"
 SRC_URI[sha256sum] = "5f6f336921cf5b84de56afbd08dfb70adeef2303751ffb3e570c936c6d656c9c"
 
 CVE_PRODUCT = "libcurl"
-inherit autotools pkgconfig binconfig multilib_header
+inherit autotools pkgconfig binconfig multilib_header update-alternatives
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} gnutls proxy threaded-resolver verbose zlib"
 PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose zlib"
@@ -48,6 +48,17 @@ PACKAGECONFIG[threaded-resolver] = "--enable-threaded-resolver,--disable-threade
 PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+ALTERNATIVE_${PN}-dev = "curl-config"
+ALTERNATIVE_LINK_NAME[curl-config] = "${bindir}/curl-config"
+ALTERNATIVE_TARGET[curl-config] = "${bindir}/curl-config-${MULTILIB_SUFFIX}"
+
+PACKAGE_PREPROCESS_FUNCS += "alternative_rename"
+
+alternative_rename() {
+        mv ${PKGD}${bindir}/curl-config ${PKGD}${bindir}/curl-config-${MULTILIB_SUFFIX}
+}
+
 EXTRA_OECONF = " \
     --disable-ntlm-wb \
     --enable-crypto-auth \
-- 
2.7.4


