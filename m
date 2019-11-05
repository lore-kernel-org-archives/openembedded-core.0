Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 26FEF7F939
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:08:47 +0000 (UTC)
IronPort-SDR: 9T2m88+mSMhoVHjmWI5BOZ5OLFjDx165GKNP3omrmMK1lixuevE3NwFaKT/WtFrevKuIsMyo1N
	FT+YEPXNpnuLyUzsPH5rqldAH15fDH/XW3619eHpFxW3TPIIGYDmhehpT3E23+IX8Xy39SFFvw
	UQRZccR98ln59TgTfyajbmWzip8+5GIpkSHld1lrIOWDgLGDkXq6aQcVQk98NQOl9wksxsD4Dz
	TH6ycZfpeU0XkLmDRyPw+4R06UG6ApwnQZfU9CmjZNFkHQpxL5LsZqHb3HmJFOpqbabAs4b1cb
	0M0=
X-IronPort-AV: E=Sophos;i="5.68,271,1569276000"; 
   d="scan'208";a="2115958"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:08:30 +0100
Message-Id: <cover.1572991610.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [warrior][PATCHv2 0/9] Backport relevant changes from Zeus
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
X-List-Received-Date: Tue, 05 Nov 2019 22:08:48 -0000
Content-Transfer-Encoding: 8bit

This patch set contains backports of our changes from Zeus that are
relevant for Warrior.

PATCHv2: Add a backported patch from meson 0.50 to allow
<language>_args and <language>_link_args properties, e.g.,
c_link_args, in meson.cross to be specified as either a sting or a
list. We could potentially have stumbled on this problem any time
since meson_array() was changed in commit 7fd8bc46 to return a string
if only one argument is specified. However, it was hidden until the
change to meson.bbclass in this patch series removed some unnecessary
arguments, leaving only one link argument when building for nativesdk.

//Peter

The following changes since commit d0f73121551dc98f6924cd77952bf9ebf5ef3dd7:

  poky.conf: Bump version for 2.7.2 warrior release (2019-10-30 13:55:49 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib pkj/warrior_sync

Niclas Svensson (1):
  devtool: finish: Keep patches ordered when updating bbappend

Peter Kjellerstedt (8):
  meson: Backport patch to handle strings in cross file args
  meson.bbclass: Remove the MESON_*_ARGS variables
  nativesdk-meson: Remove some unused variables
  devtool: Avoid failure for recipes with S == WORKDIR and no local
    files
  package_rpm.bbclass: Remove a misleading bb.note()
  tzdata: Correct the packaging of /etc/localtime and /etc/timezone
  devtool: finish: Add suppport for the --no-clean option
  lib/oe/lsb: Make sure the distro ID is always lowercased

 meta/classes/meson.bbclass                    | 15 ++--
 meta/classes/package_rpm.bbclass              |  5 +-
 meta/lib/oe/lsb.py                            |  8 +-
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...ings-in-cross-file-args.-Closes-4671.patch | 87 +++++++++++++++++++
 .../meson/nativesdk-meson_0.49.2.bb           |  5 --
 meta/recipes-extended/timezone/tzdata.bb      |  5 +-
 scripts/lib/devtool/standard.py               | 17 ++--
 8 files changed, 111 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Handle-strings-in-cross-file-args.-Closes-4671.patch

-- 
2.21.0


