Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id ADB386FFD7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 May 2016 20:43:48 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id f92so62623559qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2016 13:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=jUUWtlx0CpoH9LWbw1WxvE2QDxAKKLbiZMP9tgySvzw=;
	b=ZY/UAonMfPpsbTOXPc6qRs8JwFlgYY4SeEEKRqBTliMDh9iKsq9IU8yzJLZN00vdey
	N+QQ6BiFD5Rfm80RoMYErtIbt9xLMqV6jWQkjv5VWxvCImIiTQG097gqwPSoRYgSHhix
	QK7hSFPGKh5A/pplHRM2n7LkCAbrLlygIS0xCT/1yITypmrmOJoU8z6AelzkrWtiYJjx
	6XdYVlpgR2fN8MG2xqTCMseHKCZIFoMrc2sqQs+WMrFDCEh89TBDLw0bPIo74ZThZW4p
	xa6FqteQkbb9pR8MQiiRHXg5RN87Ccq2lUNCjOYzeEtwBv3e1srBSSyrFj8/52qzvD++
	t7Rg==
X-Gm-Message-State: AOPr4FVsAg9S/zY5CSNkG6MEamQmLgY8aRS4N6+/tD7w2c60nIrs2QzdTEElihoXSktEXg==
X-Received: by 10.140.235.14 with SMTP id g14mr22377034qhc.86.1462567429062;
	Fri, 06 May 2016 13:43:49 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	f65sm6483509qke.46.2016.05.06.13.43.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 13:43:47 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 17:43:41 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  6 May 2016 17:43:29 -0300
Message-Id: <1462567419-3459-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	neenareddy.busireddy@nxp.com,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v4 00/10] Improve Xwayland integration
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
X-List-Received-Date: Fri, 06 May 2016 20:43:49 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

There are still some issues to be done:

 - how to make Xwayland fit on the packagegroups?
 - does core-image.bbclass ought to include a xwayland feature?

Yet, this patchset seems good to be reviewed and possibly merged.

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
  weston: Enable XWayland when X11 and Wayland support are available
  weston: Remove XWayland dependencies on PACKAGECONFIG
  weston: Fix SystemD service description
  weston: Add PACKAGECONFIG option for 'clients'
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
 .../wayland/weston-init/weston.service             |  7 +--
 .../wayland/weston/xwayland.weston-start           |  7 +++
 meta/recipes-graphics/wayland/weston_1.9.0.bb      | 19 +++---
 7 files changed, 95 insertions(+), 26 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

-- 
2.8.2


