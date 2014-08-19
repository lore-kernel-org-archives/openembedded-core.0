Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D588160030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCVNM5004421 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:31:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W4aRu5X2qnju
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:31:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCVLil004417
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:31:22 +0100
Message-ID: <1408451482.1669.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 13:31:22 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Set PACKAGE_ARCH with ??=
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
X-List-Received-Date: Tue, 19 Aug 2014 12:31:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently its near impossible for other classes to sanely override
this value with their own default. By setting a weak default we can 
allow other classes to change the default and allow end recipes to
again override this.

As far as I can tell, there shouldn't be any regressions from this
change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ef30cb6..2537ef1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -133,7 +133,7 @@ SDK_LD_ARCH = "${BUILD_LD_ARCH}"
 SDK_AS_ARCH = "${BUILD_AS_ARCH}"
 
 TUNE_PKGARCH ??= ""
-PACKAGE_ARCH = "${TUNE_PKGARCH}"
+PACKAGE_ARCH ??= "${TUNE_PKGARCH}"
 MACHINE_ARCH = "${@[d.getVar('TUNE_PKGARCH', True), d.getVar('MACHINE', True)][bool(d.getVar('MACHINE', True))].replace('-', '_')}"
 PACKAGE_EXTRA_ARCHS ??= "${PACKAGE_EXTRA_ARCHS_tune-${DEFAULTTUNE}}"
 PACKAGE_ARCHS = "all any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}"



