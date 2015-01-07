Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E90A72882
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 07:07:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t07773H1007914
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 6 Jan 2015 23:07:03 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 6 Jan 2015 23:07:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 7 Jan 2015 15:06:48 +0800
Message-ID: <cover.1420613743.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/4] add variable INSTALL_ALL to install all packages in recipes
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
X-List-Received-Date: Wed, 07 Jan 2015 07:07:11 -0000
Content-Type: text/plain

Test Steps:

Install busybox and lib32-python3 to core-image-minimal,
and also install all available packages of recipes busybox
and python3.

1. vim local.conf
...
MACHINE ?= "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_INSTALL_append = " busybox lib32-python3"
INSTALL_ALL_busybox ?= "1" 
INSTALL_ALL_lib32-python3 ?= "1"
...

2. Build core-image-minimal
$ bitbake core-image-minimal

3. Check installed_pkgs.txt, all available packages of recipes busybox and
lib32-python3 have been installed.
...
$ cat tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/installed_pkgs.txt
...
busybox core2-64
busybox-hwclock core2-64
busybox-syslog core2-64
busybox-udhcpc core2-64
busybox-udhcpd core2-64
...

4. Edit local.conf to assign INSTALL_ALL_busybox ?= "0"

5. build core-image-minimal

6. Check installed_pkgs.txt, busybox-udhcpd not installed
...
$ cat tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/installed_pkgs.txt
...
busybox core2-64
busybox-hwclock core2-64
busybox-syslog core2-64
busybox-udhcpc core2-64
...

//Hongxu

The following changes since commit bfe7d3032a61a20010b5b758be07581e1bf01cba:

  gstreamer1.0-omx: use mulitple SCMs to fetch submodules (2014-12-31 17:04:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/install-all
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/install-all

Hongxu Jia (4):
  scripts/oe-pkgdata-util: support rprovides for lookup-recipe
  scripts/oe-pkgdata-util: add ability to list all produced packages
    from a recipe
  python3: avoid debian renaming for libpython3
  manifest.py/image.bbclass: add var-INSTALL_ALL to install all packages
    of a recipes.

 meta/classes/image.bbclass                    |  19 ++++-
 meta/lib/oe/manifest.py                       |  56 +++++++++++++-
 meta/recipes-devtools/python/python3_3.3.3.bb |   2 +
 scripts/oe-pkgdata-util                       | 101 +++++++++++++++++++++++++-
 4 files changed, 174 insertions(+), 4 deletions(-)

-- 
1.9.1


