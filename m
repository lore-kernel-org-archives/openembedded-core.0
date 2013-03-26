Received: from mail-we0-f176.google.com ([74.125.82.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXNv-00076j-Ns
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:11 +0100
Received: by mail-we0-f176.google.com with SMTP id s43so2144304wey.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=SgfdDX4Q7LQZUxidWPESHVcmWite6DutaZ6N72gfAEI=;
	b=c/PhHrGWOoDWeoHi6cpCHb26P4wetPFN8jY+GPMtBGyDM7dEn41lCgcbfm3++YGKtS
	7GnwBaFq8ZrGMjyhzgb4XbPRK69efLwHIYxpJ+Mf7ilXrJ1SuxhxPuV5aK40Snevxs2O
	19wfmGucamTV1k78pSyfGTlu8XEsM6+KsbUYK2hrh9knIAe1Rnn5oxvYDSjChV9gxwzF
	dSnFtdvLTx8GA3XiK0Ah73JDZxXc31onNpoxuuq1LFvEhGy9OY1ZOdDZLL+b0bqjJIgp
	MYBjdt5WPwa3jTz4sRwIr2wdHdVRadqqStZ4EcBMaTstxBUNUQ6m/4nE9PioVZCf+EIM
	XkEg==
X-Received: by 10.180.39.207 with SMTP id r15mr4570140wik.16.1364316788110;
	Tue, 26 Mar 2013 09:53:08 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.06
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:02 +0000
Message-Id: <b1187f8f99368c9936f2d6b43766c25f6dabeeb0.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkD4Z63R5gGSVcUCsvLPzrcE1yl63mYdVUcO0TrRs0mWnQBAxONIi3Foofx4KDBv8AMwPva
Subject: [PATCH 04/24] systemd: merge udev-systemd into udev
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:18 -0000

Merge the contents of udev-systemd, which is just the service files, into udev
itself.  This split wasn't intended to ever happen in oe-core.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index dc54f36..9a66a4e 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -173,7 +173,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "dbus udev-systemd"
+RDEPENDS_${PN} += "dbus"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty \
                       util-linux-agetty \
@@ -181,7 +181,7 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-systemd"
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils"
 
 FILES_udev-dbg += "/lib/udev/.debug"
 
@@ -212,6 +212,8 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/95*.rules \
                ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
+               ${systemd_unitdir}/system/*udev* \
+               ${systemd_unitdir}/system/*.wants/*udev* \
               "
 
 FILES_udev-consolekit += "/lib/ConsoleKit"
@@ -219,9 +221,6 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${bindir}/udevadm"
 
-FILES_udev-systemd = "${systemd_unitdir}/system/*udev* ${systemd_unitdir}/system/*.wants/*udev*"
-RDEPENDS_udev-systemd = "udev"
-
 # TODO:
 # u-a for runlevel and telinit
 
-- 
1.7.10.4



