Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B72BE7607E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:07:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5727VVf017795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jun 2018 19:07:31 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 6 Jun 2018 19:07:30 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 6 Jun 2018 22:07:21 -0400
Message-ID: <cover.1528336755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Thu, 07 Jun 2018 02:07:35 -0000
Content-Type: text/plain

Hi all,

Here is my queue of changes for kernel-yocto.

These are mainly -stable updates, but contained in those updates are the gcc8
fixes that we need to get gcc8 working for the reference kernels in master.

I've also fixed a couple of issues that were found in the last
4.12 update.

Note: I'll be dropping 4.12 and 4.15 from master in my next set of
      updates, keeping 4.14 and moving to a 4.17+ kernel as the latest.

There's also a minor kern-tools fix that was sent in my direction.

And finally we were seeing intermittent failures when configuring linux-yocto
for 4.16+. The failures were sometimes obvious (configure failure) or not so
obvious (dropped options). When I dug into the problem, I found that 4.16+ has
new checks for x86 that require native binaries, and the compiler that will be
used to build the kernel. The fix was to put the required dependencies on the
kernel_configme task for linux-yocto (since it runs before do_configure, it
doesn't have the default kernel DEPENDS in place), and to ensure that CC= and
HOSTCC are set in the environment for the configure invokations.

Cheers,

Bruce

The following changes since commit 1c7ad49bfd3e60c44281a8f49d69f4b96c359703:

  bitbake: bitbake: Update version to post release 1.39 (2018-06-06 13:35:15 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto/4.14: update to v4.14.30
  linux-yocto/4.15: update to v4.15.18
  linux-yocto/4.14/4.15: gcc8 fixes
  linux-yocto/4.12: fix ppc cryptodev build
  kernel: specify dependencies for compilation for config tasks
  kern-tools: avoid merge_config concatenation issues
  linux-yocto/4.12: gcc8 + platform support
  linux-yocto: add kernel sample configuration fragment
  linux-yocto/4.14: update to v4.14.48

 meta/classes/kernel-yocto.bbclass                    |  5 ++++-
 meta/classes/kernel.bbclass                          |  2 +-
 .../kern-tools/kern-tools-native_git.bb              |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb     |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb     |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb     |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb        | 16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_4.14.bb        | 20 ++++++++++----------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb        | 20 ++++++++++----------
 12 files changed, 48 insertions(+), 45 deletions(-)

-- 
2.5.0


