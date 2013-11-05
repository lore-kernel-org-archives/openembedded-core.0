Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 875CE6D12A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 18:47:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rA5Ilqbs011024
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 5 Nov 2013 10:47:53 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.89) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 5 Nov 2013 10:47:51 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 5 Nov 2013 13:47:49 -0500
Message-ID: <cover.1383677174.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] linux-yocto/3.10: fix qemuarm boot and spurious mips build warning
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
X-List-Received-Date: Tue, 05 Nov 2013 18:47:53 -0000
Content-Type: text/plain

Richard/Saul,

I don't have anything extra to add outside of what I put in the
patch commit log .. so here it is:

-------------------------------------------

This update fixes two issues:

a) qemuarm boot failure

v3.10.13 picked up a patch for arm versatile interrupt mappings that fixes
the emulator boot out of the box. But it interacts badly with our previous
fix for the issue. Reverting the existing patch and going with the mainline
solution fixes the boot.

b) qemumips build warning and failure

Depending on the build host and compiler, the build of menuconfig throws
an potentially uninitialized variable warning. That warning causes an
error on archs with -Werror. We can do a trivial change to avoid the
warning all together (initilize it to null), and keep everyone happy.

[YOCTO #5460]

-------------------------------------------

Cheers,

Bruce

The following changes since commit 57498cede4696526c121e0112b5dea3e6e8365ac:

  bitbake: toaster: fix target package information (2013-11-05 12:50:44 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto/3.10: fix qemuarm boot and spurious mips build warning

 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.8.1.2


