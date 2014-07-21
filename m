Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC94F7054B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 06:17:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6L6Hmuo011009
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Jul 2014 23:17:48 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Jul 2014 23:17:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jul 2014 14:17:33 +0800
Message-ID: <cover.1405923190.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH V2 0/1] insane: add checking to standardize how .bbappend files do FILESEXTRAPATHS
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
X-List-Received-Date: Mon, 21 Jul 2014 06:17:54 -0000
Content-Type: text/plain

Change in V2:
- It is more reasonable to move the checking to insance.bbclass
  rather than create a new bbclass. 

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
ERROR: FILESEXTRAPATHS-variable, must always use _prepend (or _append)
type of assignment. Please assign it with the format of:
  FILESEXTRAPATHS_append := ${THISDIR}/Your_Files_Path or
  FILESEXTRAPATHS_prepend := ${THISDIR}/Your_Files_Path
in your bbappend file
ERROR: Failed to parse recipe: /home/jiahongxu/yocto/poky/meta/recipes-core/busybox/busybox_git.bb
...

//Hongxu

The following changes since commit 4d2ac6f6df2b3ef98699dd4f7afadb2d994222bb:

  rootfs: Remove the extraneous install directory (2014-07-19 00:18:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/filesextrapaths
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/filesextrapaths

Hongxu Jia (1):
  insane: add checking to standardize how .bbappend files do
    FILESEXTRAPATHS

 meta/classes/insane.bbclass | 10 ++++++++++
 meta/classes/utils.bbclass  |  2 ++
 meta/conf/bitbake.conf      |  2 ++
 3 files changed, 14 insertions(+)

-- 
1.8.1.2


