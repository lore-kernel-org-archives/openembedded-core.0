Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2090C78679
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 02:35:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB72ZNgo012940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Dec 2017 18:35:23 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Dec 2017 18:35:22 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Dec 2017 10:33:27 +0800
Message-ID: <cover.1512613370.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/1] features_backfill: fix for multilib
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
X-List-Received-Date: Thu, 07 Dec 2017 02:35:23 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested with:

1) local.conf:
MACHINE = "qemumips64"
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS = "multilib:libn32"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf

2) run bitbake -e to check the features:

$ bitbake -e libn32-gobject-introspection | grep '^MACHINE_FEATURES'

(before the fix)
MACHINE_FEATURES="alsa bluetooth usbgadget screen rtc qemu-usermode"
MACHINE_FEATURES_BACKFILL="rtc qemu-usermode"
MACHINE_FEATURES_BACKFILL_CONSIDERED=" qemu-usermode"

(after the fix)
MACHINE_FEATURES="alsa bluetooth usbgadget screen rtc"
MACHINE_FEATURES_BACKFILL="rtc qemu-usermode"
MACHINE_FEATURES_BACKFILL_CONSIDERED=" qemu-usermode"
MACHINE_FEATURES_ORIGINAL="alsa bluetooth usbgadget screen"

3) world build:

$ bitbake world

builds without error.


--
The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:

  lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_backfill_multilib_171207_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_backfill_multilib_171207_0

Jackie Huang (1):
  features_backfill: fix for multilib

 meta/classes/multilib.bbclass | 4 ++++
 meta/lib/oe/utils.py          | 9 +++++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
1.9.1


