Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id E91597F363
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:18:11 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l11so6153969wrx.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=RgsWCPd6aBc2LIM3pPqCAmA0hBpv1PqPnQs3nC2oASE=;
	b=kjCsFTzp4Oxi8vRhAL5/0Z6fvSZ5DjvbgtymmGmPCn2a6ztlB62QND++TNK+PPYNuQ
	DBAxKYqrdZwG2b/+YPkWQJdWwlgmCgCH3EK7HoiIeKHBp1IqKeFsuoaLcGww2uGL4fui
	mZbSTpIomP+xkKWaEBcWwjma4bVxYLD8q346JDSi5VQtWyOdDPWG4Y0IumFOOqHRLdsz
	K68MaHyyrHPhwGxYuzahIvNzchhhJXf4AZTIGlZCP2RpO9Bv83KWGJN0qw/gHVFNa2U1
	Eu/n7iu7422Q07nL4uANg93s1ewWVWjlyJjX7w8I4g/0iFIxSw2avwxjvbKekonHCJcb
	e+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=RgsWCPd6aBc2LIM3pPqCAmA0hBpv1PqPnQs3nC2oASE=;
	b=MfNvDXVOMM4sa9ndU7mscSSWKF/RPvOSL/0vSd8GdUUsHwzFLH1KRjJKg5r13ux10R
	ooum60SIxfsg4TE9uhDFAxltjY4dovEfYctm8ANg7DYcdGvWYTeRXeNTkVxDOrkjzjM4
	sSPf9TbWaSorFrgiUsM1+08lPa8tN/lzg8kVVo0Oj44SZ0aUaPdMQHYPeGHS1NKZ/9Zy
	5aKfyBh7Bj9k+far+eeDJj1B8d/FnSsMurElM5+4GIEU80mBaFXUVBHfnKtLlTQsYK2Y
	5ZDNx2AqbAYZxgYaTOgNd4a/GmV2qRi7+unnHcvC9f1UYqhz7GfrKVeLkUkTDUlYZqNj
	uYFg==
X-Gm-Message-State: APjAAAUt3ysvxontOZBSBWtzuLk6H2rFFnN5SP3JtwvHB7TXUleAAwQA
	fcB95iwYylM2ArHoCKykCN3uGNcr
X-Google-Smtp-Source: APXvYqwj53dyDaN6Lfm1irqiTR94UEMK77k93TkLZTZr5iBFqr5VsacD6ROC8zC4dlXjTUgbdv1BTQ==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr6288655wrn.223.1567768692433; 
	Fri, 06 Sep 2019 04:18:12 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q15sm4659730wmb.28.2019.09.06.04.18.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 04:18:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:18:00 +0200
Message-Id: <cover.1567765705.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/5] virgl: add SDL support and enable by default
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
X-List-Received-Date: Fri, 06 Sep 2019 11:18:12 -0000

This patchset adds two enhancements to qemu virgl support (which is
a virtualized accelerated 3D graphics support for the qemu guests):

1. SDL qemu frontend now comes with virgl fully enabled and working
(over ssh X11 forwarding as well!), so using the gtk frontend
is no longer necessary. 'oe-selftest' is adjusted to test both
frontends.

2. virgl itself is enabled by default in qemu, when 'opengl' is in
DISTRO_FEATURES. This adds a few native dependencies to qemu-system-native
(particularly, libdrm, virglrenderer and a special minimal configuration
of mesa-native). I tested the impact on build times: it is about 25-30
seconds on a 16 core machine. 'bitbake core-image-minimal' goes from
26m45 to 27m13.

Gtk qemu frontend remains disabled by default, as it adds more to the build times.

The following changes since commit f399b2d73b828f70536857e3e9189b1deb4a4143:

  poky: Use 5.2 kernel by default (2019-09-06 08:25:29 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/qemu-split-virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/qemu-split-virgl-gtk

Alexander Kanavin (5):
  bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk
    from target
  libsdl2: enable opengl option for native/nativesdk, subject to
    'opengl' in DISTRO_FEATURES
  qemu: enable virglrenderer and glx options subject to 'opengl'
    DISTRO_FEATURE
  runqemu: add options that enable virgl with the SDL frontend
  oe-selftest: extend virgl gtk test to also check the SDL option

 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 29 ++++++++++---------
 .../qemu/qemu-system-native_4.1.0.bb          |  4 ++-
 meta/recipes-devtools/qemu/qemu_4.1.0.bb      |  5 +++-
 meta/recipes-gnome/gtk+/gtk+3.inc             |  2 ++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |  2 ++
 .../libepoxy/libepoxy_1.5.3.bb                |  2 --
 .../libsdl2/libsdl2_2.0.10.bb                 |  4 +--
 .../virglrenderer/virglrenderer_0.8.0.bb      |  2 --
 scripts/runqemu                               | 15 ++++++++--
 10 files changed, 43 insertions(+), 26 deletions(-)

-- 
2.17.1


