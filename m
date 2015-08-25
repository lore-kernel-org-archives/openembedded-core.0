Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4FFDF76BEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGx7kx015161 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:59:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rapeCW_553kK
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:59:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t7PGwttQ015154
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 17:59:06 +0100
Message-ID: <1440521935.12105.438.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Aug 2015 17:58:55 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] os-release: Exclude DATETIME from sstate signature
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
X-List-Received-Date: Tue, 25 Aug 2015 16:59:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm torn over this, I can see someone wanting this to vary in each
build. What pushed me to believe its incorrect in its current form
is that it changes for every MACHINE build, making a complete mess
if you try and generate package feeds using it.

The alternative would be to give up on allarch in this case and make
it MACHINE specific which at least would then be more consistent when
the package makes it to a package feed. If someone wants to do that,
the can propose another patch but this change at least make package
feed usage 'sane' again and avoids the perpetual rebuilds.

Incidentally, its worth noting that changes in source metadata revision
used for the build and included in this recipe would still trigger
rebuilds which is likely the common use case people actually care about.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
index 87fea6f..10a4570 100644
--- a/meta/recipes-core/os-release/os-release.bb
+++ b/meta/recipes-core/os-release/os-release.bb
@@ -21,6 +21,7 @@ VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in
 VERSION_ID = "${DISTRO_VERSION}"
 PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
 BUILD_ID ?= "${DATETIME}"
+BUILD_ID[vardepsexclude] = "DATETIME"
 
 python do_compile () {
     with open(d.expand('${B}/os-release'), 'w') as f:



