Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 83838608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:04 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id u59so1359464wes.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=5DZvabM1yYfX2IuoMu1AM2l5dKtKr0sji8aXDif/xhQ=;
	b=SHrCptRIbSgqz3OZyxbBCNfA/9Fldz3lvJUytrlUXegv2CRYRIYReIqcwnEurHX/F2
	A+E87KfGw/iIdkZtje5rC6HcRQ76E7Czcxh0sSdZGCg4/ZZSjvGRM5pUV8eq8rW5r1cH
	rFcgJ77Yu24esQegK4z4yEZYK0xaROUYv9z6R7Ht1S9r4mLhn9Si1NACiHwnSRvzCORl
	YS+qoapKrepg5ypjVf9XUy345yBZGjHGwD8e6NQP8gdz0qV2qUXTiQI5NccIeCZtTZhd
	Hf0DDZSFqwzKfq0EMzIjAKSKwuCxnaQVcqVNttoU/wI0kmVfz7lGwVZdecIbiuxFHwR4
	dZSA==
X-Received: by 10.180.205.206 with SMTP id li14mr3797504wic.33.1370012944317; 
	Fri, 31 May 2013 08:09:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:36 +0100
Message-Id: <cover.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkvGZCFnWzqPHmD4gnv24wXaYL/L4BQPMoFPdO6INxXSqrrprqG99V0SBjzU8j111923bfh
Subject: [PATCH 00/11] GTK+ 3 updates
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
X-List-Received-Date: Fri, 31 May 2013 15:09:05 -0000

Hi,

Another revision of my GTK+ 3 branch, minus the test changes that need Python
2.7 and with some more fixes, mainly backports to ensure the Wayland backend
works under Weston 1.1.

Ross

The following changes since commit ea281d3b8e5f2ae21b37ea2ad4d440bf9c6427ff:

  bitbake: Added distroy signal to information dialogs (2013-05-31 08:25:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/gtk

for you to fetch changes up to 125c91479244db72a603b9857949645bdaf5c5e0:

  gtk+3: fix repainting under Weston 1.1 (2013-05-31 16:04:27 +0100)

----------------------------------------------------------------
Ross Burton (11):
      gdk-pixbuf: upgrade to 2.28.1
      at-spi2: add -core and -atk, for GTK+ 3.8
      gtk+3: update to 3.8.2
      gtk+3: explicitly disable introspection
      gtk+3: respect x11 and wayland DISTRO_FEATURES
      gtk+3: add dependencies for gtk+3-demo
      gtk+: remove spurious libgcrypt dependency
      gtk+3: register GSetting schemas
      gtk+3: split into .bb/.inc
      gtk+3: clean up libtool link creation to avoid errors in configure log
      gtk+3: fix repainting under Weston 1.1

 .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --
 .../configure_fix.patch                            |    0
 .../extending-libinstall-dependencies.patch        |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |   11 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
 .../gtk+/{gtk+3_3.4.4.bb => gtk+3.inc}             |   33 ++-
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  293 --------------------
 .../gtk+/gtk+3/no-x11-in-wayland.patch             |   32 +++
 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch |   42 +++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |   17 ++
 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb      |   19 ++
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |   17 ++
 13 files changed, 149 insertions(+), 340 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3.inc} (79%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb

Ross Burton (11):
  gdk-pixbuf: upgrade to 2.28.1
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
  gtk+3: fix repainting under Weston 1.1

 .../gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch  |   23 --
 .../configure_fix.patch                            |    0
 .../extending-libinstall-dependencies.patch        |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} |   11 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
 .../gtk+/{gtk+3_3.4.4.bb => gtk+3.inc}             |   33 ++-
 meta/recipes-gnome/gtk+/gtk+3/cross.patch          |  293 --------------------
 .../gtk+/gtk+3/no-x11-in-wayland.patch             |   32 +++
 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch |   42 +++
 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb             |   17 ++
 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb      |   19 ++
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb     |   17 ++
 13 files changed, 149 insertions(+), 340 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/extending-libinstall-dependencies.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.26.5 => gdk-pixbuf}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.26.5.bb => gdk-pixbuf_2.28.1.bb} (89%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.4.4.bb => gtk+3.inc} (79%)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/cross.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/no-x11-in-wayland.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/wayland-attach.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3_3.8.2.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb

-- 
1.7.10.4


