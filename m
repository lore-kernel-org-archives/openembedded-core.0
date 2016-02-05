Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 966A37722A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 18:04:44 +0000 (UTC)
Received: from [82.1.213.155] (HELO elite.brightsign6)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 684771834; Fri, 05 Feb 2016 13:04:46 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign6 with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkN-000CXU-UC; Fri, 05 Feb 2016 18:04:43 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1aRkkN-0002Dk-U0; Fri, 05 Feb 2016 18:04:43 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 18:04:18 +0000
Message-Id: <1454695470-8205-4-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
References: <1454695470-8205-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mcrowe@brightsign.biz>, Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 03/15] perl: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Fri, 05 Feb 2016 18:04:44 -0000

From: Mike Crowe <mcrowe@brightsign.biz>

This recipe currently relies on EXTRA_OEMAKE having been set to
"-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make this
explicit so that the default in bitbake.conf can be changed.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/perl/perl-native_5.22.1.bb | 2 ++
 meta/recipes-devtools/perl/perl_5.22.1.bb        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.1.bb b/meta/recipes-devtools/perl/perl-native_5.22.1.bb
index 9ffb248..ed8222f 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.1.bb
@@ -1,5 +1,7 @@
 require perl.inc
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 SRC_URI += "\
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
diff --git a/meta/recipes-devtools/perl/perl_5.22.1.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
index 705852c..84254ca 100644
--- a/meta/recipes-devtools/perl/perl_5.22.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -87,6 +87,8 @@ export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
 export PERL_LIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
 export PERL_ARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
 
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
 # LDFLAGS for shared libraries
 export LDDLFLAGS = "${LDFLAGS} -shared"
 
-- 
2.1.4


