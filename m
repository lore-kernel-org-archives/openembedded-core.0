Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E76E77081
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:41:02 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id f74so4635020qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=AD3oIKuX6+M+P5dDSemRDn+UovA00uVhPWu4Qf2xH64=;
	b=PUjkOjiLr7zuxUrvthJTexm6rXdBIaWwQQS7gxdHQvkupuQ+kar4OHXEVvGWJcu1eD
	ECFIHsq8R7rfQsQRj1gz7NWh9/S8M5JR9vx3qxqqrOM1pwT7MT1jnSues2SCoIpjlNd5
	1xJSYO9ZyyEK0rmykM9nP5RMwoKuciqxDpmW3qdoONsO0jil1XLajwePHvfRz323DFp9
	3FjMOTh4XX5TAZRZM1HKZEsasMxVPpB1zWOh7LKcJ2Ez03T1tp/r/ruUqKQRVyPzzWZq
	u2d70mn2DBWi/95klcEl7Ez1WwL1uw1B2QlSjoWR63Hhy5KRAs5t8w4YWvGVbLRZKfTo
	9FwQ==
X-Gm-Message-State: AOPr4FV55o88dscc7aC/Rge9ZcL2HTrqfMdReUBaMJiHVSS1khI/NNK2RVnKZwe3ofazYg==
X-Received: by 10.140.139.138 with SMTP id 132mr3422717qhl.34.1463589662876;
	Wed, 18 May 2016 09:41:02 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	y60sm4525292qgd.10.2016.05.18.09.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 09:41:01 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Wed, 18 May 2016 13:40:50 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 13:40:35 -0300
Message-Id: <1463589648-28641-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
Organization: O.S. Systems Software LTDA.
Cc: prabhu.sundararaj@nxp.com, Otavio Salvador <otavio@ossystems.com.br>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: [oe-core PATCH v8 00/13] Improve Weston and Xwayland integration
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
X-List-Received-Date: Wed, 18 May 2016 16:41:02 -0000

Up to now, to make Xwayland to work it required several manual hacks
and it was difficult to make an image which had support for it out of
box.

This patchset intends to set the base for it. It enables weston-init
to be extended to support Xwayland launch when needed.

While working on it, some improvements on weston and weston-init were
done.

Changes in v8:
- Split XWayland module in a package (Ross)
- Use ${datadir} for module path (Ross)
- Change order of patch (Ross)
- Install weston-xwayland package (Ross)

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

Tom Hochstein (3):
  weston: weston-launch: Handle invalid command line options
  weston: Provide a default version of weston-launch that doesn't
    require PAM
  weston-init: Use weston-launch when starting weston as the first
    windowing system

 meta/recipes-graphics/images/core-image-weston.bb  |   1 +
 meta/recipes-graphics/wayland/weston-init.bb       |  12 +-
 meta/recipes-graphics/wayland/weston-init/init     |   9 +-
 .../wayland/weston-init/weston-start               |  72 +++++++++
 .../wayland/weston-init/weston.service             |   7 +-
 ...ch-Provide-a-default-version-that-doesn-t.patch | 171 +++++++++++++++++++++
 ...eston-launch-exit-for-unrecognized-option.patch |  33 ++++
 .../wayland/weston/xwayland.weston-start           |   7 +
 meta/recipes-graphics/wayland/weston_1.10.0.bb     |  31 ++--
 9 files changed, 316 insertions(+), 27 deletions(-)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-start
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-weston-launch-Provide-a-default-version-that-doesn-t.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/make-weston-launch-exit-for-unrecognized-option.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/xwayland.weston-start

-- 
2.8.2


