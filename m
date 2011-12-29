Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RgB1E-0000Eh-O0
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 09:07:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBT71dd1008348
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 23:01:39 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 28 Dec 2011 23:01:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <mark.hatle@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Dec 2011 15:00:11 +0800
Message-ID: <cover.1325141432.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Incremental image generation(rpm based rootfs)
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
X-List-Received-Date: Thu, 29 Dec 2011 08:07:21 -0000
Content-Type: text/plain

Testing:
1) Enable INC_IMAGE_GEN = "1" in conf/local.conf
2) $ bitbake core-image-sato

   * Test when remove some pkgs
     a) Save the modify time of file which is in
        tmp/work/qemux86_64-poky-linux/core-image-sato-1.0-r0/rootfs/dev/.
     b) Edit meta/recipes-sato/images/core-image-sato.bb, remove
        ${SATO_IMAGE_FEATURES} from IMAGE_FEATURES.
     c) bitbake core-image-sato

     Result: The project built well, check the modify time of the file
     which is in
     tmp/work/qemux86_64-poky-linux/core-image-sato-1.0-r0/rootfs/dev/,
     They should be the same to step a)'s, which means that these files
     were note newly created.

   * Testh when add some pkgs
     a) Save the modify time of file which is in
        tmp/work/qemux86_64-poky-linux/core-image-sato-1.0-r0/rootfs/dev/.
     b) Edit meta/recipes-sato/images/core-image-sato.bb, add the
        ${SATO_IMAGE_FEATURES} back to IMAGE_FEATURES.
     c) bitbake core-image-sato

     Result: The project built well, check the modify time of the file
     which is in
     tmp/work/qemux86_64-poky-linux/core-image-sato-1.0-r0/rootfs/dev/,
     They should be the same to step a)'s, which means that these files
     were note newly created.

   * Test when edit a pkg
     a) bitbake bzip2 -cclean
     b) rm -f rm -f sstate-cache/sstate-bzip2-*
     c) Edit meta/recipes-extended/bzip2/bzip2_1.0.6.bb
     d) bitbake core-image-sato
     Result: The project built well, and check:
        tmp/work/qemux86-poky-linux/core-image-sato-1.0-r0/temp/log.do_rootfs
     Only the bzip2 has been re-installed

// Robert

The following changes since commit f5aa3bbda623c8fae3a761d72fddc95631ad0706:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:47 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/inc_image_gen
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/inc_image_gen

Robert Yang (2):
  Incremental image generation(rpm based rootfs)
  Incremental image generation(Add config sample)

 meta-yocto/conf/local.conf.sample |    7 ++++
 meta/classes/image.bbclass        |   11 +++++-
 meta/classes/package_rpm.bbclass  |   72 +++++++++++++++++++++++++++++++-----
 3 files changed, 78 insertions(+), 12 deletions(-)

-- 
1.7.4.1



