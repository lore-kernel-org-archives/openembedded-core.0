Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RkZEv-0003Wy-En
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:47:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0AAe7K2011768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 02:40:07 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jan 2012 02:40:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 18:38:24 +0800
Message-ID: <cover.1326191431.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/2 ] V3 Incremental rpm image generation
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
X-List-Received-Date: Tue, 10 Jan 2012 10:47:37 -0000
Content-Type: text/plain

Changes of V3:
* Change the name from INC_RPM_IMAGE_GEN to INC_RPM_IMAGE_GEN as Richard
  suggested, and it will only work for rpm based rootfs, the deb and ipk
  will be done in M3.

* Update rootfs_rpm.bbclass since other developer has modified it since
  V2.

Changes of V2:
* Move the config sample from meta-yocto/conf/local.conf.sample to
  meta-yocto/conf/local.conf.sample.extended as Saul suggested.

Testing:
1) Add INC_RPM_IMAGE_GEN = "1" to conf/local.conf
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



The following changes since commit 468998cddbe1a803096c9b357e1b5daa3b7e8c2e:

  command.py: add parseConfigurationFiles API (2012-01-06 16:01:44 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/inc_image_gen
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/inc_image_gen

Robert Yang (2):
  Incremental rpm image generation
  Incremental rpm image generation(Add config sample)

 meta-yocto/conf/local.conf.sample.extended |    7 +++
 meta/classes/image.bbclass                 |   11 ++++-
 meta/classes/package_rpm.bbclass           |   73 ++++++++++++++++++++++++----
 meta/classes/rootfs_rpm.bbclass            |    6 ++-
 4 files changed, 84 insertions(+), 13 deletions(-)

-- 
1.7.4.1



