Received: from mail-wi0-f181.google.com ([209.85.212.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXNz-00076t-Rj
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:12 +0100
Received: by mail-wi0-f181.google.com with SMTP id hj8so1173866wib.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=cHUG4ODhUZpNfkSBVALfNPzGcc2qfPM2hHp0LxRa6OI=;
	b=ABjndK6hiBO0AzELdKrJu8LPz0oajk6CEe7vuLJS+ST5Qcmy5FzW8EUOJ54EtrW1Mz
	Zl11AXRaSPn46Mi2kwC8YNjZXaccTi2jw+YQFk8mynInv7OGbyPoIrBeGwXEZwQR5bSV
	S1IQQMnl2eiJRbY4vHYMnMtftnKJpeykfpKz9hzkmVuavZ5K7XJ1Esa3xl/EELwauX+U
	9cru8K25r01JcJS13Jf1N8LbyiRKuNSxziedQkY+5mTMm9+Nv2EFtOwnQLRuKgAXnfVG
	CY5qrMp6HdRkWCeNU6Ay1Ni7lJpTX8IpCM+31A1XvBfpOUXJwe4UeeWThtLe7bQkrEMY
	ignA==
X-Received: by 10.180.37.166 with SMTP id z6mr4503957wij.34.1364316792048;
	Tue, 26 Mar 2013 09:53:12 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.10
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:11 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:05 +0000
Message-Id: <b018b30dbe2afb9b58402da228da3c97283b0f33.1364316411.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkidT9yBz8ubCNWSiAWHS1rrd0q4JekR5ErpiR5oJU9SvTMG1aKHJW3D//h9U7UuOwbKXfx
Subject: [PATCH 07/24] systemd: split out the hwdb data
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

The hardware databases are not essential and also quite large, so split them out
into udev-hwdb.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_197.bb |   22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 56ced66..a006ec8 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -180,13 +180,13 @@ RRECOMMENDS_${PN} += "systemd-serialgetty \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils"
+PACKAGES =+ "udev-dbg udev udev-consolekit udev-utils udev-hwdb"
 
 FILES_udev-dbg += "/lib/udev/.debug"
 
 RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
-RRECOMMENDS_udev += "udev-extraconf"
+RRECOMMENDS_udev += "udev-extraconf udev-hwdb"
 
 FILES_udev += "${base_sbindir}/udevd \
                ${base_libdir}/systemd/systemd-udevd \
@@ -209,7 +209,6 @@ FILES_udev += "${base_sbindir}/udevd \
                /lib/udev/rules.d/78*.rules \
                /lib/udev/rules.d/8*.rules \
                /lib/udev/rules.d/95*.rules \
-               ${base_libdir}/udev/hwdb.d \
                ${sysconfdir}/udev \
                ${systemd_unitdir}/system/*udev* \
                ${systemd_unitdir}/system/*.wants/*udev* \
@@ -220,6 +219,8 @@ RDEPENDS_udev-consolekit += "${@base_contains('DISTRO_FEATURES', 'x11', 'console
 
 FILES_udev-utils = "${bindir}/udevadm"
 
+FILES_udev-hwdb = "${base_libdir}/udev/hwdb.d"
+
 # TODO:
 # u-a for runlevel and telinit
 
@@ -239,6 +240,21 @@ update-alternatives --remove shutdown ${base_bindir}/systemctl
 update-alternatives --remove poweroff ${base_bindir}/systemctl
 }
 
+pkg_postinst_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	udevadm hwdb --update
+}
+
+pkg_prerm_udev-hwdb () {
+	if test -n "$D"; then
+		exit 1
+	fi
+
+	rm -f ${sysconfdir}/udev/hwdb.bin
+}
 
 # As this recipe builds udev, respect the systemd DISTRO_FEATURE so we don't try
 # building udev and systemd in world builds.
-- 
1.7.10.4



