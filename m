Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R9g6t-00060s-3y
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:38:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2011 09:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57738476"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.157])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 09:33:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:33:11 +0100
Message-Id: <cover.1317400021.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Qt4 upgrade/fixes
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
X-List-Received-Date: Fri, 30 Sep 2011 16:38:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is a pull request for Eric Bénard's qt4_upgrade branch, including
an update of Qt to 4.7.4 (preserving 4.7.3 until other layers such as
meta-oe, meta-yocto etc. can sync up) as well as several important bug
fixes.

The patches look good; if was to be really picky though I would say that
the two demo/doc patches in the series ought to be merged into one patch,
and there are a few typos in the commit messages. I'm also relying on
others to review the correctness of the armv6-vfp no-neon patch as I have
no knowledge of this area.


The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead13d9:

  base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib paule/qt4_upgrade
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4_upgrade

Denis Carikli (3):
  qt4.inc: remove the optional documentation package from the demo's
    RRECOMMENDS
  qt4(embedded and x11): disable neon for armv6-vfp
  qt4.inc: package qtdemo's docs in a separate package

Eric Bénard (3):
  qt4e-demo-image: improve image
  qt4: fix generated sdk
  qt4: update to latest version 4.7.4

Otavio Salvador (1):
  qt4: fix translation support

 meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
 meta/recipes-qt/meta/meta-toolchain-qte.bb         |    7 ++
 meta/recipes-qt/qt4/qt-4.7.3.inc                   |    9 +--
 .../recipes-qt/qt4/qt-4.7.3/fix-translations.patch |   32 ++++++++++
 meta/recipes-qt/qt4/qt-4.7.4.inc                   |   62 ++++++++++++++++++
 .../0001-Added-Openembedded-crossarch-option.patch |   47 ++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch |   56 +++++++++++++++++
 meta/recipes-qt/qt4/qt-4.7.4/g++.conf              |   60 ++++++++++++++++++
 .../qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch          |   31 +++++++++
 meta/recipes-qt/qt4/qt-4.7.4/linux.conf            |   66 ++++++++++++++++++++
 meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb          |    4 +-
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb          |   12 ++++
 meta/recipes-qt/qt4/qt4-native.inc                 |    2 +-
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb            |   18 +++++
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc        |   24 ++++----
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb   |   11 +++
 meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb          |    4 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb          |   13 ++++
 meta/recipes-qt/qt4/qt4.inc                        |    7 ++-
 21 files changed, 445 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.3/fix-translations.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4.inc
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/0001-Added-Openembedded-crossarch-option.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/fix-qtbug-20925.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/g++.conf
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/hack-out-pg2-4.7.0.patch
 create mode 100644 meta/recipes-qt/qt4/qt-4.7.4/linux.conf
 create mode 100644 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-native_4.7.4.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
 create mode 100644 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb

-- 
1.7.4.1



