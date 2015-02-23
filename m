Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 709A2706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:00:46 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:00:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,631,1418112000"; d="scan'208";a="531537336"
Received: from afedko-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.4.45])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2015 08:51:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 17:00:34 +0000
Message-Id: <cover.1424709353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/9] Extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 17:00:48 -0000

At long last, here is the first mergeable version of what I'm now
calling the "extensible SDK". The initial proposal for this was posted
last year:

https://lists.yoctoproject.org/pipermail/yocto/2014-August/021044.html

Other than some names there hasn't been all that much change since then,
although things have changed quite a lot behind the scenes. In any case,
the basic idea is (example from poky):

 1) Create an extensible SDK:

    bitbake -c populate_sdk_ext core-image-minimal

 2) Install the SDK:

    ./poky-glibc-x86_64-core-image-minimal-core2-64-toolchain-ext-1.7.sh

    (usual SDK installation procedure; however do not run the installer
     as root or under sudo - it should be installed as the user you intend
     to run it with)

 3) Run the environment script:
    
    . ./environment-setup-core2-64-poky-linux

 4) Add your application to the build:
   
    devtool add myapp /path/to/myapp/source

 5) Build it:

    devtool build myapp

 6) Deploy the application to your target:

    devtool deploy-target myapp root@192.168.7.2

Now your application is ready to test on the target. "devtool build"
puts items into the SDK's sysroot as well so you can also add new
libraries to the installed SDK as needed.

There are still some rough edges to be worked out, and there is no
capability to update the SDK without reinstalling yet, but the basic
functionality is there.


The following changes since commit c4de42aadd4c8a4a8f16c25e7dcdefef79daf030:

  pulseaudio: upgrade to 6.0 (2015-02-23 08:08:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extensible-sdk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extensible-sdk

Paul Eggleton (1):
  sstatesig: Add ability to filter list of tasks for locked-sigs.inc

Randy Witt (8):
  gen-lockedsig-cache: Allow cross-filesystem copies.
  copy_buildsystem.py: Add a way to copy buildsystem to a directory.
  copy_buildsystem.py: Add methods to copy shared state.
  toolchain-scripts: Add parameters to toolchain_create_sdk_env_script.
  toolchain-shar-template.sh: Make relocation optional.
  uninative-tarball: Actually use bzip2 for compression.
  scripts/oe-buildenv-internal: add means of skipping SDK check during
    setup
  populate_sdk_ext: add extensible SDK

 meta/classes/image.bbclass                         |   2 +-
 meta/classes/populate_sdk_base.bbclass             |  10 +-
 meta/classes/populate_sdk_ext.bbclass              | 217 +++++++++++++++++++++
 meta/classes/toolchain-scripts.bbclass             |  15 +-
 ...-shar-template.sh => toolchain-shar-extract.sh} |  53 +----
 meta/files/toolchain-shar-relocate.sh              |  50 +++++
 meta/lib/oe/copy_buildsystem.py                    | 102 ++++++++++
 meta/lib/oe/sstatesig.py                           |   5 +-
 meta/recipes-core/meta/meta-environment-extsdk.bb  |  12 ++
 meta/recipes-core/meta/uninative-tarball.bb        |   2 +-
 scripts/gen-lockedsig-cache                        |  10 +-
 scripts/oe-buildenv-internal                       |   2 +-
 12 files changed, 414 insertions(+), 66 deletions(-)
 create mode 100644 meta/classes/populate_sdk_ext.bbclass
 rename meta/files/{toolchain-shar-template.sh => toolchain-shar-extract.sh} (64%)
 create mode 100644 meta/files/toolchain-shar-relocate.sh
 create mode 100644 meta/lib/oe/copy_buildsystem.py
 create mode 100644 meta/recipes-core/meta/meta-environment-extsdk.bb

-- 
1.9.3


