Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A2B217F5A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 11:48:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id r5so11535949wrm.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2019 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dgoOHWjox2h0txCehBtMcc31NEo1sL0n+NRXWDhcDbI=;
	b=ti2kfexakc53MavOIMt03t8yAUTbvuAvKfXKyUaL9IZTZ0Da80Ys8kbF74HIVJqOj3
	8yDw/2vjKL2rPxbf4U3XeH30mZ77GLWYRK0NSHl6FHV6Miqc/gOpS7v4Z0cB2nIcsi9H
	g2B+PEcBasfl9fxFFn+APx/+w4xYpKRi/tX710UsTDFree+zhyCEOQRTZyJguxNy8Aro
	SPng1tCaL7x2h6m5/dO3bqygvxPIskMlQAsoUvYt/Sy2J/ctGQikayS4hLxyptINkFul
	1LHIzGgZ/kRBeIfDnLxj5Cbp/RacwdUGXZw40OuzAZPkCMUm4yRF0XaJruG/CW5iPOK8
	6F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dgoOHWjox2h0txCehBtMcc31NEo1sL0n+NRXWDhcDbI=;
	b=VkttnG3vAnHltTQ24yoQEGUVxxVFuvI0H4DZBbJmwIOP+kR5ldXTNmdGYp9NepBWaM
	CcADP3O+JpTFcOO31BS8C0TV766QgDuB/+gbTOSMBB8B8teufXTXExv5cfFmGJ5j3RK/
	m0k37LK+eDfvmfFyKM179gnS3xTIxOmHTVbaBPXw1wGWbg7j42kXUdqbnpbJhYQkWysd
	ue4z8v6UhrnnYffb+qLyLeoV1DYB3o+mfkILjCMjSGXiozKiA9mSWX/P2TVW9GGj1QCh
	/NV39aJPs3k2rSWw4036g8yiRM2+Lsz1odUusm7s4XZXQplQDGfPG2vWGjUxz0Ia4AhW
	qncA==
X-Gm-Message-State: APjAAAXwgBnn1o4d3NSyKoGFPDaB2roh2tp+Q9ln7JrtnXpiTc/OyOVN
	3vG40u6ndgtiRiVSMzk0yNDzi7e0
X-Google-Smtp-Source: APXvYqzUCJvBUqk/kFPzzOKVV0ZIb3gKEiTOAJ06U5NRCvmVOz9E9noFRp36tDhL7zxRyL68Y7RniA==
X-Received: by 2002:adf:f18a:: with SMTP id h10mr12528732wro.145.1570794494993;
	Fri, 11 Oct 2019 04:48:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id b5sm6964357wmj.18.2019.10.11.04.48.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 04:48:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2019 13:47:52 +0200
Message-Id: <20191011114754.91740-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011114754.91740-1-alex.kanavin@gmail.com>
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/19] libmodulemd-v1: introduce the recipe
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
X-List-Received-Date: Fri, 11 Oct 2019 11:48:15 -0000

Upstream has split version 1 of the libmodulemd recipe into
its own branch and removed version 1 from the master
branch and 2.x releases; as libdnf requires v1 of libmodulemd,
this commit introduces a v1-specific revipe.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |  2 +-
 ...t-generate-gtkdoc-or-python-bindings.patch | 60 +++++++++++++++++++
 ...ec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch | 22 +++++++
 .../libmodulemd/libmodulemd-v1_git.bb         | 26 ++++++++
 5 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
 create mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ab0c6c55412..7a9d55c5c34 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -356,6 +356,7 @@ RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
+RECIPE_MAINTAINER_pn-libmodulemd-v1 = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnewt-python = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index 4ff294c32cb..3f11e0231fa 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -13,7 +13,7 @@ SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native"
+DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd-v1 json-c swig-native"
 
 inherit gtk-doc gobject-introspection cmake pkgconfig distutils3-base
 
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch b/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch
new file mode 100644
index 00000000000..d950ad5867e
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch
@@ -0,0 +1,60 @@
+From 71c51206e037c0bb5759e01b307b7ce1d5934703 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 6 Sep 2019 17:07:00 +0200
+Subject: [PATCH] Do not generate gtkdoc or python bindings
+
+All of these really need a configuration option.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build          | 12 ------------
+ modulemd/meson.build |  8 --------
+ 2 files changed, 20 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 155c9e7..fe35d5e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -51,25 +51,13 @@ gnome = import('gnome')
+ pkg = import('pkgconfig')
+ gobject = dependency('gobject-2.0')
+ yaml = dependency('yaml-0.1')
+-gtkdoc = dependency('gtk-doc')
+ 
+ glib_prefix = dependency('glib-2.0').get_pkgconfig_variable('prefix')
+-glib_docpath = join_paths(glib_prefix, 'share', 'gtk-doc', 'html')
+ 
+ sh = find_program('sh')
+ sed = find_program('sed')
+ test = find_program('test')
+ 
+-ret = run_command ([test, '-e', join_paths(glib_docpath, 'glib/index.html')])
+-if ret.returncode() != 0
+-  error('Missing documentation for GLib.')
+-endif
+-
+-ret = run_command ([test, '-e', join_paths(glib_docpath, 'gobject/index.html')])
+-if ret.returncode() != 0
+-  error('Missing documentation for GObject.')
+-endif
+-
+ python_name = get_option('python_name')
+ 
+ if python_name != ''
+diff --git a/modulemd/meson.build b/modulemd/meson.build
+index 9a164b5..349c982 100644
+--- a/modulemd/meson.build
++++ b/modulemd/meson.build
+@@ -523,11 +523,3 @@ configure_file(
+   configuration : xcdata
+ )
+ 
+-gnome.gtkdoc(
+-    'modulemd-1.0',
+-    install_dir: 'modulemd-1.0',
+-    src_dir : './modulemd',
+-    main_xml : 'modulemd-docs.xml',
+-    install : true,
+-)
+-
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch b/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
new file mode 100644
index 00000000000..847b5f700b0
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch
@@ -0,0 +1,22 @@
+From 4e67f6049b3f822fe6f5af46790a51ace581bf82 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 6 Nov 2018 13:41:29 +0100
+Subject: [PATCH] spec_tmpl.sh: use /bin/sh, not /usr/bin/sh
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ spec_tmpl.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spec_tmpl.sh b/spec_tmpl.sh
+index 0238087..126853c 100755
+--- a/spec_tmpl.sh
++++ b/spec_tmpl.sh
+@@ -1,4 +1,4 @@
+-#!/usr/bin/sh
++#!/bin/sh
+ 
+ version=$1
+ template=$2
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb
new file mode 100644
index 00000000000..9790470f4fe
--- /dev/null
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb
@@ -0,0 +1,26 @@
+SUMMARY = "C Library for manipulating module metadata files"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
+
+SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=1.x-maint \
+           file://0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch \
+           file://0001-Do-not-generate-gtkdoc-or-python-bindings.patch \
+           "
+
+PV = "1.8.15"
+SRCREV = "2d461725f781c6fdcf32893d8dcfa40bcef8dda5"
+UPSTREAM_CHECK_GITTAGREGEX = "libmodulemd-(?P<pver>1.*\d)"
+
+S = "${WORKDIR}/git"
+
+inherit meson gobject-introspection
+
+EXTRA_OEMESON = "-Ddeveloper_build=false"
+
+DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
+
+BBCLASSEXTEND = "native nativesdk"
+
+GIR_MESON_OPTION = 'skip_introspection'
+GIR_MESON_ENABLE_FLAG = 'false'
+GIR_MESON_DISABLE_FLAG = 'true'
-- 
2.17.1


