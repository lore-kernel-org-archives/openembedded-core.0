Return-Path: <slemieux.tyco@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id CEB777724C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 20:47:59 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id r141so6079053ita.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=xc2paCGEQcXEgmu0KuxTPW2iD0M6AjowYUyvmqCzEZ0=;
	b=U1x2MJMFmMRmfgcd5J7FAtMaBCWp7x2Z96EPgp032OHfUwcXXHrBGmDS6KpztjMJdO
	+ZZQ82fB8/AeHFf8o6NjCgEqeMOXYt58NYUr2WKa1Krg4J7aSAKNyo6ADh0qWlMjdNt+
	2vIC6h2EOP1wYFT9pFRya2a/MYjQlEI/80I0br0kwDWX95yYJg5BNtzgiEzikaSrl8F5
	bmAbpeu4r+EPzbYd3i7EMGeVZplGckD5oGHHEhMPwbgoywg7/fB8FXLm/NzSfyHEWOcD
	jp52vxUpo6Tv1Q7Gm9FNWVi/xXTm3LGjsBOlNAVKUbXavkBjtQnB2g70SD9hXquq3KFC
	OT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xc2paCGEQcXEgmu0KuxTPW2iD0M6AjowYUyvmqCzEZ0=;
	b=L23PcNIgEfMMZCPGf/htvCOEJ3FyxedmtxtHrtbT0xa7o6r/1XxRDzImz79yrB93+s
	lzXKPt+2Eu54nqkD6scpwIytsk+InSIQn1/7Xzetu+BwOVs6Iz85Gsznn2DJeZ7ttwx5
	WITGfxX0O6vGqnVg+CIM3EaS6C6UlgDIVaCtHbNixJvqz92zvJK+wyDqTDdqVnwxWC7W
	yl/A+cltF5q0hOFkWJ8PE+gMKqeDrcSRbuTDvUqKTIUGzIopm5PIEWQ/BJ6PKLrj9UHX
	RckuQnCb43mkM6RTlGIizzq5Thrsk4YQAlC66sfRW4kzkuNch0/cI3n+bRc1hspFf/DN
	kycg==
X-Gm-Message-State: AMke39kzmBhnRPrOI/lyK+AXPRWVYxpvVuQseteRVEbNUhYNHLw6BuethcaIaM09P9wVog==
X-Received: by 10.36.65.161 with SMTP id b33mr4099866itd.114.1487278079812;
	Thu, 16 Feb 2017 12:47:59 -0800 (PST)
Received: from CABRO3AP00510.localdomain ([74.51.240.241])
	by smtp.gmail.com with ESMTPSA id
	k80sm3704145ioi.28.2017.02.16.12.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 12:47:59 -0800 (PST)
From: Sylvain Lemieux <slemieux.tyco@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 15:47:50 -0500
Message-Id: <20170216204750.21475-1-slemieux.tyco@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] busybox: setup "inetd" sub-package
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
X-List-Received-Date: Thu, 16 Feb 2017 20:48:00 -0000

From: Sylvain Lemieux <slemieux@tycoint.com>

Setup "inetd" as a sub-package in "busybox" and
add the support to install "inetd" as a startup script.

Signed-off-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/recipes-core/busybox/busybox.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 39c2eef082..a26fa08ca8 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -21,7 +21,7 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
 # We don't want '-e MAKEFLAGS=' in EXTRA_OEMAKE
 EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock ${PN}-inetd"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
@@ -29,8 +29,9 @@ FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfd
 FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
 FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
 FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
+FILES_${PN}-inetd = "${sysconfdir}/init.d/inetd.${BPN} ${sysconfdir}/inetd.conf"
 
-INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
+INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock ${PN}-inetd"
 
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
@@ -38,6 +39,7 @@ INITSCRIPT_NAME_${PN}-mdev = "mdev"
 INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
 INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
+INITSCRIPT_NAME_${PN}-inetd = "inetd.${BPN}"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
@@ -45,7 +47,7 @@ SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
 CONFFILES_${PN}-syslog = "${sysconfdir}/syslog-startup.conf.${BPN}"
 CONFFILES_${PN}-mdev = "${sysconfdir}/mdev.conf"
 
-RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc"
+RRECOMMENDS_${PN} = "${PN}-syslog ${PN}-udhcpc ${PN}-inetd"
 
 inherit cml1 systemd update-rc.d ptest
 
-- 
2.11.0


