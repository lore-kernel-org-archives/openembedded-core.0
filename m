Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHVcT-0000u0-6h
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 09:36:05 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Apr 2012 00:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130584251"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 00:26:44 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2012 00:26:34 -0700
Message-Id: <8091bae14737a908742d983c3879b5f89009dde4.1334042473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL [v2] 07/14] git 1.7.7: remove perl.mak before compile
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Apr 2012 07:36:05 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The git may fail to rebuild when perl's Config.pm or config.h changes,
this is because Makefile detects that perl/perl.mak is out of date.
Remove perl.mak to let Makefile regenerate it would fix the error.
Both git and git-native have this problem.

To reproduce the error: (On x86_64 host)

$ bitbake git-native
$ touch tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.14.2/Config.pm
$ bitbake git-native -ccompile -f

[YOCTO #2156]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/git/git.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index be3831b..ce2f574 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -12,6 +12,12 @@ EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --without-
 
 inherit autotools perlnative
 
+do_compile_prepend () {
+	# Remove perl/perl.mak to fix the out-of-date perl.mak error
+	# during rebuild
+	rm -f perl/perl.mak
+}
+
 do_install () {
 	oe_runmake install DESTDIR="${D}" bindir=${bindir} \
 		template_dir=${datadir}/git-core/templates \
-- 
1.7.7.6



