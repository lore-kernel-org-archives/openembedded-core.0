Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id D4D6F6DD28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 10:04:18 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hq4so8399346wib.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 02:04:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GRVtj3gjw84Nd1OSI4FUuSJrqSZ4qF3HY/NzVosRiSg=;
	b=DQ7eUHe9+aPjf9a5193Xlq0VVXUEhYnuNCBOhiuXz1P2EgSsaG9Qx7FkRuC5K2vOkr
	88gw99EI7W5QxjsJZ0yRqfg22uKp/CkZTNIb4tQti3ThZwMSD8T9HPmP9t3UihD547+1
	2Fi9uqpzeZc+94FSkk3IVlzevwjlyEbHg3zExb5Y/lTDOg4dCfJaWOFf1I4M7wC4/Ky/
	QKvECurMo5bPu9+h0Y9Kzr/JPflcq/Hhr2zI1gbYYVnqF1fBQuenfuKyejdLOiD0V+oK
	p+Vl9s5TDA5V4mHLrCNubVu4bwAC65e2p6I3NiagVfLvBAoGPMOdTPzCLXA6aTQN/4eZ
	ygWQ==
X-Gm-Message-State: ALoCoQmdhvSi2Z2gV1S/OUjhrQH7kH8j+h1zo1Dzpndh7QBJc1POXfhjHQOEqDR7Fi2QUh6vXphm
X-Received: by 10.194.119.106 with SMTP id kt10mr1245735wjb.72.1386842657059; 
	Thu, 12 Dec 2013 02:04:17 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d2sm23269488wik.11.2013.12.12.02.04.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Dec 2013 02:04:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Dec 2013 10:04:13 +0000
Message-Id: <1386842653-1089-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] systemd-compat-units: drop machineid.service
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
X-List-Received-Date: Thu, 12 Dec 2013 10:04:20 -0000

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


