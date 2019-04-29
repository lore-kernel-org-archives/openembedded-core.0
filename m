Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 16CDE7DBCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:43:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r6so16461188wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8RKobSEWKNYnpbk8gWiczAFiUrQI/YolTkheUddnbWQ=;
	b=HENNClS3HraDztFIXMX7PhckJX3QiD33s4ij8ZIRcI9lq10Trt86Ren69hRO5DMLhU
	OyPqlJ5YqIBqDsBk0O5fZAI/wgfT8+RN6UQboo+nlewMyb7q2UAkJkeD/bv5fFvvONmK
	Xundcr5FMSus0FFpOVHVz0+0pkEHLQZlvgBKC2IHaVlHMMm1nPE8JhU65AgANTC4Mr8f
	xLnIF9MqaZqfy4jJR5g/5THtLKGF03n1kun9KDfOstOb9X2GCcW//wy17brXsySEi0pr
	CSyHwQhkgBqBY7ZF3PtsduSaeVG1VvFMrXvdtsmyeprq6av6/UH425pMxcNZ0ce/yymB
	lTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8RKobSEWKNYnpbk8gWiczAFiUrQI/YolTkheUddnbWQ=;
	b=WYyzLmPFnnG0xLOMpgfV1+KdwtxDrTTN5Kix9rBr7DkyegrZsXXhzx4vl+21JJgQZa
	mmZS4+kl1xCILjLx4dWXmxB7fA2PDvYUfsW+V8BYKPS9Ptc9WnBYoOCrGpESqg237xQs
	foZCatOdbZhqIkarEfq7mYGQMVDmkGIX4Xsx6mg8m0SozPVZHUWA9iNLnZid8PHah3B0
	zArtGwfOZ+Eqw9os1dPksU/BelWlGqAWSOVU2+SDflHA48JNrjIvV2L+BhManry6M2cR
	Al5SS40XEQu1a1icd1fM0hS0FXOYks10myAVpHdLu9+/lXZbi22W3g3ChPevqM9f8/3+
	SwVQ==
X-Gm-Message-State: APjAAAW7em3mvNSAO+525pGG8K4XYmXvqG5zlCKjz+M+ppNKd6ZR/lB5
	T0wjqXPwyk3bnX6lGI2vSh/dLNqTUb0=
X-Google-Smtp-Source: APXvYqzVttKaGX794mImXBx63rQ2qJPVk93Bte3bGKizFk4iSrMadid0bn4AjSD0fuBYPc8cbFSNMg==
X-Received: by 2002:adf:9364:: with SMTP id 91mr19745340wro.56.1556549023528; 
	Mon, 29 Apr 2019 07:43:43 -0700 (PDT)
Received: from localhost.localdomain ([89.197.133.108])
	by smtp.gmail.com with ESMTPSA id y70sm9452860wmc.8.2019.04.29.07.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 07:43:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 15:43:22 +0100
Message-Id: <20190429144325.63744-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190429144325.63744-1-alex.kiernan@gmail.com>
References: <20190429144325.63744-1-alex.kiernan@gmail.com>
Subject: [PATCH v5 3/6] systemd-conf: simplify creation of machine-specific configuration
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
X-List-Received-Date: Mon, 29 Apr 2019 14:43:43 -0000

From: Jonas Bonn <jonas@norrbonn.se>

The configuration files that systemd installs are just skeletons
detailing the available options and their default values.  The
recommended means of changing the configuration is to provide snippets
in configuration directories.  For example, journald.conf settings are
best set in /usr/lib/journald.conf.d/ and can be overridden by the user
by providing overriding snippets in /etc/systemd/journald.conf.d/.

The systemd-conf package is just providing machine-specific overrides
for some systemd defaults.

This patch restores the installation of config files by systemd and
reduces systemd-conf to just providing the config snippets in
/usr/lib/*.conf.d.  This simplfies the systemd-conf recipe considerably
since it now just sets up a couple of text files and doesn't even need
access to the systemd source anymore.

Given, however, that the base configuration files in /etc/systemd have
the lowest priority, they will always be overridden by any snippets.  As
it may confuse a user who is used to modifying these base files
directly, this patch puts symlinks in the overriding
/etc/systemd/*.conf.d/ directories back to the top-level files, thereby
restoring them to their top-level glory.  The default config files
installed by systemd are just lists of (commented out) defaults so this
should be safe.  The symlinks also provide an indication to the user
that there is more to systemd configuration than just the top-level file
and that checking the man page may be in order...

With this patch, systemd gets the right configuration irregardless of
whether /etc is populated at boot or not (i.e. in a "stateless"
system).

License-Update: configuration snippets licensing is independent of
systemd licensing

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v5:
- rebased for systemd 242

 meta/recipes-core/systemd/systemd-conf_242.bb | 48 +++++++++----------
 meta/recipes-core/systemd/systemd_242.bb      | 16 ++++---
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf_242.bb b/meta/recipes-core/systemd/systemd-conf_242.bb
index 7fe2e1105bef..8a9f01c48a93 100644
--- a/meta/recipes-core/systemd/systemd-conf_242.bb
+++ b/meta/recipes-core/systemd/systemd-conf_242.bb
@@ -1,48 +1,44 @@
-require systemd.inc
-
 SUMMARY = "Systemd system configuration"
 DESCRIPTION = "Systemd may require slightly different configuration for \
 different machines.  For example, qemu machines require a longer \
 DefaultTimeoutStartSec setting."
+LICENSE = "MIT"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
-${sysconfdir}/systemd/journald.conf \
-${sysconfdir}/systemd/logind.conf \
-${sysconfdir}/systemd/system.conf \
-${sysconfdir}/systemd/user.conf"
-
-FILES_${PN} = "${sysconfdir}/systemd"
-
-do_configure[noexec] = '1'
-do_compile[noexec] = '1'
+FILES_${PN} = "/usr/lib/journald.conf.d/* \
+	/usr/lib/logind.conf.d/* \
+	/usr/lib/system.conf.d/* \
+	/etc/systemd/* \
+"
 
 do_install() {
-	rm -rf ${D}/${sysconfdir}/systemd
-	install -d ${D}/${sysconfdir}/systemd
-
-	install -m 0644 ${S}/src/coredump/coredump.conf ${D}${sysconfdir}/systemd/coredump.conf
-
-	install -m 0644 ${S}/src/journal/journald.conf ${D}${sysconfdir}/systemd/journald.conf
+	install -d ${D}/usr/lib/journald.conf.d
 	# Enable journal to forward message to syslog daemon
-	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
+	echo "ForwardToSyslog=yes" >> ${D}/usr/lib/journald.conf.d/00-${PN}.conf
 	# Set the maximium size of runtime journal to 64M as default
-	sed -i -e 's/.*RuntimeMaxUse.*/RuntimeMaxUse=64M/' ${D}${sysconfdir}/systemd/journald.conf
+	echo "RuntimeMaxUse=64M" >> ${D}/usr/lib/journald.conf.d/00-${PN}.conf
+
+	install -d ${D}${sysconfdir}/systemd/journald.conf.d
+	ln -s ../journald.conf ${D}${sysconfdir}/systemd/journald.conf.d/00-${PN}.conf
 
-	install -m 0644 ${S}/src/login/logind.conf.in ${D}${sysconfdir}/systemd/logind.conf
+	install -d ${D}/usr/lib/logind.conf.d
 	# Set KILL_USER_PROCESSES to yes
-	sed -i -e 's/@KILL_USER_PROCESSES@/yes/' ${D}${sysconfdir}/systemd/logind.conf
+	echo "KillUserProcesses=yes" >> ${D}/usr/lib/logind.conf.d/00-${PN}.conf
+
+	install -d ${D}${sysconfdir}/systemd/logind.conf.d
+	ln -s ../logind.conf ${D}${sysconfdir}/systemd/logind.conf.d/00-${PN}.conf
 
-	install -m 0644 ${S}/src/core/system.conf.in ${D}${sysconfdir}/systemd/system.conf
+	install -d ${D}/usr/lib/system.conf.d
 	# Set MEMORY_ACCOUNTING_DEFAULT to yes
-	sed -i -e 's/@MEMORY_ACCOUNTING_DEFAULT@/yes/' ${D}${sysconfdir}/systemd/system.conf
+	echo "DefaultMemoryAccounting=yes" >> ${D}/usr/lib/system.conf.d/00-${PN}.conf
 
-	install -m 0644 ${S}/src/core/user.conf ${D}${sysconfdir}/systemd/user.conf
+	install -d ${D}${sysconfdir}/systemd/system.conf.d
+	ln -s ../system.conf ${D}${sysconfdir}/systemd/system.conf.d/00-${PN}.conf
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
 	# Change DefaultTimeoutStartSec from 90s to 240s
-	echo "DefaultTimeoutStartSec = 240s" >> ${D}${sysconfdir}/systemd/system.conf
+	echo "DefaultTimeoutStartSec = 240s" >> ${D}/usr/lib/system.conf.d/00-${PN}.conf
 }
diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-core/systemd/systemd_242.bb
index 7d1b0ec13a44..4f36dd3c8b4d 100644
--- a/meta/recipes-core/systemd/systemd_242.bb
+++ b/meta/recipes-core/systemd/systemd_242.bb
@@ -277,13 +277,6 @@ do_install() {
 		fi
 	fi
 
-	# conf files are handled by systemd-conf
-	rm -f ${D}${sysconfdir}/systemd/coredump.conf
-	rm -f ${D}${sysconfdir}/systemd/journald.conf
-	rm -f ${D}${sysconfdir}/systemd/logind.conf
-	rm -f ${D}${sysconfdir}/systemd/system.conf
-	rm -f ${D}${sysconfdir}/systemd/user.conf
-
 	# duplicate udevadm for postinst script
 	install -d ${D}${libexecdir}
 	ln ${D}${base_bindir}/udevadm ${D}${libexecdir}/${MLPREFIX}udevadm
@@ -486,6 +479,15 @@ FILES_${PN}-extra-utils = "\
                         ${rootlibexecdir}/systemd/systemd-cgroups-agent \
 "
 
+CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
+	${sysconfdir}/systemd/journald.conf \
+	${sysconfdir}/systemd/logind.conf \
+	${sysconfdir}/systemd/system.conf \
+	${sysconfdir}/systemd/user.conf \
+	${sysconfdir}/systemd/resolved.conf \
+	${sysconfdir}/systemd/timesyncd.conf \
+"
+
 FILES_${PN} = " ${base_bindir}/* \
                 ${base_sbindir}/shutdown \
                 ${base_sbindir}/halt \
-- 
2.17.1


