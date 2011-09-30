Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9fKT-0003th-9F
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 17:48:49 +0200
Received: by fxi1 with SMTP id 1so3201846fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 08:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HRbjSsfjShEsItnSZC/5KX3upg8eJ5aBd5rr/U7ULLk=;
	b=UHzVs5GXJnB/qx1pAd+OiQk9mvN4gqUupxw/WYiKW0ZX83bXpY0oWmHEcaSC20g0Ga
	2zl0zWMKIemLbBkLjHTTyIo/OUDtbHlo+5K12Dq1K5lJ08mj/XwzMWAaTR5dnW3/VOeX
	QvKoWy/K8hQLqulxDcmcCK+Ypfg5pdLBRiViw=
Received: by 10.223.45.85 with SMTP id d21mr2502713faf.63.1317397399833;
	Fri, 30 Sep 2011 08:43:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g19sm7184307fai.8.2011.09.30.08.43.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 08:43:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:43:05 +0200
Message-Id: <cover.1317397204.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [WIP][PATCH 0/9] Glib related upgrades
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
X-List-Received-Date: Fri, 30 Sep 2011 15:48:49 -0000

We were using 2.29.3+git% from meta-oe and after upgrade to 2.30.0 I was hit 
by few G_CONST_RETURN and other issues due to newer glib. Here is what I have
now to build shr images OK again, but probably there is more recipes which need
upgrade/fix to cope with glib-2.30.0.

Someone who cares about gnome should continue from this, but IMHO this is good start :).

The following changes since commit c54c1280fc0d06a53e23339c3913ec88eead13d9:

  base.bbclass: Drop unneeded dependency (2011-09-30 11:34:44 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/glib
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/glib

Martin Jansa (9):
  atk: add patch to replace G_CONST_RETURN with const
  json-glib: upgrade to 0.14.0
  libproxy: upgrade to 0.4.7
  libglade: add gdk-pixbuf dependency
  gstreamer: upgrade to 0.10.35
  zlib: fix inverted LFS logic
  gdk-pixbuf: upgrade to 2.24.6
  glib: upgrade to 2.30.0
  gtk+: upgrade to 2.24.6

 ...003-gatomic-proper-pointer-get-cast.patch.patch |   28 -
 .../0005-glib-mkenums-interpreter.patch.patch      |   25 -
 .../60_wait-longer-for-threads-to-die.patch        |   24 +-
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |    2 -
 .../glib-2.0/remove.test.for.qsort_r.patch         |   53 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb      |   23 -
 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb      |   41 ++
 .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 +
 meta/recipes-core/zlib/zlib_1.2.5.bb               |    5 +-
 .../configure_fix.patch                            |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gdk-pixbuf_2.22.1.bb => gdk-pixbuf_2.24.0.bb} |    7 +-
 ...Duplicate-the-exec-string-returned-by-gtk.patch |    0
 .../cellrenderer-cairo.patch                       |    0
 .../configurefix.patch                             |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/doc-fixes.patch   |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/entry-cairo.patch |    0
 .../hardcoded_libtool.patch                        |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/no-demos.patch    |    0
 .../run-iconcache.patch                            |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/toggle-font.diff  |    0
 .../{gtk+-2.22.1 => gtk+-2.24.6}/xsettings.patch   |    0
 .../gtk+/{gtk+_2.22.1.bb => gtk+_2.24.6.bb}        |    8 +-
 .../{json-glib_0.12.4.bb => json-glib_0.14.0.bb}   |    8 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 .../check_fix.patch                                |    0
 .../gst-inspect-check-error.patch                  |    0
 .../gstregistrybinary.c                            |    0
 .../gstregistrybinary.h                            |    0
 .../{gstreamer_0.10.32.bb => gstreamer_0.10.35.bb} |    6 +-
 .../atk/atk-1.32.0/remove.G_CONST_RETURN.patch     |  628 ++++++++++++++++++++
 meta/recipes-support/atk/atk_1.32.0.bb             |    5 +-
 .../{libproxy_0.4.6.bb => libproxy_0.4.7.bb}       |    6 +-
 33 files changed, 775 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/remove.test.for.qsort_r.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.8.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.30.0.bb
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.22.1 => gdk-pixbuf-2.24.0}/configure_fix.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf-2.22.1 => gdk-pixbuf-2.24.0}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.22.1.bb => gdk-pixbuf_2.24.0.bb} (92%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.22.1 => gtk+-2.24.6}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.22.1.bb => gtk+_2.24.6.bb} (90%)
 rename meta/recipes-gnome/json-glib/{json-glib_0.12.4.bb => json-glib_0.14.0.bb} (74%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/check_fix.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/gst-inspect-check-error.patch (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/gstregistrybinary.c (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer-0.10.32 => gstreamer-0.10.35}/gstregistrybinary.h (100%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer_0.10.32.bb => gstreamer_0.10.35.bb} (90%)
 create mode 100644 meta/recipes-support/atk/atk-1.32.0/remove.G_CONST_RETURN.patch
 rename meta/recipes-support/libproxy/{libproxy_0.4.6.bb => libproxy_0.4.7.bb} (85%)

-- 
1.7.6.1



