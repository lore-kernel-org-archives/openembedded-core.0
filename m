Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6913.1588601414526155818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 07:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rAGXhDuE;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: rehsack@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id i10so21086182wrv.10
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=6nNSjqslGSwrtDBJDL5tfsQWfw0IiqK0MvG49c95fk0=;
        b=rAGXhDuEUSopVpkAyxhAWhjRY6F5Q/6tf8is9MQaG5wSf1SNxIDgGD7+xXOIyLmeV4
         mJR28KLGhvaZ+o7MABGvYxsacdN4GwdCZI95GGq41WxxV/iKpsmnzMC0YBhGIDNMhTfB
         7PiOL5k4rlbNR6monas+yv/Zge0162EvFk/ipwvWr+jBXIqpuOljLL14yElGkUE/D7Sf
         zmEytjuy7HpkXsnX2bu371ys4YkbOu9z0DgXsxRuV5MANDUxMmYzbiRiMDTNhdA5wR+I
         oPjltFf1nVyH+0rEbw3ER44B7KWcCatI1U49Lyon80n/EeX2FIzI4nuSYgRLYc1F4COh
         /iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=6nNSjqslGSwrtDBJDL5tfsQWfw0IiqK0MvG49c95fk0=;
        b=Y/MG6FF6ksfZ2+dw8jjIsYP06yKCyAOCL7gsuaAE1yMqjxoofzZTj4MSNF4Irnwcp/
         mGZE+A+4TWJt4NzSOVo2q+isl3K8cBk2tDoATkfr+kF7KZ71L+8xdmdUcSESQvoiqXze
         oIDnLCUOEjPZr7I1ih1yT8r8FuplcPQvp2BiwCPNOII3jqjMPlULWWkXGtPqVI7u1lna
         pL3Wr5OKGqQY4DQBc1VrCt/SCz9FKiRnWy3I56sfzWuNwdISXVkXdWa9V8z1AWyFF7Ga
         fFOTgpSGWnHV172BtLmzq4jUnOPZjt75gWX6zku/9JgkNobuAHCEy/YzMR1JFSsZTGPu
         TLiQ==
X-Gm-Message-State: AGi0PuZrkTKzfevGZRBYpWCpYpC+zs1u/TfcmazTGVkv2kTscoS9EQOB
	bniC7VxNJE8YFnr0iD/qKv1i2V7d
X-Google-Smtp-Source: APiQypL21CZWbXWOHJE3YDa64aIqVNZ/eze025asq1QS528mmeMUgvJUeHpiflFcYY9J61LKzcW9eg==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr12009180wrt.215.1588601412600;
        Mon, 04 May 2020 07:10:12 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p4FE9389E.dip0.t-ipconnect.de. [79.233.56.158])
        by smtp.gmail.com with ESMTPSA id q8sm20285853wrp.58.2020.05.04.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 07:10:11 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH v3] initscripts/init-system-helpers: fix mountnfs.sh dependency
Date: Mon,  4 May 2020 16:10:04 +0200
Message-Id: <20200504141004.9988-1-sno@netbsd.org>
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
 .../initscripts/init-system-helpers_1.57.bb   | 51 +++++++++++++++++++
 .../initscripts/initscripts_1.0.bb            |  1 +
 3 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.57.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 340cda3300..9afc676031 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -266,6 +266,7 @@ RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-inetutils = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER_pn-init-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-init-system-helpers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-initramfs-boot = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-initramfs-framework = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-initramfs-live-boot = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
new file mode 100644
index 0000000000..2f7df87e1e
--- /dev/null
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
@@ -0,0 +1,51 @@
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
+do_configure() {
+	:
+}
+
+do_compile() {
+	:
+}
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

