Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVA-0000nx-FY
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:22:57 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:32 -0700
Received: by wgbdr13 with SMTP id dr13so1873962wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yB4zzadFsBfEDTuwXb1mc71TPE9PKg02/B2x96HxHRc=;
	b=DwdtW36FUBnShhsdDZcQ/rGxsTCC0D9v0wf4LTApxBOZRLYaxWBjahmpIneDwmXP0P
	+Ly1hh1fyYeKbyAw3+rrqkt+bi5MjlA9pz6mGRs93E7ociF3zwFD5uKJxMAvZF+Z3dWM
	w1GWtkUh8NJE8Thz/zLJF+gI4EXHRgxaYqhYLMx89iWpl1bYA+FUQeGMzz7+hA7Ae9Ox
	Y6bP8xJaUMPn7NMjBrp5hIFi1bPq8sELjh8y/HOmb74Pq463N+4emISOlYDXgDHCGYxh
	P/k7Eb2hz/gd+UhSLquI7TeqDpek5NMbKlqDoCsCYtiRoeCCJ4llyEEKRZkk6pudMAZI
	pHXA==
Received: by 10.216.211.131 with SMTP id w3mr1511849weo.163.1342714290762;
	Thu, 19 Jul 2012 09:11:30 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:47 +0100
Message-Id: <cover.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQk2xFe0ZTpLgq22xY0VnCzpM3j7FVzdT6pKkFBol/tZfTvlxocLFwlDX/iESvXRIMNZNLC8
Subject: [PATCH 00/26] Use gtk-doc-stub
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
X-List-Received-Date: Thu, 19 Jul 2012 16:22:57 -0000

That nice Colin Walters had the same problem in ostree that we have in Poky
- gtk-doc and modules that autoregen.  He solved it in a cleaner manner and
created gtk-doc-stub, which has the external interface of gtk-doc but
(obviously) does nothing.

This patch series:
- packages gtk-doc-stub
- changes the gtk-doc class to depend on gtk-doc-stub-native and pass
  --disable-gtk-doc to the configure script
- updates every recipe in oe-core that mentions gtk-doc

One question: is the dependency addition in gtk-doc.bbclass correct? 
Different recipies have different way of adding dependencies, and I'm not
sure if the native line is required.

For packages in other layers, you can:
- inherit gtk-doc
- remove gtk-doc from your DEPENDS
- remove --disable-gtk-doc from your OECONF
- stop creating gtk-doc.make in do_configure_prepend

I've compared buildhistory before and after this series, the only change was
that glib-2.0-doc packaged the existing documentation in the tarball.  I'm
not sure why it didn't do this before, but that's a bug fixed for free.

Ross

The following changes since commit 2665be9dd5730c3f1135b92d7d91de479c397a29:

  buildhistory.bbclass: Fix python whitespace (2012-07-19 12:33:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/gtkdoc

for you to fetch changes up to 7c586b3b9b06e0f9f50f085419083c63830b7900:

  Remove gtk-doc (2012-07-19 17:05:54 +0100)

----------------------------------------------------------------
Ross Burton (26):
      Add gtk-doc-stub
      change gtk-doc.bbclass to pull in depends and oeconf
      glib-2.0: cleanup thanks to new gtk-doc.bbclass
      gconf: cleanup thanks to new gtk-doc.bbclass
      gobject-introspection: cleanup thanks to new gtk-doc.bbclass
      cogl: cleanup thanks to new gtk-doc.bbclass
      gypsy: inherit gtk-doc
      gconf: cleanup thanks to new gtk-doc.bbclass
      connman: cleanup thanks to new gtk-doc.bbclass
      polkit: cleanup thanks to new gtk-doc.bbclass
      polkit-gnome: cleanup thanks to new gtk-doc.bbclass
      gail: cleanup thanks to new gtk-doc.bbclass
      gnome-keyring: cleanup thanks to new gtk-doc.bbclass
      libart_lgpl: cleanup thanks to new gtk-doc.bbclass
      libgnome-keyring: cleanup thanks to new gtk-doc.bbclass
      gtk+: cleanup thanks to new gtk-doc.bbclass
      libglade: cleanup thanks to new gtk-doc.bbclass
      librsvg: cleanup thanks to new gtk-doc.bbclass
      clutter: cleanup thanks to new gtk-doc.bbclass
      pango: cleanup thanks to new gtk-doc.bbclass
      kmod: inherit gtk-doc, gnome-doc-utils-native isn't the package you were looking for
      evolution-data-server: cleanup thanks to new gtk-doc.bbclass
      webkit-gtk: cleanup thanks to new gtk-doc.bbclass
      atk: cleanup thanks to new gtk-doc.bbclass
      vte: cleanup thanks to new gtk-doc.bbclass
      Remove gtk-doc

 meta/classes/gtk-doc.bbclass                       |   20 +++++--
 meta/recipes-connectivity/connman/connman.inc      |    5 +-
 meta/recipes-connectivity/gypsy/gypsy.inc          |    6 +-
 meta/recipes-connectivity/gypsy/gypsy_0.8.bb       |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |    2 +
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |    5 +-
 meta/recipes-core/glib-2.0/glib.inc                |    6 +-
 meta/recipes-extended/polkit/polkit-gnome_0.102.bb |    5 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |    6 +-
 meta/recipes-gnome/gnome/gail_1.20.2.bb            |    6 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   10 +---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    6 +-
 .../gnome/gobject-introspection_1.32.1.bb          |   11 ++--
 .../gnome/gobject-introspection_git.bb             |   11 +---
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |    7 +--
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    6 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    4 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
 .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |   19 ++++++
 meta/recipes-gnome/gtk-doc/gtk-doc.bb              |   19 ------
 meta/recipes-gnome/gtk-doc/gtk-doc.m4              |   61 --------------------
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    6 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    5 +-
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    2 +
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    2 +-
 meta/recipes-graphics/clutter/clutter.inc          |    4 +-
 meta/recipes-graphics/clutter/cogl.inc             |    4 +-
 meta/recipes-graphics/clutter/cogl_1.8.2.bb        |    2 +-
 meta/recipes-graphics/clutter/cogl_git.bb          |    2 +-
 meta/recipes-graphics/pango/pango.inc              |    4 +-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-kernel/kmod/kmod.inc                  |    6 +-
 meta/recipes-sato/eds/evolution-data-server_git.bb |   10 +---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb       |    5 +-
 meta/recipes-support/atk/atk_2.2.0.bb              |    6 +-
 meta/recipes-support/vte/vte.inc                   |    4 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 39 files changed, 106 insertions(+), 183 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
 delete mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc.bb
 delete mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc.m4

Ross Burton (26):
  Add gtk-doc-stub
  change gtk-doc.bbclass to pull in depends and oeconf
  glib-2.0: cleanup thanks to new gtk-doc.bbclass
  gconf: cleanup thanks to new gtk-doc.bbclass
  gobject-introspection: cleanup thanks to new gtk-doc.bbclass
  cogl: cleanup thanks to new gtk-doc.bbclass
  gypsy: inherit gtk-doc
  gconf: cleanup thanks to new gtk-doc.bbclass
  connman: cleanup thanks to new gtk-doc.bbclass
  polkit: cleanup thanks to new gtk-doc.bbclass
  polkit-gnome: cleanup thanks to new gtk-doc.bbclass
  gail: cleanup thanks to new gtk-doc.bbclass
  gnome-keyring: cleanup thanks to new gtk-doc.bbclass
  libart_lgpl: cleanup thanks to new gtk-doc.bbclass
  libgnome-keyring: cleanup thanks to new gtk-doc.bbclass
  gtk+: cleanup thanks to new gtk-doc.bbclass
  libglade: cleanup thanks to new gtk-doc.bbclass
  librsvg: cleanup thanks to new gtk-doc.bbclass
  clutter: cleanup thanks to new gtk-doc.bbclass
  pango: cleanup thanks to new gtk-doc.bbclass
  kmod: inherit gtk-doc, gnome-doc-utils-native isn't the package you
    were looking for
  evolution-data-server: cleanup thanks to new gtk-doc.bbclass
  webkit-gtk: cleanup thanks to new gtk-doc.bbclass
  atk: cleanup thanks to new gtk-doc.bbclass
  vte: cleanup thanks to new gtk-doc.bbclass
  Remove gtk-doc

 meta/classes/gtk-doc.bbclass                       |   20 +++++--
 meta/recipes-connectivity/connman/connman.inc      |    5 +-
 meta/recipes-connectivity/gypsy/gypsy.inc          |    6 +-
 meta/recipes-connectivity/gypsy/gypsy_0.8.bb       |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |    2 +
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |    5 +-
 meta/recipes-core/glib-2.0/glib.inc                |    6 +-
 meta/recipes-extended/polkit/polkit-gnome_0.102.bb |    5 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |    6 +-
 meta/recipes-gnome/gnome/gail_1.20.2.bb            |    6 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   10 +---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    6 +-
 .../gnome/gobject-introspection_1.32.1.bb          |   11 ++--
 .../gnome/gobject-introspection_git.bb             |   11 +---
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |    7 +--
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    6 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    4 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
 .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |   19 ++++++
 meta/recipes-gnome/gtk-doc/gtk-doc.bb              |   19 ------
 meta/recipes-gnome/gtk-doc/gtk-doc.m4              |   61 --------------------
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    6 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    5 +-
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    2 +
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    2 +-
 meta/recipes-graphics/clutter/clutter.inc          |    4 +-
 meta/recipes-graphics/clutter/cogl.inc             |    4 +-
 meta/recipes-graphics/clutter/cogl_1.8.2.bb        |    2 +-
 meta/recipes-graphics/clutter/cogl_git.bb          |    2 +-
 meta/recipes-graphics/pango/pango.inc              |    4 +-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-kernel/kmod/kmod.inc                  |    6 +-
 meta/recipes-sato/eds/evolution-data-server_git.bb |   10 +---
 meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb       |    5 +-
 meta/recipes-support/atk/atk_2.2.0.bb              |    6 +-
 meta/recipes-support/vte/vte.inc                   |    4 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 39 files changed, 106 insertions(+), 183 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb
 delete mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc.bb
 delete mode 100644 meta/recipes-gnome/gtk-doc/gtk-doc.m4

-- 
1.7.10



