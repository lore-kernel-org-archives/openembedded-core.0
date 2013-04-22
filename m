Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UUBxt-0005e4-Mx
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Apr 2013 10:19:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2013 00:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,525,1363158000"; d="scan'208";a="322150539"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2013 01:01:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2013 11:01:21 +0300
Message-Id: <cover.1366615922.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/4] Postinstall fixes
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
X-List-Received-Date: Mon, 22 Apr 2013 08:19:11 -0000

Hi all,

Because RPM saves the postinstalls in /etc/rpm-postinsts only if the
postinstall fails, the intercept hooks machanism was implemented so that the
postinstalls always return 1, in order for the rpm to save the scriptlet.
Unfortunately, this is not such a good idea when a recipe needs to install more
than one hook.

This patchset changes the logic in order to allow installing multiple hooks in
the same postinstall. The postinstall is extracted after the package is
installed and some sed magic is needed in order to extract the postinstall
scriptlets from rpm.

Thanks,
Laurentiu


The following changes since commit 3b2d8e52ee4391802cff7baf3f343700499859ce:

  build-appliance: Update to latest dylan revision for release (2013-04-18 22:02:43 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/postinsts_issue_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/postinsts_issue_fix

Laurentiu Palcu (4):
  fontcache.bbclass: do not exit with 1 after installing intercept hook
  gtk-icon-cache.bbclass: do not exit 1 after installing intercept hook
  pixbufcache.bbclass: do not exit 1 after installing intercept hook
  image.bbclass: change the logic when intercepts fail

 meta/classes/fontcache.bbclass      |   10 ++------
 meta/classes/gtk-icon-cache.bbclass |   47 +++++++++++++++--------------------
 meta/classes/image.bbclass          |   32 ++++++++++++++++--------
 meta/classes/pixbufcache.bbclass    |   29 +++++++++------------
 4 files changed, 56 insertions(+), 62 deletions(-)

-- 
1.7.9.5



