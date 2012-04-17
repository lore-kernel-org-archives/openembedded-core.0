Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SKI2y-0003ac-6L
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 01:42:56 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A5FDB2FF65
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 19:33:26 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 16:33:28 -0700
Message-Id: <cover.1334705370.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A5FDB2FF65.ABC31
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] glxgears fix
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
X-List-Received-Date: Tue, 17 Apr 2012 23:42:56 -0000

Hello,

This pull request fixes a bug where glxgears would fail with the
following error:

Error: couldn't get an RGB, Double-buffered visual.

This was occurring for images which use RPM because do_rootfs could
allow qemugl to be installed after libgl1, and qemugl's postinst needs
to run after libgl1 is installed to replace the libGL library.

This commit changes the postinst to run at first boot instead of during
do_rootfs.

This is an urgent fix to include with 1.2. - [YOCTO #2309]

The following changes since commit dc0fe3fbf9ca862c1d0d90468e6da326f58e3b41:

  qemugl: make postinst run at first boot (2012-04-18 00:21:51 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/glxgears-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=glxgears-oe

Scott Garman (1):
  qemugl: make postinst run at first boot

 meta/recipes-graphics/mesa/qemugl_git.bb |   16 +++++++++++-----
 1 files changed, 11 insertions(+), 5 deletions(-)

-- 
1.7.5.4



