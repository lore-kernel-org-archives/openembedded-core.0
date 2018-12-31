Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 118A66B512
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 12:06:03 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id z13so18196232lfe.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 04:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=XH6HCGGkkrwCYUk6lRiKf9wrEdUmPVAKqgJ4P6iI/fs=;
	b=AnYdH9tmPMFjk+wBRRjfzwnMz5sXQ/MkvLPWGnG/VMUzW+EDQpjhiW0bA0b2cCsd7Q
	perwg6rs5wBdjh4XTt+fiKwEzGFlc8XbBE62O3fovUSauKndWW3Vx+pveL4V0Coo5ul6
	vRUUx5CXPckomEshutTN84hzlbtEGnCDSzWH3r781Rg22F1x2agc27MIZteOgxoUZ6AM
	AEeSRx9MRJDdJ97jT7YDxc1vNlfkU2vSkKN5up3ik66HGh4WMpQE9FBfoJukaCC12t7q
	NHdmJefOA8WBUTTkA38Nr2UQYgoMASJOB3ki301ZVW4sIPa7nHtSV8pg4GSF3eBqxZOZ
	kBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XH6HCGGkkrwCYUk6lRiKf9wrEdUmPVAKqgJ4P6iI/fs=;
	b=gggEXfp3IxgvM4iC+5kMc2bdVsmKcxnPyOiK+NIZSbU/2Ors044a0sfEWPep2rSJEg
	RmEl2pz930i5pmN5I67TPsbvNRedXx/E8v4Qh510qUzxfCO/U+mOqPp2JaojqcV6qAYy
	1GfmiNHRAeriAdeAHzB+jqKM7XVOhjwCvVP75kPRhNpk3zcP0V+LD/YNRXlDrfr/wXUO
	Gp+u+Sgb3j2prIdnNA683gdeGQSeOIfR4OSDj3TQ3JyxwlgswO9H849Wvu6SMbQgJawF
	RPAV+6zm7t3ehBlwr90EJNSgkB6jIlDy5Ogo5Ya7dXTvm7FQkPnR6W/h9l8li4W/19tZ
	J24Q==
X-Gm-Message-State: AA+aEWbcXvLhXGYGLfGVFGXzIhIesS1ZzoiU79mQCUat6tKKgKdV5fLI
	8KsT8zRe7AbzHx3R5fB78+P26yRz7FQ=
X-Google-Smtp-Source: AFSGD/VCI5ElzSseFapFjvd1kl4bqb1MyuaBCyj67Nhht/Id/IGgi6Le5zjP9e3I0FCMGLA2e6et1Q==
X-Received: by 2002:a19:5154:: with SMTP id f81mr19521096lfb.96.1546257964257; 
	Mon, 31 Dec 2018 04:06:04 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm10246379ljr.83.2018.12.31.04.06.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Dec 2018 04:06:03 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 13:05:54 +0100
Message-Id: <20181231120559.25470-3-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181231120559.25470-1-jonas@norrbonn.se>
References: <20181231120559.25470-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 2/7] systemd-conf: simplify creation of configuration
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
X-List-Received-Date: Mon, 31 Dec 2018 12:06:04 -0000
Content-Transfer-Encoding: 8bit

The configuration files that systemd installs are just skeletons
detailing the available options and their default values.  The
recommended means of changing the configuration is to provide snippets
in configuration directories.  For example, journald.conf settings are
best set in /usr/lib/journald.conf.d/ and can be overridden by the user
by providing overriding snippets in /etc/systemd/journald.conf.d/.

The base configuration files have the lowest priority; they will always
be overridden by any snippets.  As such, it's probably best to not
provide them at all.  This also moves us a step closer to an empty /etc
which is should be a long term goal in order to allow running OE as a
"stateless system".

This patch moves the systemd configuration to snippets in
/usr/lib/*.conf.d.  This simplifies the recipe considerably since it now
just sets up a couple of text files and doesn't even need access to the
systemd source anymore.
---
 meta/recipes-core/systemd/systemd-conf.bb | 34 +++++++++--------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf.bb b/meta/recipes-core/systemd/systemd-conf.bb
index 7fe2e1105b..a504afe3e7 100644
--- a/meta/recipes-core/systemd/systemd-conf.bb
+++ b/meta/recipes-core/systemd/systemd-conf.bb
@@ -1,9 +1,8 @@
-require systemd.inc
-
 SUMMARY = "Systemd system configuration"
 DESCRIPTION = "Systemd may require slightly different configuration for \
 different machines.  For example, qemu machines require a longer \
 DefaultTimeoutStartSec setting."
+LICENSE = "GPLv2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -13,36 +12,29 @@ ${sysconfdir}/systemd/logind.conf \
 ${sysconfdir}/systemd/system.conf \
 ${sysconfdir}/systemd/user.conf"
 
-FILES_${PN} = "${sysconfdir}/systemd"
-
-do_configure[noexec] = '1'
-do_compile[noexec] = '1'
+FILES_${PN} = "/usr/lib/journald.conf.d/* \
+/usr/lib/logind.conf.d/* \
+/usr/lib/system.conf.d/* \
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
+	echo "ForwardToSyslog=yes" >> ${D}/usr/lib/journald.conf.d/${PN}.conf
 	# Set the maximium size of runtime journal to 64M as default
-	sed -i -e 's/.*RuntimeMaxUse.*/RuntimeMaxUse=64M/' ${D}${sysconfdir}/systemd/journald.conf
+	echo "RuntimeMaxUse=64M" >> ${D}/usr/lib/journald.conf.d/${PN}.conf
 
-	install -m 0644 ${S}/src/login/logind.conf.in ${D}${sysconfdir}/systemd/logind.conf
+	install -d ${D}/usr/lib/logind.conf.d
 	# Set KILL_USER_PROCESSES to yes
-	sed -i -e 's/@KILL_USER_PROCESSES@/yes/' ${D}${sysconfdir}/systemd/logind.conf
+	echo "KillUserProcesses=yes" >> ${D}/usr/lib/logind.conf.d/${PN}.conf
 
-	install -m 0644 ${S}/src/core/system.conf.in ${D}${sysconfdir}/systemd/system.conf
+	install -d ${D}/usr/lib/system.conf.d
 	# Set MEMORY_ACCOUNTING_DEFAULT to yes
-	sed -i -e 's/@MEMORY_ACCOUNTING_DEFAULT@/yes/' ${D}${sysconfdir}/systemd/system.conf
-
-	install -m 0644 ${S}/src/core/user.conf ${D}${sysconfdir}/systemd/user.conf
+	echo "DefaultMemoryAccounting=yes" >> ${D}/usr/lib/system.conf.d/${PN}.conf
 }
 
 # Based on change from YP bug 8141, OE commit 5196d7bacaef1076c361adaa2867be31759c1b52
 do_install_append_qemuall() {
 	# Change DefaultTimeoutStartSec from 90s to 240s
-	echo "DefaultTimeoutStartSec = 240s" >> ${D}${sysconfdir}/systemd/system.conf
+	echo "DefaultTimeoutStartSec = 240s" >> ${D}/usr/lib/system.conf.d/${PN}.conf
 }
-- 
2.19.1


