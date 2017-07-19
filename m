Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFED6060F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 08:16:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6J8GAqN006541
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jul 2017 01:16:10 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 01:16:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <paul.eggleton@linux.intel.com>, 
	<ross.burton@intel.com>
Date: Wed, 19 Jul 2017 01:16:04 -0700
Message-ID: <cover.1500450690.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [RFC PATCH 0/5] revive runtime/cases/_ptest.py
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
X-List-Received-Date: Wed, 19 Jul 2017 08:16:11 -0000
Content-Type: text/plain

Hello,

These patches can make ptest test case work, RP has suggested we write a tool to
do the regression check on ptest result, I think that the use case is like:

$ bitbake <image> -ctestiamge # Suppose we add ptest to default test cases in the future
# Upgrade a recipe form V1.0 to V1.1
$ bitbake <image> -ctestiamge # Run the test again

Then the regression check tool can report what's different (passed, failed,
skipped) between V1.0 and V1.1.

Currently, I'm not sure about where to save the ptest results, I saved it to
${WORKDIR}/testimage/ptest_log atm, e.g.:
tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/testimage/ptest_log

But it will be removed after -cclean, then no regression check can be made, so
I'd like to save the ptest results to DEPLOY_DIR_IMAGE if no objections, and
make -cclean not remove them. (Or only keep the latest 2 results).

And I'm not sure where to add the regression check/tool, maybe one of:
1) Add a separate tool in oe-core/scripts, this can make it easy to do regression
   check among different build directories, and runtime/cases/_ptest.py can invoke it.
2) Add it to runtime/cases/_ptest.py directly
3) Add it to buildhistory

I prefer the first one, please feel free to give your comments.

// Robert

The following changes since commit ef68005a8c527e9b1d05b7769f0ec8ebe9ec3f91:

  webkitgtk: Upgrade to 2.16.5 (2017-07-17 13:49:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ptest
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ptest

Robert Yang (5):
  oeqa/targetcontrol.py: simplify checking for qemu_use_kvm
  runtime/cases/_ptest.py: revive it
  oeqa/utils/logparser.py: add skip status
  runtime/cases/_ptest.py: add skip status
  runtime/cases/_ptest.py: rename it to ptest.py

 meta/lib/oeqa/runtime/cases/_ptest.py | 103 ----------------------------------
 meta/lib/oeqa/runtime/cases/ptest.py  |  77 +++++++++++++++++++++++++
 meta/lib/oeqa/targetcontrol.py        |   5 +-
 meta/lib/oeqa/utils/logparser.py      |   5 +-
 4 files changed, 82 insertions(+), 108 deletions(-)
 delete mode 100644 meta/lib/oeqa/runtime/cases/_ptest.py
 create mode 100644 meta/lib/oeqa/runtime/cases/ptest.py

-- 
2.11.0


