Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 570C071DAB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 23:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYaEN000371; Wed, 8 Feb 2017 23:34:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i7_b8wfDIuq5; Wed,  8 Feb 2017 23:34:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v18NYYiT000346
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Feb 2017 23:34:35 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cbbkw-0006Qf-HZ; Wed, 08 Feb 2017 23:34:34 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 23:34:29 +0000
Message-Id: <1486596869-24628-7-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486596869-24628-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 7/7] nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH
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
X-List-Received-Date: Wed, 08 Feb 2017 23:34:39 -0000

Switching between 32 and 64 bit BUILD_ARCH shows:

$ bitbake-diffsigs tmp-sstatesamehash*/stamps/*/nss-native/3.27.1-r0.do_compile.sigdata.*
basehash changed from 944cc4554a823ba966aeda0ac3d33b79 to 2475db3659c248d81d0e4dadb3c1b4cd
Variable SITEINFO_BITS value changed from '32' to '64'

We shouldn't have this dependency and it would fail oe-selftest test_sstate_32_64_same_hash
if nss-native were included, therefore exclude it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/nss/nss_3.27.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/nss/nss_3.27.1.bb b/meta/recipes-support/nss/nss_3.27.1.bb
index 9aad5bd..c89470f 100644
--- a/meta/recipes-support/nss/nss_3.27.1.bb
+++ b/meta/recipes-support/nss/nss_3.27.1.bb
@@ -107,6 +107,7 @@ do_compile() {
         OS_TEST=${OS_TEST} \
         RPATH="${RPATH}"
 }
+do_compile[vardepsexclude] += "SITEINFO_BITS"
 
 
 do_install_prepend_class-nativesdk() {
@@ -180,6 +181,7 @@ do_install() {
         install -m 755 -t ${D}/${bindir} $binary
     done
 }
+do_install[vardepsexclude] += "SITEINFO_BITS"
 
 do_install_append() {
     # Create empty .chk files for the NSS libraries at build time. They could
-- 
2.7.4


