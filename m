Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3D08071E68
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:49:52 +0000 (UTC)
Received: by iejt8 with SMTP id t8so31520909iej.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fhYUMxC2ZmIkXQpZIREiPta3pEG91l/WTmVKaxPWsgE=;
	b=KK3bxrgv24phq98TpQSj/jvxIaitCK7F+oaO/ZuU0YpX7OU2gzTstgHegXo+Jkkv49
	aLgR/iWX0QBtmtw6+eIhgf9jGTpG5ejFUmdvhvI+JVx3NfI/vbEHhhu/Y0KYmwzCph4h
	9x6XhdXoL+85GzO/hwAOadtE//EsY/g+GHeRug+ZRISmdOG/NUYMZ0yl8Aw+VYjAztr2
	TspOHBotHgTJzj2n/xJRUAxyeI3ZQzap5d28pSHc7SvfIHS/pLNQIgQVrEcVpUqzUvwo
	1GVW9tYIHrCorLNZZXAvkaTBVawz+TTsqCD6VyPv5qUOt9EqyYgZI8f11RnYA3BXX/Tc
	6F1w==
X-Received: by 10.42.249.77 with SMTP id mj13mr8086960icb.80.1429688993869;
	Wed, 22 Apr 2015 00:49:53 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id ys3sm2901031igb.4.2015.04.22.00.49.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:49:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:47 +0000
Message-Id: <cover.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] World build fixes with gcc-5
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
X-List-Received-Date: Wed, 22 Apr 2015 07:49:55 -0000

This patchset contains fixes needed for building world using
gcc-5, gcc-5 recipes are still in contrib tree. First lets fix
the recipes

connman fix and packagegroup fix is needed for making sure that
these packagegroups are marked glibc specific or independent using
overrides, helps in paving way for doing world builds for non
glibc based systems


The following changes since commit 166f2587468ae71988c610858aad3f7ef67eccba:

  bison: don't depend on help2man (2015-04-21 11:29:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/for-master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/for-master

Khem Raj (10):
  connman: Fix builds to compile on musl
  glibc, packagegroup-self-hosted, packagegroup-core-lsb: Consider
    non-glibc libcs
  insserv: Fix build with gcc5 and clang
  xserver-xorg: Fix build with gcc-5
  u-boot-mkimage: Backport fix from upstream to fix build with gcc-5
  mdadm: Fix inline semantics
  lttng-tools: Add extern qualifier to declarations in .h file
  subversion: Add -P to CPPFLAGS
  gnome-icon-theme: Needs nls.m4
  gtk+: Correct function prototype

 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch  |  91 +++++
 meta/recipes-bsp/u-boot/u-boot-mkimage_2015.01.bb  |   4 +-
 ...cktrace-API-only-when-compiling-for-glibc.patch |  41 ++
 .../connman/connman/0002-musl-header-fixes.patch   | 235 +++++++++++
 ...resolve-musl-does-not-implement-res_ninit.patch |  77 ++++
 ...Fix-duplicate-definitions-issue-with-musl.patch |  43 ++
 meta/recipes-connectivity/connman/connman_1.28.bb  |   4 +
 meta/recipes-core/glibc/glibc_2.21.bb              |   8 +-
 .../packagegroups/packagegroup-self-hosted.bb      |   7 +-
 .../161_bts777914_fix_undeclared_identifier.patch  |  36 ++
 meta/recipes-devtools/insserv/insserv_1.14.0.bb    |   1 +
 .../subversion/subversion_1.8.11.bb                |   3 +-
 meta/recipes-extended/mdadm/files/inline.patch     |  39 ++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |   1 +
 .../packagegroups/packagegroup-core-lsb.bb         |   9 +
 .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |   2 +-
 .../gtk+/gtk+/strict-prototypes.patch              |  24 ++
 meta/recipes-gnome/gtk+/gtk+_2.24.27.bb            |   1 +
 ...sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch |  50 +++
 .../xorg-xserver/xserver-xorg_1.16.3.bb            |   1 +
 .../lttng/lttng-tools/extern-decls.patch           | 442 +++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |   1 +
 22 files changed, 1109 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-mkimage/gcc5.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-implement-res_ninit.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch
 create mode 100644 meta/recipes-devtools/insserv/files/161_bts777914_fix_undeclared_identifier.patch
 create mode 100644 meta/recipes-extended/mdadm/files/inline.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch

-- 
2.1.4


