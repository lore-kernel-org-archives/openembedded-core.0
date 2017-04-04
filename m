Return-Path: <brian.avery@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E0ACC71C90
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 22:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491344400; x=1522880400;
	h=from:to:cc:subject:date:message-id;
	bh=dNLYtwx21yJZ+CKIpXAAYlDggAK4jW0bgQPVQhQWx6g=;
	b=F1YmXR1ADtdv3nozePgMRrtxl4G2BlP9Gt8AFqextvikB5YZmW6vU1ID
	gYCQHqxXBdgz1400rl+uB6QAmcPyuA==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 15:19:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,276,1486454400"; d="scan'208";a="1151066279"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by fmsmga002.fm.intel.com with ESMTP; 04 Apr 2017 15:19:59 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 15:22:09 -0700
Message-Id: <cover.1491344268.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/2] runqemu-extract-sdk: Fixes for RSS
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
X-List-Received-Date: Tue, 04 Apr 2017 22:19:59 -0000


RSS removed the "giant native sysroot" so now we need a modify how tools like runqemu and
runqemu-extract-sdk find the native tools they need to run.  This patch uses the result of
meta-ide-support which has pseudo as well as tools like unfsd in it's usr/bin to run.
Since the meta-ide-support make a usr/bin dir in tmp/work and rm_work sibsequently removes it,
we exlude meta-ide-support from the rm_work set.

-brian

The following changes since commit eff56e4f0d59b1d965a68e4f009b7f07717b7edd:

  bitbake: bitbake-user-manual: Fixed special character in -D output (2017-04-03 22:32:02 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/sadpseudo/bug11119
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/sadpseudo/bug11119

brian avery (2):
  scripts: change way we find native tools (pseudo)
  meta-ide-support: exclude this recipe from rm_work

 meta/recipes-core/meta/meta-ide-support.bb | 1 +
 scripts/oe-find-native-sysroot             | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

--
1.9.1

