Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SnE04-0004Xw-JP
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 21:16:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q66J3sSr021571
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jul 2012 12:03:54 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 6 Jul 2012 12:03:53 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Jul 2012 14:13:58 -0500
Message-ID: <cover.1341601764.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/3] Image/SDK multilib fixes
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
X-List-Received-Date: Fri, 06 Jul 2012 19:17:47 -0000
Content-Type: text/plain

The image generation for RPM needs to be synced with the python fragement in
the populate_sdk case.  Otherwise the multilib configuations get out of sync.

Similar changes are NOT needed for deb or ipkg.

We also needed to enable multilib remapping when the populate_sdk_base is
loaded, otherwise we don't get matching package and sdk images.

Finally to avoid conflicts in the SDK generation, we compute the install 
solutions by adding --replacepkgs to the temporary database.  This does
not change the installed image behavior in any way.

The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:

  bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/sdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk

Mark Hatle (3):
  populate_sdk_rpm: Sync multilib configuration with rootfs_rpm
  multilib: Enable multilib remapping for SDK generation
  package_rpm: Avoid duplicate package generation failures

 meta/classes/multilib.bbclass         |    6 ++++++
 meta/classes/package_rpm.bbclass      |   10 +++++-----
 meta/classes/populate_sdk_rpm.bbclass |   15 ++++++++++-----
 meta/classes/rootfs_rpm.bbclass       |    1 +
 4 files changed, 22 insertions(+), 10 deletions(-)

-- 
1.7.3.4



