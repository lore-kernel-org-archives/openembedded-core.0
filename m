Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SlZcI-0003OM-GT
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 07:56:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q625j3EC027673
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2012 22:45:03 -0700 (PDT)
Received: from yow-pgortmak-d2.corp.ad.wrs.com (128.224.146.165) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 1 Jul 2012 22:45:02 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jul 2012 01:44:42 -0400
Message-ID: <1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 1.7.9.6
In-Reply-To: <4FF0C930.4000104@linux.intel.com>
References: <4FF0C930.4000104@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 0/3] u-boot recipe updates
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
X-List-Received-Date: Mon, 02 Jul 2012 05:56:10 -0000
Content-Type: text/plain

These are the oe-core updates required so that yocto can do
a successful build of a working u-boot image for the mpc8315
reference BSP.

In v2, I've fixed up the issue where TARGET_PREFIX accidentally became
specific to the one single recipe.  That made the 3/3 patch in v1 no
longer required.  However, when build testing, I noticed that we
were needlessly clobbering PARALLEL_MAKE for u-boot, which is not
at all required, and just slows down builds.  So a new patch is
added to fix that, and we still have three total.

I've built for the beagleboard with -j8 (twice), and the same for
the 8315 BSP.  I've also always built u-boot with -j10 or greater
for countless powerpc images I've made in the last 1/2 dozen years.
Looking at the git history, it appears this just came in with some
large import, versus being an actively chosen individual setting.

The 8315 specific patch that was sent to the yocto list earlier to
enable building it (u-boot.bin) by default is unchanged, but I can
resend that if it helps somehow.

Paul.
---

Paul Gortmaker (3):
  u-boot: Don't make the -Os removal part of global settings.
  u-boot: make FILESDIR a shared setting.
  u-boot: do not clobber PARALLEL_MAKE setting

 meta/recipes-bsp/u-boot/u-boot.inc           |    6 ++----
 meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
 meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
 meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 --
 4 files changed, 2 insertions(+), 10 deletions(-)

-- 
1.7.9.6



