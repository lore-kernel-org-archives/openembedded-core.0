Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.1111.1608245685497195249
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 14:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q9omxE2j;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id x12so335235plr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hj/Q3D+DtLukIihIwQ4xjAcuVcQbFTVBehHHkvaySwA=;
        b=Q9omxE2jagUKCxDzLHcGi3L/OT7jZj0trqdmVHdcppDcI1Wp9fE6GSP31JHXN1lq0J
         iBCI8bwttyIs/qbyCcL8Af6JNYNMUzhmudrNrKajvJbnRp2qg+b7G4edzYTDnkZwfKgO
         Paamys3iPE5ydHrTYzkwQy8fO9WATsVbxyrzmCUv6NXE57evZQbO1cZ/J6gGz/3yBi/y
         Q/JlUXYF+FZf4Kpv+KLIppzv/9kcAR1oDbqIvuD/sp2RixeCJCIXx/A3diGOw0c0BG9e
         HI6kzWu0V6wpkvBxtFI5eP7WnGwvyJvsylMAzgnQeBL0M9A2vSunPNWXnzvOMlqv+TzY
         UEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hj/Q3D+DtLukIihIwQ4xjAcuVcQbFTVBehHHkvaySwA=;
        b=jZp4ih1885fzE3APb95Z0xr3oCavywgnRPheziLl7UkyjIKRBrUW/R/x9DeEnx/Tgu
         rnaErrVNp/Mn8t8CoYhoXE37cCOvU0gqjPIZ09JP8P2+uWmoTJliZU809sAfcM1gdgcs
         4Yu3i4SDx2/+LSMHj9epV6g5mezp+qBy2Y+eEZ4u4Tufhcmsl+tWlewJPcvPouZCYm7B
         WZ04KndYZgJbCxIl+JKLp1KNj+KWKaIHEzHY8bfV6NLLTgwna4R7ysGbxpL2NixXahdi
         3E16LBvwZogUxvARmSFAHWbUCzHclWueFFtdpRwPN1ceW6yBbWwp+Qls743LCgTkuc+Q
         xEng==
X-Gm-Message-State: AOAM53210FYPJXONjcaKONcfBYxVRP9hWJmr0lHkrDOHLIM+viznOtfT
	Ulhrdc0bnJ/XZv2HU/yZBPoFnV5x71Gfm4iG
X-Google-Smtp-Source: ABdhPJwP4GaFT0L9mdFPm8nu0aL+TzHWuX1QYjfCrB+JoZc9GWCXJzNHTM1PrUleMuRxSZf8JqwWSw==
X-Received: by 2002:a17:90b:815:: with SMTP id bk21mr1357016pjb.21.1608245684784;
        Thu, 17 Dec 2020 14:54:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id u25sm6620428pfn.170.2020.12.17.14.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 14:54:43 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] busybox: Install /etc/default/rcS when used as init system
Date: Thu, 17 Dec 2020 14:54:38 -0800
Message-Id: <20201217225440.2633474-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217225440.2633474-1-raj.khem@gmail.com>
References: <20201217225440.2633474-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps in using sysvinit scripts with busybox init system as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc       | 1 +
 meta/recipes-core/busybox/busybox_1.32.0.bb | 1 +
 meta/recipes-core/busybox/files/rcS.default | 1 +
 3 files changed, 3 insertions(+)
 create mode 100644 meta/recipes-core/busybox/files/rcS.default

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index e0522be729..c3a97261d5 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -312,6 +312,7 @@ do_install () {
 	if grep -q "CONFIG_INIT=y" ${B}/.config; then
 		install -D -m 0755 ${WORKDIR}/rcS ${D}${sysconfdir}/init.d/rcS
 		install -D -m 0755 ${WORKDIR}/rcK ${D}${sysconfdir}/init.d/rcK
+		install -D -m 0755 ${WORKDIR}/rcS.default ${D}${sysconfdir}/default/rcS
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-core/busybox/busybox_1.32.0.bb
index 8e23b0d4a2..3a669444dd 100644
--- a/meta/recipes-core/busybox/busybox_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://getopts.cfg \
            file://resize.cfg \
            ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
+           ${@["", "file://rcS.default"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
            ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
            file://syslog.cfg \
            file://unicode.cfg \
diff --git a/meta/recipes-core/busybox/files/rcS.default b/meta/recipes-core/busybox/files/rcS.default
new file mode 100644
index 0000000000..262cad7d2a
--- /dev/null
+++ b/meta/recipes-core/busybox/files/rcS.default
@@ -0,0 +1 @@
+# SULOGIN = "yes"
-- 
2.29.2

