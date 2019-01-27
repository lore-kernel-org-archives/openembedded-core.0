Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF487C34B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 09:38:27 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id n18-v6so11722198lji.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 01:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=04vfC7llrrsr1rFdQy6Rybo6WoAFIdG8nOw/kWJuyx8=;
	b=gIpNK2DYW7KdIR/g2FM7Oz9gUcfRCs/BFmR6KLr91SmY9ETi/CBzlppB/ncp3J0NXz
	f3AzGma7UdbT8qR7aIpYSXJ65O2zBFQuycnh+nOICG9wqi4JlSmoKB/xcoWkM2IY72w8
	fnNc6gtapgbkLF1pJkRjZw1qA8p7tybOCBJkC68UK0YY3sA9biTBJkakezI2hIcJFivR
	1qEmHB1F6fdr8ohaSiZcF+oMU2Vpoq2gwN3KpRykeD7fuGw7VATejxuxAi/3noM/Am7b
	7eE2C4K0jsgQr42lQUWb1hkMeWAOOmYKd9tPGKP1hBWDjoXiz53jsxruzPuUAAlEdXW0
	QWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=04vfC7llrrsr1rFdQy6Rybo6WoAFIdG8nOw/kWJuyx8=;
	b=HxqIFBY3AB6fiumrxf1X8G6+eVfLz+B1l+yYn59jhUrMvLQ80gaO4em6SEUMs3YDPg
	9Lf+TTjcwNpZXVQxgKwNeyRukcdjq1KIaUNKVWlzct17h8F7MN31CD9aUaw7OLgB536q
	D2V0fXrLjIM8aTP3MCWrfs2LnKtp41WniC6ux9YdhMh+hxOAFF0x/fNjlneQIJFql0cG
	OmJUgTO671JMkPHw+MndkA4Tl2tc2rbdyFnqEhijKv/2A3NH6AvxbcuhqmzAGatp1FuV
	O2x2aq0GszB6slOUQOzO5VsOPkkw9rK1Jzhgxw5oZ7IH3dmEDHHEfbelh8mbqo67nb1o
	Hghw==
X-Gm-Message-State: AJcUukcb9+rGkHvfyGMr85oak8N1cvDni4JVaIKJam4K6u+c+lmJ1PkB
	PU+9HsDUnaVqNT5sX1u3/Cvlq51y1II=
X-Google-Smtp-Source: ALg8bN7XoWhfgJaAHn90+99v7sZU3WazJpxtsIObZExeen/kh0Vb32XYdgJz+KAsYtRSFHoCfShmGw==
X-Received: by 2002:a2e:681a:: with SMTP id
	c26-v6mr13772082lja.175.1548581907406; 
	Sun, 27 Jan 2019 01:38:27 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm2398992ljf.96.2019.01.27.01.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 01:38:26 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 10:38:18 +0100
Message-Id: <20190127093821.4803-3-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190127093821.4803-1-jonas@norrbonn.se>
References: <20190127093821.4803-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v3 2/5] systemd-conf: simplify creation of machine-specific configuration
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
X-List-Received-Date: Sun, 27 Jan 2019 09:38:27 -0000
Content-Transfer-Encoding: 8bit

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
---
 meta/recipes-core/systemd/systemd-conf.bb | 48 +++++++++++------------
 meta/recipes-core/systemd/systemd_239.bb  | 16 ++++----
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-conf.bb b/meta/recipes-core/systemd/systemd-conf.bb
index 7fe2e1105b..8a9f01c48a 100644
--- a/meta/recipes-core/systemd/systemd-conf.bb
+++ b/meta/recipes-core/systemd/systemd-conf.bb
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
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 54217d3042..c6b93251b3 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -291,13 +291,6 @@ do_install() {
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
@@ -496,6 +489,15 @@ FILES_${PN}-extra-utils = "\
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
2.19.1


