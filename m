Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ED9F671D9D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 20:59:05 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 13:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="94327298"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 01 May 2017 13:59:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:58:58 -0700
Message-Id: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2 0/6] Reproducible binaries
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
X-List-Received-Date: Mon, 01 May 2017 20:59:06 -0000

This patch set (V2) contains several patches aimed to achieve reproducible binaries.
Building reproducible binaries may remove certain intentional
randomness intended for increased security. Hence, it is reasonable
to expect there will be cases where this is not desirable.
The user can select his/her preferences via the variable
BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not
build reproducible binaries) in order to minimize any potential
regressions.

For debian packages we get a lot of binary identical packages simply by
exporting SOURCE_DATE_EPOCH. This is done automatically when
BUILD_REPRODUCIBLE_BINARIES="1".

For rootfs we get much fewer differences by modified prelinking and by
ensuring various timestamps are reproducible.

For example, building core-image-minimal with this patchset,
using the following settings in the local.conf:

    BUILD_REPRODUCIBLE_BINARIES="1"
    LDCONFIGDEPEND=""
    IMAGE_CMD_TAR="tar -v --sort=name"

    #Optional user specified timestams:
    REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK="1483228800"
    REPRODUCIBLE_TIMESTAMP_ROOTFS="1483228800"

we can build binary identical core-image-minimal-rootfs.tar.bz2 images.
(Tested on the same machine, two different build folders, images built at different
times)
Eventually, it will be possible to build identical identical core-image-minimal-rootfs.ext4
as well. (Note in this test case the rootfs is built without pre-built ldconfig aux-cache).
This patchset does not address the reproducibility of the linux kernel nor
the reproducibility of linux kernel modules.



Juro Bystricky (6):
  bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
  base.bbclass: initial support for binary reproducibility
  image-prelink.bbclass: support binary reproducibility
  rootfs-postcommands.bbclass: support binary reproducibility
  busybox.inc: improve reproducibility
  image.bbclass: support binary reproducibility

 meta/classes/base.bbclass                | 82 ++++++++++++++++++++++++++++++++
 meta/classes/image-prelink.bbclass       | 12 ++++-
 meta/classes/image.bbclass               | 12 +++++
 meta/classes/rootfs-postcommands.bbclass | 24 ++++++++--
 meta/conf/bitbake.conf                   | 11 +++++
 meta/recipes-core/busybox/busybox.inc    |  3 ++
 6 files changed, 140 insertions(+), 4 deletions(-)

-- 
2.7.4


