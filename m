Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A51AC6E8E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:42:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1I9gdSf013215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Feb 2014 01:42:39 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 01:42:38 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2014 17:42:23 +0800
Message-ID: <cover.1392716065.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/5] package_manager.py/ootfs.py: support ipk incremental image generation
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
X-List-Received-Date: Tue, 18 Feb 2014 09:42:40 -0000
Content-Type: text/plain

Test Cases

---------------------------------------------
Case 1: Rebuild in place
1. Edit local.conf, enable multilib and ipk incremental image generation
...
 46 MACHINE ?= "qemux86-64"
254 require conf/multilib.conf
255 MULTILIBS = "multilib:lib32"
256 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
257 
258 IMAGE_INSTALL_append = " lib32-gzip"
260 IMAGE_FEATURES_append = " package-management ssh-server-dropbear "
262 
263 INC_IPK_IMAGE_GEN = "1"
...
bb core-image-minimal

2. Edit local.conf, add some spaces in IMAGE_INSTALL_append
vim local.conf
...
258 IMAGE_INSTALL_append = " lib32-gzip "
...

3. bb core-image-minimal, the image should not be rebuilt
vim log.do_rootfs:
...
 16 NOTE: Package packagegroup-core-ssh-dropbear (1.0-r1) installed in root is up to date.
 17 Package opkg-collateral (1.0-r2) installed in root is up to date.
 18 Package run-postinsts (1.0-r9) installed in root is up to date.
 19 Package packagegroup-core-boot (1.0-r11) installed in root is up to date.
 20 Package opkg (1:0.2.0-r0) installed in root is up to date.
 21 Package poky-feed-config-opkg (1.0-r2) installed in root is up to date.
 ...
 53 NOTE: Package lib32-gzip (1.6-r7) installed in root is up to date.
...

vim installed_pkgs.txt
...
lib32-gzip x86
...

4. runqemu qemux86-64, ssh could work and lib32-gzip is installed
On host:
runqemu qemux86-64
ssh root@192.168.7.2 and run 'opkg-cl list-installed'
...
lib32-gzip - 1.6-r7
...

---------------------------------------------
Case 2: Decremental Rebuild
1. Edit local.conf, enable multilib and ipk incremental image generation
...
 46 MACHINE ?= "qemux86-64"
254 require conf/multilib.conf
255 MULTILIBS = "multilib:lib32"
256 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
257 
258 IMAGE_INSTALL_append = " lib32-gzip openssl"
260 IMAGE_FEATURES_append = " package-management ssh-server-dropbear "
262 
263 INC_IPK_IMAGE_GEN = "1"
...
bb core-image-minimal

2. Edit local.conf, remove 'lib32-gzip openssl'
vim local.conf
...
258 # IMAGE_INSTALL_append = " lib32-gzip openssl"
...

3. bb core-image-minimal, lib32-gzip and openssl should be removed.
vim log.do_rootfs:
...
 20 NOTE: Removing package lib32-eglibc from root...
 21 Removing package lib32-gzip from root...
 22 Removing package lib32-update-alternatives-opkg from root...
 23 Removing package libcrypto1.0.0 from root...
 24 Removing package libssl1.0.0 from root...
 25 Removing package openssl from root...
 26 Removing package openssl-conf from root...
 ...
 31 Package opkg-collateral (1.0-r2) installed in root is up to date.
 32 Package run-postinsts (1.0-r9) installed in root is up to date.
 33 Package packagegroup-core-boot (1.0-r11) installed in root is up to date.
 34 Package opkg (1:0.2.0-r0) installed in root is up to date.
 35 Package poky-feed-config-opkg (1.0-r2) installed in root is up to date.
...

---------------------------------------------
Case 3: Incremental Rebuild
1. Edit local.conf, enable multilib and ipk incremental image generation
...
 46 MACHINE ?= "qemux86-64"
254 require conf/multilib.conf
255 MULTILIBS = "multilib:lib32"
256 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
257 
258 # IMAGE_INSTALL_append = " lib32-gzip openssl"
260 IMAGE_FEATURES_append = " package-management ssh-server-dropbear "
262 
263 INC_IPK_IMAGE_GEN = "1"
...
bb core-image-minimal

2. Edit local.conf, append 'lib32-gzip openssl' to IMAGE_INSTALL
vim local.conf
...
258 IMAGE_INSTALL_append = " lib32-gzip openssl"
...

3. bb core-image-minimal, lib32-gzip and openssl should be added.
vim log.do_rootfs:
...
 20 NOTE: Package packagegroup-core-ssh-dropbear (1.0-r1) installed in root is up to date.
 21 Package opkg-collateral (1.0-r2) installed in root is up to date.
 22 Package run-postinsts (1.0-r9) installed in root is up to date.
 23 Installing openssl (1.0.1e-r15.0) to root...
 ...
 31 Package packagegroup-core-boot (1.0-r11) installed in root is up to date.
 32 Package opkg (1:0.2.0-r0) installed in root is up to date.
 33 Package poky-feed-config-opkg (1.0-r2) installed in root is up to date.
 ...
 54 NOTE: Installing the following packages: lib32-gzip
...

---------------------------------------------
Case 4: Rebuild in place and Upgrade package
1. Edit local.conf, enable ipk incremental image generation
...
258 IMAGE_INSTALL_append = " gzip"
263 INC_IPK_IMAGE_GEN = "1"
...
bb core-image-minimal

2. Edit local.conf, upgrade gzip's PR
...
258 PR_pn-gzip = "r1"
...

3. bb core-image-minimal, gzip should be upgraded to r1
vim log.do_rootfs:
...
 21 NOTE: Package packagegroup-core-ssh-dropbear (1.0-r1) installed in root is up to date.
 22 Package opkg-collateral (1.0-r2) installed in root is up to date.
 23 Package run-postinsts (1.0-r9) installed in root is up to date.
 24 Package packagegroup-core-boot (1.0-r11) installed in root is up to date.
 25 Package opkg (1:0.2.0-r0) installed in root is up to date.
 26 Upgrading gzip on root from 1.6-r0 to 1.6-r1...
...

---------------------------------------------
Case 5: Test BAD_RECOMMENDATIONS
1. Edit local.conf, enable ipk incremental image generation
...
258 IMAGE_INSTALL_append = " util-linux"
263 INC_IPK_IMAGE_GEN = "1"
...
bb core-image-minimal

The util-linux-fdisk is in util-linux's RRECOMMENDS
vim installed_pkgs.txt
...
41 util-linux-fdisk core2-64
...

2. Edit local.conf, add some spaces to IMAGE_INSTALL and add
util-linux-fdisk to core-image-minimal's BAD_RECOMMENDATIONS
...
260 IMAGE_INSTALL_append = " util-linux  "
265 BAD_RECOMMENDATIONS_pn-core-image-minimal += "util-linux-fdisk"
...

3. bb core-image-minimal, util-linux-fdisk should not be installed
vim log.do_rootfs:
...
34 NOTE: Requested ignored recommendation util-linux-fdisk is not a package
    ...
119 util-linux: ignoring recommendation for util-linux-fdisk at user request
120 util-linux: unsatisfied recommendation for util-linux-fdisk
...

The util-linux-fdisk doesn't exist in installed_pkgs.txt any more.

---------------------------------------------
Case 5: Test NO_RECOMMENDATIONS
1. Edit local.conf, enable ipk incremental image generation
...
258 IMAGE_INSTALL_append = " util-linux"
263 INC_IPK_IMAGE_GEN = "1"
...
bb core-image-minimal

The util-linux-fdisk util-linux-cfdisk util-linux-sfdisk
util-linux-mount util-linux-readprofile util-linux-mkfs are
in util-linux's RRECOMMENDS

vim installed_pkgs.txt
...
4 util-linux-mkfs core2-64
18 util-linux-sfdisk core2-64
20 util-linux-mount core2-64
38 util-linux-cfdisk core2-64
41 util-linux-fdisk core2-64
46 util-linux-readprofile core2-64
...

2. Edit local.conf, add some spaces to IMAGE_INSTALL and
   assign core-image-minimal's NO_RECOMMENDATIONS with 1
...
260 IMAGE_INSTALL_append = " util-linux  "
267 NO_RECOMMENDATIONS_pn-core-image-minimal = "1"
...

3. bb core-image-minimal, The six packages should not be installed
vim log.do_rootfs:
...
34 NOTE: Requested ignored recommendation util-linux-fdisk is not a package
    ...
113 util-linux: ignoring recommendation for util-linux-sfdisk at user request
114 util-linux: unsatisfied recommendation for util-linux-sfdisk
115 util-linux: ignoring recommendation for util-linux-cfdisk at user request
116 util-linux: unsatisfied recommendation for util-linux-cfdisk
117 util-linux: ignoring recommendation for util-linux-mount at user request
118 util-linux: unsatisfied recommendation for util-linux-mount
119 util-linux: ignoring recommendation for util-linux-fdisk at user request
120 util-linux: unsatisfied recommendation for util-linux-fdisk
121 util-linux: ignoring recommendation for util-linux-mkfs at user request
122 util-linux: unsatisfied recommendation for util-linux-mkfs
123 util-linux: ignoring recommendation for util-linux-readprofile at user request
124 util-linux: unsatisfied recommendation for util-linux-readprofile
...

They don't exist in installed_pkgs.txt any more.

//Hongxu



The following changes since commit ac499f0b9f8a421a4e63d2de2a0b89f20c43d81c:

  dev-manual: Fixed code block example for ARCHIVER. (2014-02-17 15:39:46 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/ipk-inc-gen
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/ipk-inc-gen

Hongxu Jia (5):
  package_manager.py: support ipk incremental image generation
  package_manager.py: tweak handle_bad_recommendations for ipk
    incremental image generation
  rootfs.py: support ipk incremental image generation
  rootfs.py: fix BAD_RECOMMENDATIONS for ipk incremental image
    generation
  rootfs.py: tweak _multilib_sanity_test for ipk incremental image    
    generation

 meta/lib/oe/package_manager.py | 124 +++++++++++++++++++++++++++++++++++---
 meta/lib/oe/rootfs.py          | 134 ++++++++++++++++++++++++++++++++++++++---
 2 files changed, 242 insertions(+), 16 deletions(-)

-- 
1.8.1.2


