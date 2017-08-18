Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D35578542
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 07:31:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7I7VsnU014008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Aug 2017 00:31:54 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 00:31:53 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 18 Aug 2017 03:31:50 -0400
Message-ID: <cover.1503041246.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/2] upgrade bash v2 && fix multilib issues
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
X-List-Received-Date: Fri, 18 Aug 2017 07:31:55 -0000
Content-Type: text/plain

Test steps:

vim local.conf:
...
MACHINE ?= "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_INSTALL_append = " bash"

VIRTUAL-RUNTIME_init_manager = "systemd"
DISTRO_FEATURES_append = " systemd"
DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
KERNEL_FEATURES_append = " cfg/systemd.scc"
...

bitbake lib32-core-image-sato-sdk

//Hongxu

The following changes since commit 55bf88603927469de9aa9f6fd4d449230d2e61e3:

  poky: Add nios2 to list of qemu targets (2017-08-17 00:21:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20170816
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20170816

Hongxu Jia (2):
  bash: 4.3.30 -> 4.4
  logrotate: fix systemd service not found while multilib

 meta/recipes-extended/bash/bash.inc                |   6 +
 .../recipes-extended/bash/bash/CVE-2016-9401.patch |  50 -------
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 158 +++------------------
 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 --------------
 meta/recipes-extended/bash/bash/test-output.patch  |  47 ++++--
 meta/recipes-extended/bash/bash_4.3.30.bb          |  75 ----------
 meta/recipes-extended/bash/bash_4.4.bb             |  58 ++++++++
 .../recipes-extended/logrotate/logrotate_3.12.3.bb |   4 +-
 8 files changed, 115 insertions(+), 393 deletions(-)
 delete mode 100644 meta/recipes-extended/bash/bash/CVE-2016-9401.patch
 delete mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch
 delete mode 100644 meta/recipes-extended/bash/bash_4.3.30.bb
 create mode 100644 meta/recipes-extended/bash/bash_4.4.bb

-- 
2.8.1


