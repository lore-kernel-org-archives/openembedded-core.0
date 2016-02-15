Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9B8565CB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 02:02:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1F225V7008657
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Feb 2016 18:02:06 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Feb 2016 18:02:05 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 09:59:27 +0800
Message-ID: <cover.1455501148.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Replace retry logic in useradd with flock
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
X-List-Received-Date: Mon, 15 Feb 2016 02:02:09 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Hi Ross,

We met problems that useradd fails to add users. I found it a simultaneous issue, so created this patch.

As a comparison of build time:

Without flock:
1
$ time bitbake core-image-minimal

real    38m8.625s
user    318m43.262s
sys     62m47.710s


2
$ time bitbake core-image-sato

real    54m13.065s
user    587m1.386s
sys     122m16.949s



With flock:
1
$ time bitbake core-image-minimal

real    40m55.178s
user    316m26.576s
sys     58m53.322s


2
$ time bitbake core-image-sato

real    55m11.312s
user    580m16.787s
sys     118m16.385s


The following changes since commit 36b43b233c841b3c09fc17e04686b4b758780963:

  lib/oe/terminal: set workdir for konsole terminal (2016-02-14 11:42:19 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/flock
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/flock

Kai Kang (1):
  useradd_base.bbclass: fix simultaneous with flock

 meta/classes/useradd.bbclass      |   8 +-
 meta/classes/useradd_base.bbclass | 165 ++++++++++----------------------------
 2 files changed, 48 insertions(+), 125 deletions(-)

-- 
2.6.1


