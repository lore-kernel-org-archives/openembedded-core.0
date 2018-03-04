Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D794D78563
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 12:42:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 04:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,422,1515484800"; d="scan'208";a="179744447"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 04:42:07 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 04:41:48 -0800
Message-Id: <cover.1520166347.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 0/7] Enable easier ptest of perl modules
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
X-List-Received-Date: Sun, 04 Mar 2018 12:42:07 -0000

We need run-time testing in order to ensure recipe quality and
automating this is easiest with ptest.

* Add a new ptest-perl.bbclass which:
  - copies tests that almost all perl modules will have in t/ to PTEST_PATH
  - uses a common run-ptest script (from meta-perl recipes)
  - runs install_ptest_perl task after install_ptest
    = checks that run-ptest is not already present

For many perl recipes, using this class will be as simple as:
"inherit ptest-perl"

To run the tests, follow the ptest instructions in the dev-manual [1] and
then run "ptest-runner libfoo-perl" on target.

Tested on qemux86 with all oe-core lib*-perl recipes with no failures.

[1] http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#testing-packages-with-ptest

The following changes since commit 8e4ece7bf0b09275a34ce8e7cc3e1e54a366c361:

  glibc: Enable static PIE support when security_flags are enabled (2018-03-01 22:18:00 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/ptest-perl
  http://cgit.openembedded.org//log/?h=timo/ptest-perl

Tim Orling (7):
  meta/classes: add ptest-perl.bbclass
  libtest-needs-perl: add 0.002005
  liberror-perl: inherit ptest-perl
  liburi-perl: inherit ptest-perl
  libxml-parser-perl: inherit ptest-perl
  libxml-perl: inherit ptest-perl
  libxml-simple-perl: inherit ptest-perl

 meta/classes/ptest-perl.bbclass                    | 30 ++++++++++++++++++++++
 meta/files/ptest-perl/run-ptest                    | 16 ++++++++++++
 .../recipes-devtools/perl/liberror-perl_0.17025.bb |  7 ++++-
 .../perl/libtest-needs-perl_0.002005.bb            | 29 +++++++++++++++++++++
 meta/recipes-devtools/perl/liburi-perl_1.73.bb     | 10 +++++++-
 .../perl/libxml-parser-perl_2.44.bb                | 11 +++++++-
 meta/recipes-devtools/perl/libxml-perl_0.08.bb     |  2 +-
 .../perl/libxml-simple-perl_2.24.bb                |  2 +-
 8 files changed, 102 insertions(+), 5 deletions(-)
 create mode 100644 meta/classes/ptest-perl.bbclass
 create mode 100644 meta/files/ptest-perl/run-ptest
 create mode 100644 meta/recipes-devtools/perl/libtest-needs-perl_0.002005.bb

-- 
2.14.3


