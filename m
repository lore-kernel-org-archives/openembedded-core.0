Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7fO-00007h-6e
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:41:46 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so4037996pbc.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=QyuSCtKUtry1SKjiS2iFaCKt0xcvD+a5CjcA/xw2Tdw=;
	b=Zrkul74Kqdtnnqnvw47l/Xy9Lk/mymW02tURwTIbGjmbFIzpsbWKBZfI+EjeBt718B
	5uz9Yy8aDqdrX+n+ufkMEguJoUtlrnJpDYn/8+NruI/uagBXuJ+HxvhQcKf175oJyUxR
	5fh86E85fu3gjqdSPG2fLCXqwRv4HaXhrMQeYtriWyeYDttavqL8G5oPvsGEZ9fzEt/r
	2qbdXxlPR7R6IOw768Rwq7n60KdPJxbcHF3nxMqyt4v+Y/xNmNjbDK4ACHHvVJwGpQ99
	IHi43bu06PXRd/5CDgzBze3UfFmZu0wbBU3zqOhnScN7wg69TAAmbcZJSvfIvhXRndZM
	KV2g==
X-Received: by 10.68.239.3 with SMTP id vo3mr24447574pbc.184.1363026306584;
	Mon, 11 Mar 2013 11:25:06 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.03
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:43 -0700
Message-Id: <cover.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQlMKfglYZFS6SEfnIrGjlVrMfNUv8Ap7KYYYyGWv/85V1JEpMIuEwwS+HWYlSQuqffo8eHg
Subject: [PATCH 00/12] safe systemd patches
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
X-List-Received-Date: Mon, 11 Mar 2013 18:41:48 -0000
X-List-Received-Date: Mon, 11 Mar 2013 18:41:48 -0000

Hi,

This series is a set of simple/safe systemd related patches.  I've a follow-up series to
implement hybrid system/sysvinit.

Ross

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/systemd-safe

for you to fetch changes up to 1fd5b960dd36458b7b829f9094df18cd8b5ac201:

  systemd: remove libsystemd-daemon linkage in libudev (2013-03-11 10:59:54 -0700)

----------------------------------------------------------------
Ross Burton (12):
      connman: explicitly disable systemd if we don't want it enabled
      polkit: explicitly disable systemd if we're using consolekit
      xf86-video-intel: add explicit dependency on udev
      avahi: explicitly disable systemd if we don't want it enabled
      xkeyboard-config: remove long-gone build dependencies
      systemd-compat-units: add missing systemd-systemctl-native dependency
      busybox: enable swapon -p (91 byte increase)
      systemd: busybox's swapon now supports -p
      systemd: remove util-linux-mount dependency
      systemd: set the location of the kill binary
      util-linux: disable systemd support
      systemd: remove libsystemd-daemon linkage in libudev

 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-core/busybox/busybox-1.20.2/defconfig |    2 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |    2 +
 .../systemd/systemd/udev-linkage.patch             |   62 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |    8 +--
 meta/recipes-core/util-linux/util-linux.inc        |    1 +
 meta/recipes-extended/polkit/polkit_0.104.bb       |    5 +-
 .../xorg-driver/xf86-video-intel_2.21.0.bb         |    2 +-
 .../xorg-driver/xf86-video-intel_git.bb            |    2 +-
 .../xorg-lib/xkeyboard-config_2.8.bb               |    2 +-
 11 files changed, 76 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/udev-linkage.patch

Ross Burton (12):
  connman: explicitly disable systemd if we don't want it enabled
  polkit: explicitly disable systemd if we're using consolekit
  xf86-video-intel: add explicit dependency on udev
  avahi: explicitly disable systemd if we don't want it enabled
  xkeyboard-config: remove long-gone build dependencies
  systemd-compat-units: add missing systemd-systemctl-native dependency
  busybox: enable swapon -p (91 byte increase)
  systemd: busybox's swapon now supports -p
  systemd: remove util-linux-mount dependency
  systemd: set the location of the kill binary
  util-linux: disable systemd support
  systemd: remove libsystemd-daemon linkage in libudev

 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 meta/recipes-core/busybox/busybox-1.20.2/defconfig |    2 +-
 meta/recipes-core/systemd/systemd-compat-units.bb  |    2 +
 .../systemd/systemd/udev-linkage.patch             |   62 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |    8 +--
 meta/recipes-core/util-linux/util-linux.inc        |    1 +
 meta/recipes-extended/polkit/polkit_0.104.bb       |    5 +-
 .../xorg-driver/xf86-video-intel_2.21.0.bb         |    2 +-
 .../xorg-driver/xf86-video-intel_git.bb            |    2 +-
 .../xorg-lib/xkeyboard-config_2.8.bb               |    2 +-
 11 files changed, 76 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/udev-linkage.patch

-- 
1.7.10.4



