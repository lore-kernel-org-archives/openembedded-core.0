Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 81D9A60118
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 19:12:30 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l68so15346648qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 12:12:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=Q0cmxWOXgEynipjdVTX/Nt4/MCWcLryGs1LbE1AqKng=;
	b=eWe3d3ljHjOcFz9/d37WrQc3UEF9GgXH2xT+dVe/ao4ErQwrFe4aumssKukt9AdLiI
	rPLFXw5p33Ichevizq1oj1HYgzRiVA7OYL62mDPqr780jMId7iMyfSmQgVjumv7Pbm9S
	4FqjP+bB+EUSNJ/mFfo/BYhE5Ax7nwrZB2GDZm6Vptd++NlcLCkBCzUbTG/Yr6IOGQeh
	9rIfq6uFGUv6KPDI6bRC18aqe0NAltAxz4Q6tZQfcNTpwL69ueTmlwRMgGIAs2TVit5/
	r2Qx+pcMP8y6SQFkXKqqPp9oUtI+lsUOysetdSnN7HEIRRtWkQ/W28/WoRgHgj7eE1v6
	I7BQ==
X-Gm-Message-State: AOPr4FXCQOnxsoXyKu9jr39GK57tBrtr25OCLtrUdkIh00DTNb/j9SRGCj5t/rTpJt2n0w==
X-Received: by 10.55.81.3 with SMTP id f3mr31294314qkb.35.1463425950330;
	Mon, 16 May 2016 12:12:30 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	d12sm15344092qhd.13.2016.05.16.12.12.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 12:12:29 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 16 May 2016 16:12:14 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 16 May 2016 16:11:58 -0300
Message-Id: <1463425932-10080-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v6 00/14] Improve Weston and Xwayland integration
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
X-List-Received-Date: Mon, 16 May 2016 19:12:30 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

While working on it, some improvements on weston and weston-init were
done.

Changes in v6:
- New patch.
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

Otavio Salvador (11):
  weston: Use HTTPS for tarball download
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
 meta/recipes-graphics/wayland/weston_1.10.0.bb     |  29 ++--
 9 files changed, 311 insertions(+), 29 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

-- 
2.8.2


