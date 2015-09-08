Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0230465CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 13:42:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 08 Sep 2015 06:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,490,1437462000"; d="scan'208";a="800637710"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 06:42:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 14:41:49 +0100
Message-Id: <cover.1441719081.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [RFC PATCH 0/3] WIP: add ability to reduce package feed churn
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
X-List-Received-Date: Tue, 08 Sep 2015 13:42:07 -0000

Based on some earlier thinking / work done by Richard Purdie and Randy Witt
I've been looking into how we could avoid newly versioned but otherwise
functionally identical packages built solely because of changes in
recipe dependencies entering the package feed (thus triggering unnecessary
upgrades on target). I've come up with a class that you can enable that
makes use of build-compare to compare the new package to one that was
previously generated and skip adding it to the feed if it hasn't
materially changed.

I suspect we may be able to go further than this in future so this isn't
necessarily the end game in terms of reducing the impact of signature
changes, but it's a start. More concretely I am a bit concerned that
build-compare itself needs further work, I am seeing errors in the task
logs that aren't causing the task to fail, probably the script needs
set -e at minimum (and the errors themselves need fixing). I wanted to
give people a bit of a preview of this though as it does have the
potential to be quite useful assuming the approach makes sense.



Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches.


The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/packagefeed-stability
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/packagefeed-stability

Paul Eggleton (3):
  classes/sstate: break out function to get sstate manifest filename
  build-compare: add support for examining deb and ipk packages
  WIP: classes/packagefeed-stability: add class to help reduce package
    feed churn

 meta/classes/packagefeed-stability.bbclass         | 270 +++++++++++++++++++++
 meta/classes/sstate.bbclass                        |   7 +-
 meta/lib/oe/sstatesig.py                           |  12 +
 .../build-compare/build-compare_git.bb             |   8 +-
 ...001-Add-support-for-deb-and-ipk-packaging.patch |  64 +++++
 5 files changed, 353 insertions(+), 8 deletions(-)
 create mode 100644 meta/classes/packagefeed-stability.bbclass
 create mode 100644 meta/recipes-devtools/build-compare/files/0001-Add-support-for-deb-and-ipk-packaging.patch

-- 
2.1.0


