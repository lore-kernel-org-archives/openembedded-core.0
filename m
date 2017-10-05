Return-Path: <n.merinov@inango-systems.com>
Received: from main-1.inango.com (main-1.inango-systems.com [5.189.174.2])
	by mail.openembedded.org (Postfix) with ESMTP id C42B17804E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 07:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-1.inango.com (Postfix) with ESMTP id F3D944C0EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Oct 2017 09:37:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-1.inango.com ([127.0.0.1])
	by localhost (main-1.inango.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cfy6ylLAfzcI; Thu,  5 Oct 2017 09:37:07 +0200 (CEST)
Received: from nmerinov.inango-sw (unknown [194.60.247.123])
	by main-1.inango.com (Postfix) with ESMTPSA id E54B64C0C6D;
	Thu,  5 Oct 2017 09:37:06 +0200 (CEST)
From: Nikolay Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 12:36:50 +0500
Message-Id: <20171005073651.19752-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH] perl-native: Provide correct lddlflags
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
X-List-Received-Date: Thu, 05 Oct 2017 07:37:09 -0000

For shared libraries compilation perl uses LDDLFLAGS instead of
LDFLAGS. Value for LDDLFLAGS can be provided through
recipe-sysroot-native/usr/lib/perl-native/perl/config.sh file
generated during perl-native compilation.

With default LDDLFLAGS libxml-parser-perl-native package have no
correct rpath in Expat.so module. Provide correct LDDLFLAGS for perl
modules compilation to fix build on hosts without libexpat.so.

Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
---
 meta/recipes-devtools/perl/perl-native_5.24.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
index e01d11fbed..6c56a7d701 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.1.bb
@@ -32,6 +32,7 @@ do_configure () {
 		-Dcc="${CC}" \
 		-Dcflags="${CFLAGS}" \
 		-Dldflags="${LDFLAGS}" \
+		-Dlddlflags="${LDFLAGS} -shared" \
 		-Dcf_by="Open Embedded" \
 		-Dprefix=${prefix} \
 		-Dvendorprefix=${prefix} \
-- 
2.14.2


