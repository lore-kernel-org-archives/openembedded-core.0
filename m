Return-Path: <jonas@norrbonn.se>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE136086F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 12:06:02 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id f23so18174307lfc.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Dec 2018 04:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DqW5kQFgA6nDuC7yxZJBRFGlro7Cw+sgLzk3//i/Tv8=;
	b=Bo+SDRy5cSBdWLvw5eMLsZIf35Bgx9GCD+s92lO5JLaLSGQOITCoigTo9YiXLf+QP3
	THOGOKmIxalCf3RQk7NlVPSmemR4w6EHKYk9yve3CRrExh6oTISIxGsm6rM2abu8tbK8
	ZpfaUTXO0AEQkVjsPn7EEmZQXR/B7jl22x8B0RWbt/WavVcuDxlsKpnhRIgkFQoNjj9z
	/s8U4/EkODNVpNCumoNH+2ltijn/cwVuxnkgnej85VQQxBxG+xh+jd/qrEvtGDyoftpw
	/rUDbQcMh6BBL1v4U/7CIFXfaE6WHUytZJfyyv2zoNL2Qkdi3s9LqjgPLOoKx0nYWPkQ
	nxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DqW5kQFgA6nDuC7yxZJBRFGlro7Cw+sgLzk3//i/Tv8=;
	b=VV+gYnpPS1BoZ+XgUtnFDz1J7dgYEQ7tjPPZJkxMW6jtv5BK/OcQTEqkMw3RUIOLHR
	sJhmjDnv1MCFPtPuH182f+xjv/js2WQZ+Tj+QN3AbEXwEFDYrurysyYwFlAqbx2j7O12
	dtnJZrkUloVlLTc7RqNhmVvRLKSBoOJaO8rLgI/l749WW55SUACErXNcl08jy13j6D+S
	UJeIxcyNkDM82kcewMy4Ie9WqZZl3swpYDhFSAHcCPJQjM0uf4w8uAjNOqnukWTM1lr3
	ADxt3Mw4a+7WboQ3kpmwp+vPrsYMS+mn2SZhOg/DUo/x0rIyAubNFqCOgHL1r0W1x4qZ
	cF4A==
X-Gm-Message-State: AJcUukfi7RCGXJ5q42qoe2lqqXW3HMoJrTjseY3o6vnyy7C0olDX22RA
	ci1Lq6sxasZ/qwC0t3StAf5uAeJtA+0=
X-Google-Smtp-Source: ALg8bN7Ufc/kGz7m+IF/KsltmI/9GcYlG11VOCrSAtPyYgbKlhd0OMvsYjI/6U4YUt/g06OzHIyPHQ==
X-Received: by 2002:a19:7dc2:: with SMTP id y185mr8766019lfc.27.1546257963023; 
	Mon, 31 Dec 2018 04:06:03 -0800 (PST)
Received: from mimer.lan (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
	by smtp.gmail.com with ESMTPSA id
	r76-v6sm10246379ljr.83.2018.12.31.04.06.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Dec 2018 04:06:02 -0800 (PST)
From: Jonas Bonn <jonas@norrbonn.se>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Dec 2018 13:05:53 +0100
Message-Id: <20181231120559.25470-2-jonas@norrbonn.se>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181231120559.25470-1-jonas@norrbonn.se>
References: <20181231120559.25470-1-jonas@norrbonn.se>
MIME-Version: 1.0
Subject: [PATCH 1/7] systemd: do not create machine-id
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
X-List-Received-Date: Mon, 31 Dec 2018 12:06:03 -0000
Content-Transfer-Encoding: 8bit

There is no reason to have an emtpy machine-id as part of the systemd
package.  Either:

i)  the filesystem is writable and the file will be created
automatically; or
ii) the filesystem is read-only, in which case the empty machine-id file
should be created as part of the read-only-rootfs tweaks.
---
 meta/classes/rootfs-postcommands.bbclass  | 6 ++++++
 meta/recipes-core/systemd/systemd-conf.bb | 9 ++-------
 2 files changed, 8 insertions(+), 7 deletions(-)

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
-- 
2.19.1


