Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id C13F665CC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 14:30:51 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n62so2850395qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 07:30:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=4jp7Pbr/l0BMy0MTMBTuQ/Nvp/8Hh0F6HziUj/oOze8=;
	b=HLrWl/cGgTOKpXQuuyZ4VliYvg65IKQe7/0AjCKMNqhf1C7xx/VkOYR/PGTdcwtyKf
	vMtl22SwJwUieCOay5/AmlDXGa5t+yOtOE6tNSVxHYAq7adHD5PSUDch9R2WeLayNGCR
	POcgI86cSiDutnSTmCpw8CF04WJFUbslEoWBbaRjIjqdXNFuCMYnr5CGcw4YAKNbrgIh
	4beKuKLDDOwcCE0neN8yQnBHr2DsAnYVMHh8onawYqd8+34241PXAsI0Pmwfp6Wa/UMl
	xpbMlp/VaNGs2rO+St8CqaumgkHbwSy8WlKV7xfnPWbq9UYRLO11RCGF3zyUOvAV9ac3
	+Wcg==
X-Gm-Message-State: AOPr4FWjQuHvGC8Ei/YPPO7PVMKCa4+UaIWkToW03zfN2e1M3DCMXqQdWm7qyJEYMmvOnw==
X-Received: by 10.55.59.74 with SMTP id i71mr4088356qka.50.1462977051991;
	Wed, 11 May 2016 07:30:51 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	r127sm3535668qkf.47.2016.05.11.07.30.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 May 2016 07:30:50 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 11 May 2016 11:30:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 May 2016 11:30:31 -0300
Message-Id: <1462977042-7436-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v5 00/11] Improve Weston and Xwayland integration
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
X-List-Received-Date: Wed, 11 May 2016 14:30:52 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

While working on it, some improvements on weston and weston-init were
done. The patches:

  weston: Fix SystemD service description
  weston: Add PACKAGECONFIG option for 'clients'
  weston: Enable XWayland when X11 and Wayland support are available
  weston: Remove XWayland dependencies on PACKAGECONFIG
  weston-init: Rework do_install to use install -D option

Seem to be ready to be merged.

The other patches are still being worked on and should not be merged
yet. There are still some issues to be done:

 - how to make Xwayland fit on the packagegroups?
 - does core-image.bbclass ought to include a xwayland feature?

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
- Drop weston-lunch use as it requires PAM
- Move weston-start module to weston package
- Stop using weston-launch

Otavio Salvador (10):
  weston: Fix SystemD service description
  weston: Add PACKAGECONFIG option for 'clients'
  weston: Enable XWayland when X11 and Wayland support are available
  weston: Remove XWayland dependencies on PACKAGECONFIG
  weston-init: Rework do_install to use install -D option
  weston-init: Rework init sequence to avoid code duplication
  weston-init: Error out if loading a nested instance
  weston-init: Add module support for the weston-start helper
  weston: Add Xwayland initialization support using weston-start
  core-image-weston: If X11 is enabled, add XWayland support

Tom Hochstein (1):
  weston: weston-launch: Handle invalid command line options

 meta/recipes-graphics/images/core-image-weston.bb  |  1 +
 meta/recipes-graphics/wayland/weston-init.bb       | 11 ++--
 meta/recipes-graphics/wayland/weston-init/init     |  9 +--
 .../wayland/weston-init/weston-start               | 67 ++++++++++++++++++++++
 .../wayland/weston-init/weston.service             |  7 +--
 ...eston-launch-exit-for-unrecognized-option.patch | 33 +++++++++++
 .../wayland/weston/xwayland.weston-start           |  7 +++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      | 20 ++++---
 8 files changed, 129 insertions(+), 26 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

-- 
2.8.2


