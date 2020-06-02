Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.10912.1591105408163862506
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 06:43:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EmcVeaf7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: rehsack@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id k26so3183787wmi.4
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=3xnOesqar/xuELcBGCD5UL/1qbi24YDv70tWJgvoZH4=;
        b=EmcVeaf7DVYjoqwgvGJTJUzVFyIlv74kBgtaPbgt0x3BsdUBNOvql9Ag4QSAmswGfO
         F/BaEjdQFpvO1KLvbqHuYXgq7UxM70LsniHEME4EUFk2z3kG6MXysGoXNs9+XW9FSWqb
         86OdGichdtUMZqndmcj0mth/AEjfvDgSXLlQNhom3/L1agR55cmAE4wCj3x9vCleXxVC
         NBCy/Ilfm2A0G8OOnZjH1ncqVP3yGEaKddVbDVLAAkDEATZtf0UqV9cnSxlJ/oyWfnRc
         crfyhYOr0dAGOLlrpEvbkdzhbG+ZMCbieRoabcrfjvqb8pmAMjdLU9L3+80osfWBEF22
         BgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=3xnOesqar/xuELcBGCD5UL/1qbi24YDv70tWJgvoZH4=;
        b=dD+3NSTWF5V6U94gQmbdm3kjPteSqLClQAcK19423qIIxCGBb/Sv1Qm3tm5U6gvMpj
         qHaCHH1rCvvok2Kv9R3Tnr5vuDB6HCIg22YYU9NxWRxISA2AdlgGQfGS6ctJHkUNV25y
         5Tojtkccw7Gy1+PO4bhvYZ9P/Lw6X5BbnMT5ByiezKN9jdDS5EH+zfxGG3dz+A0ezYZp
         us55rmcga+MvuSgnj3Tv0OtQMADqR+betGKebQe6IKPZmLdzE4NX/YwRw+IDJT7m4R+t
         jWA3aTbG3sxcjgxkwBoDHDD0TeHSrrbNlW8WUHrEfdfnkyO+UvC63fX2UbEOwRo2qQr8
         NKYw==
X-Gm-Message-State: AOAM531bfCT7NNCDdueDW57KuLKUWiyoH548hfeDK8NmcVV0PuKUeof4
	9WcwckC6o8CjRXtqB8xwZMskgGB0X6g=
X-Google-Smtp-Source: ABdhPJzB/SszNizXwfqHDiwIOOK9Lp79/OJi6bMIvhnZm4zI/2mOXhZVbjqhk8itcVkzmV1TJVrmFw==
X-Received: by 2002:a7b:c84b:: with SMTP id c11mr4109002wml.78.1591105406373;
        Tue, 02 Jun 2020 06:43:26 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id q1sm3505385wmc.12.2020.06.02.06.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 06:43:25 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Otavio Salvador <otavio.salvador@gmail.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH v4 1/2] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Tue,  2 Jun 2020 15:42:55 +0200
Message-Id: <20200602134256.8156-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1

With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
    Author: Yue Tao <Yue.Tao@windriver.com>
    Date:   Fri May 25 10:48:08 2018 +0800

	initscripts: Avoid starting rpcbind daemon twice

	Check the status before start it to avoid duplicates.

the use of a script {/usr/sbin/}service is introduced - maybe earlier
provided by systemd, nowadays mostly by init-system-helpers from
debian project.

For the very first shot, maybe discussions and improvements based
on that script collection, use just the init-system-helpers-service
in initscripts/mountnfs.sh to avoid problems mounting NFS in later
boot stage.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../initscripts/init-system-helpers_1.57.bb   | 46 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 +
 3 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.57.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 51e6da669c..adac9fd824 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -265,6 +265,7 @@ RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-inetutils = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER_pn-init-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-init-system-helpers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-initramfs-boot = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-initramfs-framework = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-initramfs-live-boot = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
new file mode 100644
index 0000000000..d41bb94791
--- /dev/null
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
@@ -0,0 +1,46 @@
+SUMMARY = "helper tools for all init systems"
+DESCRIPTION = "This package contains helper tools that are necessary for switching between \
+the various init systems that Debian contains (e. g. sysvinit or \
+systemd). An example is deb-systemd-helper, a script that enables systemd unit \
+files without depending on a running systemd. \
+\
+It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d\" scripts which \
+provide an abstraction for enabling, disabling, starting, and stopping \
+services for all supported Debian init systems as specified by the policy. \
+\
+While this package is maintained by pkg-systemd-maintainers, it is NOT \
+specific to systemd at all. Maintainers of other init systems are welcome to \
+include their helpers in this package."
+HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
+SECTION = "base"
+LICENSE = "BSD-3-Clause & GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
+
+DEPENDS = "perl"
+
+SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
+SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"
+
+S = "${WORKDIR}/git"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install() {
+	install -d -m 0755 ${D}${sbindir}
+	install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
+	install -m 0755 ${S}/script/service ${D}${sbindir}
+	install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
+}
+
+PACKAGES += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
+
+FILES_${PN} = ""
+FILES_${PN}-invoke-rc.d = "${sbindir}/invoke-rc.d"
+FILES_${PN}-service = "${sbindir}/service"
+FILES_${PN}-update-rc.d = "${sbindir}/update-rc.d"
+
+ALLOW_EMPTY_${PN} = "1"
+
+RDEPENDS_${PN}-update-rc.d = "perl"
+RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1a59b82fbf..4080c4a495 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','
 PACKAGES =+ "${PN}-functions ${PN}-sushell"
 RDEPENDS_${PN} = "initd-functions \
                   ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
+                  init-system-helpers-service \
 		 "
 # Recommend pn-functions so that it will be a preferred default provider for initd-functions
 RRECOMMENDS_${PN} = "${PN}-functions"
-- 
2.17.1

