Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id A00D2608F7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:07 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id p58so268668wes.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=RTqUjV38SmuTMPQTM3nboegslGd1sdUZHK1Y5EHzeg0=;
	b=pspFTP7xS51rhrhhWtKGma2cPDkL4DPjLRXudHtiRp7Gbdila9mjfaGwHCSag+cRS3
	wO4ESe7sHs4nPMunyzGkq56V9S1FKbOXtqTsiiX/MrQy2lhotxJd+7OujFY//jZiAfja
	nhwUQur95IgY4/dRE72Xzbsl0k2ifjd2auGhOBsSibg5EerIKWZRRC2fb1/EZrHIiajZ
	LryJL8PVZfTAFy8nO9PSK4lPzY48EIfA6EmmTTGiLeKMx2HlKvAJt2Oaa3uqkAXQsR1z
	/GnybTamOPfynGRCmSLefGOIl+QKIjRDz2AoYEPax6J9qntY+ymKY/F8vh1oO/TxEMTB
	n6dA==
X-Received: by 10.180.109.48 with SMTP id hp16mr4815258wib.24.1369922167553;
	Thu, 30 May 2013 06:56:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:34 +0100
Message-Id: <cover.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQniZY6q8Zy8DxmRKnGou//P5ZJtbvurCKwjeJd18gWbIzFcI/Lthg/UUw5iY6glcsPRjm8l
Subject: [PATCH 00/14] GTK+ 3.8 and Wayland integration
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
X-List-Received-Date: Thu, 30 May 2013 13:56:08 -0000

Hi,

This series contains plenty of goodness.  It upgrades gdk-pixbuf to the latest
stable, adds ATK 2.8 and at-spi2 for GTK+ 3.8, and then GTK+ 3.8.  GTK+ 3.8 has
good support for Wayland so this is enabled and numerous bugs fixed in the process.

Finally, the recipe is split into a .inc/.bb as I've another branch that adds a
git recipe for testing (which so far has found a bug in glib master).

Ross

The following changes since commit d0861b7a12113c6626c6206faf3a9389fb8ef5cb:

  bitbake: bitbake: xmlrpc remote server (2013-05-30 10:44:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/gtk

for you to fetch changes up to 7f6817c212b8cb777b9117990c238f2a75ae8750:

  gtk+3: clean up libtool link creation to avoid errors in configure log (2013-05-30 14:49:02 +0100)

----------------------------------------------------------------
Ross Burton (14):
      test-utils: handle import bb failing and skip the test
      test_utils: import functions directly for conciseness
      utils: add trim_version() function
      gdk-pixbuf: upgrade to 2.28.1
      atk: upgrade to 2.8
      at-spi2: add -core and -atk, for GTK+ 3.8
      gtk+3: update to 3.8.2
      gtk+3: explicitly disable introspection
      gtk+3: respect x11 and wayland DISTRO_FEATURES
      gtk+3: add dependencies for gtk+3-demo
      gtk+: remove spurious libgcrypt dependency
      gtk+3: register GSetting schemas
      gtk+3: split into .bb/.inc
      gtk+3: clean up libtool link creation to avoid errors in configure log

 meta/lib/oe/tests/test_utils.py                    |   34 ++-
 meta/lib/oe/utils.py                               |   15 +
 .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --
 .../configure_fix.patch                            |    0
 .../extending-libinstall-dependencies.patch        |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |   11 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
 .../gtk+/{gtk+3_3.4.4.bb => gtk+3.inc}             |   33 ++-
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  293 --------------------
 .../gtk+/gtk+3/no-x11-in-wayland.patch             |   32 +++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |   16 ++
 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb      |   19 ++
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |   17 ++
 .../atk/{atk_2.6.0.bb => atk_2.8.0.bb}             |    9 +-
 15 files changed, 155 insertions(+), 349 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3.inc} (79%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
 rename meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.8.0.bb} (70%)

Ross Burton (14):
  test-utils: handle import bb failing and skip the test
  test_utils: import functions directly for conciseness
  utils: add trim_version() function
  gdk-pixbuf: upgrade to 2.28.1
  atk: upgrade to 2.8
  at-spi2: add -core and -atk, for GTK+ 3.8
  gtk+3: update to 3.8.2
  gtk+3: explicitly disable introspection
  gtk+3: respect x11 and wayland DISTRO_FEATURES
  gtk+3: add dependencies for gtk+3-demo
  gtk+: remove spurious libgcrypt dependency
  gtk+3: register GSetting schemas
  gtk+3: split into .bb/.inc
  gtk+3: clean up libtool link creation to avoid errors in configure
    log

 meta/lib/oe/tests/test_utils.py                    |   34 ++-
 meta/lib/oe/utils.py                               |   15 +
 .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --
 .../configure_fix.patch                            |    0
 .../extending-libinstall-dependencies.patch        |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |   11 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
 .../gtk+/{gtk+3_3.4.4.bb => gtk+3.inc}             |   33 ++-
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  293 --------------------
 .../gtk+/gtk+3/no-x11-in-wayland.patch             |   32 +++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |   16 ++
 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb      |   19 ++
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |   17 ++
 .../atk/{atk_2.6.0.bb => atk_2.8.0.bb}             |    9 +-
 15 files changed, 155 insertions(+), 349 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3.inc} (79%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb
 rename meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.8.0.bb} (70%)

-- 
1.7.10.4


