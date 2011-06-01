Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlN8-0007AJ-W4
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:07 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Jun 2011 06:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; 
   d="scan'208";a="7836594"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 01 Jun 2011 06:18:54 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:31 +0800
Message-Id: <cover.1306931844.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
Subject: [RFC v1 PATCH 00/16] populate perl-native into its own directory
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
X-List-Received-Date: Wed, 01 Jun 2011 13:22:07 -0000

Currently both perl-native (a.k.a. ${STAGING_BINDIR_NATIVE}/perl )and
perl-native-runtime(a.k.a. the system perl, or /usr/bin/perl) appear in
the PATH when bitbake is running.
This can cause some race conditions: many places detecting perl from PATH
can't make sure which path will be used as this depends on when perl-native's
populate_sysroot is finished, e.g., automake-native and autoconf-native could
use perl-native-runtime while gnu-config-native could use perl-native and
this inconsistent usages can cause trouble, e.g., bug 941.

And, as RP suggested, "the time to use perl-native instead of
perl-native-runtime is where any perl module is being built, perl itself is
being built or anything that has an explicit dependency on the perl version
present".

So I made the following changes to try to address the aboves issues:
1) populate perl-native into its own directory so it won't appear in PATH
by default, and add perlnative.bbclass for these recipes that really depend
on perl-native;
2) check all perl-native references and correct the ones that should be
perl-native-runtime;
3) fix any building issues due to the new location of perl-native,
especially cpan and cpan-base .bbclass.

With the changes, bug 941 doesn't appear.

Tests I did are:
I tried "bitbale core-image-sato-sdk and meta-toolchain-gmae" in x86_32 and
x86_64 Ubuntu hosts and everything seems building fine.


Please review the changes and comment on them. Thanks!

--------------------------

The following changes since commit 0736b136efac283449c9218c01740eba4a7bc8cc:

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master_perl-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master_perl-native

Dexuan Cui (16):
  native.bbclass: allow a native package to be populated into its own
    dir
  perl-native: populate into its own dir
  perlnative.bbclass: add the file
  gnu-config-native: should depend on perl-native-runtime rather than
    perl-native
  libcap: should depend on perl-native-runtime rather than perl-native
  openssl: should depend on perl-native-runtime rather than perl-native
  git: should depend on perl-native-runtime rather than perl-native
  coreutils: remove unnecessary dependency on perl
  dpkg: should depend on perl-native-runtime rather than perl-native
  webkit-gtk: should depend on perl-native-runtime rather than
    perl-native
  perl: inherit perlnative
  cpan.bbclass, cpan-base.bbclas: update them for the perlnative change
  libxml-parser-perl: inherit perlnative
  libconvert-asn1-perl: fix EXTRA_PERLFLAGS due to the perl-native
    change
  libxml-simple-perl: fix EXTRA_PERLFLAGS due the the perlnative change
  icon-naming-utils-native: inherit perlnative

 meta/classes/cpan-base.bbclass                     |   10 +++++++---
 meta/classes/cpan.bbclass                          |   12 ++++++------
 meta/classes/native.bbclass                        |    5 +++++
 meta/classes/perlnative.bbclass                    |    2 ++
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    6 +++---
 meta/recipes-core/coreutils/coreutils_8.9.bb       |    6 +++---
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    2 +-
 meta/recipes-devtools/git/git.inc                  |    4 ++--
 meta/recipes-devtools/git/git_1.7.5.1.bb           |    2 +-
 .../gnu-config/gnu-config_20080123.bb              |    4 ++--
 .../icon-naming-utils-native_0.8.7.bb              |    4 ++--
 .../perl/libxml-parser-perl-native_2.40.bb         |    2 +-
 .../perl/libxml-parser-perl_2.40.bb                |    2 +-
 .../perl/libxml-simple-perl-native_2.18.bb         |    2 +-
 .../perl/libxml-simple-perl_2.18.bb                |    4 ++--
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    5 ++++-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |   10 +++++-----
 .../perl/libconvert-asn1-perl_0.22.bb              |    4 ++--
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    6 +++---
 meta/recipes-support/libcap/libcap.inc             |    4 ++--
 meta/recipes-support/libcap/libcap_2.20.bb         |    2 +-
 24 files changed, 59 insertions(+), 45 deletions(-)
 create mode 100644 meta/classes/perlnative.bbclass

-- 
1.7.2



