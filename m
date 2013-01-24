Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TyIEG-00082u-Gl
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 09:32:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0O8GdNd024245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 00:16:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 24 Jan 2013 00:16:38 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2013 16:16:40 +0800
Message-ID: <cover.1359014474.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 00/12] read-only rootfs support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 08:32:45 -0000
X-List-Received-Date: Thu, 24 Jan 2013 08:32:45 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The series of patches add support to read-only rootfs.

The main idea is to use symbolic links to create the illuion that some
directories are writable in case of a read-only rootfs.

We use a similar stragety to update-rc.d.bbclass to manage all the recipes
that need to tweak some specific directories to support a read-only rootfs.
These recipes inherit volatiles.bbclass and set VOLATILE_DIR, VOLATILE_LINK
and VOLATILE_PKGS properly.

The advantage of this strategy is that it deligates the task of supporting
read-only rootfs to the recipes, resulting in a better management scheme.

This set of patches have been tested on minimal images with and without
'read-only-rootfs' image feature enabled. Everything is OK.

For sato images, everything is the same as before if 'read-only-rootfs' is not enabled.
With 'read-only-rootfs' enabled, sato image could work if graphic interface is diabled.
When all postinstall problems are resolved, sato image should work well.


The following changes since commit 37e025f6f9c410005e0f1dee0767e38eaec01cbd:

  bitbake: hob: Hob should display warnings generated during parsing (2013-01-21 19:05:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/readonly-rootfs

Chen Qi (12):
  sysvinit: add ROOTFS_READ_ONLY variable to rcS-default
  image.bbclass: add a hook funtion to support readonly rootfs
  core-image.bbclass: support read-only rootfs
  package.bbclass: add VOLATILE_DIR and VOLATILE_LINK to PACKAGEVARS
  volatiles.bbclass: add recipe
  volatiles_sysvinit.bbclass: add recipe
  populate-volatile.sh: improve this script
  initscripts: let populate-volatile.sh create the /tmp link
  initscripts: inherit volatiles to support read-only rootfs
  dropbear: inherit volatiles to support read-only rootfs
  nfs-utils: inherit volatiles to support read-only rootfs
  dbus: inherit volatiles to support read-only rootfs

 meta/classes/core-image.bbclass                    |    4 +
 meta/classes/image.bbclass                         |   18 ++
 meta/classes/package.bbclass                       |    4 +-
 meta/classes/volatiles.bbclass                     |   11 +
 meta/classes/volatiles_sysvinit.bbclass            |   49 ++++
 .../nfs-utils/nfs-utils_1.2.3.bb                   |    7 +-
 meta/recipes-core/dbus/dbus.inc                    |    7 +-
 meta/recipes-core/dropbear/dropbear.inc            |    7 +-
 .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
 .../initscripts-1.0/populate-volatile.sh           |  287 ++++++++++----------
 .../initscripts/initscripts-1.0/volatiles          |    1 +
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    6 +-
 meta/recipes-core/sysvinit/sysvinit/rcS-default    |    4 +
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    2 +-
 14 files changed, 255 insertions(+), 161 deletions(-)
 create mode 100644 meta/classes/volatiles.bbclass
 create mode 100644 meta/classes/volatiles_sysvinit.bbclass

-- 
1.7.9.5



