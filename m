Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id A7F2770018
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 20:01:01 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bt5so14098601pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 13:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=xh9vwWoB4nio6FxEXInMgvbOlXM7u5btt3vtQgJK4O8=;
	b=hHkbIWaihOWNXznjT+8cDcbK4F3YJIB0HoLgCDjAkQbp0qJXaKmkXH+F4Hm6sTyLUN
	0+/VWwqzrRXGXjaxa5rZlRH5y/MdgRbijbhSUSeAyMmH2M9/aLArDVY5y9iYzVu9P0/z
	6pkmB/5HxmZTr9GhTFmyEd2GJjeemdvT6+MdnaScelpH2FuyzY7U0ijt67OvzcvKscGJ
	5FN5QWCXeT5cO4pxjh6baGXdZE7u9kFzigNW0VbieR8Pop3G9HeFJcs+2cHAIMCtrEkS
	/9DTTekKs7CyAe+JnAPxiG6+Iv5uNsnC8wNFUhqi5JFH8B53nKMofV6sIhCF8rgkcP1k
	lepg==
X-Gm-Message-State: AOPr4FU6CVr/8xmYbI3KEZf4v63+SxyAOXxvBmX0yW3/rEX2Yiuf5WfgyIIlE0HV9XQuMg==
X-Received: by 10.67.14.7 with SMTP id fc7mr6234553pad.1.1462305662187;
	Tue, 03 May 2016 13:01:02 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id f187sm72394pfb.60.2016.05.03.13.00.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 13:01:00 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Tue, 03 May 2016 17:00:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  3 May 2016 17:00:44 -0300
Message-Id: <1462305651-16593-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v2 0/7] Improve Xwayland integration
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
X-List-Received-Date: Tue, 03 May 2016 20:01:03 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

There are still some issues to be done:

 - how to make Xwayland fit on the packagegroups?
 - does core-image.bbclass ought to include a xwayland feature?

Yet, this patchset seems good to be reviewed and possibly merged.

Changes in v2:
- Remove PAM requirement
- Remove PAM requirement
- Drop weston-lunch use as it requires PAM
- Move weston-start module to weston package
- Stop using weston-launch

Otavio Salvador (7):
  weston: Enable XWayland when X11 and Wayland support are available
  weston: Remove XWayland dependencies on PACKAGECONFIG
  weston-init: Rework do_install to use install -D option
  weston-init: Rework init sequence to avoid code duplication
  weston-init: Error out if loading a nested instance
  weston-init: Add module support for the weston-start helper
  weston: Add Xwayland initialization support using weston-start

 meta/recipes-graphics/wayland/weston-init.bb       | 11 ++--
 meta/recipes-graphics/wayland/weston-init/init     |  9 +--
 .../wayland/weston-init/weston-start               | 67 ++++++++++++++++++++++
 .../wayland/weston-init/weston.service             |  5 +-
 .../wayland/weston/xwayland.weston-start           |  7 +++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      | 12 +++-
 6 files changed, 90 insertions(+), 21 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

-- 
2.8.2


