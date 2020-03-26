Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.32977.1585212877221253327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PO6igQdB;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id d1so6038605wmb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 01:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+1xVhZ+l2zVjIkENypcu5eItYdOwiJYZfZswh0rO7K4=;
        b=PO6igQdBQpi64D6ZzInYP4a26uiWr19fmhi4Dz3RJ0RjDTQnKzmXL40q/vCDd/4X+J
         ZTVg67ySqgnipsiGQPTpQC5gSH1Hazmxd/6HS6VYz4dKJ46z4WdWDb6AHBSZNcmgvf/6
         7sqiGCcz45/lHZnTZ7Gs139kLaaWjO1LlEBV2Sg1rYuy7hF+3avvvGix+jMV9ZxdIs4u
         8pV3EO+Gil6NN4C3b6OItmwIUUGLEMB3W8B5pBMSs9ieOmpZl1rXYJXo2HpM8sfsgfIF
         1ggimobaTUI6uAqXVyuiqu9aXWP8HALhRQoymDpL3ypDmBrCYbG/lfgbdoVVRlpr4vbT
         f8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+1xVhZ+l2zVjIkENypcu5eItYdOwiJYZfZswh0rO7K4=;
        b=Yj4iSn3qrmdPX4T8FB/+iWZs2EN8tr5DyUYqRjw0OaUHmujLHX96orPSOpnqRajAWR
         PsaZKLRRoNdRu8fqAw6Vaq5EMNEoVsJoFOUUJh/VLYW+/7lDdMMBipa8aH5qRljlIbhO
         MfR+OqkkBlEr3SmScBJ78lijU1bqci1XCHKx9jCRGDA5FNS5J/poJEzsRZY4jpmE9OgY
         sw5cu9hdF0CISKRKnouD2jmJRIz39pFMD6jGSun9Au5B1RIfiH8GWkBREkU2855aTfH2
         FhTiNq8ZDsWDN5Hh1dq6fb5z/rAKNC+qqmPKlXFhPyYoRbl3HtHJNpkeEUoOVIha75eR
         Dnig==
X-Gm-Message-State: ANhLgQ2qrY7eo/2BKs1FMyTb4dpKoD7h1BGzzUKRzVWy1elKIaJilPyV
	/Tphc4rHURBh/gjuEWlwIub4vIbC
X-Google-Smtp-Source: ADFU+vuH3D1JoVVSCRFwKXA1A7DzlLbVYDQMORPlGydG2Gq4/ktsNq+x/UragtKv1GtG1LqUdaARxw==
X-Received: by 2002:a1c:988d:: with SMTP id a135mr2186640wme.16.1585212875455;
        Thu, 26 Mar 2020 01:54:35 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id h26sm2484107wmb.19.2020.03.26.01.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 01:54:34 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][RFC PATCH 06/13] systemd: Add PACKAGECONFIG for sysvinit
Date: Thu, 26 Mar 2020 08:54:19 +0000
Message-Id: <20200326085426.117209-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326085426.117209-1-alex.kiernan@gmail.com>
References: <20200326085426.117209-1-alex.kiernan@gmail.com>

Add sysvinit PACKAGECONFIG which is bound to DISTRO_FEATURES, this
then disables all sysvinit handling in systemd if it isn't present.

Consolidate sysvinit handling so that when it's disabled we exclude all
sysvinit features.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- sysvinit: moved update-rc.d RDEPENDS to PACKAGECONFIG

 meta/recipes-core/systemd/systemd_244.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index bb75aa0b9b2b..79794322ba08 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -56,7 +56,7 @@ PAM_PLUGINS = " \
 "
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux usrmerge polkit', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'efi ldconfig pam selinux sysvinit usrmerge polkit', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
     acl \
@@ -165,6 +165,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
+PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,update-rc.d"
 # When enabled use reproducble build timestamp if set as time epoch,
 # or build time if not. When disabled, time epoch is unset.
 def build_epoch(d):
@@ -198,7 +199,6 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
                   -Dnobody-group=nobody \
                   -Drootlibdir=${rootlibdir} \
                   -Drootprefix=${rootprefix} \
-                  -Dsysvrcnd-path=${sysconfdir} \
                   -Ddefault-locale=C \
                   "
 
@@ -234,6 +234,7 @@ do_install() {
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
 		sed -i s%@UDEVD@%${rootlibexecdir}/systemd/systemd-udevd% ${D}${sysconfdir}/init.d/systemd-udevd
+		install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 	fi
 
 	chown root:systemd-journal ${D}/${localstatedir}/log/journal
@@ -273,7 +274,6 @@ do_install() {
 		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
-	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 
 	# If polkit is setup fixup permissions and ownership
 	if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
@@ -562,7 +562,7 @@ FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ $
 
 RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
-RDEPENDS_${PN} += "volatile-binds update-rc.d"
+RDEPENDS_${PN} += "volatile-binds"
 
 RRECOMMENDS_${PN} += "systemd-extra-utils \
                       systemd-compat-units udev-hwdb \
-- 
2.17.1

