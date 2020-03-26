Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.32992.1585212875403170845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NH74Tm3s;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id c81so5547763wmd.4
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2AszMdQ1gbGQKCxDQ1zC4+Vi1jNAcM4kD4wuNBhrtwA=;
        b=NH74Tm3sZy9OX1s4yVUsw72BW/FUcheRviE41qop8Gq0CxwOqthGnpCO6xHlcuhsEB
         Igcp1idtAp32l3kCpHTojWYclQ3LWz4+AgxIBI4WJq0kKov5frGcL7DG3LLEQ/QfSQGc
         ZnWYpEoRIyYRhAMVmkAKU58qY4ipFX8zHgM0KQSj4E7pothd1dAK+guo5XRFLPSNDulU
         1VQ0GsNuEwZYYAr8UYf6yW2CsjLmKRNx1RaM5h3oPUbkkqzGL3bohp3uYE/umSDbS9Ra
         KqziOrGxufJMkPs6mJNRuGy6haQ6pzo62+xz9hSfBKgv3KVNtumqqq2jFwkInZA7O/nK
         PCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2AszMdQ1gbGQKCxDQ1zC4+Vi1jNAcM4kD4wuNBhrtwA=;
        b=jsdXG3pHrwF9hqD0LFnjOvm8ymTxXDKOpEBPVlvohGr66dldRTPh/m/itfSMKXEIzX
         j/06SAkwEZF8RjmzivSZNldHFk9F4sxPEjI+XmVvOiemwd3oCWIYnG6HiylsFdFcBNxy
         ZxQ2+RuzuLNrcGf1cEMzzNUU6EBQhmAXrOwb8YxK0b8TtwlYg+sYRL8ZnIL4vVH+nIQe
         tB1Of/g03NKkwHB9IaI7ISWUGphJzLra7LTbjzKbWwX02MMWZK8GVdYFXXIqjv7n3vUj
         iyO8eDJXxa7IyPFw5ES0HLNYT7mHHuLwm/ZujjlG2uq2EwfmltUMLjSiD7jcv6KZw54d
         +1JA==
X-Gm-Message-State: ANhLgQ3rcTMJjCorCUfaTyaTZrpZwDzANQK16JDX692hUHZx3/azK4zN
	QdMPnZzn9lbCo7C62WSLdAXUCLj6
X-Google-Smtp-Source: ADFU+vtu+eIFfH7C9upj/19PNnZ2kiLRgTahsXG9XK7vJjHd/XYYDHjQlgInnwms2TLm9q1eulL2mQ==
X-Received: by 2002:a1c:f407:: with SMTP id z7mr1975560wma.36.1585212873600;
        Thu, 26 Mar 2020 01:54:33 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:33 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 04/13] systemd: Reinstate systemd-hwdb-update.service
Date: Thu, 26 Mar 2020 08:54:17 +0000
Message-Id: <20200326085426.117209-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

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
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

 meta/recipes-core/systemd/systemd_244.3.bb   | 10 ++++------
 scripts/postinst-intercepts/update_udev_hwdb | 16 ++++++++++++++--
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index 214eee316b63..4ee20f85c21f 100644
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

