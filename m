Received: from mail-we0-f171.google.com ([74.125.82.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXNq-00076U-82
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:11 +0100
Received: by mail-we0-f171.google.com with SMTP id d46so4695642wer.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=gUxH/2YfVQ9BJtntErCnRedP1flD5TAJNJPu7j+jqN8=;
	b=Y83hxZDv7LahXSZWnjqVteeMDW7C6ulSDTq17dBsrXyRYfCvF3IeI2yW73QKNvMzUv
	XwACgDtgU5wpBpuUT9nxUd8R3iF+VNweLw9BhHjBfMR6bywohlbwzu/4jn6KToltd3Mz
	R8Ju11/ISsjCAHKu6t+TnlyD/s+LhtEZaf5qccycC2wJg/E43STNJMSIXViOIikGrCy3
	NUqP1fktjtJu3o8p+yPHaQgZTvdw7j8b6Jgt/LUr4ia468G/3/VfbFTaugJvDMFnh8Hf
	m6AnCEFZ62bNHLTVzoHhRAH45aygYRM+VsuIkpU6WIaqkw7YvtCKqxS/8yrSAvY+03h3
	V+Dg==
X-Received: by 10.194.5.4 with SMTP id o4mr25986317wjo.40.1364316782233;
	Tue, 26 Mar 2013 09:53:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:49:58 +0000
Message-Id: <cover.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQlJA0L8jOXjRjShU7IFVeFlqF/dHmF348wpIVnBvZEJ8pueJ/PeQuPb1bGdI+Is0NLwUDwu
Subject: [PATCH V2 00/24] hybrid systemd/sysvinit, and systemd fixes
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:17 -0000
X-List-Received-Date: Tue, 26 Mar 2013 17:10:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

An iteration on the previous series, this fixes the issues that Saul and Martin
noticed, removes the commit that is targetted at meta-yocto, and importantly
fixes pure-systemd booting which was previously aborting dramatically when
populate-volatiles copied the contents of /run to /var/volatile/run (and then
deleted the originals).  systemd really doesn't like having it's internal pipes
and sockets deleted.

Ross

The following changes since commit f36926a264190e6202830e8520b41b30ae77ea43:

  docbook-utils-native: Unbreak the build after source and build dir split (2013-03-25 20:51:19 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd

for you to fetch changes up to a56f9f8d95194dc4365e83488a34f37a4ee0bce1:

  udev: move /run volatile entry to udev instead of initscripts (2013-03-26 16:26:09 +0000)

----------------------------------------------------------------
Andreas Oberritter (1):
      Revert "base-files: add fstab for systemd based systems"

Radu Moisan (1):
      busybox: enable systemd integration for syslogd

Ross Burton (22):
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
      default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
      packagegroup-core-boot: revert to specifying sysvinit as default init manager
      systemd-compat-units: disable dbus-1
      systemd: recommend systemd-compat-units
      dbus: explicitly disable systemd when no systemd
      busybox: order and group initscript variables logically
      udev: move /run volatile entry to udev instead of initscripts

 meta/classes/systemd.bbclass                       |   38 ++++----
 meta/classes/update-rc.d.bbclass                   |   22 +++--
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 .../base-files/base-files/fstab.systemd            |    9 --
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 .../busybox/busybox-1.20.2/strict-atime.patch      |   49 ++++++++++
 meta/recipes-core/busybox/busybox.inc              |   22 ++++-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 +-
 .../busybox/files/busybox-klogd.service.in         |    8 ++
 .../busybox/files/busybox-syslog.service.in        |   13 +++
 meta/recipes-core/dbus/dbus.inc                    |    4 +-
 .../images/core-image-minimal-initramfs.bb         |    2 +
 .../initscripts/initscripts-1.0/volatiles          |    1 -
 .../packagegroups/packagegroup-core-boot.bb        |    5 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |    1 +
 meta/recipes-core/systemd/systemd/init             |  101 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |   49 +++++++---
 meta/recipes-core/udev/udev.inc                    |    6 +-
 meta/recipes-core/udev/udev/volatiles              |    1 +
 meta/recipes-core/util-linux/util-linux.inc        |   11 ++-
 22 files changed, 289 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
 create mode 100644 meta/recipes-core/systemd/systemd/init
 create mode 100644 meta/recipes-core/udev/udev/volatiles

Andreas Oberritter (1):
  Revert "base-files: add fstab for systemd based systems"

Radu Moisan (1):
  busybox: enable systemd integration for syslogd

Ross Burton (22):
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
  default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
  packagegroup-core-boot: revert to specifying sysvinit as default init
    manager
  systemd-compat-units: disable dbus-1
  systemd: recommend systemd-compat-units
  dbus: explicitly disable systemd when no systemd
  busybox: order and group initscript variables logically
  udev: move /run volatile entry to udev instead of initscripts

 meta/classes/systemd.bbclass                       |   38 ++++----
 meta/classes/update-rc.d.bbclass                   |   22 +++--
 meta/conf/bitbake.conf                             |    2 +-
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    2 +-
 .../base-files/base-files/fstab.systemd            |    9 --
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 .../busybox/busybox-1.20.2/strict-atime.patch      |   49 ++++++++++
 meta/recipes-core/busybox/busybox.inc              |   22 ++++-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 +-
 .../busybox/files/busybox-klogd.service.in         |    8 ++
 .../busybox/files/busybox-syslog.service.in        |   13 +++
 meta/recipes-core/dbus/dbus.inc                    |    4 +-
 .../images/core-image-minimal-initramfs.bb         |    2 +
 .../initscripts/initscripts-1.0/volatiles          |    1 -
 .../packagegroups/packagegroup-core-boot.bb        |    5 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |    1 +
 meta/recipes-core/systemd/systemd/init             |  101 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |   49 +++++++---
 meta/recipes-core/udev/udev.inc                    |    6 +-
 meta/recipes-core/udev/udev/volatiles              |    1 +
 meta/recipes-core/util-linux/util-linux.inc        |   11 ++-
 22 files changed, 289 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
 create mode 100644 meta/recipes-core/busybox/files/busybox-klogd.service.in
 create mode 100644 meta/recipes-core/busybox/files/busybox-syslog.service.in
 create mode 100644 meta/recipes-core/systemd/systemd/init
 create mode 100644 meta/recipes-core/udev/udev/volatiles

-- 
1.7.10.4



