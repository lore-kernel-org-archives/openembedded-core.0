Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ED85071CB4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:54:59 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2017 01:55:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="225089973"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 14 Feb 2017 01:55:00 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 7E2D06A4080;
	Tue, 14 Feb 2017 01:53:57 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:54:48 +0200
Message-Id: <cover.1487065337.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/11] Mesa 17, other upgrades, piglit
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
X-List-Received-Date: Tue, 14 Feb 2017 09:55:00 -0000

Bunch of graphics upgrades, the only major one is mesa 17.
On top of the piglit update I've added the same
piglit-generated-tests-compressed hack I've sent before in case
you're interested...

I've smoketested as usual (seems fine), and did a piglit run with
ok results:

    piglit:   ca58eec0b9 (2017-02-06)
    mesa:     17.0.0
    Hardware: nuc6i5syh, gen9 graphics (Iris 540)

    summary:
           name: piglit
           ----  ------
           pass:  46120
           fail:    298
          crash:      2
           skip:   5187
           warn:      5
          total:  51612

Thanks,
  Jussi



The following changes since commit e758547db9048d4aa1c1415d6af8072f519fae24:

  nss: Fix nss-native so the checksum doesn't change with BUILD_ARCH (2017-02-09 10:52:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/mesa17
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/mesa17

Jussi Kukkonen (11):
  mesa: Upgrade 13.0.4 -> 17.0.0
  gdk-pixbuf: Upgrade 2.36.1 -> 2.36.4
  util-macros: Upgrade 1.19.0 -> 1.19.1
  presentproto: Upgrade 1.0 -> 1.1
  xauth: Upgrade 1.0.9 -> 1.0.10
  xf86-input-libinput: Upgrade 0.23.0 -> 0.24.0
  xkeyboard-config: Upgrade 2.19 -> 2.20
  libinput: Upgrade 1.6.0 -> 1.6.1
  piglit: Upgrade to current master
  piglit: Package tests in compressed form as well
  core-tools-testapps: Re-add piglit

 .../packagegroup-core-tools-testapps.bb            |  2 +
 .../{gdk-pixbuf_2.36.1.bb => gdk-pixbuf_2.36.4.bb} |  4 +-
 .../mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc                |  8 +---
 .../mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb}        |  7 ++-
 .../0001-cmake-Link-test-utils-with-ldl.patch      | 41 ----------------
 ...0001-cmake-Link-utils-with-xcb-explicitly.patch | 54 ----------------------
 meta/recipes-graphics/piglit/piglit/piglit.sh      | 20 ++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         | 31 ++++++++++---
 .../{libinput_1.6.0.bb => libinput_1.6.1.bb}       |  4 +-
 .../xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb}   |  4 +-
 ...put_0.23.0.bb => xf86-input-libinput_0.24.0.bb} |  4 +-
 ...ard-config_2.19.bb => xkeyboard-config_2.20.bb} |  4 +-
 .../xorg-proto/presentproto_git.bb                 |  6 +--
 ...util-macros_1.19.0.bb => util-macros_1.19.1.bb} |  4 +-
 15 files changed, 64 insertions(+), 129 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.1.bb => gdk-pixbuf_2.36.4.bb} (96%)
 rename meta/recipes-graphics/mesa/{mesa-gl_13.0.4.bb => mesa-gl_17.0.0.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_13.0.4.bb => mesa_17.0.0.bb} (74%)
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-test-utils-with-ldl.patch
 delete mode 100644 meta/recipes-graphics/piglit/piglit/0001-cmake-Link-utils-with-xcb-explicitly.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/piglit.sh
 rename meta/recipes-graphics/wayland/{libinput_1.6.0.bb => libinput_1.6.1.bb} (85%)
 rename meta/recipes-graphics/xorg-app/{xauth_1.0.9.bb => xauth_1.0.10.bb} (75%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.23.0.bb => xf86-input-libinput_0.24.0.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.19.bb => xkeyboard-config_2.20.bb} (88%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.19.0.bb => util-macros_1.19.1.bb} (75%)

-- 
2.1.4


