Return-Path: <juro.bystricky@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA2660602
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 16:31:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 26 Sep 2016 09:31:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,400,1470726000"; d="scan'208";a="1056814895"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2016 09:31:25 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 09:30:51 -0700
Message-Id: <1474907452-37153-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] SDK: Avoid deleting TMP folder when changing SDKMACHINE
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
X-List-Received-Date: Mon, 26 Sep 2016 16:31:24 -0000


When changing SDKMACHINE, we may encounter an error forcing us to wipe the TMP folder.
Since only SDK_ARCH is captured in the PN of the crosssdk recipes, changes to SDK_OS
result in conflicts. Eventually we hit an error such as:

ERROR: meta-toolchain-1.0-r7 do_populate_sdk: The recipe meta-toolchain is trying to install files
into a shared area when those files already exist.
...
The build has stopped as continuing in this scenario WILL break things,
...
you're advised to wipe out tmp and rebuild
...

This patchset addresses the problem by using SDK_SYS as the recipe name suffix instead of SDK_ARCH.
The patchest was successfully tested with the following sequences in local.conf:
$ bitbake meta-toolchain
SDKMACHINE = "x86_64-mingw32"
SDKMACHINE = "x86_64"
SDKMACHINE = "i686-mingw32"
SDKMACHINE = "i686"
SDKMACHINE = "x86_64-mingw32"

$ bitbake core-image-minimal -c populate_sdk
USER_CLASSES += " testsdk "

SDKMACHINE = "x86_64" (passes testsdk: Ran 11 tests in 75.426s)
SDKMACHINE = "x86_64-mingw32"
SDKMACHINE = "i686"  (passes testsed:Ran 11 tests in 82.831s)
SDKMACHINE = "i686-mingw32"
SDKMACHINE = "x86_64-mingw32"
SDKMACHINE = "x86_64"

$bitbake core-image-minimal -c populate_sdk_ext

As there is no meta-mingw for master yet, I used this meta-mingw layer:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mingw-contrib/log/?h=juro/master

(The "master" is by definition a moving target, I used the poky commit
a767c78abeb19a9d730e3c9b1f64c13fbbcade17 with the tests above)



Juro Bystricky (1):
  SDK: Allow changing SDKMACHINE without wiping TMP folder

 meta/classes/base.bbclass                                |  2 +-
 meta/conf/distro/include/tcmode-default.inc              | 12 ++++++------
 meta/recipes-core/glibc/glibc-initial.inc                |  2 +-
 meta/recipes-core/glibc/glibc.inc                        |  2 +-
 meta/recipes-core/musl/musl.inc                          |  2 +-
 meta/recipes-devtools/binutils/binutils-crosssdk_2.27.bb |  2 +-
 meta/recipes-devtools/gcc/gcc-cross-initial.inc          |  2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc                  |  2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk-initial.inc       |  2 +-
 meta/recipes-devtools/gcc/gcc-crosssdk.inc               |  2 +-
 meta/recipes-devtools/gcc/libgcc-initial.inc             |  2 +-
 11 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.7.4


