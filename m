Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5C85C7FD95
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 15:38:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so3544411wre.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 07:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=4bkYU/cEEi704ytPg/UzW4eurD5W19U526rbLamO7WI=;
	b=OI7FXZxTcueTEvx0bYFP0pdkultLPj9sjMI00HsmJH7HLLIa+iDk+JAEuRZIx13aUU
	avmsiz3sN73YKqvmBU0UXcaCrCTtxF/hKCLA5+86NxNo71fd4OrDdiylEySLoeNufUuI
	bgKsdQV3mDG7LK0qRo39C9neb3839zC3fO6uz6Jo8f4otMAKGDJykWiUjnv/WBsm8ghQ
	TxLqHFdHuLcxa2BFDBmHj6S7YRePZK5MRylCm2Qp1QYaPvYsnrIXRNsxUlYEd5Ivy33E
	myNTbPx7271Y+YakxOHk9KBhupziALNwRNRHTV6g/Lob6BC4plo/NjENa0O9URp/mHPR
	APOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4bkYU/cEEi704ytPg/UzW4eurD5W19U526rbLamO7WI=;
	b=ui9cDcPYFwj02wAJgfzV467vtVbZCzaATvT68bnoEnilvj4Bzp242SrSaSQqJRE8hH
	WFlSh2Ap84QCg9wWnZbzmm4+m8NX5PS8rT2j47jwa1garfEJiFW6TemFsvC43aohxWlk
	9tBB6z0JZZPpR4nCeE5m4uWRQE5aURkLgFUi9T9mJIV2vCt2V3GkM4AomL85zSoZZBzX
	ARv+nDX9rnwpnr5o7dcRSGKYofiDFC99sddvI8ZuMOAly6xz8aoZjmM2fBK1c4B6Jqs0
	Yemai/E1TFX8SnPC3B+3corSfUzfo1XNumiU1Y8icz0NZt2YpKmY23eDrzj3hZiORz+c
	HXIg==
X-Gm-Message-State: APjAAAVdMqIfzd0Zet3+asna9NJmmI0dDEaeCx+TWzyCllvnFRYDXXkU
	8cHlZ85gHQ5fYtOJ0hHe4KvPmYP/
X-Google-Smtp-Source: APXvYqxBZxjB+rEfth8Sa0Xx1OSj3DDEVK9z6tE+sQ6z7NLaGsDlImfcBBUAM1DpwW1rPadqE92GrA==
X-Received: by 2002:adf:ea0f:: with SMTP id q15mr18639925wrm.324.1579793880618;
	Thu, 23 Jan 2020 07:38:00 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	t25sm3152466wmj.19.2020.01.23.07.37.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 07:38:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 16:37:52 +0100
Message-Id: <cover.1579793597.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/3] virgl: enable in qemu when 'opengl' is in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 23 Jan 2020 15:38:00 -0000

virgl is a virtualized accelerated 3D graphics support for the qemu
guests. This patchset enables virgl in qemu, when 'opengl' is in
DISTRO_FEATURES.

This adds a few native dependencies to qemu-system-native
(particularly, libdrm, virglrenderer and a special minimal configuration
of mesa-native). I tested the impact on build times: it is about 30
seconds on a 16 core machine. 'bitbake core-image-minimal' goes from
25m26s to 25m57s.

The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:

  bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/qemu-split-virgl-gtk
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/qemu-split-virgl-gtk

Alexander Kanavin (3):
  bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk
    from target
  libsdl2: enable opengl option for native/nativesdk, subject to
    'opengl' in DISTRO_FEATURES
  qemu: enable virglrenderer and glx options subject to 'opengl'
    DISTRO_FEATURE

 meta/conf/bitbake.conf                         |  4 ++--
 meta/lib/oeqa/selftest/cases/runtime_test.py   | 18 ++++++------------
 .../qemu/qemu-system-native_4.1.0.bb           |  4 +++-
 meta/recipes-devtools/qemu/qemu_4.1.0.bb       |  5 ++++-
 meta/recipes-gnome/gtk+/gtk+3.inc              |  2 ++
 meta/recipes-graphics/cairo/cairo_1.16.0.bb    |  2 ++
 .../libepoxy/libepoxy_1.5.4.bb                 |  2 --
 .../recipes-graphics/libsdl2/libsdl2_2.0.10.bb |  4 ++--
 .../virglrenderer/virglrenderer_0.8.1.bb       |  2 --
 9 files changed, 21 insertions(+), 22 deletions(-)

-- 
2.17.1


