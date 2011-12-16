Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RbgSG-0002U2-5s
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 23:40:40 +0100
Received: by iakh37 with SMTP id h37so1565894iak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Ota9nmfE0WkDwPax60CVNtq4D3cUXQktFqiGeQqArU0=;
	b=DIeApPJ6RJmrtxUmPZJpkaCHOQfMEMrnrNUE7/2blneJTguqTc1v3g7iXpkiwymhAn
	B6uD4IrcCP8UnxNTd6JQOAKcW9FU/6LNywRZoJB0uMKsSXqaLO92xvkPwvpYXAPT0+V4
	SYni9H462TQ+WSW3Xd/vh/nShNkzjbd4H5Iws=
Received: by 10.50.183.233 with SMTP id ep9mr11135935igc.67.1324074819781;
	Fri, 16 Dec 2011 14:33:39 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id x18sm37130242ibi.2.2011.12.16.14.33.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 14:33:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 14:33:27 -0800
Message-Id: <cover.1324074518.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 0/4] Add gcc cross test driver and improve eglibc testing
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
X-List-Received-Date: Fri, 16 Dec 2011 22:40:40 -0000

Add cross testing driver for gcc-cross
Replaces the patch to relocate gxx headers with upstream submitted one
Drop shorten-build-commands eglibc patch since it hinders testing
Add a patch to eglibc so it can accomodate gxx headers the way OE installs them
Improve the eglibc testing since we needed to override more
variables to point to final sysroot


The following changes since commit 3e05acab1c119a3b2a4703ea8729cc768935d36e:

  license.bbclass: remove bashism (2011-12-16 16:50:39 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/gcc-cross-testing
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/gcc-cross-testing

Khem Raj (4):
  eglibc-testing: Clean the test before running them
  gcc-cross: Add cross testing driver for running regression testsuites
  gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
  eglibc: Fixes for running regression tests

 .../eglibc-2.13/shorten-build-commands.patch       |   82 ---------
 .../eglibc-2.13/use-sysroot-cxx-headers.patch      |   36 ++++
 .../eglibc-2.14/shorten-build-commands.patch       |   82 ---------
 .../eglibc-2.14/use-sysroot-cxx-headers.patch      |   36 ++++
 meta/recipes-core/eglibc/eglibc-testing.inc        |   34 ++++-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    4 +-
 meta/recipes-core/eglibc/eglibc_2.14.bb            |    4 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    4 +-
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |  189 ++++++++++++++++++--
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc            |   91 +++++++++-
 12 files changed, 373 insertions(+), 193 deletions(-)
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/use-sysroot-cxx-headers.patch
 delete mode 100644 meta/recipes-core/eglibc/eglibc-2.14/shorten-build-commands.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-headers.patch

-- 
1.7.5.4



