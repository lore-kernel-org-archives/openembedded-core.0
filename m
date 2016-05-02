Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id DC6307317C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 20:13:57 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id xk12so7314801pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 13:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=qfPUSXcb0ewBkRq3PT3BZMiJc5sY9YgVkU/2tdKrgJs=;
	b=Do11JMzleUPZxmsXOvIS3L+FqPLWgtZCWyfzLKqD1DsJwhOvas1tuujyrZcQ5GIDrU
	tPmD1wnhRNinHcrd2AVbrVIriJ7PsD7nQi9yUnY3Fy0Cu3G1zb4S5mYOOJ5hfbWW5glL
	+EJijYnfDxX2G1WRpgeHdUkwlAOCrhDcpBGKYjJUoQSTth9y0wmMd5JKeQXGPoUSPiec
	hmg8hqN5s0Pqak5droUEzpZdyTqlyyCDrvErmiWWpefpGyK8qD4bOMv6p+azCn6sR+yQ
	lEDm8hezi5wVnhT8DDv7IVsxUBD6pVo+LTqVdmtoXnAtdugx+tBcCBtbZ/dEIW7WciFN
	7gEg==
X-Gm-Message-State: AOPr4FXsNg6JzTRI8VF1F2eyE9JBpcw0XZnZ6TSGrELpPd2kNdT6PGzoPOlbqjnbtbKGDg==
X-Received: by 10.66.72.137 with SMTP id d9mr43908253pav.151.1462220038342;
	Mon, 02 May 2016 13:13:58 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	t8sm47766183paw.16.2016.05.02.13.13.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 May 2016 13:13:57 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 02 May 2016 17:13:51 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  2 May 2016 17:13:36 -0300
Message-Id: <1462220023-17811-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH 0/7] Improve Xwayland integration
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
X-List-Received-Date: Mon, 02 May 2016 20:13:58 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

There are still some issues to be done:

 - how to make Xwayland fit on the packagegroups?
 - does core-image.bbclass ought to include a xwayland feature?

Yet, this patchset seems good to be reviewed and possibly merged.


Otavio Salvador (7):
  weston: Enable XWayland when X11 and Wayland support are available
  weston: Remove XWayland dependencies on PACKAGECONFIG
  weston-init: Rework do_install to use install -D option
  weston-init: Rework init sequence to avoid code duplication
  weston-init: Error out if loading a nested instance
  weston-init: Add module support for the weston-start helper
  xserver-xorg: Add Xwayland initialization support using weston-start

 meta/recipes-graphics/wayland/weston-init.bb       | 11 ++-
 meta/recipes-graphics/wayland/weston-init/init     |  9 +--
 .../wayland/weston-init/weston-start               | 78 ++++++++++++++++++++++
 .../wayland/weston-init/weston.service             |  5 +-
 meta/recipes-graphics/wayland/weston_1.9.0.bb      |  5 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  9 ++-
 .../xorg-xserver/xserver-xorg/xwayland             |  6 ++
 7 files changed, 101 insertions(+), 22 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xwayland

-- 
2.8.2


