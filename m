Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1Qjd8x-00006z-8C
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 22:13:20 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6KK91Mf020211
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 15:09:02 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 13:08:55 -0700
Message-Id: <cover.1311192464.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/5] Fix building in very long paths
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
X-List-Received-Date: Wed, 20 Jul 2011 20:13:20 -0000

Hey all,

The following series fixes building in deep paths.  To be clear, the
biggest problem is that shebang (#!) is not portable over 80 chars in
length and we already eat up 51 chars with sysroot paths on x86_64.
The fix, in concept is easy, use /usr/bin/env instead.  In practice,
perl makes this difficult.  In this series we fix python to use
/usr/bin/env, add a 'nativeperl' wrapper (RP's name) so that we can
do /usr/bin/env nativeperl and not require sub-recipes to have inherit
perlnative (eg sato-icon-theme would need perlnative if we didn't do this).
Next we have cpan make sure it mangles everything to use nativeperl and
then go fix a few hard cases by hand.  All of these changes are either
direct ports (python) or port + more work (perl/cpan) of changes I did
in oe.dev.  With this series I'm able to build world for qemux86 in a
very long path (which means I could then turn on doing this in our jenkins
cluster on the weekend like I did for oe.dev on testing-next).

The following changes since commit 0d03800caffc2341b74190d38f7a372223c89f4c:
  Mei Lei (1):
        lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/work-in-deep-paths-v1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/work-in-deep-paths-v1

Tom Rini (5):
  python-native: Mangle scripts to use /usr/bin/env python, bump PR
  gnome-doc-utils: Use /usr/bin/env python in xml2po, bump PR
  perl-native: Add a perl-native wrapper in the normal bindir
  cpan.bbclass: Perform more mangling for perl path
  icon-naming-utils-native: Fix long path to perl in icon-name-mapping

 meta/classes/cpan.bbclass                          |    3 ++
 .../icon-naming-utils-native_0.8.7.bb              |    7 +++-
 meta/recipes-devtools/perl/liburi-perl_1.58.bb     |    2 +-
 .../perl/libxml-parser-perl_2.40.bb                |    2 +-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb     |    2 +-
 .../perl/libxml-simple-perl_2.18.bb                |    2 +-
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |   17 +++++++++-
 .../recipes-devtools/python/python-native_2.6.6.bb |    5 +++
 .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
 .../perl/libconvert-asn1-perl_0.22.bb              |    2 +-
 .../recipes-extended/perl/libtimedate-perl_1.20.bb |    2 +-
 .../perl/libxml-namespacesupport-perl_1.11.bb      |    2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.96.bb |    2 +-
 .../use-usr-bin-env-for-python-in-xml2po.patch     |   33 ++++++++++++++++++++
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    5 ++-
 15 files changed, 75 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch



