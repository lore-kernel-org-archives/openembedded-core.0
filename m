Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.24354.1590707237170374424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 16:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: tgamblin@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04SN6uSA024098
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 16:07:06 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Thu, 28 May 2020
 16:06:45 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20958)	id 99D559007E6;
 Thu, 28 May 2020 16:06:45 -0700 (PDT)
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] qemuarm: check serial consoles vs /proc/consoles
Date: Thu, 28 May 2020 16:06:45 -0700
Message-ID: <20200528230645.6291-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Note that this patch affects qemuarm AND qemuarm64.

When booting a VM and during operation, the following message
periodically appears:

INIT: Id "hvc0" respawning too fast: disabled for 5 minutes

This is because hvc0 is specified in SERIAL_CONSOLES in qemuarm.conf
and qemuarm64.conf, but it is not in /proc/consoles and
SERIAL_CONSOLES_CHECK is not specified, leaving getty to attempt to
enable hvc0. Add SERIAL_CONSOLES_CHECK to both conf files so that
hvc0 isn't enabled if it hasn't been set there or in local.conf.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/conf/machine/qemuarm.conf   | 1 +
 meta/conf/machine/qemuarm64.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 367fcef019..4e605d3a92 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -8,6 +8,7 @@ require conf/machine/include/qemu.inc
 KERNEL_IMAGETYPE = "zImage"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-arm"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 7965fac71e..e8aac38475 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -8,6 +8,7 @@ require conf/machine/include/qemu.inc
 KERNEL_IMAGETYPE = "Image"
 
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 # For runqemu
 QB_SYSTEM_NAME = "qemu-system-aarch64"
-- 
2.24.1

