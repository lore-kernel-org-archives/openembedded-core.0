Return-Path: <Kexin.Hao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB9F37999F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 07:09:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T79QOm016702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 00:09:36 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 29 Sep 2018 00:09:15 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 15:01:43 +0800
Message-ID: <20180929070147.88203-1-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Fix the build failure when creating a multilib wic
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
X-List-Received-Date: Sat, 29 Sep 2018 07:09:46 -0000
Content-Type: text/plain

We have observed the following build failure when building lib32-core-image-minimal
for a qemux86-64 machine.
    DEBUG: | ERROR: Couldn't find correct bootimg_dir, exiting
    | ERROR: Couldn't find correct bootimg_dir, exiting
    DEBUG: | 

This patch series tries to fix this issue. You can use the following
steps to reproduce this issue:
 1. source .../git/poky/oe-init-build-env and set the MACHINE to
"qemux86-64"

 2. Add the following to conf/local.conf:
    IMAGE_FSTYPES = "wic"
    
    MULTILIBS = "multilib:lib32"
    require conf/multilib.conf
    DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

 3. bitbake lib32-core-image-minimal

Kevin Hao (4):
  wic: bootimg-pcbios: Drop the unnecessary reference of STAGING_DATADIR
  wic: isoimage-isohybrid: Drop the unnecessary reference of
    STAGING_DATADIR
  bitbake.conf: Introduce variables used to access the other recipe
    specific sysroot directory in multilib case
  wic: Set the right bootimg_dir when building a multilib image

 meta/classes/image_types_wic.bbclass                 |  2 +-
 meta/conf/bitbake.conf                               |  4 ++++
 meta/conf/multilib.conf                              |  1 +
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     |  7 +++----
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 13 ++++---------
 scripts/wic                                          |  2 +-
 6 files changed, 14 insertions(+), 15 deletions(-)

-- 
2.14.4


