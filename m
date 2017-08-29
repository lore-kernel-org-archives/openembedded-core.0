Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 42427782AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 4C5792E2F6;
	Tue, 29 Aug 2017 23:21:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RrEbB9tWWw3l; Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 3CF6F2E306;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29B031A0B1;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E78B1A0B0;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 10E5F2144;
	Tue, 29 Aug 2017 23:21:42 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TLLeA5030159;
	Tue, 29 Aug 2017 23:21:40 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TLLeo6030158;
	Tue, 29 Aug 2017 23:21:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 23:20:56 +0200
Message-Id: <cover.1504041416.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [pyro][PATCH 00/25] Fix RPM regressions for Pyro
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
X-List-Received-Date: Tue, 29 Aug 2017 21:21:43 -0000

These are the backported changes from master that re-adds support for
having rpm generating file dependencies.

The only change compared to master is in the last patch. There I have
added a new variable called ENABLE_RPM_FILEDEPS_FOR_PYRO. Unless it
is set to "1", the RPM file dependency machinery will not be
activated. This should make it possible to integrate these changes to
Pyro, without risking that they break builds for anyone who do not
expect the dependency requirements to change. The name of the variable
was chosen to clearly indicate that this only affects Pyro.

The first patch in the series is strictly not related to the RPM
changes, but since I cannot build core-image-sato without it, I
included it here to make my life a little easier.

//Peter

The following changes since commit 9842f64154e633c198b201fae01dbab1fb04c74e:

  rootfs-postcommands.bbclass: Prevent linking testdata to itself (2017-08-29 12:22:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/rpm_regressions-pyro
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/rpm_regressions-pyro

Alexander Kanavin (1):
  libxml2: move python module to Python 3

Mark Hatle (2):
  ltp: Skip the filedependency scan
  rpm: Disable perl dependency generation

Martin Jansa (1):
  libcheck: fix file-rdeps QA issue

Peter Kjellerstedt (20):
  gtk+3: Update the patches to work with old versions of patch
  package_manager.py: Generate correct RPM package names again
  libxml2: Make ptest run the Python tests if Python support is enabled
  insane.bbclass: Report all file-rdeps errors, not just the first
  insane.bbclass: Improve the handling of runtime file dependencies
  buildhistory.bbclass: Improve the generated depends.dot file
  toaster.bbclass: Simplify parsing of depends.dot
  toaster.bbclass: Ignore some dependencies in
    toaster_buildhistory_dump()
  rpm: Simplify the creation of wrappers for the native tools
  rpm: Create a wrapper for the native rpmdeps tool
  rpm: Do not require that ELF binaries are executable to be
    identifiable
  rpm: Use conditional to access %{_docdir} in macros.in
  rpm: Add a new option --alldeps to rpmdeps
  insane.bbclass: Ignore perl as dependency for nativesdk packages
  perl: Do not generate file dependencies for perl-ptest
  rpm: Add dependencies on bash, perl and python3-core
  git: Do not install git cvsserver and git svn by default
  texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
  package_rpm.bbclass: Filter out unwanted file deps for nativesdk
    packages
  package.bbclass: Restore functionality to detect RPM dependencies

Richard Purdie (1):
  bind: Use correct python interpreter path

 meta/classes/buildhistory.bbclass                  |  15 +-
 meta/classes/insane.bbclass                        |  20 +-
 meta/classes/package.bbclass                       |  11 +-
 meta/classes/package_rpm.bbclass                   |  25 +-
 meta/classes/toaster.bbclass                       |  36 +--
 meta/lib/oe/package.py                             |  60 +++--
 meta/lib/oe/package_manager.py                     |   6 +-
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |   2 +-
 ...run-the-python-tests-if-python-is-enabled.patch |  99 ++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  17 +-
 meta/recipes-devtools/git/git.inc                  |  21 ++
 meta/recipes-devtools/perl/perl-ptest.inc          |   4 +
 .../rpm/files/0001-perl-disable-auto-reqs.patch    |  32 +++
 ...ire-that-ELF-binaries-are-executable-to-b.patch |  32 +++
 ...onditional-to-access-_docdir-in-macros.in.patch |  36 +++
 .../0013-Add-a-new-option-alldeps-to-rpmdeps.patch | 152 ++++++++++++
 meta/recipes-devtools/rpm/rpm_git.bb               |  83 +++----
 meta/recipes-extended/ltp/ltp_20170116.bb          |   5 +
 meta/recipes-extended/texinfo/texinfo_6.3.bb       |   6 +
 .../gtk+/gtk+3/0001-Hardcoded-libtool.patch        |  12 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch |   8 +-
 .../0003-Add-disable-opengl-configure-option.patch | 268 +++++++++++++++------
 ...4-configure.ac-Fix-wayland-protocols-path.patch |   8 +-
 meta/recipes-support/libcheck/libcheck_0.10.0.bb   |   1 -
 24 files changed, 756 insertions(+), 203 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0011-Do-not-require-that-ELF-binaries-are-executable-to-b.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0012-Use-conditional-to-access-_docdir-in-macros.in.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0013-Add-a-new-option-alldeps-to-rpmdeps.patch

-- 
2.12.0


