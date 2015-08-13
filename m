Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D53A73D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 07:37:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7D7bLUT000226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 00:37:22 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 13 Aug 2015 00:37:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 00:37:18 -0700
Message-ID: <cover.1439449078.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] populate_sdk_base.bbclass: fixes for multilib sdk
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
X-List-Received-Date: Thu, 13 Aug 2015 07:37:22 -0000
Content-Type: text/plain

Fixed for multilib sdk:
MACHINE ?= "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal -cpopulate_sdk 

Extrat the sdk, both environment-setup-core2-64-poky-linux and
environment-setup-x86-pokymllib32-linux can compile hello.c after
sourced.

This has fixed "bitbake core-image-minimal -cpopulate_sdk", but the sdk
of "bitbake lib32-core-image-minimal -cpopulate_sdk" doesn't work, I'm
not sure what is preferred, include both 32 and 64 bit sdk as "bitbake
core-image-minimal -cpopulate_sdk" does or only 32bit ? What's your
opinion, please ?

// Robert

The following changes since commit cb8d309ff0ea0ca11edc2aae75ddd869491cb330:

  perf: fix build breakage on kernels after 4.1 (2015-08-12 11:31:01 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/sdk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sdk

Robert Yang (3):
  toolchain-shar-extract.sh: add a space in the end
  populate_sdk_base.bbclass: help rpm to pull in multilib toolchain
  packagegroup-core-standalone-sdk-target: remove qemuwrapper-cross

 meta/classes/populate_sdk_base.bbclass             |   32 ++++++++++++++++++++
 meta/files/toolchain-shar-extract.sh               |    4 +--
 .../packagegroup-core-standalone-sdk-target.bb     |    1 -
 3 files changed, 34 insertions(+), 3 deletions(-)

-- 
1.7.9.5


