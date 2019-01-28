Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id E2C347C5B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 20:58:53 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id e26so12970419lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QZDlGoMzXSr4kfudvOMLTra1OaxbvrOcIER+GiG4jtk=;
	b=km5zTyL+xIr/0XtQmg3ooe1WKU326GgLeodhVqj9wOKKMqJfL5r8jjcgdqi3dEhWfF
	MK8qns02I1fmrOFt1vit+euRBOARkHal/5I5FsG7HQZ1npA4o5fkib7F+IzyQKmo+gFp
	oS+k0/wmGK3riL493IiXkro7pdcyoclNY2UDFRUtsn5Qhh90jOMSIbcfP1b/nY5rCa9Z
	WjcatN3Gs+X5/0Qn7SoQU1kXS4UPJ6TXgFjfEWzuxqCmWTxRSbJ/JMiCkYStTZ6dwQEl
	wp3WJjahFqwPnITmlO0T/8CZEf4Nn/d9QQUkxrlIN1lEK/DKFUzVvDaIe7uZHgF6WTw8
	JXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QZDlGoMzXSr4kfudvOMLTra1OaxbvrOcIER+GiG4jtk=;
	b=j9rUbKeNVf2Kawax14nC9g1pYyp87+B/eOiin4D0BRJrwXOSqdT562A3KfYWc3ypvX
	Xchh3RiG9HD5zOtQCALeZPWmcwA4vIXO+2TzqhNuntagZMDP1Yy/00LiW3jIrfUuOm+f
	tvE+PRWFtZuIY/2+3dsayklyFm3F6RKP8foT5/zP9vprgmb6gqxdgQw+tTMdHC5Kc47P
	sOmQkS68vRkUOEZhYI4Ssx9FQ9cN5SBbtGWblGoMXIXL/u99nGVJcw0MnOT/qxhBMNGO
	eHsKp/+antzK7zMye89SZXLnWWFYyedwa74ObbRmLf6vFow2d68a1ISIE306ELQ7xZ+5
	N3lw==
X-Gm-Message-State: AJcUukdBLspLNMN1+6ocr/LVsyldfcvhY2TVaLWfuzneC2aMgni3QrrJ
	hYa24fdtw3AYOCMeUjXZRpUAxvx45bI=
X-Google-Smtp-Source: ALg8bN75irRRkQ1iCJ/RMhq8SstFf8H0jXp4h6tD9vnW7nsGHJfPd4Uakzn3WkJFZS4PAwSOwITxLg==
X-Received: by 2002:a19:c345:: with SMTP id t66mr15458269lff.55.1548709133889; 
	Mon, 28 Jan 2019 12:58:53 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id w9sm3142340lfc.66.2019.01.28.12.58.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 12:58:53 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 21:58:44 +0100
Message-Id: <20190128205848.12834-3-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128205848.12834-1-jonas@norrbonn.se>
References: <20190128205848.12834-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v4 2/6] systemd: do not create machine-id
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
X-List-Received-Date: Mon, 28 Jan 2019 20:58:54 -0000
Content-Transfer-Encoding: 8bit

There is no reason to have an emtpy machine-id as part of the systemd
package.  Either:

i)  the filesystem is writable and the file will be created
automatically; or
ii) the filesystem is read-only, in which case the empty machine-id file
should be created as part of the read-only-rootfs tweaks.

Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
---
 meta/classes/rootfs-postcommands.bbclass  | 6 ++++++
 meta/recipes-core/systemd/systemd-conf.bb | 9 ++-------
 meta/recipes-core/systemd/systemd_239.bb  | 1 -
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index bde58ad6cd..89f8efd323 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -126,6 +126,12 @@ read_only_rootfs_hook () {
 			${IMAGE_ROOTFS}/etc/init.d/populate-volatile.sh
 		fi
 	fi
+
+	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+	# Create machine-id
+	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
+		touch ${IMAGE_ROOTFS}${sysconfdir}/machine-id
+	fi
 }
 
 #
diff --git a/meta/recipes-core/systemd/systemd-conf.bb b/meta/recipes-core/systemd/systemd-conf.bb
index 9bb27fd96d..7fe2e1105b 100644
--- a/meta/recipes-core/systemd/systemd-conf.bb
+++ b/meta/recipes-core/systemd/systemd-conf.bb
@@ -7,14 +7,13 @@ DefaultTimeoutStartSec setting."
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/machine-id \
-${sysconfdir}/systemd/coredump.conf \
+CONFFILES_${PN} = "${sysconfdir}/systemd/coredump.conf \
 ${sysconfdir}/systemd/journald.conf \
 ${sysconfdir}/systemd/logind.conf \
 ${sysconfdir}/systemd/system.conf \
 ${sysconfdir}/systemd/user.conf"
 
-FILES_${PN} = "${sysconfdir}/machine-id ${sysconfdir}/systemd"
+FILES_${PN} = "${sysconfdir}/systemd"
 
 do_configure[noexec] = '1'
 do_compile[noexec] = '1'
@@ -23,10 +22,6 @@ do_install() {
 	rm -rf ${D}/${sysconfdir}/systemd
 	install -d ${D}/${sysconfdir}/systemd
 
-	# Create machine-id
-	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
-	touch ${D}${sysconfdir}/machine-id
-
 	install -m 0644 ${S}/src/coredump/coredump.conf ${D}${sysconfdir}/systemd/coredump.conf
 
 	install -m 0644 ${S}/src/journal/journald.conf ${D}${sysconfdir}/systemd/journald.conf
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index 5a8d6ec2b5..0de21a5c3a 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -291,7 +291,6 @@ do_install() {
 	fi
 
 	# conf files are handled by systemd-conf
-	rm -f ${D}${sysconfdir}/machine-id
 	rm -f ${D}${sysconfdir}/systemd/coredump.conf
 	rm -f ${D}${sysconfdir}/systemd/journald.conf
 	rm -f ${D}${sysconfdir}/systemd/logind.conf
-- 
2.19.1


