Received: from mail-ee0-f54.google.com ([74.125.83.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U4Iry-0005ar-MV
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Feb 2013 23:26:02 +0100
Received: by mail-ee0-f54.google.com with SMTP id c41so2734926eek.41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2013 14:10:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=Du3hYdSIlPDTNTM2FydVDqkBSuZOecZ7/RM/bcRldGk=;
	b=NAT2Kh7M0VdPIlfAaLM5QM8hlSqcze4P2dMOgqt6e7tKCwuR9211Lmx6cRNsqfbzwm
	iqMi4Bj0tQBKUtu2Kcryu/gmPiGIfYDS1vS55cOZqnvQGHidWlpMRLLD0TQOAioJkf9Z
	380IxcycaeCy/LLssHdHNukYouS51h8TEIUORhlWE9FzehlEbi2brCZOqppA5Pbr1nNx
	29P0zX1EniHRwsHSz656Pefe3Nez5OUc46Wt/Fa9e1s2E/P3kkoXhYrWbPoPnNd25Ayp
	dB0ziIs2frUbH5sdXkHnShgOHJAwaVUUe8iB9oFJhm9w0CKKTOX1L3AHNO2XuGJfgPYi
	nXAQ==
X-Received: by 10.14.215.131 with SMTP id e3mr31723551eep.32.1360447807205;
	Sat, 09 Feb 2013 14:10:07 -0800 (PST)
Received: from otp-agherzan-l1.corp.ad.wrs.com
	(5-13-217-124.residential.rdsnet.ro. [5.13.217.124])
	by mx.google.com with ESMTPS id k7sm51774853een.8.2013.02.09.14.10.05
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 09 Feb 2013 14:10:06 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Feb 2013 00:09:56 +0200
Message-Id: <1360447797-10187-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1360447797-10187-1-git-send-email-andrei@gherzan.ro>
References: <1360447797-10187-1-git-send-email-andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn6GNtmHS4wzcvfwrWEnj4S9HPNCsU6Ai10g5ERr+3/nbMuRVte0/PyT3k5AipaCr8bSXif
Subject: [PATCH 2/3] udev: Cleanup .inc file
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
X-List-Received-Date: Sat, 09 Feb 2013 22:26:02 -0000

* udev-acl and udev-concolekit have no files so remove these packages
* there's nothing in sbindir so remove useless sbindir = "${base_sbindir}"
* there is no udevinfo or udevtest so remove these from udev-utils
* udevadm is installed in bindir so modify it's path in FILES_udev-utils

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-core/udev/udev.inc |   15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index facad0c..bd82c34 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -31,9 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
 
 inherit autotools pkgconfig update-rc.d
 
-# udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
-sbindir = "${base_sbindir}"
-libexecdir = "${base_libdir}" 
+libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
                 --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids \
@@ -46,8 +44,8 @@ EXTRA_OECONF = "--disable-introspection \
                 --with-rootprefix= \
                "
 
-PACKAGES =+ "udev-acl udev-consolekit udev-utils"
-PACKAGES =+ "udev-cache libudev libudev-dev libudev-dbg"
+PACKAGES =+ "udev-utils udev-cache"
+PACKAGES =+ "libudev libudev-dev libudev-dbg"
 PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
 
 INITSCRIPT_PACKAGES = "udev udev-cache"
@@ -73,12 +71,7 @@ FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libg
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
-FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
-
-FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
-
-RDEPENDS_udev-consolekit += "udev-acl"
-FILES_udev-consolekit = "${libdir}/ConsoleKit"
+FILES_udev-utils = "${bindir}/udevadm"
 
 do_install_append () {
 	install -d ${D}${sysconfdir}/init.d
-- 
1.7.9.5



