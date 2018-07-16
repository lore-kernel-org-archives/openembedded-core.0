Return-Path: <nick83ola@gmail.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3AE2072EA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 08:18:14 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id r3-v6so15107886ybo.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 01:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1pw71Ibu1sNX0Shvod49mEbzj22J3UEXrKxy3ExkHRw=;
	b=s3thOkrDawnzahB5IdSbZ9QSikcKUh8r5Nw4rmuZ69Lke9sysd22QMdbeblc5ngYf1
	sW73I91I6gMCkvGqmfSLNP1Nc0z7TqViw/9hFLGfLCUvy65JMOwdyyduGlYYsGrtVkKo
	t7+fLUhvUNV5INgWwcWuPjU9L4L+Npz2EcxhEm3KlQ00o7e57DiqlzHW+X5WE4uDOfq+
	0SMsNhRLqq3TRsZKhsX+jSX1cxWclcp7k007TGFwpbn/XY8iZtA80z4qM3xgNO84zbtU
	IlvMCzRvQ0UouH6fo+HmvRU44Y8DuKUqms6tT+Fi2aYjgIZhX89Swff1deMCtoy8aZQI
	YHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1pw71Ibu1sNX0Shvod49mEbzj22J3UEXrKxy3ExkHRw=;
	b=uWOBNbl3ygcTGMzic3G5aPu04NDPcoPULMoLcgGQf0BusGaRf8zDDI7PORSot9T5qW
	fDIb0kgq6m+rG7HZZc72OAJ3gxRcONzdiGek/zWg98zPADk7GHm3GF2CMBKua1BkNqRJ
	ifWjvHJOce3BEjJ+PgoDkbkjd9GBVI+xkt0eDAbchBFpZ5cWVMTlIsffNSmOaK+vpIf0
	p+gu9Mvw8VXABK5dK76bdWGpaq/5S5A2XrhbFXq6EIiEqi6cSl4J7jFBZzCwsXrfHeSD
	qUwM5bT7rND0FvOK5Pjv+SpFeZBGaaJ4uVbzGG0PxG9Qqe1ZjWed3S3t4t2hQkkCuJS5
	9H0A==
X-Gm-Message-State: AOUpUlGVr23xERUMB9MhN1uJ0hCNBGUkcJJ7i8OJkBTL2b7NoJLNBzHk
	8gRxHgCnSR51MVNUqaeT+M0TbQ==
X-Google-Smtp-Source: AAOMgpcQBL4hSJmKn0Wi5L2V57LGQ9YOmeuMQreNvugIGYGYj7U9e7wA51gbTslqICnVlGMcFhajFw==
X-Received: by 2002:a25:8102:: with SMTP id
	o2-v6mr8031248ybk.379.1531729094888; 
	Mon, 16 Jul 2018 01:18:14 -0700 (PDT)
Received: from nick-laptop.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	r196-v6sm7577332ywe.25.2018.07.16.01.18.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 01:18:14 -0700 (PDT)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 09:17:59 +0100
Message-Id: <20180716081759.5747-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Nicola Lunghi <nicola.lunghi@jci.com>
Subject: [meta-oe][poky][PATCH v2] systemd: resolved linked even if the option is disabled
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
X-List-Received-Date: Mon, 16 Jul 2018 08:18:14 -0000

From: Nicola Lunghi <nicola.lunghi@jci.com>

if resolved option is not selected the package systemd-resolved
is not installed so it cannot provide an alternative for
resolv.conf

In this recipe the previous check was instead reversing the check (note the !).

This patch avoid messing with resol.conf link if resolved is disabled in
the package config.

This in particular if we compile systemd with musl where systemd-resolved
cannot be compiled.

Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 3efca33e73..bd6dcef637 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -258,14 +258,11 @@ do_install() {
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
 		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
-	else
-		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 
@@ -539,7 +536,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
 
-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
 
 ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
@@ -565,6 +562,7 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+ALTERNATIVE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
-- 
2.17.1


