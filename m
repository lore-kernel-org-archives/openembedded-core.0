Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7UB6-00064x-Mv
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 18:06:57 +0100
Received: by mail-wg0-f42.google.com with SMTP id 12so2873560wgh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 08:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=1TYX4J8bYdwALaWnCfzRtD7d/hk+0HYJIHzRmZx28CE=;
	b=CSBX4h4rKrZ+pbqIIQlavdVqA/tNk9vhkJc5qjFQdOu2jYir2JokP8eIqwG7P4bwPm
	DFjynoieQPgWgX48Q7Cy+HzLCIRBpZXAIT+d/etEXrIQDSBfH/E+jOXkLqqVzfBU6eK5
	ajSyMrqU6XoU/2APkXzWZn/m8UpcsiP2Bxhuegn5uJAn/p1UrHqj3unSCStUi71dBV2H
	McFe/la9iI6gFP7KiyJbTgzuLGa7J4gIdLDc+715x8WOTGuiqFQU0rorjXI2j4gueq8g
	wfcBEVLS3osWWkfIEu6TrLdZZKw4ztnRcVF13anQ39QESammRM/vkV3PjQqF29OiwvcA
	yChQ==
X-Received: by 10.180.79.37 with SMTP id g5mr21549245wix.24.1361206248425;
	Mon, 18 Feb 2013 08:50:48 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bg5sm22771727wib.8.2013.02.18.08.50.46
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 08:50:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 16:48:30 +0000
Message-Id: <1361206110-32463-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQmbMynHvqyVciF6bezdmrhcnQrL+HgzLWxk4UWj3SKLt0aXxsvuDSeB1bgjBiYr8jSbA8KT
Subject: [PATCH] systemd: merge udev-systemd into udev
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
X-List-Received-Date: Mon, 18 Feb 2013 17:07:00 -0000

Merge the contents of udev-systemd, which is just the service files, into udev
itself.  This split wasn't intended to every happen in oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 0c3ebc4..675545f 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -171,7 +171,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "dbus udev-systemd"
+RDEPENDS_${PN} += "dbus"
 
 # kbd -> loadkeys,setfont
 # systemd calls 'modprobe -sab --', which busybox doesn't support due to lack
@@ -188,7 +188,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils"
 
 FILES_udev-dbg += "/lib/udev/.debug"
 
@@ -219,6 +219,8 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/95*.rules \
                ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
               "
 
 FILES_udev-consolekit += "/lib/ConsoleKit"
@@ -226,9 +228,6 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${bindir}/udevadm"
 
-FILES_udev-systemd = "${systemd_unitdir}/system/*udev* ${systemd_unitdir}/system/*.wants/*udev*"
-RDEPENDS_udev-systemd = "udev"
-
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.10.4



