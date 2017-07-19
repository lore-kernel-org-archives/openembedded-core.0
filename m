Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE2478223
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:07:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 03:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,380,1496127600"; d="scan'208";a="994656313"
Received: from gsena-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.48.213])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 03:07:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 12:07:13 +0200
Message-Id: <cover.1500458777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH 0/5] recipetool fetching fixes
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
X-List-Received-Date: Wed, 19 Jul 2017 10:07:31 -0000

Some improvements to recipetool create (and hence devtool add) around
handling dependencies during fetching, which required extensive
reworking of the code in order to use normal task execution instead of
calling the fetcher directly. This also fixes bug 11710 which blocked
devtool add / recipetool create from working in memres mode. Also
includes a couple of general fetching improvements.

NOTE: this patchset depends upon the tinfoil changes just sent to
bitbake-devel.


The following changes since commit ef68005a8c527e9b1d05b7769f0ec8ebe9ec3f91:

  webkitgtk: Upgrade to 2.16.5 (2017-07-17 13:49:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool27
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool27

Paul Eggleton (5):
  classes/staging: change fixme debug message from note to debug
  recipetool: create: refactor code for ensuring npm is available
  devtool: extract: refactor kern-tools-native handling
  recipetool: create: ensure meaningful error for malformed tarballs
  recipetool: create: reimplement fetching with normal fetch/unpack tasks

 meta/classes/staging.bbclass         |   2 +-
 scripts/lib/devtool/__init__.py      |  31 -----
 scripts/lib/devtool/standard.py      |  73 +++---------
 scripts/lib/recipetool/create.py     | 211 +++++++++++++++++++++++++++--------
 scripts/lib/recipetool/create_npm.py |   7 +-
 scripts/lib/recipetool/utils.py      |  37 ++++++
 6 files changed, 226 insertions(+), 135 deletions(-)
 create mode 100644 scripts/lib/recipetool/utils.py

-- 
2.9.4


