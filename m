Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C350F77BA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490365096; x=1521901096; h=from:to:subject:date:message-id;
	bh=w1/jeZqiyXlZuEF4QvPTZCtNjbnfIbgUytkL5CGW/qY=;
	b=ILfiJtUrGDJCXWU6kO9F7D6aqpglyASxvdkpJXn+st10aYIfpeerP+qy
	oIWlf23Dzwv/pWeD1dmQSvnzolZMbg==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="1146511852"
Received: from mlehtone-mac02.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2017 07:17:35 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:17:24 +0200
Message-Id: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/6] oe-build-perf-test: re-organize buildstats archiving
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
X-List-Received-Date: Fri, 24 Mar 2017 14:18:14 -0000

This patchset optimizes the way buildstats are stored in oe-build-perf-test
result data. After this change buildstats are stored under
refs/notes/buildstats/* in Git, and thus, they're not cloned/fetched by
default. The motivation is to reduce the data footprint as buildstats are
rarely used but they take a lot of space. With thousands of test runs, the
amount of data transfer required by git clone drops from the order of gigabytes
to megabytes. If needed for deeper analysis, buildstats can always be fetched
separately.

The first patch in this changeset packs all buildstats into one JSON-formatted
file so that they're easier to work with under git-notes.

The second patch optimizes buildstats data footprint by combining rusage
values.

Patches #3, #4 and #5 add oe-git-archive script the ability to store data under
git-notes, also fixing one bug in the git push functionality.

The last patch changes the build perf test worker script to store buildstats
under git-notes.


The following changes since commit 3b5ac72bdf76ac8ff98dc3c882a4edc77c6e2c33:

  rpm: add a "rpm-build" PROVIDES (2017-03-22 15:09:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/buildstats
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/buildstats


Markus Lehtonen (6):
  oe-build-perf-test: pack all buildstat in one file
  oe-build-perf-test: sum rusage in buildstats
  scripts/oe-git-archive: fix pushing
  scripts/oe-git-archive: implement --exclude
  scripts/oe-git-archive: implement --notes
  build-perf-test-wrapper.sh: store buildstats under git-notes

 meta/lib/oeqa/buildperf/base.py            | 66 ++++++++++++++++--------------
 meta/lib/oeqa/buildperf/test_basic.py      | 24 +++++------
 scripts/contrib/build-perf-test-wrapper.sh |  2 +
 scripts/oe-build-perf-test                 |  1 +
 scripts/oe-git-archive                     | 32 +++++++++++++--
 5 files changed, 78 insertions(+), 47 deletions(-)

-- 
2.6.6


