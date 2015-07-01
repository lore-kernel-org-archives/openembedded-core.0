Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3B79565C89
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 18:24:49 +0000 (UTC)
Received: by ieqy10 with SMTP id y10so40785692ieq.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=laIB+e5EZBvHU2DoUmzwWr/3fSfN8+iXU+2RTtEN6GE=;
	b=H+I/ucc791Ff7JisrM7ce0AhsNlxDk7U8gMejoVRDb/TX92jadyPvS7O1pInLbEGPB
	egIthEPjDW0Okqkfj4ajUR9Po4U9AsQEZ5NDPoFGL9KjYpdM2GgM1hQcB4qXfC8lyyn/
	fowYFaVsWLxhuYPz9QzULru8LsXjByg0UGnMKai8XYbdgyuqcfU9HHr5XY++QLgpDCFW
	b2dGbxE13pm1r1CxPYZGnjzE49VQi0bNFzpqO44XoAdZHoskizHMPB2518B/JOMv21KV
	aVZUgyAU7i+BHy48jtsBrUhpK1Tkuj+0ngLBP/14R76QJ0Gs1HQ/oSvy2UxoWmqnFzw+
	6iIQ==
X-Received: by 10.42.176.8 with SMTP id bc8mr5928235icb.22.1435775089616;
	Wed, 01 Jul 2015 11:24:49 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id d96sm1920125ioj.37.2015.07.01.11.24.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 11:24:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 11:24:41 -0700
Message-Id: <cover.1435774899.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 0/6] wayland/weston 1.8 upgrade
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
X-List-Received-Date: Wed, 01 Jul 2015 18:24:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Addresses comments on wayland upgrade to use tarballs
runqemu patch is needed for wayland/weston to work
libpicaccess and gdb patches make musl support better

Khem Raj (6):
  libinput: Upgrade 0.7.0 -> 0.18.0
  wayland: Upgrade 1.6.0 -> 1.8.1
  weston: Upgrade weston_1.6.0.bb -> weston_1.8.0.bb
  runqemu-internal: Replace wacom-tablet with tablet for usbdevice
  libpciaccess: Upgrade to 0.13.4
  gdb: Disable lttng support for musl

 meta/recipes-devtools/gdb/gdb-common.inc           |   1 +
 .../{libinput_0.7.0.bb => libinput_0.18.0.bb}      |   9 +-
 .../wayland/{wayland_1.6.0.bb => wayland_1.8.1.bb} |   5 +-
 .../wayland/weston/0001-make-error-portable.patch  |  80 +++++++++
 .../weston/disable-wayland-scanner-pkg-check.patch |  20 ++-
 .../wayland/{weston_1.6.0.bb => weston_1.8.0.bb}   |  22 ++-
 ...clude-config.h-before-anything-else-in-.c.patch | 187 +++++++++++++++++++++
 .../libpciaccess/0002-Fix-quoting-issue.patch      |  34 ++++
 ...nux_sysfs.c-Include-limits.h-for-PATH_MAX.patch |  32 ++++
 .../0004-Don-t-include-sys-io.h-on-arm.patch       |  28 +++
 .../xorg-lib/libpciaccess/limits.patch             |  17 --
 ...bpciaccess_0.13.3.bb => libpciaccess_0.13.4.bb} |  13 +-
 scripts/runqemu-internal                           |   4 +-
 13 files changed, 407 insertions(+), 45 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_0.7.0.bb => libinput_0.18.0.bb} (50%)
 rename meta/recipes-graphics/wayland/{wayland_1.6.0.bb => wayland_1.8.1.bb} (92%)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-make-error-portable.patch
 rename meta/recipes-graphics/wayland/{weston_1.6.0.bb => weston_1.8.0.bb} (84%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0001-Include-config.h-before-anything-else-in-.c.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0002-Fix-quoting-issue.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0003-linux_sysfs.c-Include-limits.h-for-PATH_MAX.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0004-Don-t-include-sys-io.h-on-arm.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/limits.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.3.bb => libpciaccess_0.13.4.bb} (44%)

-- 
2.1.4


