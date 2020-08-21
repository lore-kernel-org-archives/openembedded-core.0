Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.132078.1598013569795647542
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 05:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GcxRNaXm;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: liu.ming50@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id w2so1283141edv.7
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwRxsZUUI5Q8F7T8UQHhi/jJ6RKusa/O3a0g8NX6Qgk=;
        b=GcxRNaXmNZKvQhbZJxbW775qDtOwMOFtbAUmHQ/S3est6v9KVYVJT1SB7DOJbRC6L/
         Ld1E9kSa0Eht8c9iAtwXgNHp6KD1a1TdoIFZGU9vWJAQIxxJUuTVMfTyve9G0l0G1o3I
         N/WA7nHAWjoEUJzh8htIszeya+1lK1b5GMS7PD8y7uOYTOz6tD5zZ+1v0FBQtIVrtBju
         LRC6eZjH9lPP9C1SkGFU3tHcNteqmsDrnJHeQMSHOzmg9i59MZ2kJ1ZQRLzkY1Ok1q7r
         DgbvXWVAMz5pyB0c3ygOVm7wpM1Bu1uPpOVcbI0pLH4korQRmddM4Zk7MnKK+kSGwY60
         IY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CwRxsZUUI5Q8F7T8UQHhi/jJ6RKusa/O3a0g8NX6Qgk=;
        b=A/qYtsaHRMcuM0REPibedI7oNaEU9Up+GWciW+spdxcYVOISwj9DmRi8NPiMgeYa2z
         XbaoWHTYsxrn6zHbSZ/OA9UuHs04kJi3V+uRHyk584rVMaE7cpoxFVGET1/ilX5i2mRU
         qcb4sr8Ks436VZkwoXwZ2b+C3/AuPwPbf2mCf2JExerF+rHqhvbRW+4FRzI9g4EmRC/C
         9lI7hQEQgzrOmwwv5ww4MJWlLmic6gWwtMC07ZS7J9K/3JfhO1EbZahnDJCEA7E5D2rf
         8eqNu/YPxp8F+XUPUgKwobfw9VJWr3qpS4o+3x3xaM1NMv3+uygVZhl0KDCkJhH5O5AG
         InDA==
X-Gm-Message-State: AOAM530TUa6eGAArMEOccIXIya6hMGEO3FSY0NWmQPxIz6wnIG6iZfgJ
	2njgduZaCorcbzfNzn+8I1Fq+nf5yG3nhw==
X-Google-Smtp-Source: ABdhPJxu6cdhG/YWKmRxJQw5so0bp4RulXOSjBcT/KyTp+5PQeWK566CDHXOZfBVzP32lumCRYF0Pg==
X-Received: by 2002:a50:fb94:: with SMTP id e20mr2626547edq.103.1598013567837;
        Fri, 21 Aug 2020 05:39:27 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from peterliu-Precision-7530.toradex.int (m83-185-33-154.cust.tele2.se. [83.185.33.154])
        by smtp.gmail.com with ESMTPSA id l16sm1209172ejc.49.2020.08.21.05.39.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Aug 2020 05:39:27 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: sergio.prado@toradex.com,
	Ming Liu <ming.liu@toradex.com>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: [OE-core] [PATCH] systemd: split systemd specific udev rules into its own package
Date: Fri, 21 Aug 2020 14:39:12 +0200
Message-Id: <20200821123912.26161-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

In case some other packages need these udev rules but they wont install
systemd, for instance, a issue was found that plymouth needs
71-seat.rules to be present in rootfs or it will fail.

Let systemd RDEPENDS on systemd-udev-rules.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Ming Liu <ming.liu@toradex.com>
---
 meta/recipes-core/systemd/systemd_246.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_246.bb b/meta/recipes-core/systemd/systemd_246.bb
index a463aab1e3..70154fcb8c 100644
--- a/meta/recipes-core/systemd/systemd_246.bb
+++ b/meta/recipes-core/systemd/systemd_246.bb
@@ -324,6 +324,7 @@ PACKAGE_BEFORE_PN = "\
     ${PN}-journal-upload \
     ${PN}-journal-remote \
     ${PN}-extra-utils \
+    ${PN}-udev-rules \
     udev \
     udev-hwdb \
 "
@@ -498,6 +499,13 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
 
+FILES_${PN}-udev-rules = "\
+                        ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
+                        ${rootlibexecdir}/udev/rules.d/71-seat.rules \
+                        ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
+                        ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
+"
+
 CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
 	${sysconfdir}/systemd/journald.conf \
 	${sysconfdir}/systemd/logind.conf \
@@ -553,10 +561,6 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${exec_prefix}/lib/sysusers.d \
                 ${exec_prefix}/lib/environment.d \
                 ${localstatedir} \
-                ${rootlibexecdir}/udev/rules.d/70-uaccess.rules \
-                ${rootlibexecdir}/udev/rules.d/71-seat.rules \
-                ${rootlibexecdir}/udev/rules.d/73-seat-late.rules \
-                ${rootlibexecdir}/udev/rules.d/99-systemd.rules \
                 ${rootlibexecdir}/modprobe.d/systemd.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.timedate1.conf \
                 ${datadir}/dbus-1/system.d/org.freedesktop.locale1.conf \
@@ -571,7 +575,7 @@ FILES_${PN} = " ${base_bindir}/* \
 
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) util-linux-agetty util-linux-fsck"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount util-linux-umount udev (= ${EXTENDPKGV}) systemd-udev-rules util-linux-agetty util-linux-fsck"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)}"
 RDEPENDS_${PN} += "volatile-binds"
 
-- 
2.28.0

