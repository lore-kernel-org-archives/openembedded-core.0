Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD6E73175
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7Ewd7024187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:58 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:22 -0800
Message-ID: <7aab4744a329f5fd1aca221950ef629e9f92b456.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1451286789.git.liezhi.yang@windriver.com>
References: <cover.1451286789.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/40] openssl: sanity check that the bignum module is present
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:57 -0000
Content-Type: text/plain

From: Ross Burton <ross.burton@intel.com>

The crypto_use_bigint_in_x86-64_perl patch uses the "bigint" module to
transparently support 64-bit integers on 32-bit hosts.  Whilst bigint (part of
bignum) is a core Perl module not all distributions install it (notable Fedora
23).

As the error message when bignum isn't installed is obscure, add a task to check
that it is available and alert the user if it isn't.

[ YOCTO #8562 ]

(From OE-Core master rev: 2f9a2fbc46aa435a0a7f7662bb62029ac714f25a)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index fd56841..659e0bd 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -56,3 +56,13 @@ PARALLEL_MAKEINST = ""
 do_configure_prepend() {
   cp ${WORKDIR}/find.pl ${S}/util/find.pl
 }
+
+# The crypto_use_bigint patch means that perl's bignum module needs to be
+# installed, but some distributions (for example Fedora 23) don't ship it by
+# default.  As the resulting error is very misleading check for bignum before
+# building.
+do_configure_prepend() {
+	if ! perl -Mbigint -e true; then
+		bbfatal "The perl module 'bignum' was not found but this is required to build openssl.  Please install this module (often packaged as perl-bignum) and re-run bitbake."
+	fi
+}
-- 
1.7.9.5


