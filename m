Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0EE772044
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 05:33:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sA65XeSO008431
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Nov 2014 21:33:40 -0800 (PST)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 5 Nov 2014 21:33:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Nov 2014 00:33:38 -0500
Message-ID: <1415252018-19321-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH] perl: set the perl libraries search path
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
X-List-Received-Date: Thu, 06 Nov 2014 05:33:43 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The default value for this is ../../lib which ends up with
something like:
| ./sysroots/x86_64-linux/usr/bin/perl-native/perl5.20.0.real \
| "-I../../lib" "-I../../lib" "-MExtUtils::Command::MM" -e pod2man \
| "--" --section=0 --perm_rw=644 perldoc.pod blib/man1/perldoc.1

in this case, nativeperl will find libraries from the target build,
When using an x86-64 host to target Haswell, you can end up with
../../lib including precompiled modules which use Haswell
instructions, it fails with:
| Running pm_to_blib for dist/if directly
| Skip ../../lib/if.pm (unchanged)
| Makefile:457: recipe for target 'manifypods' failed
| make[1]: *** [manifypods] Illegal instruction

So set it to use the -native ones instead of those from the target
build.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.20.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.20.0.bb b/meta/recipes-devtools/perl/perl_5.20.0.bb
index e594c5c..81caaa9 100644
--- a/meta/recipes-devtools/perl/perl_5.20.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.20.0.bb
@@ -94,6 +94,11 @@ HOSTPERL = "${STAGING_BINDIR_NATIVE}/perl-native/perl${PV}"
 # Where to find .so files - use the -native versions not those from the target build
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
 
+# Where to find perl @INC/#include files
+# - use the -native versions not those from the target build
+export PERL_LIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
+export PERL_ARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
+
 # LDFLAGS for shared libraries
 export LDDLFLAGS = "${LDFLAGS} -shared"
 
-- 
2.0.0


