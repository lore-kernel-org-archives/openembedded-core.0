Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhSs-0007e0-Kt
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:45 +0100
Received: from mail-fa0-f70.google.com ([209.85.161.70])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:14 -0800
Received: by mail-fa0-f70.google.com with SMTP id t1so5965969fae.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=8bv1LIqcMWyGbUBYV8M6fx6mab4j5n5lty87253fRIQ=;
	b=PYJqnn1iXYHhcCusfezTuSsdR9yE5txit6tp2EhV7G4/CxlEmpvzO9VPd2T5HoY5zr
	tBLXjeFg5GNLPuwo3Lvtav5PMOSj7JytBEHb47XLoL1m91Me8SifX0ojnOtODMTcwUsB
	4agVh6dK8hBKkOSPhuk6UFO0inyJaL7zgekc4DbiNJ8A0hmIpxXpIQ0GwoEUEQz60eAI
	qBik9sTYb8kdB0Q7Y1wbR1fPmWFcsqm7CvLsLlh2BaaAu0bsW1BWJ2yzvTOgPEELPLW8
	tQP8tn7UGwJT+UwmMQ2Vfp+k351JHcumCBCYHrlobvFgDthayZ5UUTeDJCVY/MvS6V9e
	x90w==
X-Received: by 10.180.20.198 with SMTP id p6mr9292374wie.19.1358635752795;
	Sat, 19 Jan 2013 14:49:12 -0800 (PST)
X-Received: by 10.180.20.198 with SMTP id p6mr9292369wie.19.1358635752574;
	Sat, 19 Jan 2013 14:49:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:03 +0000
Message-Id: <cover.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQn91IOX9BDGcXtN9cslPXYsolQn2EMTvLh3MHlqjb4TGvHk4uDYm7hcBE09pGfJ5Hqu5d4G7oGGj5t/YN6fLLAOHLMKWvECwp7aeMD5IK2NOKQFqfk8xjHy6T7NaI7TOmF9AJAx+dcyCKMEc5A7hxALeubbM7UQPOTAU9jrilPOd9XaXaxwSzKu6SAtibfgKFbozkEk
Subject: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Sat, 19 Jan 2013 23:04:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series has the goal of enabling core-image-minimal to boot using systemd.
As such it touches no real services, just the infrastructural tweaks to make the
init manager a distribution choice, systemd itself, and a few low-level changes.

95% of the credit obviously must go to the contributors of meta-systemd:

    Andreas Müller <schnitzeltony@googlemail.com>
    Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
    Holger Hans Peter Freyther <holger@moiji-mobile.com>
    Khem Raj <raj.khem@gmail.com>
    Koen Kooi <koen@dominion.thruhere.net>
    Martin Jansa <Martin.Jansa@gmail.com>

And thanks to Radu Moisan <radu.moisan@intel.com> for the work pulling together
a series for merging into oe-core.

Confirmed that this series using sysvinit results in a zero-delta in
core-image-minimal.

Cheers,
Ross

The following changes since commit 349e5bea53b02cabf836b8943541a002ce9ba682:

  guilt: add git 1.8.x support (2013-01-18 13:28:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd-minimal

for you to fetch changes up to 2a93db0fd8302290ac0f2c6c83ea640ad273c3e2:

  libpam: register PAM session with logind (2013-01-19 22:35:52 +0000)

----------------------------------------------------------------
Koen Kooi (1):
      libpam: register PAM session with logind

Martin Donnelly (1):
      base-files: add fstab for systemd based systems

Radu Moisan (5):
      default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
      default-providers: Automatically set PREFERRED_PROVIDER_udev
      systemd: add systemd recipes
      default-providers: Add systemd option to PREFERRED_PROVIDER_udev
      update-rc.d: disable update-rc.d.bbclass when systemd enabled

Ross Burton (3):
      dbus: respect systemd distro feature
      packagegroup-core-boot: install systemd-compat-units on systemd images
      packagegroup-core-boot: only install initscripts if we're using sysvinit

 meta/classes/update-rc.d.bbclass                   |   90 +-----
 meta/classes/update-rc.d_real.bbclass              |   89 ++++++
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    1 +
 .../base-files/base-files/fstab.systemd            |    9 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 meta/recipes-core/dbus/dbus.inc                    |   27 +-
 .../packagegroups/packagegroup-core-boot.bb        |    7 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
 .../systemd/systemd-compat-units/machineid.service |   16 +
 .../systemd-compat-units/run-postinsts.service     |   17 +
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
 .../systemd-serialgetty/serial-getty@.service      |   32 ++
 .../systemd/systemd-systemctl-native.bb            |   15 +
 .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
 .../systemd/systemd/00-create-volatile.conf        |   10 +
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
 meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
 .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
 .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
 meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
 meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
 .../pam/libpam/pam.d/common-session                |    4 +-
 31 files changed, 1726 insertions(+), 108 deletions(-)
 create mode 100644 meta/classes/update-rc.d_real.bbclass
 create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
 create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
 create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
 create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 create mode 100644 meta/recipes-core/systemd/systemd_196.bb

Koen Kooi (1):
  libpam: register PAM session with logind

Martin Donnelly (1):
  base-files: add fstab for systemd based systems

Radu Moisan (5):
  default-distrovars: Add DISTRO_FEATURES_INITMAN to DISTRO_FEATURES
  default-providers: Automatically set PREFERRED_PROVIDER_udev
  systemd: add systemd recipes
  default-providers: Add systemd option to PREFERRED_PROVIDER_udev
  update-rc.d: disable update-rc.d.bbclass when systemd enabled

Ross Burton (3):
  dbus: respect systemd distro feature
  packagegroup-core-boot: install systemd-compat-units on systemd
    images
  packagegroup-core-boot: only install initscripts if we're using
    sysvinit

 meta/classes/update-rc.d.bbclass                   |   90 +-----
 meta/classes/update-rc.d_real.bbclass              |   89 ++++++
 meta/conf/distro/include/default-distrovars.inc    |    3 +-
 meta/conf/distro/include/default-providers.inc     |    1 +
 .../base-files/base-files/fstab.systemd            |    9 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    7 +-
 meta/recipes-core/dbus/dbus.inc                    |   27 +-
 .../packagegroups/packagegroup-core-boot.bb        |    7 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |   58 ++++
 .../systemd/systemd-compat-units/machineid.service |   16 +
 .../systemd-compat-units/run-postinsts.service     |   17 +
 meta/recipes-core/systemd/systemd-serialgetty.bb   |   45 +++
 .../systemd-serialgetty/serial-getty@.service      |   32 ++
 .../systemd/systemd-systemctl-native.bb            |   15 +
 .../systemd/systemd-systemctl/systemctl            |  126 ++++++++
 .../systemd/systemd/00-create-volatile.conf        |   10 +
 ...emd-analyze-use-argparse-instead-of-getop.patch |  103 ++++++
 ...-analyze-use-GDBus-instead-of-dbus-python.patch |   91 ++++++
 meta/recipes-core/systemd/systemd/modprobe.rules   |   17 +
 .../systemd/systemd/optional_secure_getenv.patch   |   19 ++
 .../systemd-pam-configure-check-uclibc.patch       |   26 ++
 .../systemd/systemd/systemd-pam-fix-execvpe.patch  |   26 ++
 .../systemd/systemd-pam-fix-fallocate.patch        |   82 +++++
 .../systemd/systemd-pam-fix-getty-unit.patch       |   35 ++
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  166 ++++++++++
 .../systemd/systemd/systemd-pam-fix-msformat.patch |  335 ++++++++++++++++++++
 .../recipes-core/systemd/systemd/touchscreen.rules |   18 ++
 .../systemd/systemd/use-rootlibdir.patch           |  107 +++++++
 meta/recipes-core/systemd/systemd/var-run.conf     |    4 +
 meta/recipes-core/systemd/systemd_196.bb           |  249 +++++++++++++++
 .../pam/libpam/pam.d/common-session                |    4 +-
 31 files changed, 1726 insertions(+), 108 deletions(-)
 create mode 100644 meta/classes/update-rc.d_real.bbclass
 create mode 100644 meta/recipes-core/base-files/base-files/fstab.systemd
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units.bb
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service
 create mode 100644 meta/recipes-core/systemd/systemd-compat-units/run-postinsts.service
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty.bb
 create mode 100644 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
 create mode 100644 meta/recipes-core/systemd/systemd-systemctl-native.bb
 create mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
 create mode 100644 meta/recipes-core/systemd/systemd/00-create-volatile.conf
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-systemd-analyze-use-argparse-instead-of-getop.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-Revert-analyze-use-GDBus-instead-of-dbus-python.patch
 create mode 100644 meta/recipes-core/systemd/systemd/modprobe.rules
 create mode 100644 meta/recipes-core/systemd/systemd/optional_secure_getenv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-configure-check-uclibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-execvpe.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pam-fix-msformat.patch
 create mode 100644 meta/recipes-core/systemd/systemd/touchscreen.rules
 create mode 100644 meta/recipes-core/systemd/systemd/use-rootlibdir.patch
 create mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 create mode 100644 meta/recipes-core/systemd/systemd_196.bb

-- 
1.7.10.4



