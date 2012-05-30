Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1SZsG5-0005M1-H1
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 01:24:53 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 May 2012 16:13:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="150535294"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 30 May 2012 16:13:28 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q4UNL7Fi014708; Wed, 30 May 2012 16:21:07 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q4UNL6kN014707;
	Wed, 30 May 2012 16:21:06 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 16:21:05 -0700
Message-Id: <cover.1338419593.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/1] Inefficient find of pkg data
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 23:24:53 -0000

[YOCTO #2419]

find -name is a horrible way to find files (.025s per exec). Changing this
to shell expansion (.002 per exec). Also, no point in having a big for loop when
I pipe this into head anyway. 

I tried this a few ways and this seems the most efficient reducing rootfs 
generation down to around 30s from around 50s.

The following changes since commit 348da93e283b2b8454fd9cde80d4b17378e2a168:

  webkit-gtk: Use glib as unicode backend to avoid browser crash (2012-05-30 17:38:02 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib eflanagan/license_1.3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/license_1.3

Elizabeth Flanagan (1):
  license.bbclass: optimize pkg runtime data

 meta/classes/license.bbclass |   40 +++++++++++++++++++---------------------
 1 files changed, 19 insertions(+), 21 deletions(-)

-- 
1.7.5.4



