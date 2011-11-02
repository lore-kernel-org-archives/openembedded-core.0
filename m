Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RLUdF-0008E7-Vh
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 07:49:06 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2011 23:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,442,1315206000"; d="scan'208";a="85115022"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.252])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2011 23:41:36 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 23:41:34 -0700
Message-Id: <cover.1320190748.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] [Yocto Bug 1700] Fix for buildstats diskio on non physical disks
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
X-List-Received-Date: Wed, 02 Nov 2011 06:49:06 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

tmpfs/encryptfs/ramfs have no entry in /proc/diskstats. This modifies 
buildstats to not collect diskio statistics when we encounter a case where 
the os.major/os.minor is not represented with an entry in /proc/diskstats.

Longer term solution to this is to:
- Identify all fs types that don't have representation in /proc/diskstats
- Gather meaningful iostats of these fs types if possible.

The following changes since commit 4a951e0433a99cd985515843f0a48fadc7050aca:

  Fix HOMEPAGE values in libzypp and sat-solver .bb files (2011-11-01 18:28:19 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib eflanagan/diskio_bug1700
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=eflanagan/diskio_bug1700

Elizabeth Flanagan (1):
  [Yocto Bug 1700] Fix for buildstats on tmpfs

 meta/classes/buildstats.bbclass |   37 ++++++++++++++++++++++++++-----------
 1 files changed, 26 insertions(+), 11 deletions(-)



