Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7AEA660797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 16:36:37 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id e35so1852801qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 09:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=O2WCE9nB+Atca+Dn9H/nk+5DiKVbWPlHPifV80r33Ns=;
	b=TQTz1isEnaaAE6LZuw6cTSPfykAVCPeTfyZZjGlKhGkRaNagLM8WvFEtoDATisuer9
	NbjU6u7y8pMi+KgXaxsqa8ANeyD27eALB1G8bdlHV5VzuH99EH0cY/6x1OiTtpOxnaAQ
	5Om49I6eDqu06+8z6QCm2DPr2T8uHQBLZX0n3swzhN90ncGsSA+V00ed5Bo6Iix379Y5
	3DRRdE/vBeaBU96MSQEMzd3KzGsjunARJ+MSC62GcyynbQH4LlPLOoUljNM2KguJG+Gj
	57tOSG7Tadv/H14LZ1UOOrcHP5ykTg9lJYamye1epfHcpAwkGkPHkfjkbyjHjx5rcVmB
	nHuQ==
X-Gm-Message-State: AOPr4FVtmfcq3Z2NTDyQsOUBLEQ3V4bso38B1D/uziDTmpw/JFGzLucObuzII66Ow8lBzA==
X-Received: by 10.140.108.247 with SMTP id j110mr2636068qgf.54.1463502997758; 
	Tue, 17 May 2016 09:36:37 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	c52sm1721902qge.14.2016.05.17.09.36.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 May 2016 09:36:35 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 17 May 2016 13:36:26 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 17 May 2016 13:36:12 -0300
Message-Id: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v7 00/13] Improve Weston and Xwayland integration
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
X-List-Received-Date: Tue, 17 May 2016 16:36:37 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

While working on it, some improvements on weston and weston-init were
done.

Changes in v7:
- Rebase on top of 1.10 v2 + fixup
- Rebase on top of 1.10 v2 + fixup

Changes in v6:
- Rebase on top of 1.10
- Fix typo on commit log (rborton)
- New patch.
- New patch.
- Add xterm

Changes in v5:
- New patch.

Changes in v4:
- New patch.
- New patch.
- Use --log= for weston call

Changes in v3:
- Fix log redirection
- Fix argument pass for openvt
- New patch.

Changes in v2:
- Remove PAM requirement
- Remove PAM requirement
- Move weston-start module to weston package
- Stop using weston-launch
- Drop weston-lunch use as it requires PAM

Otavio Salvador (10):
  weston: Fix SystemD service description
  weston: Add PACKAGECONFIG option for 'clients'
  weston: Enable XWayland when X11 and Wayland support are available
  weston: Remove XWayland dependencies on PACKAGECONFIG
  weston-init: Rework do_install to use install -D option
  weston-init: Rework init sequence to avoid code duplication
  weston: Add Xwayland initialization support using weston-start
  weston-init: Error out if loading a nested instance
  weston-init: Add module support for the weston-start helper
  core-image-weston: If X11 is enabled, add XWayland support

Tom Hochstein (3):
  weston: weston-launch: Handle invalid command line options
  weston: Provide a default version of weston-launch that doesn't
    require PAM
  weston-init: Use weston-launch when starting weston as the first
    windowing system

 meta/recipes-graphics/images/core-image-weston.bb  |   1 +
 meta/recipes-graphics/wayland/weston-init.bb       |  11 +-
 meta/recipes-graphics/wayland/weston-init/init     |   9 +-
 .../wayland/weston-init/weston-start               |  72 +++++++++
 .../wayland/weston-init/weston.service             |   7 +-
 ...ch-Provide-a-default-version-that-doesn-t.patch | 171 +++++++++++++++++++++
 ...eston-launch-exit-for-unrecognized-option.patch |  33 ++++
 .../wayland/weston/xwayland.weston-start           |   7 +
 meta/recipes-graphics/wayland/weston_1.10.0.bb     |  27 ++--
 9 files changed, 310 insertions(+), 28 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

-- 
2.8.2


