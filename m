Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAm6-0001uK-Fs
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2011 00:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="682382403"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2011 00:25:01 -0700
Message-Id: <f6884e18d07272d274f47595f37df11a466b23ea.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 16:27:09 -0700
Date: Fri, 22 Apr 2011  0:25:01 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 30/33] cpan.bbclass: export PERLHOSTLIB for perl modules
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:34 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This makes sure that native perl .so can get loaded at the buildtime, and
avoids following kind of errors while building perl modules:

Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/20

+ perl Makefile.PL
EXPATLIBPATH=/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib
EXPATINCPATH=/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/include
*** Module name IN:
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/Cwd.pm
*** Module name OUT:
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/Cwd.pm
*** Module name IN:
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/Fcntl.pm
*** Module name OUT:
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/Fcntl.pm
Can't load
'/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/auto/Fcntl/Fcntl.so'
for module Fcntl:
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/auto/Fcntl/Fcntl.so:
wrong ELF class: ELFCLASS32 at
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/XSLoader.pm
line 79.
 at
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/Fcntl.pm
line 215
BEGIN failed--compilation aborted at
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/Fcntl.pm
line 216.
Compilation failed in require at
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/File/Temp.pm
line 146.
BEGIN failed--compilation aborted at
/disk0/pokybuild/build0/tmp/sysroots/qemux86/usr/lib/perl/5.12.2/File/Temp.pm
line 146.
Compilation failed in require at inc/Devel/CheckLib.pm line 12.
BEGIN failed--compilation aborted at inc/Devel/CheckLib.pm line 12.
Compilation failed in require at Makefile.PL line 5.
BEGIN failed--compilation aborted at Makefile.PL line 5.
ERROR: Function 'do_configure' failed (see
/disk0/pokybuild/build0/tmp/work/i586-poky-linux/libxml-parser-perl-2.40-r0/temp/log.do_configure.16956
for further information)

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/classes/cpan.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 1cfd022..9b8431b 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -13,6 +13,7 @@ export PERLCONFIGTARGET = "${@is_target(d)}"
 export PERL_INC = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}/CORE"
 export PERL_LIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
 export PERL_ARCHLIB = "${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
+export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_version(d)}/"
 
 cpan_do_configure () {
 	export PERL5LIB="${PERL_ARCHLIB}"
-- 
1.7.1



