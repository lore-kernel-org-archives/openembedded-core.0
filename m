Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BC01D783C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 514972E1B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id T5MhbyaBgDiT
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id 7201D2E1A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E2CD1E070
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 530E41E056
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 47466DDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FDrF0c010365
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FDrF5F010364
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 15:53:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 15:53:02 +0200
Message-Id: <cover.1497534748.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 00/11] More fixes for file dependency generation with RPM
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
X-List-Received-Date: Thu, 15 Jun 2017 13:53:18 -0000

This is the second take on restoring the file dependency support for
RPM that was lost in Pyro. These changes should fix most (all?)
problems that were seen on the autobuilders after the first set of
changes were introduced.

The first patch is not strictly needed for this, but it fixes a build
problem due to a renamed file in a patch file that I got when building
core-image-sato. No idea why no one else has had problems with this...

//Peter

The following changes since commit 2bf2ab9fcd12b179c396d2d4b4603b774a37eef6:

  bitbake: bitbake-user-manual: Updated BBLAYERS_FETCH_DIR variable description (2017-06-15 11:15:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/rpm_regressions2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/rpm_regressions2

Peter Kjellerstedt (11):
  gtk+3: Update the patches to work without PATCHTOOL = "git"
  perl: Do not generate file dependencies for perl-ptest
  rpm: Add dependencies on bash, perl and python3-core
  linux-firmware: Avoid a dependency on python-core
  texi2html: Add a dependency on perl
  git: Add a dependency on perl for gitweb
  git: Do not install git cvsserver and git svn
  texinfo: Avoid a problem with a dependency on perl(Locale::gettext_xs)
  package_rpm.bbclass: Filter out unwanted file deps for nativesdk
    packages
  insane.bbclass: Ignore perl as dependency for nativesdk packages
  package.bbclass: Restore functionality to detect RPM dependencies

 meta/classes/insane.bbclass                        |   2 +-
 meta/classes/package.bbclass                       |   5 +-
 meta/classes/package_rpm.bbclass                   |  25 +-
 meta/lib/oe/package.py                             |  60 +++--
 meta/recipes-devtools/git/git.inc                  |  16 +-
 meta/recipes-devtools/perl/perl-ptest.inc          |   4 +
 meta/recipes-devtools/rpm/rpm_git.bb               |   5 +
 meta/recipes-extended/texi2html/texi2html_5.0.bb   |   2 +
 meta/recipes-extended/texinfo/texinfo_6.3.bb       |   6 +
 .../gtk+/gtk+3/0001-Hardcoded-libtool.patch        |  12 +-
 ...Do-not-try-to-initialize-GL-without-libGL.patch |   8 +-
 .../0003-Add-disable-opengl-configure-option.patch | 268 +++++++++++++++------
 ...4-configure.ac-Fix-wayland-protocols-path.patch |   8 +-
 .../linux-firmware/linux-firmware_git.bb           |   3 +
 14 files changed, 307 insertions(+), 117 deletions(-)

-- 
2.12.0


