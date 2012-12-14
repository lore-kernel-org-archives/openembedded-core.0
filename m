Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TjO1n-0004HA-Cg
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 06:41:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2012 21:27:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,277,1355126400"; d="scan'208";a="231415058"
Received: from unknown (HELO localhost) ([10.255.13.223])
	by azsmga001.ch.intel.com with ESMTP; 13 Dec 2012 21:27:05 -0800
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	bruce.ashfield@windriver.com
Date: Thu, 13 Dec 2012 23:27:05 -0600
Message-Id: <cover.1355462107.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/1] Fix for build lttng-modules build error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Dec 2012 05:41:46 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This is an untested patch for a build error seen on the Yocto autobuilder.
I'm unable to reproduce the problem locally, so can't say whether it
actually fixes the problem or not - hoping it can be tested under mut
first to see if it works.

Basically the problem is that do_make_scripts with lttng-modules fails
because it can't cd into the workdir:

/srv/home/pokybuild/yocto-autobuilder/yocto-slave/cedartrail/build/build/tmp/work/cedartrail-poky-linux/lttng-modules/2.0.5-r0/temp/run.do_make_scripts.27949: line 113: cd: /srv/home/pokybuild/yocto-autobuilder/yocto-slave/cedartrail/build/build/tmp/work/cedartrail-poky-linux/lttng-modules/2.0.5-r0/git: No such file or directory

Looking at the build I see that that directory is actually there, but
it obviously wasn't when do_make_scripts() was run.  So apparently
we have a race and in the failed case the unpack happened after
do_make_scripts() instead of before as expected.  So the patch makes
sure that doesn't happen

The following changes since commit da598d4f0fcf6faa62055084a51d70d735399d33:

  eglibc: fix checksums of fetched patches (2012-12-13 18:02:21 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib.git tzanussi/module-do-make-scripts-fix
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/module-do-make-scripts-fix

Tom Zanussi (1):
  module.bbclass: make sure do_make_scripts() executes after do_patch()

 meta/classes/module.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

-- 
1.7.4.1



