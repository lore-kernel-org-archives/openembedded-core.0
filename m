Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 67FD6724DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:34:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBAAYAmR024237
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 10 Dec 2014 02:34:11 -0800 (PST)
Received: from yow-bashfiel-d4.corp.ad.wrs.com (128.224.20.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 10 Dec 2014 02:34:10 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 10 Dec 2014 05:34:01 -0500
Message-ID: <cover.1418207154.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel: consolidated pull for developer experience
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
X-List-Received-Date: Wed, 10 Dec 2014 10:34:16 -0000
Content-Type: text/plain

Richard,

Here are the first (and largest) kernel developer experience changes for the 1.8
release.

Obviously you are the author of patch 1 in the series, and I've made changes to
fixup the remaining out of tree module build, and on-target kernel build issues.

With these changes in place, I've built and booted the linux-yocto kernels, as
well as build the kernel itself on the target .. so they are definitely sane
from that point of view. I won't swear that there aren't any cornder cases still
lurking, but we need more eyes and tests to find those cases.

With this series, we've move a lot of the source copying and I/O intensive
operations to the kernelsrc recipe .. which makes them optional and not an
impact on the typical build/developer. As described in pach 1, the kernel is
unpacked, manipulated and built directly from STAGING_DIR_KERNEL.

If the src is required, the kerneldevsrc recipe can be added to the
DEPENDS/RDEPENDS and the packaging will happen (with the associated overhead).

I've kept the series history as you see it on purpose, so we can capture
credit for the optimization idea, and to make the changes more digestible
to those reading the series. If we want some additional squashing of the
commits, I'm happy to do that as well.

The final parts of this series are some collected kernel build fixes that 
I've had for a while, but are minor in the grand scheme of things.

Cheers,

Bruce

Bruce Ashfield (5):
  kernel: fix out of tree module builds
  kerneldev: create kernel-devsrc packaging
  images: introduce core-image-kernel-dev
  lttng/perf: depend on virtual/kernel:do_install
  kernel-yocto: fix non-git builds

Jeff Wang (1):
  kernel-yocto: make sure git tags get dereferenced properly in
    do_patch()

Richard Purdie (1):
  kernel: Rearrange for 1.8

 meta/classes/kernel-yocto.bbclass                  |  8 +-
 meta/classes/kernel.bbclass                        | 93 ++++------------------
 meta/classes/linux-kernel-base.bbclass             | 13 ++-
 .../images/core-image-kernel-dev.bb                | 17 ++++
 meta/recipes-kernel/linux/kernel-devsrc.bb         | 50 ++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.5.0.bb   |  1 +
 meta/recipes-kernel/perf/perf.bb                   | 12 +--
 7 files changed, 104 insertions(+), 90 deletions(-)
 create mode 100644 meta/recipes-extended/images/core-image-kernel-dev.bb
 create mode 100644 meta/recipes-kernel/linux/kernel-devsrc.bb

-- 
2.1.0


