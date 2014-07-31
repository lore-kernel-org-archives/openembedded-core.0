Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F02D57099C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 08:15:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s6V8FJ2N029952
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 01:15:19 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 31 Jul 2014 01:15:19 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Jul 2014 01:15:17 -0700
Message-ID: <cover.1406794207.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] package_manager.py: set preferred ABI for rpm
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
X-List-Received-Date: Thu, 31 Jul 2014 08:15:24 -0000
Content-Type: text/plain

Test info:
* Set these in local.conf:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

IMAGE_INSTALL_append = " bash lib32-bash"

1) Set RPM_PREFER_COLOR = "1" in local.conf
$ bitbke core-image-minimal
$ file tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/bin/bash
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/bin/bash: ELF 32-bit LSB executable, Intel 80386
### 32bit wins

2) Set RPM_PREFER_COLOR = "2" in local.conf
$ bitbke core-image-minimal
$ file tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/bin/bash
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/bin/bash: ELF 64-bit LSB executable, x86-64
### 64bit wins

// Robert

The following changes since commit 7986adeac16550b33f65fded39a55f668e0e543f:

  populate_sdk_base: Fix grep command usage on old hosts (2014-07-29 09:57:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib robert/rpm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rpm

Robert Yang (2):
  package_manager.py: set preferred ABI for rpm
  local.conf.sample.extended: update for preferred ABI

 meta/conf/local.conf.sample.extended |   15 +++++++++++++++
 meta/lib/oe/package_manager.py       |   16 ++++++++++++++++
 meta/lib/oe/rootfs.py                |    3 ++-
 3 files changed, 33 insertions(+), 1 deletion(-)

-- 
1.7.9.5


