Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNyRA-0003H0-Ad
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 04:02:52 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 396552FD07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 21:56:32 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 18:56:35 -0800
Message-Id: <cover.1320807056.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 396552FD07.791FD
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/4] More useradd cleanups
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
X-List-Received-Date: Wed, 09 Nov 2011 03:02:52 -0000

Hello,

Richard pointed out that USERADDPN is no longer needed in
useradd.bbclass. While removing that, I noticed that I was actually
injecting the user/group preinst script into *all* packages whose
recipe inherits useradd. That's not what we want, and is the reason
for the USERADD_PACKAGES variable. So I refactored the class to fix
that and clarified the useradd-example recipe documentation.

Finally, I added another check to avoid modifying -nativesdk packages.

The following changes since commit 25fae81538a92e15eab3fc169ebce44505f67839:

  python: skip setup.py 'import check' when cross-compiling (2011-11-08 21:44:23 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/useradd-cleanup-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-cleanup-final

Scott Garman (4):
  useradd.bbclass: only modify packages in USERADD_PACKAGES
  useradd.bbclass: do not modify -nativesdk packages
  useradd-example.bb: update example documentation comments
  avahi: remove USERADDPN

 .../recipes-skeleton/useradd/useradd-example.bb    |    9 ++--
 meta/classes/useradd.bbclass                       |   45 ++++++++------------
 meta/recipes-connectivity/avahi/avahi.inc          |    1 -
 3 files changed, 22 insertions(+), 33 deletions(-)

-- 
1.7.5.4



