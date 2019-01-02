Return-Path: <jonas@norrbonn.se>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 590FD6B96C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:11:51 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id n18-v6so27402315lji.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Jan 2019 08:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+HmaJ9ujWAgsESHWtWrrwKMEK7bMD8HAFRfMRLrFjpE=;
	b=m55zYFMlUBVKyAn2TgSSwSjQk8X9yLoTZKwDvrd3+w+WKRMjWXQx5jzzPXppSltADo
	3NiRwvFDquNrwIL4r2MMIF04VlO4SGqi/udg/K/eXQm3C+MhVr5vJQVGf6aiLf7ogRzP
	1jMd77SqbOahn533XWjbPQOkEtsSDi6aB1+gsPSy8BpCfHVTLU9TM5Mmmtfz+zvqGatq
	0nN2BoK38RWK3e1v7SytebGWyoOECbnm2kYF+7O18vos0z4EAZXZtcUkFUp6Y1ccrW1w
	FQGTPuMZJib6pvPP1fnwYOn+D1A8MwQoTF1veWotUYw0Lh+ZKaE/JLXjOfqNxRYoBXsO
	AsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+HmaJ9ujWAgsESHWtWrrwKMEK7bMD8HAFRfMRLrFjpE=;
	b=mD9VlJablnr9nfwbx34MqEskeScQzYvT9+gePrXZsNC4fO5/IuIH29RJwasz8vk3Tb
	StSBUCZUv0wDZGFadmPs9h8fMk/MKyshuN0sYXRnazHuThY8Ovyv834WELUFT3WfdLrC
	FbY8SJJAumaqaDIVhKJ5m24mSr0IyXvMaXuw57G8CrSkobOL0cJOxy3q9xGevRkKiHAy
	oQNpXs65/SFHmAho/iXxT1IAdMUfiryure3kRVeQHfxJ91GCSyYeci1y3IiTXDvNLP+x
	PgCQphCimMT3n2zvU6flPvHKfjT8bq+ZPli5Y/dUdMyG+5dQs5yVO+uF0f54Q9/urb0n
	BWCg==
X-Gm-Message-State: AJcUukfqrK7I8qZIrBWYQxct3XBf2qg85+DHT2lYn9YH2l3eWjHjbA8c
	N9q21e9A153SpdCaUglbphG47+jaeNw=
X-Google-Smtp-Source: ALg8bN7Y/6UoxjtYpNtgfU1NAL7GH7dSv2QBZys6r0g/jOQ8oZxw4f+1LzkKP0RlOzXEoFgLR2ItsA==
X-Received: by 2002:a2e:5054:: with SMTP id
	v20-v6mr24863628ljd.45.1546445511710; 
	Wed, 02 Jan 2019 08:11:51 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	o17sm10040195lff.77.2019.01.02.08.11.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Jan 2019 08:11:51 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Jan 2019 17:11:40 +0100
Message-Id: <20190102161144.11264-2-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190102161144.11264-1-jonas@norrbonn.se>
References: <20190102161144.11264-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH v2 1/5] systemd: do not create machine-id
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
X-List-Received-Date: Wed, 02 Jan 2019 16:11:51 -0000
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
index 03acce25b7..0bb3276bf1 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -286,7 +286,6 @@ do_install() {
 	fi
 
 	# conf files are handled by systemd-conf
-	rm -f ${D}${sysconfdir}/machine-id
 	rm -f ${D}${sysconfdir}/systemd/coredump.conf
 	rm -f ${D}${sysconfdir}/systemd/journald.conf
 	rm -f ${D}${sysconfdir}/systemd/logind.conf
-- 
2.19.1


