Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC597C5B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 20:58:54 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id f5so12919862lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=eIPaOXhGVPbm5whKL4MHhgSY/XS/IrhiAriz4R8tJDU=;
	b=LYFP+O4dLudKlJSWvG0BmgFfP7x4+D+4TTKLIvdNEh01MtTV5Gaj4sz50xHzCvDONe
	NPB6VGJVdoQ3M1SyYS0QBy6Xn1laMyanKopzAI4/ZxM44mrqpQ+4YYEnY8TgDHt94djs
	ZrYjWrRst094TmrKuzARhibg+B3e/Mf2wbMUlmhQb3kj2TvxfEF5qLiME7ed+EuIdrEN
	Gkgn2SltneIVju6deixSiRxAJDhHVZe1qWEX7ua/Btdf1Qadhpw3fUNOCEy2BAcdUddM
	DBwHifqMafouRunRT931NnPdA1nvJBwrMGeRx9Fu+BgIc9207WSfUzVqaK1zrV0v+m3i
	rHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=eIPaOXhGVPbm5whKL4MHhgSY/XS/IrhiAriz4R8tJDU=;
	b=XAX3DQQN8K3si6I1sLDmdEu7wRwbRX++6Uh56CWRg9CdYOdflh4YZMj0T/C75AwO5K
	zeUysIjkTfO9UsJdyil1Xd4YUS2xRKd1FtjsKmwFTqkwFjXw85BfqBxkzs6lfZWXJLTO
	5Qjz7XgFtjhb4LksXID2hrpnBfvThMuJ8oeyYqzLE8AdnE8gs+AoBfMsgzN/X9R6sf8z
	ysBYDx+G1OhZmcHNFeUMchOIFQcrhhu8Droj4+1fSYgTPdYwfJNJoMt4EI4TIA0B6fX1
	LLwMIzvWuz0XYRwibcmujsywNkLRvv172fSqop0qtnIUeZUy2cEMI+KNQWXC+8c4nKkW
	8rdw==
X-Gm-Message-State: AJcUukenuPPpO+1YeKN/pOae42Ln5b7K5FOF7tnyhQQJt4+/1qQ1TrNK
	tsk/Zzm02qgI3qknY24xqA17Fd3JA0Y=
X-Google-Smtp-Source: ALg8bN7lY2Xh22YWK/hwIA59buc7FJBHF7GC5yQ9DSVPEKRlNFJMcrHSbDTQMg1lpvmrWsaHJMbOug==
X-Received: by 2002:a19:d486:: with SMTP id
	l128mr17765018lfg.114.1548709135042; 
	Mon, 28 Jan 2019 12:58:55 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id w9sm3142340lfc.66.2019.01.28.12.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 12:58:54 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 21:58:45 +0100
Message-Id: <20190128205848.12834-4-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128205848.12834-1-jonas@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v4 3/6] systemd-conf: simplify creation of machine-specific configuration
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
X-List-Received-Date: Mon, 28 Jan 2019 20:58:55 -0000
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
index 0de21a5c3a..588404f785 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -290,13 +290,6 @@ do_install() {
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
@@ -495,6 +488,15 @@ FILES_${PN}-extra-utils = "\
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


