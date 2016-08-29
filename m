Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E252A600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 22:45:22 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2016 15:45:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,253,1470726000"; d="scan'208";a="1021961632"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2016 15:45:23 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 15:45:35 -0700
Message-Id: <1472510736-3148-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/1] MIPS tune mips64-n32
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
X-List-Received-Date: Mon, 29 Aug 2016 22:45:23 -0000

This patch fixes the issue where a mips CPP compiler configured with n32
cannot find c++ include files:

#include <bits/c++config.h>
int main()
{
    return 0;
}

error: bits/c++config.h: No such file or directory
|  #include <bits/c++config.h>

Although the file c++config.h does exist, CPP cannot find it
as the file is not in the directory CPP expects it to be in.
The fix consists of creating a symlink with the name the directory
CPP expects and point it to the location where the  CPP files
actualy reside.

The patch was tested with two configurations, single compiler
and multilib (both of which used to fail the testsdk):

MACHINE="qemumips64"
require conf/multilib.conf
MULTILIBS = "multilib:lib64 multilib:lib32"
DEFAULTTUNE = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips32r2"
USER_CLASSES += " testsdk "

bitbake core-image-minimal -c populate_sdk
bitbake core_image_minimal -c testsdk

MACHINE="qemumips64"
DEFAULTTUNE = "mips64-n32"
USER_CLASSES += " testsdk "

bitbake core-image-minimal -c populate_sdk
bitbake core_image_minimal -c testsdk


Juro Bystricky (1):
  gcc-runtime.inc: add CPP support for mips64-n32 tune

 meta/recipes-devtools/gcc/gcc-runtime.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.7.4


