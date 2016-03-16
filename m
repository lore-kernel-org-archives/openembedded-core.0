Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 55F2260616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 09:42:48 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so181327235wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:cc:to:mime-version;
	bh=A8PfTrr1+N1hZLUx5XpvSyhlTHMtbmuriBfpyhYLNKI=;
	b=c+57sIusZsPGTdZ5dj1YVA5T4hEGSE7GfJC6YP5ZPb6+IZN2mKnS0QIkGhPk8VLdLf
	F4tl+tthdQzWouj7Naunvq20mlC7N8+EKp0r++bSlETetTO2ku9/Sf9jhbfDCH350k8H
	MsIetRh0SbnnSSWgIqDFrXHdsxewQ/EvwqKYOCoyWdS7ekFm+zAuLSYsnkUcYZzho4FI
	xQ1XlGxVNe1+mChg3UW7h3h/6PFPcAnyFMZLAjWdoHqKyQRxp7jIrDAfXqO/DKfB7zhE
	GjypQg+sdxBT4PPz0CPikAV19X0akTlGhTZnbQvGnh4zptobLVI9HqX/4+mPxwqR0Txo
	oVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:cc:to:mime-version;
	bh=A8PfTrr1+N1hZLUx5XpvSyhlTHMtbmuriBfpyhYLNKI=;
	b=ZpAGVFTGuZHUR0DIQRYkLOR1BD40/wOaaiXlxTwM2EjNzwz+bRj81o2wYPLEuFm5hE
	KtICoKAiBb4lUWn3c/8CVsAi4YKBFkrhbyC0Zzfub87fnxv5GepOyq1t227ONmYzYFsc
	jHUZK4aVE+aRgKxzhus2BLOs3QOZs+TxliRol9NFqvCDTwhVSFalUQsoat/5k4ZyXeRb
	98X/8oLIZiteEEvmQpGFwOOmCPQmEx8z910tsIzleJZsaUf1eid3mSXIf6r9ei8Iimos
	M1UfEz9nIiIO8o0S6jeWrrRyYceA08xQvb91bNfU4xXZXffsvZYPLUn7JCrZhKvtvN8Z
	iVLg==
X-Gm-Message-State: AD7BkJKs7WVAXSizV4LES7tA+OoYgONbW9DVpXA0+Dk78jlHKjCAOtB/x2YOSXKvwjoMEg==
X-Received: by 10.194.90.137 with SMTP id bw9mr2648587wjb.120.1458121368842;
	Wed, 16 Mar 2016 02:42:48 -0700 (PDT)
Received: from walter.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	c128sm24606992wma.11.2016.03.16.02.42.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 02:42:48 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Wed, 16 Mar 2016 10:42:47 +0100
Message-Id: <2607CCC1-5299-4C5F-A9A0-95E6F3C54C5F@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: [PATCH 3/4] wpa-supplicant: use debian wpa contribution to improve ifup/ifdown
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
X-List-Received-Date: Wed, 16 Mar 2016 09:42:53 -0000
X-Groupsio-MsgNum: 79679
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EA98934F-08F0-496D-8EEE-E0A89987D622";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_EA98934F-08F0-496D-8EEE-E0A89987D622
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Instead of simplified, self-written start/stop hooks for wpa-supplicant =
on
interfaces coming up or going down, use the more advanced hooks provided
by the debian contribution.

Since the default behavior in the debian start/stop hooks is log into =
syslog,
which is more reasonable for embedded devices either (usually no user =
interface
available), follow this behavior and enable CONFIG_DEBUG_SYSLOG.

Add a package for ifplugd action hooks, if desired and install man-pages
as well for a reasonable wpa-supplicant-doc.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../wpa-supplicant/wpa-supplicant/defconfig        |  4 +-
 .../wpa-supplicant/wpa-supplicant.sh               | 85 =
----------------------
 .../wpa-supplicant/wpa-supplicant_2.5.bb           | 47 ++++++++----
 3 files changed, 36 insertions(+), 100 deletions(-)
 delete mode 100644 =
meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh

diff --git =
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
index f04e398..217cf61 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig
@@ -418,9 +418,9 @@ CONFIG_CTRL_IFACE_DBUS_NEW=3Dy
 #CONFIG_DEBUG_FILE=3Dy

 # Send debug messages to syslog instead of stdout
-#CONFIG_DEBUG_SYSLOG=3Dy
+CONFIG_DEBUG_SYSLOG=3Dy
 # Set syslog facility for debug messages
-#CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON
+CONFIG_DEBUG_SYSLOG_FACILITY=3DLOG_DAEMON

 # Add support for sending all debug messages (regardless of debug =
verbosity)
 # to the Linux kernel tracing facility. This helps debug the entire =
stack by
diff --git =
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.s=
h =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.s=
h
deleted file mode 100644
index 5c9e5d3..0000000
--- =
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.s=
h
+++ /dev/null
@@ -1,85 +0,0 @@
-#!/bin/sh
-
-
-WPA_SUP_BIN=3D"/usr/sbin/wpa_supplicant"
-WPA_SUP_PNAME=3D"wpa_supplicant"
-WPA_SUP_PIDFILE=3D"/var/run/wpa_supplicant.$IFACE.pid"
-WPA_SUP_OPTIONS=3D"-B -P $WPA_SUP_PIDFILE -i $IFACE"
-
-VERBOSITY=3D0
-
-
-if [ -s "$IF_WPA_CONF" ]; then
-	WPA_SUP_CONF=3D"-c $IF_WPA_CONF"
-else
-	exit 0
-fi
-
-if [ ! -x "$WPA_SUP_BIN" ]; then
-
-	if [ "$VERBOSITY" =3D "1" ]; then
-		echo "$WPA_SUP_PNAME: binaries not executable or missing =
from $WPA_SUP_BIN"
-	fi
-
-	exit 1
-fi
-
-if [ "$MODE" =3D "start" ] ; then
-	# driver type of interface, defaults to wext when undefined
-	if [ -s "/etc/wpa_supplicant/driver.$IFACE" ]; then
-		IF_WPA_DRIVER=3D$(cat =
"/etc/wpa_supplicant/driver.$IFACE")
-	elif [ -z "$IF_WPA_DRIVER" ]; then
-
-		if [ "$VERBOSITY" =3D "1" ]; then
-			echo "$WPA_SUP_PNAME: wpa-driver not provided, =
using \"wext\""
-		fi
-
-		IF_WPA_DRIVER=3D"wext"
-	fi
-
-	# if we have passed the criteria, start wpa_supplicant
-	if [ -n "$WPA_SUP_CONF" ]; then
-
-		if [ "$VERBOSITY" =3D "1" ]; then
-			echo "$WPA_SUP_PNAME: $WPA_SUP_BIN =
$WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
-		fi
-
-		start-stop-daemon --start --quiet \
-			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN =
--pidfile $WPA_SUP_PIDFILE \
-			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D =
$IF_WPA_DRIVER
-	fi
-
-	# if the interface socket exists, then wpa_supplicant was =
invoked successfully
-	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
-
-		if [ "$VERBOSITY" =3D "1" ]; then
-			echo "$WPA_SUP_PNAME: ctrl_interface socket =
located at $WPA_COMMON_CTRL_IFACE/$IFACE"
-		fi
-
-		exit 0
-
-	fi
-
-elif [ "$MODE" =3D "stop" ]; then
-
-	if [ -f "$WPA_SUP_PIDFILE" ]; then
-
-		if [ "$VERBOSITY" =3D "1" ]; then
-			echo "$WPA_SUP_PNAME: terminating $WPA_SUP_PNAME =
daemon"
-		fi
-
-		start-stop-daemon --stop --quiet \
-			--name $WPA_SUP_PNAME --pidfile	$WPA_SUP_PIDFILE
-
-		if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
-			rm -f $WPA_COMMON_CTRL_IFACE/$IFACE
-		fi
-
-		if [ -f "$WPA_SUP_PIDFILE" ]; then
-			rm -f $WPA_SUP_PIDFILE
-		fi
-	fi
-
-fi
-
-exit 0
diff --git =
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
index 935c8af..fa40c57 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.5.bb
@@ -19,8 +19,8 @@ SYSTEMD_SERVICE_${PN} =3D "wpa_supplicant.service =
wpa_supplicant-nl80211@.service
 SYSTEMD_AUTO_ENABLE =3D "disable"

 SRC_URI =3D "http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
+           =
http://snapshot.debian.org/archive/debian/20151115T033945Z/pool/main/w/wpa=
/wpa_2.3-2.3.debian.tar.xz;name=3Dwpa-debian \
            file://defconfig \
-           file://wpa-supplicant.sh \
            file://wpa_supplicant.conf \
            file://wpa_supplicant.conf-sane \
            file://99_wpa_supplicant \
@@ -28,11 +28,15 @@ SRC_URI =3D =
"http://w1.fi/releases/wpa_supplicant-${PV}.tar.gz  \
 SRC_URI[md5sum] =3D "96ff75c3a514f1f324560a2376f13110"
 SRC_URI[sha256sum] =3D =
"cce55bae483b364eae55c35ba567c279be442ed8bab5b80a3c7fb0d057b9b316"

+SRC_URI[wpa-debian.md5sum] =3D "38dedea3056ee103fb70c544ae1b99b8"
+SRC_URI[wpa-debian.sha256sum] =3D =
"aebdeda11461e93d7f37df5f45643a3fc3c203853c884d983ed4f558604f0b2f"
+
 S =3D "${WORKDIR}/wpa_supplicant-${PV}"

-PACKAGES_prepend =3D "wpa-supplicant-passphrase wpa-supplicant-cli "
+PACKAGES_prepend =3D "wpa-supplicant-passphrase wpa-supplicant-cli =
wpa-supplicant-ifplugd "
 FILES_wpa-supplicant-passphrase =3D "${bindir}/wpa_passphrase"
 FILES_wpa-supplicant-cli =3D "${sbindir}/wpa_cli"
+FILES_wpa-supplicant-ifplugd =3D "${sysconfdir}/ifplugd/action.d/ =
${sysconfdir}/wpa_supplicant/action_wpa.sh"
 FILES_${PN} +=3D "${datadir}/dbus-1/system-services/*"
 CONFFILES_${PN} +=3D "${sysconfdir}/wpa_supplicant.conf"

@@ -62,12 +66,16 @@ do_compile () {
 	unset CFLAGS CPPFLAGS CXXFLAGS
 	sed -e "s:CFLAGS\ =3D.*:& \$(EXTRA_CFLAGS):g" -i =
${S}/src/lib.rules
 	oe_runmake -C wpa_supplicant
+
+        cd "${WORKDIR}/debian"
+        sed -i -e 's,"/sbin/wpa,"/usr/sbin/wpa,g' ifupdown/functions.sh
 }

 do_install () {
 	install -d ${D}${sbindir}
-	install -m 755 wpa_supplicant/wpa_supplicant ${D}${sbindir}
-	install -m 755 wpa_supplicant/wpa_cli        ${D}${sbindir}
+	install -m 755 wpa_supplicant/wpa_supplicant         =
${D}${sbindir}
+	install -m 755 wpa_supplicant/wpa_cli                =
${D}${sbindir}
+	install -m 755 ${WORKDIR}/debian/ifupdown/wpa_action =
${D}${sbindir}

 	install -d ${D}${bindir}
 	install -m 755 wpa_supplicant/wpa_passphrase ${D}${bindir}
@@ -78,21 +86,34 @@ do_install () {
 	install -d ${D}${sysconfdir}
 	install -m 600 ${WORKDIR}/wpa_supplicant.conf-sane =
${D}${sysconfdir}/wpa_supplicant.conf

-	install -d ${D}${sysconfdir}/network/if-pre-up.d/
-	install -d ${D}${sysconfdir}/network/if-post-down.d/
-	install -d ${D}${sysconfdir}/network/if-down.d/
-	install -m 755 ${WORKDIR}/wpa-supplicant.sh =
${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
-	cd ${D}${sysconfdir}/network/ && \
-	ln -sf ../if-pre-up.d/wpa-supplicant =
if-post-down.d/wpa-supplicant
+	install -d ${D}${sysconfdir}/wpa_supplicant/
+        install -m 755 ${WORKDIR}/debian/ifupdown/action_wpa.sh =
${D}${sysconfdir}/wpa_supplicant/
+        install -m 644 ${WORKDIR}/debian/ifupdown/functions.sh =
${D}${sysconfdir}/wpa_supplicant/
+        install -m 755 ${WORKDIR}/debian/ifupdown/wpasupplicant.sh =
${D}${sysconfdir}/wpa_supplicant/ifupdown.sh
+
+	for nethook in if-up.d if-pre-up.d if-post-down.d if-down.d; do
+            install -d ${D}${sysconfdir}/network/${nethook}/
+            (cd ${D}${sysconfdir}/network/ && \
+                ln -sf ../../wpa_supplicant/ifupdown.sh =
${nethook}/wpa-supplicant)
+        done
+
+	install -d ${D}${sysconfdir}/ifplugd/action.d/
+        (cd ${D}${sysconfdir}/ifplugd/action.d/ && ln -sf =
../../wpa_supplicant/action_wpa.sh action_wpa)
+
+        install -d ${D}${mandir}/man5 ${D}${mandir}/man8
+        install -m 0644 =
wpa_supplicant/doc/docbook/wpa_supplicant.conf.5 ${D}${mandir}/man5/
+        install -m 0644 wpa_supplicant/doc/docbook/wpa_passphrase.8 =
wpa_supplicant/doc/docbook/wpa_supplicant.8 \
+            wpa_supplicant/doc/docbook/wpa_cli.8 =
${WORKDIR}/debian/ifupdown/wpa_action.8 \
+            ${D}${mandir}/man8/

 	install -d ${D}/${sysconfdir}/dbus-1/system.d
-	install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf =
${D}/${sysconfdir}/dbus-1/system.d
+	install -m 644 wpa_supplicant/dbus/dbus-wpa_supplicant.conf =
${D}/${sysconfdir}/dbus-1/system.d
 	install -d ${D}/${datadir}/dbus-1/system-services
-	install -m 644 ${S}/wpa_supplicant/dbus/*.service =
${D}/${datadir}/dbus-1/system-services
+	install -m 644 wpa_supplicant/dbus/*.service =
${D}/${datadir}/dbus-1/system-services

 	if =
${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; =
then
 		install -d ${D}/${systemd_unitdir}/system
-		install -m 644 ${S}/wpa_supplicant/systemd/*.service =
${D}/${systemd_unitdir}/system
+		install -m 644 wpa_supplicant/systemd/*.service =
${D}/${systemd_unitdir}/system
 	fi

 	install -d ${D}/etc/default/volatiles
--
2.6.3

The counterpart (cf88eed - dnsmasq: steal resolvconf support from =
Ubuntu) is in master-next of meta-oe
and will be hopefully pushed to master (heard nothing contrary ...)

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_EA98934F-08F0-496D-8EEE-E0A89987D622
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW6SqXAAoJEESZlq7c5QqdZnEQAK7I/PXqeth3FoIuUrgazbKS
VZvUNEnc9e2Hlyk7LOmTYMZqnhdWLWFoJ9Uje+qtvrVwRtqANJmOAAZKluarz0oU
WwIg7ALoufIL+el0AYlJWZ6BVTLj4RbaIntFA51RPy+XeIZU4ZfI4OusmPvxblRO
HMhb4MWsyTVQc0BdgM5e34w3To5iBrLGYOmg3Z7FBfQsAqcP/Y/a687TiClyhPIA
0bQO3+bZtOSH84AnTSQTxyNvqzuIcxcBFqi8ddXEGMtskGix3jdIr9ttLBBnMvh7
AGCbk7NCNcAtUUT2zVglAjzi33comRSWm81C/6xAc5cJw5sDVZGRdhFHArA+uyLK
XzpiK8ntLZEudB+Gb3Muwlc2wX3zwuMcLt6wF4BjNztcfIXCkby+JhUzp/31j9or
DD/AiW/yR4IWcRSB/+KEWQc7xBO4FvdrVteWTq8zKqWWHAOFmo/KTj6N5g243Zl7
sBcz1/gdhdeyNj0M10QacZKuBJcXLCmR7hAxdn7QVbxN21JWHf4bhqmycwGokTy0
yLXNmHoWg+wFld+ZmXjv5IYuiJLktqtCWLqEtVvV4srdnY6er/jPJnBXMxVRtm2V
4Ur3My0o/AeRfHgO/yCwcHuxQNj1AL/VPAwTl0R2exJUw3MllcUC0FiN3P1hO8GT
VSbO2SNwstHcQdAifrkv
=XuNq
-----END PGP SIGNATURE-----

--Apple-Mail=_EA98934F-08F0-496D-8EEE-E0A89987D622--
