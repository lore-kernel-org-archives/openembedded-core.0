Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3576072C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 22:49:49 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id j68so24313877qke.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 15:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=+Vob4N2nR9665m/ew6vIyQdXrOBndyc45YW2rS9U2Bk=;
	b=csekPQmdQBnPa/lgJD8XrFe6ZenJEJQRLqvkxAe318+nmki7YdbdF9VOgk6quHsD7t
	/c0DhcEe+Re6g+GEOnRh8TVbbbubKwYkS/Jp8QU0QAdGkyAnEJRs6eBwy5BwNA2JS4fY
	nXbN66wPmKlsRwyn20WxMmqB9X5/6J3U3Y35EdgGd1MI7iFRFsJ/Dn1r212q8rk4jKbN
	pWf40ZInLgCSHnB8Fn+YTx0KrjLtZhgs+yHMwCADzhXwHOMcGLywRhAFhmgCwqPzrFJi
	Ja0qAp7teMkoV2K4KEgQxjV6aaE9LSajtEMMPqGv8uUoJkA3imvn0NKqaQPVwjUIK665
	Njng==
X-Gm-Message-State: AOPr4FU9sbvcpKrvTna/hhcyknnv4R8CgPlyx+yOVoXeIU2hYCUpdN3z7nG66/qhEmXH8g==
X-Received: by 10.55.149.135 with SMTP id x129mr11847044qkd.140.1462402190542; 
	Wed, 04 May 2016 15:49:50 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	z66sm2227578qhc.16.2016.05.04.15.49.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 May 2016 15:49:49 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 04 May 2016 19:49:43 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 May 2016 19:49:32 -0300
Message-Id: <1462402180-16861-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v3 0/8] Improve Xwayland integration
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
X-List-Received-Date: Wed, 04 May 2016 22:49:50 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

There are still some issues to be done:

 - how to make Xwayland fit on the packagegroups?
 - does core-image.bbclass ought to include a xwayland feature?

Yet, this patchset seems good to be reviewed and possibly merged.

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

Otavio Salvador (8):
  weston: Enable XWayland when X11 and Wayland support are available
  weston: Remove XWayland dependencies on PACKAGECONFIG
  weston-init: Rework do_install to use install -D option
  weston-init: Rework init sequence to avoid code duplication
  weston-init: Error out if loading a nested instance
  weston-init: Add module support for the weston-start helper
  weston: Add Xwayland initialization support using weston-start
  core-image-weston: If X11 is enabled, add XWayland support

 meta/recipes-graphics/images/core-image-weston.bb  |  1 +
 meta/recipes-graphics/wayland/weston-init.bb       | 11 ++--
 meta/recipes-graphics/wayland/weston-init/init     |  9 +--
 .../wayland/weston-init/weston-start               | 67 ++++++++++++++++++++++
 .../wayland/weston-init/weston.service             |  5 +-
 .../wayland/weston/xwayland.weston-start           |  7 +++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      | 12 +++-
 7 files changed, 91 insertions(+), 21 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

-- 
2.8.2


