Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 45A787C2FD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 09:38:26 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id u89-v6so11786320lje.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1w0nZWieT8bO1XGreP1g0jQZ8vkF3aPNkPEc1a/yJpo=;
	b=hflhjGc0cCYcspl63XU7nCY7q9SVx+lpuIcK6gQjvK7oFco/ZccpCMivGnS9gzMEuX
	XkRC1D4iwhO4VOaVdqcv/iBjtMXtXLmadrjRruUo0g3MsjZTy173pK1fO/CCblwnjMSQ
	RE8W5tpnLXgIPz2J81D2rkUuQJcYKL+uw8GoRP6/3lIA00uqughvAq/+dBjWq9cDvC7/
	wQbcvjIxVxxmQKSHQq9h9KMRLwtx53HtPqtIvnmkCg5OjprUzQJ23dqfYl8wZJ5Au4S0
	cI2siEpbdAYv1wiR7u2Ix0YWsr17zzhcPtoS/U1/ZNBVcrdT5oQheVf6p3c3FSX2T6KX
	4HUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1w0nZWieT8bO1XGreP1g0jQZ8vkF3aPNkPEc1a/yJpo=;
	b=Cjv3uwFCDPCHWYTIVeCo8GeV3VQqdubiBk3L9Q7B8YeQyLKiKxsFftmGii9MHhi/XR
	per47jrfwkUIG2ldbPXUD8uCGSLV/RjoBd21G9d8+ESlWZyiR63j0nBgRHLsRg4e4Rb0
	fi+LwSlmMJ//HqUEbGAWjzwzGLb8beDW8PaaA6zMkpXmp3eDDQDHAdpV+XUN8twtRaAq
	f5gxoad8ujQCyGL6YhKkEAJ4DB1X+p6kfb0R5q0zH8qQ676qSmaUhzNZbWTyQJq2z9wi
	4g3xzI58wALBON5wJNtBOvuMup5v9C80ffMEu43TIYpzisHmfGyERjjwQ1pR4UItfKyv
	6qjA==
X-Gm-Message-State: AJcUukeR6xlyFry7BLUy0SadgA1Zr8/O1Ex8JFq/7vnc6ZAHguheNlL6
	KyzsggTdje/+hmI8EBlHJ4IniaD0vto=
X-Google-Smtp-Source: ALg8bN4UsiCZEANybK7g3Mc4PQeEtr2eRUi1ftGP20aie23zRW6zpsofJ6NwZck3SPjo7qJPUR2ZGw==
X-Received: by 2002:a2e:98c9:: with SMTP id
	s9-v6mr14279213ljj.166.1548581906487; 
	Sun, 27 Jan 2019 01:38:26 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm2398992ljf.96.2019.01.27.01.38.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 01:38:25 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 10:38:17 +0100
Message-Id: <20190127093821.4803-2-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190127093821.4803-1-jonas@norrbonn.se>
References: <20190127093821.4803-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v3 1/5] systemd: do not create machine-id
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
X-List-Received-Date: Sun, 27 Jan 2019 09:38:26 -0000
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
index 7efc1e5828..54217d3042 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -292,7 +292,6 @@ do_install() {
 	fi
 
 	# conf files are handled by systemd-conf
-	rm -f ${D}${sysconfdir}/machine-id
 	rm -f ${D}${sysconfdir}/systemd/coredump.conf
 	rm -f ${D}${sysconfdir}/systemd/journald.conf
 	rm -f ${D}${sysconfdir}/systemd/logind.conf
-- 
2.19.1


