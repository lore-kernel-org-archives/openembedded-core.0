Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjEeW-00079Q-H4
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:04:16 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JI0AMf031373
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 13:00:10 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 11:00:07 -0700
Message-Id: <cover.1311097889.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v3 0/4] Change help2man, mercurial-native behavior
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
X-List-Received-Date: Tue, 19 Jul 2011 18:04:16 -0000

Hey all,

As I said in another thread, today we depend on a few more host utilities
being installed on the host than oe.dev does.  This is an attempt to fix
that a bit and improve on the situation at the same time.  First up is
dropping mercurial-native as we don't have any hg:// URIs and meta-oe now
has a mercurial-native recipe if needed.  Next up is help2man-native.  We
now only ship the GPLv3 version as a -native recipe.  This retains a
"don't re-conf" do_configure and an expanded comment that explains that if
we did so we would need perlnative.  Since this is just making a perl script
it feels like doing the reconf and required patching is overkill.  After
this, add in a local.conf.sample change so people can ASSUME_PROVIDED
this themselves if needed (based on oe.dev)

I've tested this with qemux86 and core-image-sato
and it still all builds and works as much as it has been for me wrt tests.

Finally, in the commit message I said avoiding perl-native problem and what
I'm speaking of is that since I put help2man-native in with all of the
autotools deps, adding perlnative to the inherits list would bring perl in
for everything.  We can punt on this by just not adding target help2man for
now.

v2: Move mercurial-native recipe to meta-oe, GPLv2 version of help2man-native
v3: After talking with RP, we don't want to do the automatic ASSUME_PROVIDED
thing anymore.
The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
  Saul Wold (1):
        libx11: ensure nativesdk uses correct DEPENDS and XCB flags

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/add-more-native-recipes-v3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/add-more-native-recipes-v3

Tom Rini (4):
  bitbake.conf, sanity.bbclass: Drop mercurial-native
  help2man-native: Add 1.38.2
  autotools.bbclass: Add help2man-native to the main DEPENDS tree
  local.conf.sample: Add a note about ASSUME_PROVIDED for help2man

 meta/classes/autotools.bbclass                     |    4 +-
 meta/classes/sanity.bbclass                        |    2 +-
 meta/conf/bitbake.conf                             |    1 -
 meta/conf/local.conf.sample                        |    3 ++
 .../help2man/help2man-native_1.38.2.bb             |   25 ++++++++++++++++++++
 5 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/help2man/help2man-native_1.38.2.bb



