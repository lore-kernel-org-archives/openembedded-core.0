Return-Path: <Adrian.Calianu@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BF45865DB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 13:41:52 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Jun 2014 15:41:47 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id 65EC02884E9;
	Tue, 10 Jun 2014 15:41:47 +0200 (CEST)
From: Adrian Calianu <adrian.calianu@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jun 2014 15:41:30 +0200
Message-ID: <1402407691-58920-1-git-send-email-adrian.calianu@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: adrian.calianu@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 0/1] wic: Add wic support to generate rootfs image for uboot
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
X-List-Received-Date: Tue, 10 Jun 2014 13:42:03 -0000
Content-Type: text/plain

Hi,

We tried to extend existing wic tool to generates rootfs images for U-Boot.
This will be possible from cooked mode(existing build folder) and from raw 
mode where you have to provide a list of packages to be installed and 
a native rootfs with necessary tools. 

Some prerequisites are required for this new build setup in wic.conf file. 
As package manager only opkg and only web paths(repourl) are supported by now.
../poky/scripts/lib/image/config/wic.conf
[create]
arch=target_arch (example: powerpc, arm, x86)
pkgmgr=opkg
repourl=http://example.distro/p2020rdb/ipk/all http://example.distro/p2020rdb/ipk/p2020rdb http://example.distro/p2020rdb/ipk/ppce500v2

    1) Build rootfs image from an existing bitbake build:
       wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -e core-image-minimal -o .../output

    2) Build rootfs image from an existing rootfs and native_sysroot:
       wic create ../poky/scripts/lib/image/canned-wks/uboot.wks -r .../path_to_rootfs -n .../path_to_native_sysroot -o .../output

    3) Build rootfs image only from a package list (on wks file) similar with IMAGE_INSTALL from bitbake. 
       Package dependencies will be installed by default by the package manager.

       Add the list of packages to be installed as rootfs on ../poky/scripts/lib/image/canned-wks/uboot.wks:
       %packages
       packagegroup-core-boot
       pramfs-init
       run-postinsts
       packagegroup-core-ssh-dropbear
       %end

       Generate rootfs image:
       wic create ../poky/scripts/lib/image/canned-wks/uboot.wks  -n .../path_to_native_sysroot -o .../output

 
Adrian Calianu (1):
  Add wic support to generate rootfs image for uboot

 scripts/lib/image/canned-wks/uboot.wks             |   17 +
 scripts/lib/image/config/wic.conf                  |    4 +
 scripts/lib/image/engine.py                        |    7 +-
 scripts/lib/mic/imager/direct.py                   |    4 +
 .../lib/mic/kickstart/custom_commands/partition.py |  128 ++++
 scripts/lib/mic/plugin.py                          |   11 +-
 scripts/lib/mic/pluginbase.py                      |    9 +
 scripts/lib/mic/plugins/source/uboot.py            |  173 +++++
 scripts/lib/mic/utils/oe/package_manager.py        |  810 ++++++++++++++++++++
 scripts/wic                                        |   88 ++-
 10 files changed, 1219 insertions(+), 32 deletions(-)
 create mode 100644 scripts/lib/image/canned-wks/uboot.wks
 create mode 100644 scripts/lib/mic/plugins/source/uboot.py
 create mode 100644 scripts/lib/mic/utils/oe/package_manager.py

-- 
1.7.10.4


