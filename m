Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB3C70553
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 05:35:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6L5Z2sU023240
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jul 2014 22:35:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Jul 2014 22:35:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2014 13:34:46 +0800
Message-ID: <cover.1405917574.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Mon, 21 Jul 2014 05:35:09 -0000
Content-Type: text/plain

Test Steps:

1) Edit meta-yocto/recipes-core/busybox/busybox_%.bbappend
   and assigned FILESEXTRAPATHS incorrectly:
...
--- a/meta-yocto/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-yocto/recipes-core/busybox/busybox_%.bbappend
@@ -1,2 +1,2 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
+FILESEXTRAPATHS := "${THISDIR}/${BPN}:"
...

2) bitbake busybox
...
ERROR: Please assign FILESEXTRAPATHS with the format of:
  FILESEXTRAPATHS_append := ${THISDIR}/Your_Files_Path or
  FILESEXTRAPATHS_prepend := ${THISDIR}/Your_Files_Path
in your bbappend file

ERROR: Failed to parse recipe: /home/jiahongxu/yocto/poky/meta/recipes-core/busybox/busybox_1.22.1.bb
...

//Hongxu

The following changes since commit 4d2ac6f6df2b3ef98699dd4f7afadb2d994222bb:

  rootfs: Remove the extraneous install directory (2014-07-19 00:18:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/filesextrapaths
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/filesextrapaths

Hongxu Jia (1):
  add checking to standardize how .bbappend files do FILESEXTRAPATHS

 meta/classes/base.bbclass                  |  1 +
 meta/classes/filesextrapaths_check.bbclass | 10 ++++++++++
 meta/classes/utils.bbclass                 |  2 ++
 meta/conf/bitbake.conf                     |  2 ++
 4 files changed, 15 insertions(+)
 create mode 100644 meta/classes/filesextrapaths_check.bbclass

-- 
1.8.1.2


