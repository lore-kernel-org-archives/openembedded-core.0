Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF9Gq-0002sF-Gg
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 21:24:34 +0100
Received: by mail-da0-f50.google.com with SMTP id t1so616427dae.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 13:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=k1h5yoSP254pdFSYbaToFQA5ANw/2d7TZlAH5GiM9dg=;
	b=N0acdPj8Lc91RmkN6vINk78/CIFpknPn0RdhwWylSiPJGU9aFkPs9MxsnuY9krstUm
	DIDMRcGflEPAwGolIgeFZrrUJ0dvQC7+FTb20GwzqZOryJvQHLJsgSeShf6KaC8QZYok
	8BlZjVdtCg448VQ+PhufoeNRJjv1y7x1RHqBffnCnoY2cMV2eSkcofILbjvEO+hdTptD
	0OspkoI7lUr00Qj0qzEPHj04R/D1zGib4KdgIuT6WkWfxOcIShEuIf1xFXsNiopWkZZ3
	muDB90k/kMiw09zfWlByE1v1/H2paA0RpNpYtsrdQTHgMqw2aK38/ZOlXVtJeb51rgks
	l55w==
X-Received: by 10.68.225.40 with SMTP id rh8mr31427672pbc.137.1363032472639;
	Mon, 11 Mar 2013 13:07:52 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id eh5sm21700910pbc.44.2013.03.11.13.07.50
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 13:07:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 13:07:30 -0700
Message-Id: <cover.1363031776.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnMjLs00P1az4/9EYeSRdOgUbJKI6+WacTkAfXehY7eK+vvD5dss6sOoOsdL07XT74dCU0r
Subject: [RFC PATCH 0/9] hybrid systemd/sysvinit
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 20:24:47 -0000
X-List-Received-Date: Mon, 11 Mar 2013 20:24:47 -0000
X-List-Received-Date: Mon, 11 Mar 2013 20:24:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series allows you to have both sysvinit and systemd in DISTRO_FEATURES.
Packages will be built with both init scripts, and some daemons will be linking
to libsystemd-daemon so that will be pulled in to sysvinit images.

The init manager used at image construction time is DISTRO_FEATURES_INITMAN
(maybe this should be renamed) and that value is also backfilled into
DISTRO_FEATURES.

The key change is that systemd.bbclass only recommends systemd, and will check
that there's a systemctl binary before calling it - this allows packages built
like this to be installed on a systemd-free image.

This is very much a RFC, I've done some basic testing but between illness and
having to prepare for a presentation at this conference I've not been able to
test it as much as I'd hoped.  Review and testing very much appreciated.

Some metrics: adding the systemd feature but still using sysvinit when building
the image results in just libsystemd-daemon and the service files being added to
the image, with a negliable size increase.

Ross

The following changes since commit 1fd5b960dd36458b7b829f9094df18cd8b5ac201:

  systemd: remove libsystemd-daemon linkage in libudev (2013-03-11 10:59:54 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd

for you to fetch changes up to ba7c15ae47ace8a15d97b4c58d2aa5b2ebb4c47a:

  default-distrovars: don't add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES (2013-03-11 12:17:49 -0700)

----------------------------------------------------------------
Radu Moisan (1):
      busybox: add systemd enabling for syslog and klogd

Ross Burton (8):
      systemd: merge udev-systemd into udev
      systemd: make xz support (compressed journal) optional
      default-providers: change udev selection logic
      update-rcd.bbclass: handle both sysvinit and systemd features being present
      systemd: allow postinsts to run without systemd being present
      systemd: add udev init script for hybrid sysvinit/systemd usage
      update-rc.d/systemd: change communication variable name
      default-distrovars: don't add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES

 meta/classes/systemd.bbclass                       |   37 ++++---
 meta/classes/update-rc.d.bbclass                   |    7 +-
 meta/conf/distro/include/default-distrovars.inc    |    2 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 meta/recipes-core/busybox/busybox.inc              |   17 +++-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    2 +
 .../busybox/files/busybox-klogd.service.in         |    8 ++
 .../busybox/files/busybox-syslog.service.in        |   13 +++
 .../packagegroups/packagegroup-core-boot.bb        |    4 +-
 meta/recipes-core/systemd/systemd/init             |  101 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |   26 +++--
 11 files changed, 184 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
 create mode 100644 meta/recipes-core/systemd/systemd/init

Radu Moisan (1):
  busybox: add systemd enabling for syslog and klogd

Ross Burton (8):
  systemd: merge udev-systemd into udev
  systemd: make xz support (compressed journal) optional
  default-providers: change udev selection logic
  update-rcd.bbclass: handle both sysvinit and systemd features being
    present
  systemd: allow postinsts to run without systemd being present
  systemd: add udev init script for hybrid sysvinit/systemd usage
  update-rc.d/systemd: change communication variable name
  default-distrovars: don't add DISTRO_FEATURES_INITMAN to
    DISTRO_FEATURES

 meta/classes/systemd.bbclass                       |   37 ++++---
 meta/classes/update-rc.d.bbclass                   |    7 +-
 meta/conf/distro/include/default-distrovars.inc    |    2 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 meta/recipes-core/busybox/busybox.inc              |   17 +++-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    2 +
 .../busybox/files/busybox-klogd.service.in         |    8 ++
 .../busybox/files/busybox-syslog.service.in        |   13 +++
 .../packagegroups/packagegroup-core-boot.bb        |    4 +-
 meta/recipes-core/systemd/systemd/init             |  101 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |   26 +++--
 11 files changed, 184 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
 create mode 100644 meta/recipes-core/systemd/systemd/init

-- 
1.7.10.4



