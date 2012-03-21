Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SATLA-0002ZW-8j
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:45:08 +0100
Received: by wera1 with SMTP id a1so1340601wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IxRPrlk17z0u3CePH22MXUhbaBenfN+r72AZHvY+a2w=;
	b=FCq55ExDcL3/Pa0P4khpDR40tznZyGcfbwWNi3+GacAa25Te3YJ/yaKGpYxlRhmoJd
	2YAk+R2KT7vqWDJw7LKK6q/8ZrfSoS4yX1AaLTBc5y2aGkVTvnxiV/73CQws2/fa+OfK
	Nx4D+kSadKux7KWw7YIfQ+93yXSCkmiuBM9Fq6xvr32FAB4qXXw0j6hmukERRIwvzr/e
	t3H0MarXdGZltkQ1zLQlLYV5AqvSkNbS8eydPn15VIU/ldWMSlduZe63jYMObRh0Yfn8
	m/Omy4LkWdRtwLWdiIldGSXXlK11OET5hW5ioqTgySzKY2CFaJEc2zYtKXOCd7e92cnr
	Nx9Q==
Received: by 10.180.73.143 with SMTP id l15mr12386250wiv.11.1332365774345;
	Wed, 21 Mar 2012 14:36:14 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex2sm12378606wib.8.2012.03.21.14.36.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Mar 2012 14:36:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 22:36:06 +0100
Message-Id: <cover.1332365336.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH 00/13] Merge native BBCLASSEXTENDs and SDK, PACKAGECONFIG fix
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
X-List-Received-Date: Wed, 21 Mar 2012 21:45:08 -0000

gtk+-native is usefull at least for gtk+3 build, see
http://git.openembedded.org/meta-openembedded/commit/?id=c0f4fff835b59aab108ddba40957d8291fb937b8
for details.

.bbappends with just added BBCLASSEXTEND are IMHO worse 
for maintenance then moving it to oe-core directly.

Tested with gtk+-native build with oe-core only and then
again with all layers (and extra patchset removing native 
BBCLASSEXTENDs from meta-oe).

The following changes since commit b60d0c57a2e16d690fd11c6349917efc57630004:

  gettext/awk/sed/grep: Backport WARNING fixes to GPLv2 versions (2012-03-21 16:30:37 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull

Denis 'GNUtoo' Carikli (2):
  xev: move from meta-demoapps
  classes: scons: add EXTRA_OESCONS

Martin Jansa (11):
  bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME
  base.bbclass: extract *virtclass_map_dependencies logic from
    native/nativesdk bbclasses and call it from packageconfig
  xorg: add more native BBCLASSEXTENDs for gtk+-native
  gtk+: import native support from meta-oe
  librsvg: import native support from meta-oe
  pixman: add native support and perl-native to DEPENDS from meta-oe
  cairo: import native support from meta-oe
  tiff: import native support from meta-oe
  libusb*: import native support from meta-oe
  pango: import native support and --disable-introspection from meta-oe
  rootfs_ipk: replace 3 opkg-cl calls with one in get_package_filename

 .../recipes-graphics/xorg-app/xev_1.0.3.bb         |    7 --
 meta/classes/base.bbclass                          |   77 ++++++++++++++++++--
 meta/classes/native.bbclass                        |   25 +------
 meta/classes/nativesdk.bbclass                     |   27 +-------
 meta/classes/rootfs_ipk.bbclass                    |    7 +-
 meta/classes/scons.bbclass                         |    6 +-
 meta/conf/bitbake.conf                             |    4 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    4 +
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +
 meta/recipes-graphics/cairo/cairo.inc              |    1 +
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    2 +-
 meta/recipes-graphics/pango/pango.inc              |    3 +
 .../recipes-graphics/xorg-app/xev/diet-x11.patch   |    0
 meta/recipes-graphics/xorg-app/xev_1.0.3.bb        |   10 +++
 .../xorg-lib/libxcomposite_0.4.3.bb                |    1 +
 .../recipes-graphics/xorg-lib/libxcursor_1.1.13.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxdamage_1.1.3.bb |    1 +
 meta/recipes-graphics/xorg-lib/libxfixes_5.0.bb    |    2 +-
 meta/recipes-graphics/xorg-lib/libxrandr_1.3.2.bb  |    2 +-
 meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb    |    3 +-
 .../xorg-proto/compositeproto_0.4.2.bb             |    1 +
 .../xorg-proto/damageproto_1.2.1.bb                |    1 +
 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb |    2 +-
 .../xorg-proto/randrproto_1.3.2.bb                 |    2 +-
 meta/recipes-multimedia/libtiff/tiff_4.0.1.bb      |    1 +
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    7 ++-
 meta/recipes-support/libusb/libusb1_1.0.8.bb       |    2 +
 27 files changed, 123 insertions(+), 78 deletions(-)
 delete mode 100644 meta-demoapps/recipes-graphics/xorg-app/xev_1.0.3.bb
 rename {meta-demoapps => meta}/recipes-graphics/xorg-app/xev/diet-x11.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-app/xev_1.0.3.bb

-- 
1.7.8.5



