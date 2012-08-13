Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T102l-0001X1-Nu
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 21:11:16 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 13 Aug 2012 11:59:20 -0700
Received: by wibhq12 with SMTP id hq12so3254257wib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 11:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=LgDU94yjECXaP2oeOE1aN/1YbscerTwzrxt3Iwg0tv8=;
	b=o5um4353f8596CnEoWKgnqTQKtmKA5Cvp/wFeKWnMItkJ3oBQPXrYHO+M4ozq0fKgN
	O57p+u6A1Kbuc0osMtLFbQBV/TGlXeoGm07KBbB9uWOYATUqv+KFNngv38EyTA/HYsvl
	6PElHn9RzuRziUJV2PI4FPJBTTBoeUHSAtJ4dLNVrZ9kU3yF4xT6x2zJGTKf1pzJHEDA
	7b1XE+gu5SNCGFhq6xek0TkcmLqpSwngAI/JMOvEL6zwysW51186TuXu/JUIFyglY1Xu
	psr5IONVhNdknosy/SZFRBlp2YyzFeDuuNY28imgqhRCpC3IOosfIaALE0z+NoyZubKQ
	T+Bw==
Received: by 10.180.76.135 with SMTP id k7mr20756083wiw.7.1344884358245;
	Mon, 13 Aug 2012 11:59:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id h9sm17936447wiz.1.2012.08.13.11.59.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Aug 2012 11:59:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 19:58:39 +0100
Message-Id: <cover.1344884283.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlSlG3yHnJJaO8JnmMgxs/jhzBm87cxz5uLM/SAnFx+a42m8CUEU2HAcu3rejLLp3UUz3V4
Subject: [PATCH 0/8] Enable EGL and GLES in x86 Mesa
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
X-List-Received-Date: Mon, 13 Aug 2012 19:11:16 -0000

Hopefully the final Mesa patch set.  First pulls in an essential fix to
PACKAGECONFIG, and then enables GLES and EGL using PACKAGECONFIG, based on
whether the MACHINE_FEATURES contains x86.

Ross

The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:

  foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/mesa

for you to fetch changes up to 938675e4208fd34908653e1a7565c58f53067d77:

  mesa: enable EGL, with DRM and X11 platforms (2012-08-13 12:53:45 +0100)

----------------------------------------------------------------
Damien Lespiau (2):
      mesa: Add a mesa-dri-glsl-native_git recipe
      core: Prefer mesa-dri as virtual/libopengles1/2 provider

Ross Burton (5):
      clutter: DOLT isn't used anymore
      mesa: enable GLES v1 and v2
      mesa-demos: fix GLES2 build
      mesa: respect x11 DISTRO_FEATURE
      mesa: enable EGL, with DRM and X11 platforms

Yao Zhao (1):
      base.bbclass: fix PACKAGECONFIG handling code

 meta/classes/base.bbclass                          |   25 ++++++++---------
 meta/conf/distro/include/default-providers.inc     |    2 ++
 meta/conf/machine/qemux86-64.conf                  |    2 ++
 meta/conf/machine/qemux86.conf                     |    2 ++
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    7 +----
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    7 +----
 meta/recipes-graphics/clutter/cogl_git.bb          |    7 +----
 meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   26 ++++++++++++------
 .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 ++--
 .../recipes-graphics/mesa/mesa-dri-glsl-native.inc |    7 +++++
 .../mesa/mesa-dri-glsl-native_8.0.4.bb             |    9 ++----
 .../mesa/mesa-dri-glsl-native_git.bb               |   23 ++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri.inc            |    8 +++++-
 meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
 .../arch/qemu/conf/machine/{{=machine}}.conf       |    2 ++
 18 files changed, 129 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch

Damien Lespiau (2):
  mesa: Add a mesa-dri-glsl-native_git recipe
  core: Prefer mesa-dri as virtual/libopengles1/2 provider

Ross Burton (5):
  clutter: DOLT isn't used anymore
  mesa: enable GLES v1 and v2
  mesa-demos: fix GLES2 build
  mesa: respect x11 DISTRO_FEATURE
  mesa: enable EGL, with DRM and X11 platforms

Yao Zhao (1):
  base.bbclass: fix PACKAGECONFIG handling code

 meta/classes/base.bbclass                          |   25 ++++++++---------
 meta/conf/distro/include/default-providers.inc     |    2 ++
 meta/conf/machine/qemux86-64.conf                  |    2 ++
 meta/conf/machine/qemux86.conf                     |    2 ++
 meta/recipes-graphics/clutter/clutter-1.8_1.8.4.bb |    7 +----
 meta/recipes-graphics/clutter/clutter-1.8_git.bb   |    7 +----
 meta/recipes-graphics/clutter/cogl_git.bb          |    7 +----
 meta/recipes-graphics/mesa/mesa-8.0.4.inc          |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |   26 ++++++++++++------
 .../mesa/mesa-demos/gles2-info.patch               |   15 ++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.0.1.bb     |    5 ++--
 .../recipes-graphics/mesa/mesa-dri-glsl-native.inc |    7 +++++
 .../mesa/mesa-dri-glsl-native_8.0.4.bb             |    9 ++----
 .../mesa/mesa-dri-glsl-native_git.bb               |   23 ++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri.inc            |    8 +++++-
 meta/recipes-graphics/mesa/mesa-git.inc            |    2 ++
 ...-gross-hack-to-prevent-from-install-libgl.patch |   29 ++++++++++++++++++++
 .../arch/qemu/conf/machine/{{=machine}}.conf       |    2 ++
 18 files changed, 129 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/gles2-info.patch
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_git.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa/0004-gross-hack-to-prevent-from-install-libgl.patch

-- 
1.7.10



