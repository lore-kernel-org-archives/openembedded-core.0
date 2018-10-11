Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DF3F79AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 09:55:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9B9tCQH019922
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 11 Oct 2018 02:55:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 11 Oct 2018 02:55:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Thu, 11 Oct 2018 02:55:11 -0700
Message-ID: <20181011095511.5509-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] openssl: use nativeperl to build
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
X-List-Received-Date: Thu, 11 Oct 2018 09:55:12 -0000
Content-Type: text/plain

If host perl is old version (such as perl v5.16.3 on CentOS-7.5),
the openssl-native failed at do_install, the reason is its Makefile
is not correct which is generated at do_configure by perl script.

Use nativeperl to assure latest perl on host for openssl build.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 5a43a15..52d4e60 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
 SRC_URI[md5sum] = "7079eb017429e0ffb9efb42bf80ccb21"
 SRC_URI[sha256sum] = "2836875a0f89c03d0fdf483941512613a50cfb421d6fd94b9f41d7279d586a3d"
 
-inherit lib_package multilib_header ptest
+inherit lib_package multilib_header ptest perlnative
 
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
@@ -105,7 +105,9 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
-	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
+	export PERL="nativeperl"
+	/usr/bin/env nativeperl	./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} \
+	    --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 }
 
 do_install () {
-- 
2.7.4


