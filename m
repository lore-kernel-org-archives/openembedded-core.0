Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6EN-0007fF-R9
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:20 +0100
Received: by mail-wi0-f171.google.com with SMTP id hn17so8139100wib.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=53INaa5KhtzyoQ07vRo86nvczmvZAwx2PhsImKaPHso=;
	b=IjY2uvxjbJC47NSWhYNYh2RWXHayYADsn4jvpwfTIltlIqS6p3V5QQefMRcdUoJIJc
	pShdceJmVBsZYt864G6M9GK0hLo7Leps6yoVKiYURHfKDgbSmlDAUZZNrlVCXI0XAgnE
	IusTnoDsyt56ablRtAizEh/9FX7hrGFDmrvm9qxuXlgQqXU5dzEktPeIYpSl0u1ZLzhc
	G7rbDunhxCkkUQvfaT/5OqDG4PsQubY0AJvw/IOekMKmefdeQez4OsOddJiBZTVs4NL5
	MXxjhFWCPuc9m0tgLaR1RHi9MMleEVEXiXH08ZKV2Vv+NAbyHF4RsgCRgwmlJ024XKJn
	ilVA==
X-Received: by 10.194.81.40 with SMTP id w8mr4769636wjx.14.1363974085449;
	Fri, 22 Mar 2013 10:41:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.23
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:20 +0000
Message-Id: <cover.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQkTeOcSaOtNHIxopIcDeKj7Ke+CZ+rH39esWHR+uZR8DQjJ8D8mhND5/VJkhDIRyeim4b8n
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/22] hybrid systemd/sysvinit, and systemd fixes
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
X-List-Received-Date: Fri, 22 Mar 2013 17:58:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series changes the package groups and distro feature setup to allow
simultaneous use of sysvinit and systemd, with a number of fixes that were
discovered on the way.

As before there are sysvinit and systemd DISTRO_FEATURES.  These are not
mutually exclusive, and sysvinit is backfilled for compatibility.

Common Scenarios
===

"I want sysvinit, just like before"

Do nothing, sysvinit is backfilled and the image is effectively identical as it
was before this series.

"I just want systemd"

Add systemd to DISTRO_FEATURES, and sysvinit to
DISTRO_FEATURES_BACKFILL_CONSIDERED.  You'll only get the sysvinit scripts where
required: when a package doesn't have systemd support.

"I want my main image to boot using systemd, but a rescue image to use sysvinit"

This is less elegant, but can probably be improved later.  Add systemd to
DISTRO_FEATURES and sysvinit will be backfilled for you (feel free to add it
explicitly for clarity).  Then set VIRTUAL-RUNTIME_init_manager to "systemd" and
any images using package-group-core-boot will boot using systemd.  For your
rescue/minimal images I expect you're not using package-group-core-boot anyway,
so pull sysvinit+initscripts into those images however you wish.


Future Plans
===

Mainly, finish integrating the bulk of meta-systemd into oe-core!

There's potential for reducing the footprint of the hwdb by building/patching
udevadm on the host to generate the hwdb.bin file at image construction time,
and then removing the source files leaving just the binary cache.  As it is,
udev-hwdb is a recommendation so if your system doesn't actually need it, you
can blacklist it.

Cheers,
Ross

The following changes since commit 6211a2bdd32f7b2c8de7a5d75353c0522c8d4230:

  scripts/qemu-testlib: Add more debugging information (2013-03-21 17:05:15 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd

for you to fetch changes up to 0e1da1e227c8e52087f7a52f8501a81cd28e76c7:

  systemd: recommend systemd-compat-units (2013-03-22 17:24:21 +0000)

----------------------------------------------------------------
Andreas Oberritter (1):
      Revert "base-files: add fstab for systemd based systems"

Radu Moisan (1):
      busybox: enable systemd integration for syslogd

Ross Burton (20):
      busybox: add strictatime support to mount
      systemd: make xz support (compressed journal) optional, defaulting to on.
      systemd: merge udev-systemd into udev
      core-image-minimal-initramfs: don't install busybox-syslog
      systemd: don't depend on the PCI/USB databases
      systemd: split out the hwdb data
      default-providers: change udev selection logic
      update-rcd.bbclass: handle both sysvinit and systemd features being present
      util-linux: split uuidd into it's own package, and enable for systemd
      update-rcd: drop depends to recommends, check for update-rcd in scripts
      systemd: check for systemctl first, and don't force systemd to be installed.
      systemd: add udev init script for hybrid sysvinit/systemd usage
      update-rc.d/systemd: change communication variable name
      default-distrovars: don't add INITMAN to DISTRO_FEATURES and DISTRO_FEATURES_BACKFILL
      bitbake.conf: explicitly backfill sysvinit, not DISTRO_FEATURES_INITMAN
      local.conf.sample.extended: remove obsolete DISTRO_FEATURES_INITMAN reference
      default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
      packagegroup-core-boot: revert to specifying sysvinit as default init manager
      systemd-compat-units: disable dbus-1
      systemd: recommend systemd-compat-units

 meta-yocto/conf/local.conf.sample.extended         |    4 -
 meta/classes/systemd.bbclass                       |   38 ++++----
 meta/classes/update-rc.d.bbclass                   |   22 +++--
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 .../base-files/base-files/fstab.systemd            |    9 --
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 .../busybox/busybox-1.20.2/strict-atime.patch      |   49 ++++++++++
 meta/recipes-core/busybox/busybox.inc              |   18 +++-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 +-
 .../busybox/files/busybox-klogd.service.in         |    8 ++
 .../busybox/files/busybox-syslog.service.in        |   13 +++
 .../images/core-image-minimal-initramfs.bb         |    2 +
 .../packagegroups/packagegroup-core-boot.bb        |    6 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |    1 +
 meta/recipes-core/systemd/systemd/init             |  101 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |   49 +++++++---
 meta/recipes-core/util-linux/util-linux.inc        |   11 ++-
 19 files changed, 280 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
 create mode 100644 meta/recipes-core/systemd/systemd/init

Andreas Oberritter (1):
  Revert "base-files: add fstab for systemd based systems"

Radu Moisan (1):
  busybox: enable systemd integration for syslogd

Ross Burton (20):
  busybox: add strictatime support to mount
  systemd: make xz support (compressed journal) optional, defaulting to
    on.
  systemd: merge udev-systemd into udev
  core-image-minimal-initramfs: don't install busybox-syslog
  systemd: don't depend on the PCI/USB databases
  systemd: split out the hwdb data
  default-providers: change udev selection logic
  update-rcd.bbclass: handle both sysvinit and systemd features being
    present
  util-linux: split uuidd into it's own package, and enable for systemd
  update-rcd: drop depends to recommends, check for update-rcd in
    scripts
  systemd: check for systemctl first, and don't force systemd to be
    installed.
  systemd: add udev init script for hybrid sysvinit/systemd usage
  update-rc.d/systemd: change communication variable name
  default-distrovars: don't add INITMAN to DISTRO_FEATURES and
    DISTRO_FEATURES_BACKFILL
  bitbake.conf: explicitly backfill sysvinit, not
    DISTRO_FEATURES_INITMAN
  local.conf.sample.extended: remove obsolete DISTRO_FEATURES_INITMAN
    reference
  default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
  packagegroup-core-boot: revert to specifying sysvinit as default init
    manager
  systemd-compat-units: disable dbus-1
  systemd: recommend systemd-compat-units

 meta-yocto/conf/local.conf.sample.extended         |    4 -
 meta/classes/systemd.bbclass                       |   38 ++++----
 meta/classes/update-rc.d.bbclass                   |   22 +++--
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 .../base-files/base-files/fstab.systemd            |    9 --
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 .../busybox/busybox-1.20.2/strict-atime.patch      |   49 ++++++++++
 meta/recipes-core/busybox/busybox.inc              |   18 +++-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 +-
 .../busybox/files/busybox-klogd.service.in         |    8 ++
 .../busybox/files/busybox-syslog.service.in        |   13 +++
 .../images/core-image-minimal-initramfs.bb         |    2 +
 .../packagegroups/packagegroup-core-boot.bb        |    6 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |    1 +
 meta/recipes-core/systemd/systemd/init             |  101 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |   49 +++++++---
 meta/recipes-core/util-linux/util-linux.inc        |   11 ++-
 19 files changed, 280 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
 create mode 100644 meta/recipes-core/systemd/systemd/init

-- 
1.7.10.4



