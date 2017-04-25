Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 627DD72F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 18:14:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2017 11:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,250,1488873600"; d="scan'208";a="960974556"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga003.jf.intel.com with ESMTP; 25 Apr 2017 11:14:13 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 11:14:04 -0700
Message-Id: <1493144048-12455-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/4] Reproducible binaries
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
X-List-Received-Date: Tue, 25 Apr 2017 18:14:22 -0000

This patch set contains several patches aimed to achieve reproducible binaries.
Building reproducible binaries may remove certain intentional
randomness intended for increased security. Hence, it is reasonable
to expect there will be cases where this is not desirable.
The user can select his/her preferences via the variable
BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
build reproducible binaries) in order to minimize any potential
regressions. (Once the reproducible binaries code is mature enough,
it can be set to "1".)

The patch set is rather simple, targeting the "low hanging fruit".
For debian packages we get a lot of binary identical packages simply by
exporting SOURCE_DATE_EPOCH.
For rootfs we get much fewer differences by modified prelinking and by
ensuring various timestamps are reproducible.


Juro Bystricky (4):
  bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
  base.bbclass: initial support for binary reproducibility
  image-preling.bbclass: support binary reproducibility
  rootfs-postcommands.bbclass: support binary reproducibility

 meta/classes/base.bbclass                | 82 ++++++++++++++++++++++++++++++++
 meta/classes/image-prelink.bbclass       |  9 +++-
 meta/classes/rootfs-postcommands.bbclass | 18 ++++++-
 meta/conf/bitbake.conf                   |  3 ++
 4 files changed, 109 insertions(+), 3 deletions(-)

-- 
2.7.4


