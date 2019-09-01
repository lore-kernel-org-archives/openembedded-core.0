Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FE477ED2F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 20:36:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q19so3632963wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=pAD2erBRuQy8cdK/sKBuAwfEY3ltNOQlJ1hN8J0By8s=;
	b=Qtfe8qJ695e6SW5VL/p9vpEk1KP3z3ETJxP+0kS+7EegUefLTrwlTEiSGZkcx31mkj
	lGQgIq/TiNTq1ghCVz3pciNgSnYsZLMivr4lKbaYXIPXGZJGyyE1uvMjnJMPSzBLTGmQ
	0prq1V7fvrKXwsYG3a6cKOz8cWidnVjzjllT79C45AgH+nX15AjjJk/CSXzwf8VwvNrh
	Cx5hHmem0z0MkN3fePvBj7YU5nrTBT+XCTz1jF19xG3CQdquYkoSGEp+tbkfDX7uOJsw
	BoJswB1rj6Tq98lknZZU5QJoap/3lFNDVp3dDcUON0lxA2/vFiq0y1KAMVW1/Qqa7sQN
	t/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pAD2erBRuQy8cdK/sKBuAwfEY3ltNOQlJ1hN8J0By8s=;
	b=M7licEN1h9ErnFCU+HelYRVSxnUHGNf/MpRjwwc19TiP9Qw3lD5gCdTYUKo/vW+ctT
	J8DCppVRozbO8wtyvRkP6e8s8vyRO3Z4HMS9wTHms9AT3zyMwvQH14NSvL3IrSJX76nX
	TJPEkMOOzPAfr7liFazV+rXa0vLWEmBfp+RHEVv7g8wzADJrNogpjsZa0/SrwOwLgjDo
	6iapoDEtGFuh4u3gNzs9+S6bWVqdxZUDmIR0pGX0URuTg3/qAOLdBlhLP9ybR6TQzCl1
	viaSotTWIHfxGx0GYrgGYoN6zoxmhOKOqRXWxpOyIz0M0aUAIm1+Fqo4vTkw2imNhmQo
	CHGg==
X-Gm-Message-State: APjAAAWYKYadGXRuKjweCwE/jd9PC1mkjffEnwANLNMC2dSbSFt5gBCB
	ZcZYAvcS7GAXHvoEHcMc7bZV7BcY
X-Google-Smtp-Source: APXvYqzf/6i0IYVxev7evPEnipNkVxyWeC7O43NTM1/XKu8s42LMSv5JLr2f3vFIlMwlzRIDBWZ51A==
X-Received: by 2002:a1c:ca09:: with SMTP id a9mr31045815wmg.43.1567370203637; 
	Sun, 01 Sep 2019 13:36:43 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f6sm25876192wrh.30.2019.09.01.13.36.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 13:36:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 22:36:30 +0200
Message-Id: <cover.1567369258.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Sun, 01 Sep 2019 20:36:43 -0000

This patchset adds two enhancements to qemu virgl support (which is
a virtualized accelerated 3D graphics support for the qemu guests):

1. SDL qemu frontend now comes with virgl fully enabled and working
(over ssh X11 forwarding as well!), so using the gtk frontend
is no longer necessary. 'oe-selftest' is adjusted to test both
frontends.

2. virgl itself is enabled by default in qemu, when 'opengl' is in
DISTRO_FEATURES. This pulls in a few components during build (particularly,
libdrm, virglrenderer and a special minimal configuration of mesa-native).
I tested the impact on build times: it is about 25-30 seconds on a 16 core
machine. 'bitbake core-image-minimal' goes from 26m45 to 27m13.

Gtk qemu frontend remains disabled by default, as it adds more to the build times.

The following changes since commit 270bd86740a080fb56d932a5c0eb70d6ce2a2b3c:

  libepoxy: enable x11 PACKAGECONFIG for native/nativesdk (2019-09-01 17:08:18 +0200)

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


