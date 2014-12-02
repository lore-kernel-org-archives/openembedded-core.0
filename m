Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 177C9601A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 15:53:54 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so1958470wid.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Dec 2014 07:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SFRXagx0y2MVdyHLC+/sotIEGh7UzcQJPq62UISV2tk=;
	b=l8VIQwY6fC8xIf0AO+32TGT3dkYtng0TXMUqDTnnREuKT/tftDZO1W2jTP7creBPjo
	yttdPk5SKOReU3XqVPsfEcnWHhPEOELU+HhcO5kIoqE1DM4HeCpDwk+7Ep5MlQq2wxLK
	SpXvHkLw6QZc2ZjPIfU2kmXTEt8pgC6kQVGq+6WnPhAjxlv0AeNhh7X1Lu2mGAy2tOPX
	DO+7g0/5emngX1e2FLcl0rqWBzznOGzqRgE0jMqLOH2m68RsEK0dX4qFg+EJt7L6+atA
	hpEERo8coD/xWTC1eULUu6dZzcyHlQEjXF98ASBDkc4cc4WNt6Jws41+/uRzbPRgLAZl
	P1aA==
X-Gm-Message-State: ALoCoQl1WljK7Uv6pd0YUATm6yQYfz063m9oiRfNs00YqVEcGeOVmaL2mvPLn8nScJorrNzlzGBx
X-Received: by 10.180.85.198 with SMTP id j6mr91625845wiz.23.1417535634080;
	Tue, 02 Dec 2014 07:53:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id j2sm32437034wjs.28.2014.12.02.07.53.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Dec 2014 07:53:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 15:53:22 +0000
Message-Id: <cover.1417535164.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4][RFC] Change libexecdir to ${prefix}/libexec
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
X-List-Received-Date: Tue, 02 Dec 2014 15:53:57 -0000

Hi,

First, this is VERY MUCH A RFC!

There's numerous problems with setting ${libexecdir} to ${libdir}/${BPN}, but
the a easy argument in my opinion is that nobody else does this.

The Debian world sets libexecdir to ${exec_prefix}/lib, and the Red Hat world
uses ${exec_prefix}/libexec.  The FHS says either are fine.  Nobody puts the
package name into the definition of libexecdir, as automake provides
pkglibexecdir ($libexec/$package) for package-specific binaries.

This branch changes bitbake.conf to use ${exec_prefix}/libexec and a few patches
to fix (or hack around) any problems this has revealed so far.

Comments and testing (especially with other layers, and multilib configurations)
much appreciated.

Ross

The following changes since commit b8631416f12b8a904ce3deb036f9d5ce632937b0:

  package_regex.inc: Update REGEX'es in order to find upstream versions correctly (2014-11-28 14:03:02 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/libexec

for you to fetch changes up to ed5b853fc4626afabcad8171f478893d5fb438f5:

  bitbake: set libexecdir to prefix/libexec (2014-12-02 15:43:36 +0000)

----------------------------------------------------------------
Ross Burton (4):
      eglibc: WIP fix paths for libexec
      neard: remove libexec hacks
      weston: fix plugin location in FILES
      bitbake: set libexecdir to prefix/libexec

 meta/conf/bitbake.conf                                 |    4 ++--
 meta/recipes-connectivity/neard/neard.inc              |   10 +++-------
 meta/recipes-connectivity/neard/neard/neard.in         |    2 +-
 meta/recipes-connectivity/neard/neard/neard.service.in |    2 +-
 meta/recipes-core/glibc/glibc-package.inc              |    2 +-
 meta/recipes-graphics/wayland/weston_1.6.0.bb          |    2 +-
 6 files changed, 9 insertions(+), 13 deletions(-)

Ross Burton (4):
  eglibc: WIP fix paths for libexec
  neard: remove libexec hacks
  weston: fix plugin location in FILES
  bitbake: set libexecdir to prefix/libexec

 meta/conf/bitbake.conf                                 |    4 ++--
 meta/recipes-connectivity/neard/neard.inc              |   10 +++-------
 meta/recipes-connectivity/neard/neard/neard.in         |    2 +-
 meta/recipes-connectivity/neard/neard/neard.service.in |    2 +-
 meta/recipes-core/glibc/glibc-package.inc              |    2 +-
 meta/recipes-graphics/wayland/weston_1.6.0.bb          |    2 +-
 6 files changed, 9 insertions(+), 13 deletions(-)

-- 
1.7.10.4


