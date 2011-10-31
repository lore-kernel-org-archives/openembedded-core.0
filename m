Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RKvxF-00024d-I5
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 18:47:25 +0100
Received: by faas16 with SMTP id s16so6403853faa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 10:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/z6gUWJ3mKG+84VW6BNfezciH53zB6njabZBPSEPm9k=;
	b=tgjBdnomRMNYYFK4UZZc8OVwcTl5xbUdJpvpa/zGgwJ11aVNZnXKv5LdTFEEGeErtO
	l2XgHXcDvRePfyNgddC/GzvJSudL3P00d5CNRGEe3LbtCEMHy+F06Xb9nRNzsPK+tJIR
	aLb/t2pnbXhBM2QHa9f/vVbJ1GgM4RMnk3Dsw=
Received: by 10.223.17.3 with SMTP id q3mr30655402faa.28.1320082877330;
	Mon, 31 Oct 2011 10:41:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w27sm17809127fad.13.2011.10.31.10.41.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 10:41:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2011 18:41:09 +0100
Message-Id: <cover.1320082621.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
Subject: [oe-core 0/7] Python upgrade
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
X-List-Received-Date: Mon, 31 Oct 2011 17:47:25 -0000

Based on Nitin's latest version in poky/contrib and with added 
fixes to build extra modules and PR bumps to rebuild stuff which 
is in /usr/lib/python2.6 

It's good to check that sysroots like this are empty after build:
sysroots/om-gta02/usr/lib/python2.6/ -type f | grep -v \.pyo | grep -v \.pyc | grep -v \.la
sysroots/x86_64-linux/usr/lib/python2.6/ -type f | grep -v \.pyo | grep -v \.pyc | grep -v \.la

The following changes since commit ff13e06892f102d915855cde50896349b07b3717:

  clutter-gtk: add LIC_FILES_CHKSUM to include file (2011-10-31 10:46:59 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib jansa/python
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/python

Martin Jansa (5):
  python: update generate-manifest for 2.7 version and regenerate it
  python-2.7.2: fix build issues when additional modules are linked
    against host or native libpython instead of target
  recipes: bump PR after python upgrade
  python-dir: change PYTHON_BASEVERSION to 2.7
  bitbake.conf: update STAGING_PYDIR to 2.7 version

Nitin A Kamble (2):
  python, python-native: upgrade from 2.6.6 to 2.7.2
  update python 2.7 manifest

 meta/classes/python-dir.bbclass                    |    2 +-
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/default-versions.inc      |    6 +-
 .../bluez/gst-plugin-bluetooth_4.96.bb             |    2 +
 .../telepathy/telepathy-python_0.15.19.bb          |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 ...on-2.6-manifest.inc => python-2.7-manifest.inc} |  124 +++++-----
 .../python/python-argparse_1.2.1.bb                |    1 +
 meta/recipes-devtools/python/python-dbus_0.84.0.bb |    2 +-
 meta/recipes-devtools/python/python-gst_0.10.21.bb |    2 +-
 .../python/python-imaging_1.1.7.bb                 |    2 +-
 .../python/python-native/multilib.patch            |  240 ++++++++++++++++++++
 .../python/python-native/nohostlibs.patch          |   36 ++-
 ...thon-native_2.6.6.bb => python-native_2.7.2.bb} |   13 +-
 .../python/python-pycairo_1.8.10.bb                |    2 +-
 .../python/python-pycurl_7.19.0.bb                 |    2 +-
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 .../recipes-devtools/python/python-pygtk_2.17.0.bb |    2 +-
 .../python/python-pyrex-native_0.9.9.bb            |    2 +-
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |    2 +-
 .../python/python-scons-native_2.1.0.bb            |    2 +-
 meta/recipes-devtools/python/python-scons_2.1.0.bb |    2 +-
 .../python/python-setuptools_0.6c11.bb             |    2 +-
 meta/recipes-devtools/python/python.inc            |   17 +-
 .../01-use-proper-tools-for-cross-build.patch      |   80 ++++---
 .../python/python/02-remove-test-for-cross.patch   |  108 ---------
 .../06-avoid_usr_lib_termcap_path_in_linking.patch |   12 +-
 .../python/06-ctypes-libffi-fix-configure.patch    |   42 ++---
 meta/recipes-devtools/python/python/multilib.patch |  126 ++++++-----
 .../python/python/security_issue_2254_fix.patch    |  184 ---------------
 .../python/{python_2.6.6.bb => python_2.7.2.bb}    |   11 +-
 meta/recipes-extended/cracklib/cracklib_2.8.18.bb  |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.6.bb             |    2 +
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 .../gstreamer/gstreamer_0.10.35.bb                 |    2 +
 meta/recipes-support/atk/atk_2.2.0.bb              |    1 +
 meta/site/common-linux                             |    3 +
 ...te-manifest-2.6.py => generate-manifest-2.7.py} |    6 +-
 43 files changed, 521 insertions(+), 541 deletions(-)
 rename meta/recipes-devtools/python/{python-2.6-manifest.inc => python-2.7-manifest.inc} (52%)
 create mode 100644 meta/recipes-devtools/python/python-native/multilib.patch
 rename meta/recipes-devtools/python/{python-native_2.6.6.bb => python-native_2.7.2.bb} (74%)
 delete mode 100644 meta/recipes-devtools/python/python/02-remove-test-for-cross.patch
 delete mode 100644 meta/recipes-devtools/python/python/security_issue_2254_fix.patch
 rename meta/recipes-devtools/python/{python_2.6.6.bb => python_2.7.2.bb} (92%)
 rename scripts/contrib/python/{generate-manifest-2.6.py => generate-manifest-2.7.py} (99%)

-- 
1.7.7.1



