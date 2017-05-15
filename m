Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 909FD71DEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 13:27:08 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id k91so73101429ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=c/QD+UfZ4DMNF2UGetEpcvO/96k45ss8n2HyAcSSTms=;
	b=HGp8EovwkEzK9MFHq0DNownT5oJl/Iz3dPyp6kIBhQH5Nyr08/h9KI+Yb9TRVEcskG
	OKsZ7NDnOatwDt9gChdXRWKsa+usxMGlV//Ft46BO/QT3dEBUjil62oywpMM54EGL/kP
	7XNX4HD9uX34IaXvhXLFUljtDmVUqPogLb1aJsD47rjLYjDUAOcsNW1mjnfAOGHy2FO2
	PniS3ZOB+17WJBRtrKE1CdRrg/j9LBxfDj4NWmpHFEJZPtPFr2NCfgqvS05jJBqSP7xC
	2ehuBXzgHpmMmV6BmunvBg7Hkm6vVBCE7bnT2v+jGRmj+cRTWwue0eJ+eT/Koyb9U2k+
	fdTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c/QD+UfZ4DMNF2UGetEpcvO/96k45ss8n2HyAcSSTms=;
	b=quJN95LEgysDvI1uf03O0F7luEkA8OAu3y1rGrDb8T4bnOBGlgroYEDm5yzzXy+fWk
	Sy6ECq968ku7dudVHlLgzjdQs769x6zIdttYrII9eIGPVKbMqwj5nmGC+OmQM+yA8I7h
	BtacKk1jyESvTuTsbCXTK0oqB823eCBJ6flHHPgirkpbY8DewD8upQkOxPFwAMytRxyX
	C1ExEcwGrGglltxwxOAF30hlERTW6RX64oRppfLlV7B3DEO+gNUKhDx8Il8qbeAalQ/v
	3YEMFBfobZHOpltV7zOO7Ik999CoogQsSj4Lj95y9bqshQsFn7J53gm7eOA9rr8XYuWB
	ZMGA==
X-Gm-Message-State: AODbwcB2Uu9/3sF46z7FwZOOixvdGOshJVS7ZsfE9aKGP8tZcXfpLGl+
	mD3TdAkFOIkCWTJZ
X-Received: by 10.107.170.16 with SMTP id t16mr5286012ioe.113.1494854829991;
	Mon, 15 May 2017 06:27:09 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8F79A.dip0.t-ipconnect.de.
	[93.232.247.154])
	by smtp.gmail.com with ESMTPSA id c7sm4537765itc.14.2017.05.15.06.27.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 May 2017 06:27:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 15:26:57 +0200
Message-Id: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Mon, 15 May 2017 13:27:10 -0000

At OEDAM [1] I took the AR to flesh out some of my ideas for
introducing global and per-image settings for switching between
development and production builds. The goal is partly to establish
common configure options that then can be used by different layers,
partly to have some actual useful functionality attached to them
already in OE-core.

"development" builds are what a developer does when trying out a
distro or working on his own personal device. "production" is what
device manufacturer put onto the actual end-user hardware.

At OEDAM we already concluded that per-image settings are more
useful. However, sometimes a component also has compile-time choices
that cannot be changed later on in an image, and indeed I found one
example for that (kmod) in OE-core.

Therefore I have included "debug-build" DISTRO_FEATURES support. It's a
bit similar to manpages.bbclass, but in contrast to that (currently)
is meant to be inherited globally - that's partly due to
misunderstanding how manpages.bbclass was meant to be used. This can
be changed, for now I just want to demonstrate that such a distro
feature is not entirely useless, and what effect it could have already
in OE-core.

In refkit, we also switch globally between development and production
builds via .inc files. However, I am in the process of replacing that
with the more flexible per-image IMAGE_MODE check. So from my
perspective, the IMAGE_MODE is more important and useful than the
"debug-build" DISTRO_FEATURE.

From a design perspective, the approach taken here is to let a
developer or image define what mode it wants, and default features can
be configured accordingly. That alternative would be to continue defining
features as before and use the mode to configure QA warnings or errors.

But I find that less flexible, and I suspect it would be harder to
keep track of what is meant to be usable in which mode. Developers
also would have a harder time overriding the defaults.

[1] https://www.openembedded.org/wiki/OEDAM_2017

Patrick Ohly (6):
  build-mode.bbclass: distro-wide debug-build mode
  basefiles: warn about non-production DISTRO_FEATURES in motd
  defaultsetup.conf: enable special "debug-build" DISTRO_FEATURES support
  image-mode.bbclass: per-image production/development/debug mode
  image.bbclass: include IMAGE_MODE support
  local.conf.sample: make debug-tweaks depend on IMAGE_MODE

 meta/classes/build-mode.bbclass                   | 16 ++++-
 meta/classes/image-mode.bbclass                   | 62 ++++++++++++++++-
 meta/classes/image.bbclass                        |  3 +-
 meta/conf/distro/defaultsetup.conf                |  2 +-
 meta/conf/local.conf.sample                       |  5 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb | 11 +++-
 6 files changed, 96 insertions(+), 3 deletions(-)
 create mode 100644 meta/classes/build-mode.bbclass
 create mode 100644 meta/classes/image-mode.bbclass

base-commit: 9f9ebf2e1ba6eda48fb5e3f20d4ca5bbabe3dad4
-- 
git-series 0.9.1

