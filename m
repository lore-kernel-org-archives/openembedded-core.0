Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 48C04782F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:48:49 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 07:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="129748632"
Received: from rpieper-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.39.83])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2017 07:48:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:48:06 +0200
Message-Id: <cover.1500561823.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH v2 0/7] recipetool fetching fixes
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
X-List-Received-Date: Thu, 20 Jul 2017 14:48:50 -0000

Some improvements to recipetool create (and hence devtool add) around
handling dependencies during fetching, which required extensive
reworking of the code in order to use normal task execution instead of
calling the fetcher directly. This also fixes bug 11710 which blocked
devtool add / recipetool create from working in memres mode. Also
includes a couple of general fetching improvements.

NOTE: this patchset depends upon the tinfoil changes just sent to
bitbake-devel.

Changes since v1:
- Removed remaining references to scriptutils.fetch_uri() function
  which didn't work in conjunction with memres or Richard's pending
  persistent server changes
- Added a fix for unpacking rpms
- Tweaked description for 2/7
- Reordered and fixed "ensure npm available" patch


The following changes since commit c4c2fb3732dbb290b7f0ca43af2e8662f99e4582:

  libgcrypt: upgrade to 1.7.8 (2017-07-19 15:13:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool27
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool27

Paul Eggleton (7):
  classes/staging: change fixme debug message from note to debug
  devtool: extract: refactor kern-tools-native handling
  recipetool: create: ensure meaningful error for malformed tarballs
  recipetool: create: eliminate second fetch for packages
  recipetool: create: reimplement fetching with normal fetch/unpack tasks
  classes/base: set do_unpack dependencies for rpm files
  recipetool: create: refactor code for ensuring npm is available

 meta/classes/base.bbclass            |   4 +-
 meta/classes/staging.bbclass         |   2 +-
 scripts/lib/devtool/__init__.py      |  31 -------
 scripts/lib/devtool/standard.py      |  71 +++-------------
 scripts/lib/devtool/upgrade.py       |  10 ++-
 scripts/lib/recipetool/create.py     | 102 ++++++++++------------
 scripts/lib/recipetool/create_npm.py |  37 ++++++--
 scripts/lib/scriptutils.py           | 158 ++++++++++++++++++++++++++---------
 8 files changed, 218 insertions(+), 197 deletions(-)

-- 
2.9.4


