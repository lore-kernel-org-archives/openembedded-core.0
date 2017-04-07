Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2182277D64
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 04:57:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 06 Apr 2017 21:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,162,1488873600"; d="scan'208";a="1132406854"
Received: from anatara2-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2017 21:57:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 16:57:17 +1200
Message-Id: <cover.1491540566.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/6] Add optional task signatures to buildhistory
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
X-List-Received-Date: Fri, 07 Apr 2017 04:57:31 -0000

If you're looking to compare task signatures between builds, that can
actually be a bit difficult to do if you don't have anything printed
out (e.g. from an error) with some signatures to look for. buildhistory
already makes a commit (or several commits) for each build, so we can
actually write the signatures into buildhistory so that we can compare
them later. If available (via the tasks actually having run, or by
explicitly creating them), we can even use the siginfo/sigdata files
to dig down and find out exactly what caused the signature changes.

Finally, add sha256sums for each file staged by every shared state task
so that we can see when a task re-executes if the file contents has
changed.

(All of this functionality defaults to off, you need to add "task" to
BUILDHISTORY_FEATURES in order to enable it).

There's also a small fix making it a bit easier to run the
buildhistory-diff script from the buildhistory repository.

NOTE: this patch series requires some of the patches in the set recently
sent to the bitbake-devel list.


The following changes since commit 901659a51cd53625a93f57a9c5865e90a07ec09d:

  oeqa/runtime/utils/targetbuildproject: use parent classes defaults tmpdir (2017-04-06 10:13:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-sigs
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/buildhistory-sigs

Paul Eggleton (6):
  buildhistory-diff: operate from buildhistory directory
  classes/buildhistory: write out task signatures on every build
  buildhistory-diff: add option to compare task signature list
  buildhistory-diff: add option to compare actual signature differences
  classes/uninative: set SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] properly
  classes/buildhistory: save output file signatures for sstate tasks

 meta/classes/buildhistory.bbclass    |  40 +++++++++++++
 meta/classes/uninative.bbclass       |   2 +-
 meta/lib/oe/buildhistory_analysis.py | 109 ++++++++++++++++++++++++++++++++++-
 meta/lib/oe/sstatesig.py             |  10 ++++
 scripts/buildhistory-diff            |  13 ++++-
 5 files changed, 170 insertions(+), 4 deletions(-)

-- 
2.9.3


