Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D093F71911
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 09:23:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9F9NPo8000799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 Oct 2014 02:23:25 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 15 Oct 2014 02:23:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 15 Oct 2014 17:23:15 +0800
Message-ID: <cover.1413364849.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain build failure
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
X-List-Received-Date: Wed, 15 Oct 2014 09:23:29 -0000
Content-Type: text/plain

Changed in V2: 
V1 caused build failure of meta-toolchain, in order to avoid it, we
should use DEFAULTTUNE_virtclass-multilib-lib32 first, if it is not 
available, and try to use DEFAULTTUNE_ML_<multilib> 

Test steps:

1. env
vim local.conf
...
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS ?= "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "x86"
...

2. build lib32-meta-toolchain success
$ bitbake lib32-meta-toolchain

3. build meta-toolchain success
$ bitbake meta-toolchain

//Hongxu

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-lib32-meta-toolchain
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-lib32-meta-toolchain

Hongxu Jia (1):
  multilib.bbclass/package_manager.py: fix <multilib>-meta-toolchain
    build failure

 meta/classes/multilib.bbclass  | 1 +
 meta/lib/oe/package_manager.py | 3 +++
 2 files changed, 4 insertions(+)

-- 
1.9.1


