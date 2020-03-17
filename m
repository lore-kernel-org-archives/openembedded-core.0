Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 88B5760B47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 15:28:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z12so13317424wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2020 08:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y5ChPQFwhS3dkXOyV9iEoVjtU8gzzmKlQyN3R7O2AxQ=;
	b=THuzy/o2hFPqQr8Gw+QkHOjJ4KeA/yACgGPPOi48u/RoQpoheyWw306hjNb6qyj5Eh
	pVVbDVi8J/rcM+NB0n0qU056Lh5TsQcemGJCqItBC5YykwMJJu3qNrn3rJABmq3zyx4X
	FELP3nhma2JGZRYkDa2RGtEo0SV28c7HTcCpv2pa8bJ/hGgO7+ypdvHlzvzc/2WjBdYN
	dj3b/HUey5zoalF3wdSd/Nf/r7sGuPJRtLMvQvCg7bJXzn/YI9oTfeDwcxYXWO2wSA/v
	hh64EV2zBUFPvEqWdexDnjOk8wdQjhx04ukYyMVW0d3CH6R1Kdjx0TTEV3Pj7cymlYA/
	vK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y5ChPQFwhS3dkXOyV9iEoVjtU8gzzmKlQyN3R7O2AxQ=;
	b=JU4y8AfKMhasGnus0KVWb4wkf95bfpfwaTuIXvF8kQjZRwDuaEjqSqXmJ+fonXPQa1
	FMGO0pjcjEG00/WHqhBOAK3BRFbdrrTVwaE+IYFHAo9mEZdQ/BI2lkkL40abgAbmJ+Qz
	4H/8ML0x3Q5Z2wCyWaS2exLPPt028pDt9WTZVPVfSQ5P/somr75NtyXHr6f2ZLhzNUdJ
	jUMaZW7EtfHsXi8eDJbMizxtF+94FyKAdeGV6ZuZRTdfIWm8D1bHFA56QCLzNSucN9I1
	BOIQhHSko/s8R1ugbJdjR+Deg6q69gxsP3jfbQ3wypME9uwwVuWnj9W41IXZmDhZ3Glj
	d8Dg==
X-Gm-Message-State: ANhLgQ1sQUp1doSG0PVcjRmRauE+tDfTuUcq9Wdf5CIOdFoRDMfsimFW
	0IrHUza8FRSzMw6mE2enEYn/eZOk
X-Google-Smtp-Source: ADFU+vtMBx0HI0P76fdcjFEDzUNbvasZJGcYDlKQJhTOKne3L7j1Jqn5JMsqQJoImy4v/wLZjjWFHA==
X-Received: by 2002:a05:600c:618:: with SMTP id
	o24mr6146197wmm.128.1584458932606; 
	Tue, 17 Mar 2020 08:28:52 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246])
	by smtp.gmail.com with ESMTPSA id c2sm4307128wma.39.2020.03.17.08.28.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2020 08:28:51 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2020 15:22:54 +0000
Message-Id: <20200317152303.4600-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200317152303.4600-1-alex.kiernan@gmail.com>
References: <20200317152303.4600-1-alex.kiernan@gmail.com>
Subject: [RFC PATCH 02/11] systemd: Reinstate systemd-hwdb-update.service
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
X-List-Received-Date: Tue, 17 Mar 2020 15:28:52 -0000

systemd supports a distribution hwdb.bin in /usr/lib/udev/hwdb.bin,
which is used if /etc/udev/hwdb.bin is not present. When generating the
install time hwdb, for systemd, ensure that we put it in /usr/lib/udev,
which then ensures that at boot time we do not regenerate it, unless the
system is marked for update.

This allows fragments dropped into /etc/udev/hwdb.d to be processed
correctly, but without requiring a first boot time build:

root@qemumips:~# systemctl status systemd-hwdb-update.service
* systemd-hwdb-update.service - Rebuild Hardware Database
     Loaded: loaded (/usr/lib/systemd/system/systemd-hwdb-update.service; static; vendor preset: disabled)
     Active: inactive (dead)
  Condition: start condition failed at Wed 2020-03-04 15:18:11 UTC; 44s ago
             |- ConditionPathExists=|!/usr/lib/udev/hwdb.bin was not met
             |- ConditionPathExists=|/etc/udev/hwdb.bin was not met
             `- ConditionDirectoryNotEmpty=|/etc/udev/hwdb.d was not met
       Docs: man:hwdb(7)
             man:systemd-hwdb(8)

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/systemd/systemd_244.3.bb   | 10 ++++------
 scripts/postinst-intercepts/update_udev_hwdb | 16 ++++++++++++++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index bb799831996c..048021000448 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -293,10 +293,6 @@ do_install() {
 	# install default policy for presets
 	# https://www.freedesktop.org/wiki/Software/systemd/Preset/#howto
 	install -Dm 0644 ${WORKDIR}/99-default.preset ${D}${systemd_unitdir}/system-preset/99-default.preset
-
-    # We use package postinsts for the hwdb update, as the update service is
-    # easily triggered for no reason and will slow down boots.
-    find ${D} -name systemd-hwdb-update.service -delete
 }
 
 python populate_packages_prepend (){
@@ -636,7 +632,9 @@ FILES_udev += "${base_sbindir}/udevd \
                ${datadir}/bash-completion/completions/udevadm \
               "
 
-FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
+FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d \
+                   ${systemd_unitdir}/system/systemd-hwdb-update.service \
+                   "
 
 RCONFLICTS_${PN} = "tiny-init ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolvconf', '', d)}"
 
@@ -696,7 +694,7 @@ pkg_prerm_${PN}_libc-glibc () {
 PACKAGE_WRITE_DEPS += "qemu-native"
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX}
+		$INTERCEPT_DIR/postinst_intercept update_udev_hwdb ${PKG} mlprefix=${MLPREFIX} binprefix=${MLPREFIX} rootlibexecdir="${rootlibexecdir}" PREFERRED_PROVIDER_udev="${PREFERRED_PROVIDER_udev}"
 	else
 		udevadm hwdb --update
 	fi
diff --git a/scripts/postinst-intercepts/update_udev_hwdb b/scripts/postinst-intercepts/update_udev_hwdb
index c4fb2bffcbf0..102e99b94725 100644
--- a/scripts/postinst-intercepts/update_udev_hwdb
+++ b/scripts/postinst-intercepts/update_udev_hwdb
@@ -5,5 +5,17 @@
 
 set -e
 
-PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
-chown root:root $D${sysconfdir}/udev/hwdb.bin
+case "${PREFERRED_PROVIDER_udev}" in
+	systemd)
+		UDEV_EXTRA_ARGS="--usr"
+		UDEVLIBDIR="${rootlibexecdir}"
+		;;
+
+	*)
+		UDEV_EXTRA_ARGS=""
+		UDEVLIBDIR="${sysconfdir}"
+		;;
+esac
+
+PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D ${UDEV_EXTRA_ARGS}
+chown root:root $D${UDEVLIBDIR}/udev/hwdb.bin
-- 
2.17.1


