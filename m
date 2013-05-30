Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BEC016041D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 14:03:53 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hr14so5325337wib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 07:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=/yunXin5m0WS5EbCjzbzUlM++KAxCZYZV+oTYpKp9Ms=;
	b=llwkUIf58NuwalxMuyO41M0t53mowTuTqk3cNMN9nK5agcTEOY7yC4//rYPeCb/0Ry
	590/g2wiRCCdE1A2fzGjW36E3Kf2BWAtlLUfNqSmDfpRrClzDAtkg2UENDfjW+sCArX0
	e85RGmf6IipKmtfCYIMf8Sz/Ph9YEF+cDPg8fHJpWBU/tF/ApyVKJPuC8FsMBsnEJ/vI
	JdVfWLBLVASU2hrZeOradkVVPus8R7w0CInd5klxzigArrhD9E22wpP6kuB2j9SjEmow
	qvEzs/r3kqX6RxmD9/xWqZM5pitUnES9UuFWizVrhztp2KOUNr8uHfz7l5tZiFmKKiWW
	x3LQ==
X-Received: by 10.194.59.72 with SMTP id x8mr4895685wjq.49.1369922633805;
	Thu, 30 May 2013 07:03:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id h8sm38208362wiz.9.2013.05.30.07.03.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 07:03:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 15:00:33 +0100
Message-Id: <cover.1369922325.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlBrrIuNPpHmSFP25Gj42VtcOMVzf7cnaef+A5rv7CFyYlWPWQ6A8QqAYih3tWPqgFSHajn
Subject: [PATCH 0/4] Mesa and Wayland updates
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
X-List-Received-Date: Thu, 30 May 2013 14:03:54 -0000

Hi,

A short series that updates our Mesa and Wayland to the latest upstream
releases, adds a very rudimentary init script to start Weston, and a basic image
that boots directly into Weston on DRM.

This image recipe effectively depends on the GTK+ branch I just sent as
otherwise GTK+ doesn't have a Wayland backend.

Ross

The following changes since commit d0861b7a12113c6626c6206faf3a9389fb8ef5cb:

  bitbake: bitbake: xmlrpc remote server (2013-05-30 10:44:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/wayland

for you to fetch changes up to 6792689a9b2c5269b2e9e2c6fc21a52dca1cef9d:

  core-image-weston: basic image that boots directly to Weston (2013-05-30 14:57:54 +0100)

----------------------------------------------------------------
Ross Burton (4):
      mesa: upgrade to 9.1.2
      wayland: update to 1.1.0
      weston-init: basic init script to start Weston on KMS/DRM
      core-image-weston: basic image that boots directly to Weston

 meta/recipes-graphics/images/core-image-weston.bb  |    9 +
 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   13 -
 .../mesa/mesa/0002-cross-compile.patch             |   94 ---
 ...ate-NativeDisplayType-depending-on-config.patch |  358 +++++++++++
 meta/recipes-graphics/mesa/mesa/cross-glsl.patch   |  632 --------------------
 .../mesa/dont-fail-if-libX11-isnt-installed.patch  |   36 --
 .../fix-egl-compilation-without-x11-headers.patch  |   32 -
 .../mesa/mesa/fix-glsl-cross.patch                 |   43 ++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 -
 meta/recipes-graphics/mesa/mesa_9.1.2.bb           |   14 +
 .../wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} |    6 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   17 +
 meta/recipes-graphics/wayland/weston-init/init     |   56 ++
 13 files changed, 499 insertions(+), 815 deletions(-)
 create mode 100644 meta/recipes-graphics/images/core-image-weston.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.2.bb
 rename meta/recipes-graphics/wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} (91%)
 create mode 100644 meta/recipes-graphics/wayland/weston-init.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/init

Ross Burton (4):
  mesa: upgrade to 9.1.2
  wayland: update to 1.1.0
  weston-init: basic init script to start Weston on KMS/DRM
  core-image-weston: basic image that boots directly to Weston

 meta/recipes-graphics/images/core-image-weston.bb  |    9 +
 meta/recipes-graphics/mesa/mesa-9.0.2.inc          |   13 -
 .../mesa/mesa/0002-cross-compile.patch             |   94 ---
 ...ate-NativeDisplayType-depending-on-config.patch |  358 +++++++++++
 meta/recipes-graphics/mesa/mesa/cross-glsl.patch   |  632 --------------------
 .../mesa/dont-fail-if-libX11-isnt-installed.patch  |   36 --
 .../fix-egl-compilation-without-x11-headers.patch  |   32 -
 .../mesa/mesa/fix-glsl-cross.patch                 |   43 ++
 meta/recipes-graphics/mesa/mesa_9.0.2.bb           |    4 -
 meta/recipes-graphics/mesa/mesa_9.1.2.bb           |   14 +
 .../wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} |    6 +-
 meta/recipes-graphics/wayland/weston-init.bb       |   17 +
 meta/recipes-graphics/wayland/weston-init/init     |   56 ++
 13 files changed, 499 insertions(+), 815 deletions(-)
 create mode 100644 meta/recipes-graphics/images/core-image-weston.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-9.0.2.inc
 delete mode 100644 meta/recipes-graphics/mesa/mesa/0002-cross-compile.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/EGL-Mutate-NativeDisplayType-depending-on-config.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/cross-glsl.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/dont-fail-if-libX11-isnt-installed.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa/fix-egl-compilation-without-x11-headers.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa/fix-glsl-cross.patch
 delete mode 100644 meta/recipes-graphics/mesa/mesa_9.0.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa_9.1.2.bb
 rename meta/recipes-graphics/wayland/{wayland_1.0.6.bb => wayland_1.1.0.bb} (91%)
 create mode 100644 meta/recipes-graphics/wayland/weston-init.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/init

-- 
1.7.10.4


