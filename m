Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qbgx6-0003Pj-OL
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 00:40:16 +0200
Received: from localhost.localdomain (c-98-246-160-194.hsd1.or.comcast.net
	[98.246.160.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 00CE030504;
	Tue, 28 Jun 2011 18:36:26 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 15:36:17 -0700
Message-Id: <cover.1309300395.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 00CE030504.2E04C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/1] shadow-native fix for useradd
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
X-List-Received-Date: Tue, 28 Jun 2011 22:40:16 -0000

Pseudo was recently changed so that when system() calls are made
after a chroot(), the host binaries can no longer be found, breaking
the system("mkdir -p") approach when useradd creates home directories.

Instead, use mkdir(2) to create home directories with a helper
function to ensure parent directories get created.

This is a prerequisite fix needed for my useradd.bbclass changes
(still pending until I address some of Richard's comments from this
morning). 

The following changes since commit a4f3e006e1f2fd93f156012af2a05adccf41d065:

  u-boot-mkimage: bump version to 2011.03 (2011-06-28 17:13:19 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/mkdir-p-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/mkdir-p-fix

Scott Garman (1):
  shadow-native: fix creation of home directories

 .../shadow/files/add_root_cmd_options.patch        |  125 +++++++++++++++----
 1 files changed, 98 insertions(+), 27 deletions(-)



