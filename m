Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXnZU-0003kk-CC
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Dec 2011 06:28:04 +0100
Received: by yenq1 with SMTP id q1so1491528yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2011 21:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=SvFHK73mEj4PYdYYDfeInWmITUZpqWQVlhwOrwiM0Rw=;
	b=lxqCszjvPB/GVTEqxl4RJb3cIjt2JckXJkXWS+tLjLQhkd3aJeinmHii59gOg7/f6w
	NcGuDeuQxsJ3MG8V14INosIZqzgxB8UGlYQnBiYxHetTmz01rHD45TQTmtI1s3VViJTh
	g/WinWQBeckhm+j8SyF1VuKEFpCpqH73hSV4M=
Received: by 10.236.174.2 with SMTP id w2mr16724363yhl.35.1323148876252;
	Mon, 05 Dec 2011 21:21:16 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id o50sm35411236yhl.9.2011.12.05.21.21.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 21:21:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Dec 2011 21:21:07 -0800
Message-Id: <cover.1323148566.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/6] Enable cloog/ppl when compiling gcc
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
X-List-Received-Date: Tue, 06 Dec 2011 05:28:04 -0000

This patchset contains

Changes to gcc where now it will be compiled with cloog/ppl support
and we have corresponding libraries build as -native and -nativesdk
recipes

Fixes the beagleboard ICE seen with mesa-xlib sometime ago
and removes the workaround for the same

Updates eglibc 2.14 to tip of SVN branch

Fixes gnutls build failure observed on uclibc

The following changes since commit 0a7a8597be05c8def8af58eecab49d963dc9d757:

  libsdl: Disable pulseaudio explicitly (2011-12-05 23:03:23 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-graphite
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-graphite

Khem Raj (6):
  tcmode-default: Remove pinning u-boot-mkimage-native to non-existing
    version
  cloog-ppl,ppl: Add new recipes
  gcc-4.6: Enable PPL and ClooG support
  gnutls: Fix fix-gettext-version.patch
  eglibc: Update 2.14 recipes to latest SVN tip
  gcc: Backport patch from trunk to fix ICE seen on armv7 with
    mesa-xlib

 meta/conf/distro/include/tcmode-default.inc        |    7 -
 .../eglibc-2.14/glibc-2.14-libdl-crash.patch       |   66 +-
 meta/recipes-core/eglibc/eglibc_2.14.bb            |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |   14 +-
 .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |   34 +
 .../recipes-devtools/gcc/gcc-cross-canadian_4.6.bb |    4 +-
 meta/recipes-support/cloog-ppl/cloog-ppl.inc       |    6 +
 .../recipes-support/cloog-ppl/cloog-ppl_0.15.11.bb |   13 +
 .../gnutls-2.12.14/fix-gettext-version.patch       |   17 +-
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |    2 +-
 .../ppl/ppl-0.11.2/ppl_autoreconf.patch            |17034 ++++++++++++++++++++
 meta/recipes-support/ppl/ppl.inc                   |    6 +
 meta/recipes-support/ppl/ppl_0.11.2.bb             |   16 +
 meta/recipes-support/ppl/ppl_git.bb                |   17 +
 14 files changed, 17188 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-arm-set-cost.patch
 create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl.inc
 create mode 100644 meta/recipes-support/cloog-ppl/cloog-ppl_0.15.11.bb
 create mode 100644 meta/recipes-support/ppl/ppl-0.11.2/ppl_autoreconf.patch
 create mode 100644 meta/recipes-support/ppl/ppl.inc
 create mode 100644 meta/recipes-support/ppl/ppl_0.11.2.bb
 create mode 100644 meta/recipes-support/ppl/ppl_git.bb

-- 
1.7.5.4



