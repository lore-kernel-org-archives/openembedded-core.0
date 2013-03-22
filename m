Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6EU-0007fr-09
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:27 +0100
Received: by mail-wi0-f174.google.com with SMTP id hj8so28065wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=SgfdDX4Q7LQZUxidWPESHVcmWite6DutaZ6N72gfAEI=;
	b=nugFeOLzbgq7kt3X9fxAvTMPvrK+2slfwOflegbTkRAykHJy/Bud5WmAegG/5NfpMR
	yvcTY80oYTg0dDMW0ESFrh2nCKPKRt3n5pzgMykRuLSunm1D0qIQ4HnxdVhIPQjwGkQQ
	JyRBTKkK6Q6bvRgShYF+EMqD284ICOJyV5CMHz36JrZaZpc/YxCsPvxHCuTx0Id+rZ4T
	Ci0uiYORZnwsX3w+xZwz0xNwjP3/qryGueYOdciHEHhsacyE15piSKIlfkc7EjAuMZyq
	+otOIdSZ1mN+wUexyKQAVYWGg6heBVVewRAn5dlBwA26hjJIEIXXOuvPflkpU5wNTkof
	3vFQ==
X-Received: by 10.194.81.40 with SMTP id w8mr4770122wjx.14.1363974091307;
	Fri, 22 Mar 2013 10:41:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.29
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:24 +0000
Message-Id: <e2f22f9f6827dec810d23e8dc9b41606feb2a79a.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlljCIyCn90nqEzKOkTerkudLteFE+Hoz9S8pMFHyry1kutcy6LfdPoRjcaqKHLPqwFbjiL
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/22] systemd: merge udev-systemd into udev
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
X-List-Received-Date: Fri, 22 Mar 2013 17:58:35 -0000

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



