Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3119960E11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:20:18 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hq4so5552040wib.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 08:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GRVtj3gjw84Nd1OSI4FUuSJrqSZ4qF3HY/NzVosRiSg=;
	b=a6fSE/6i/vhWXApXCjC9jWpqrF02dM1oCgjLrxHZY7T+p2uHuegvdW0ARituaW1BcW
	s5yS4uKwKvrVZIQ4iKgMyveT+z+AgufazzEgOpzlTDzDZFNjqcdMa799TdajtmgjjlqU
	9h1DdaHVAPI/IzYVQ5Tlu75RS9KQYCX4tswYCoxKuPgChleg7zayNpnjxKOcvGwRXOzo
	Ud//aB5XBx/03g29Zi2pX83Sl16wDSkEvff/7fLrTm0eScROtAdzEl5FnJvZjJPmicrs
	0nHRa2dDwwC1jSat0RPWQ3FZIyq6fuygX/RaCn236kmB3PMmQwoQk62tNmJSJy+M0o7R
	LW1A==
X-Gm-Message-State: ALoCoQmR4Odk1LvH+nJJpG3EFgIx4o/iUrUoFl1HWhAqS0CaD+WFcsNXwKATg2U5CL1PZMTl4SZb
X-Received: by 10.194.110.138 with SMTP id ia10mr24567769wjb.3.1387383618633; 
	Wed, 18 Dec 2013 08:20:18 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm2179947wij.7.2013.12.18.08.20.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Dec 2013 08:20:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2013 16:20:05 +0000
Message-Id: <1387383607-4005-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
References: <1387383607-4005-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/6] systemd-compat-units: drop machineid.service
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
X-List-Received-Date: Wed, 18 Dec 2013 16:20:18 -0000

systemd will create the machine ID automatically if it isn't set, so this unit
doesn't serve any purpose.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb      |    4 ----
 .../systemd/systemd-compat-units/machineid.service     |   16 ----------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd-compat-units/machineid.service

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 6eb5ffd..e4d93d2 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -19,10 +19,6 @@ do_install() {
 	install -m 0644 ${WORKDIR}/run-postinsts.service ${D}${systemd_unitdir}/system
 	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/basic.target.wants/
 	ln -sf ../run-postinsts.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
-
-	install -m 0644 ${WORKDIR}/machineid.service ${D}${systemd_unitdir}/system
-	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/sysinit.target.wants/
-	ln -sf ../machineid.service ${D}${systemd_unitdir}/system/basic.target.wants/
 }
 
 SYSTEMD_DISABLED_SYSV_SERVICES = " \
diff --git a/meta/recipes-core/systemd/systemd-compat-units/machineid.service b/meta/recipes-core/systemd/systemd-compat-units/machineid.service
deleted file mode 100644
index f586c6d..0000000
--- a/meta/recipes-core/systemd/systemd-compat-units/machineid.service
+++ /dev/null
@@ -1,16 +0,0 @@
-[Unit]
-Description=Machine ID first boot configure
-DefaultDependencies=no
-ConditionPathExists=|!/etc/machine-id
-After=systemd-remount-fs.service
-Before=sysinit.target
-
-[Service]
-ExecStart=/bin/systemd-machine-id-setup
-RemainAfterExit=No
-Type=oneshot
-StandardOutput=syslog
-
-[Install]
-WantedBy=basic.target
-WantedBy=sysinit.target
-- 
1.7.10.4


