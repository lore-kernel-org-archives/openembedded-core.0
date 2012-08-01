Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYGy-0004Za-Ci
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:33 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:31:52 -0700
Received: by wgbdr13 with SMTP id dr13so4631233wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=WGfquBuwxnmT3ewFeWVht/vLMwYtspsIJ/ZpvpHnllY=;
	b=W1GuJMLWj4S9JVeuBdDnOm8bbBJdmXXj7ou+cAlUJzk0lpC4ZLxHyeCujaiST0gRwL
	MqIUEsaZtTTK1AQmASS2HAQnXtwfBujqv373FUCF+DSj3bvSfPEUG5zIN/p8jb947D+l
	9opchCtJKxj1IE7G+SKx4neyAZw9MqZboQUF5vz+SdmTV4ABkjLux6Av3zZG/eoqOe1z
	DcKnEt4lUNab5raA8qwwHPA9VM4GJBH1cREGRVO4WM6iT/FrKIw633kQ0PAwTDrpScAF
	jeoWJfI5qSqwCH/BayXHMlob5yANR8CiUTE1HzA+eBXT/FOvcxlJbrdkLyCDJEasD8O8
	9Lwg==
Received: by 10.216.68.2 with SMTP id k2mr8374502wed.69.1343824310235;
	Wed, 01 Aug 2012 05:31:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.31.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:31:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:06 +0100
Message-Id: <cover.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm4EXd0yXmsBadkncIXQgQP8/eevXlIMCPVO+BvOsq2clgUjtRTVB8jxcVl2jkbY5h38K/9
Subject: [PATCH 00/12] Mesa upgrade/improvements
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:33 -0000

This patch series upgrades mesa-dri to the latest upstream, enables GLES2 and
EGL, and lets mesa-dri build without X11.  mesa-xlib doesn't get all the new
packages as it's not that useful (no HW acceleration).

Tested on a Sandy Bridge, running glxgears/gles2gears.

The following changes since commit 3309cf42d314f0a26079a11836c6b9b9bb5f253e:

  package_rpm.bbclass: Accomodate dash when using arrays (2012-07-31 12:22:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to 9a9c6f98362245a91a2e58daef6c4ff1bb415881:

  mesa-demos: fix GLES2 build (2012-08-01 13:17:10 +0100)

----------------------------------------------------------------
Damien Lespiau (2):
      mesa: Update to 8.0.4 (latest stable version)
      mesa: Use 'require' instead of 'include'

Ross Burton (10):
      mesa: format the packages list nicely
      mesa: move glu.pc to libglu-dev
      mesa: add --enable-shared-glapi, and package it in libglapi
      mesa: enable the Graphic Buffer Manager library
      mesa: enable GLESv2
      mesa: enable EGL, with DRM and X11 platforms
      mesa: respect x11 DISTRO_FEATURE
      poky: add EGL and OpenGLESv2 features
      mesa: no need to depend on python-native, the class does that
      mesa-demos: fix GLES2 build

 meta-yocto/conf/distro/poky.conf                   |    2 +-
 ...a-dri_7.11.bbappend => mesa-dri_8.0.4.bbappend} |    0
 .../mesa/{mesa-7.11.inc => mesa-8.0.4.inc}         |   14 +++---
 meta/recipes-graphics/mesa/mesa-common.inc         |   37 ++++++++++----
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
 ...ative_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} |    4 +-
 meta/recipes-graphics/mesa/mesa-dri.inc            |   11 ++++-
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
 meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
 meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
 .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++++++++
 ...ossfix-mklib.patch => 0002-cross-compile.patch} |   39 ++++++++++++---
 ...sa_fix_for_x32.patch => 0003-fix-for-x32.patch} |   30 +++++++----
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
 meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
 meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 ----------------
 20 files changed, 204 insertions(+), 120 deletions(-)
 rename meta-yocto/recipes-graphics/mesa/{mesa-dri_7.11.bbappend => mesa-dri_8.0.4.bbappend} (100%)
 rename meta/recipes-graphics/mesa/{mesa-7.11.inc => mesa-8.0.4.inc} (60%)
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} (84%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch => 0002-cross-compile.patch} (68%)
 rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch => 0003-fix-for-x32.patch} (59%)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch

Damien Lespiau (2):
  mesa: Update to 8.0.4 (latest stable version)
  mesa: Use 'require' instead of 'include'

Ross Burton (10):
  mesa: format the packages list nicely
  mesa: move glu.pc to libglu-dev
  mesa: add --enable-shared-glapi, and package it in libglapi
  mesa: enable the Graphic Buffer Manager library
  mesa: enable GLESv2
  mesa: enable EGL, with DRM and X11 platforms
  mesa: respect x11 DISTRO_FEATURE
  poky: add EGL and OpenGLESv2 features
  mesa: no need to depend on python-native, the class does that
  mesa-demos: fix GLES2 build

 meta-yocto/conf/distro/poky.conf                   |    2 +-
 ...a-dri_7.11.bbappend => mesa-dri_8.0.4.bbappend} |    0
 .../mesa/{mesa-7.11.inc => mesa-8.0.4.inc}         |   14 +++---
 meta/recipes-graphics/mesa/mesa-common.inc         |   37 ++++++++++----
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 +-
 ...ative_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} |    4 +-
 meta/recipes-graphics/mesa/mesa-dri.inc            |   11 ++++-
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 --
 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb       |    4 ++
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    6 +--
 meta/recipes-graphics/mesa/mesa-git.inc            |   11 +++--
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    5 --
 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb      |    5 ++
 meta/recipes-graphics/mesa/mesa-xlib_git.bb        |    6 +--
 .../mesa/mesa/0001-Compile-with-uclibc.patch       |   52 ++++++++++++++++++++
 ...ossfix-mklib.patch => 0002-cross-compile.patch} |   39 ++++++++++++---
 ...sa_fix_for_x32.patch => 0003-fix-for-x32.patch} |   30 +++++++----
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 +++++++++++
 meta/recipes-graphics/mesa/mesa/crossfix.patch     |   18 -------
 meta/recipes-graphics/mesa/mesa/uclibc.patch       |   42 ----------------
 20 files changed, 204 insertions(+), 120 deletions(-)
 rename meta-yocto/recipes-graphics/mesa/{mesa-dri_7.11.bbappend => mesa-dri_8.0.4.bbappend} (100%)
 rename meta/recipes-graphics/mesa/{mesa-7.11.inc => mesa-8.0.4.inc} (60%)
 rename meta/recipes-graphics/mesa/{mesa-dri-glsl-native_7.11.bb => mesa-dri-glsl-native_8.0.4.bb} (84%)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_8.0.4.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_8.0.4.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa/0001-Compile-with-uclibc.patch
 rename meta/recipes-graphics/mesa/mesa/{crossfix-mklib.patch => 0002-cross-compile.patch} (68%)
 rename meta/recipes-graphics/mesa/mesa/{mesa_fix_for_x32.patch => 0003-fix-for-x32.patch} (59%)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/crossfix.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/uclibc.patch

-- 
1.7.10



