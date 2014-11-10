Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id ADCF065D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 10:11:37 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so8291767wgh.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 02:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cYDu+5zR1b0PglU36Iolxyy+Fc4FhE+P8l2k2/CeW6Q=;
	b=a8xqJw7R32KbQ5ch3kU7zF1Zr/MqRJuO4qi7kmnzp1m9ndIYxnziVGUJsb/6kG6BGh
	k4mjJpzatMslBLNNQKieUw8WlniEneN7b2DhRs7naviHyqRP9rcnPZL9+gzjtIpfVZ0R
	Mjho7nHVNyCUp/LPvZQshKTQLnZdxALIuHdUA76AjWWC3rF18S+bWJKyzkNRynV9OHGp
	0lkzyj1UqbJx7z2QfXplSaBHHydh4uNj4EzmSHOAxWdoqc2LzLYXdcYLe09PnZZY7ulB
	F7LBiiWlXvwUGfMK0QIj6c55z0ElapdMLxv4IauIYqPQdnQ0SLPaiXs0HEbS9hoGDYYE
	lTSQ==
X-Gm-Message-State: ALoCoQnFi8IBLmBfcIWJDJTBx6LuemEwOmQbAF2fgDwx3qiDLtDzUEcLGmZEDZ9aKvcylthYYemp
X-Received: by 10.180.186.175 with SMTP id fl15mr29519714wic.38.1415614297653; 
	Mon, 10 Nov 2014 02:11:37 -0800 (PST)
Received: from localhost ([2001:610:612:0:beee:7bff:fe9e:ae56])
	by mx.google.com with ESMTPSA id mu4sm12806993wib.2.2014.11.10.02.11.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 10 Nov 2014 02:11:36 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 11:11:33 +0100
Message-Id: <1415614293-25957-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv2] gptfdisk: add 0.8.10+git version
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
X-List-Received-Date: Mon, 10 Nov 2014 10:11:38 -0000

Besides from being useful as fdisk replacement this gives us 'sgdisk'
which can be used to set the GUID for partitions, e.g.

	sgdisk -t 1:C12A7328-F81F-11D2-BA4B-00A0C93EC93B /dev/mmcblk0p1

To mark it as ESP in scripts like mkefidisk.sh.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

Changes:
	v2: bindir -> sbindir 

 meta/recipes-devtools/fdisk/gptfdisk_git.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk_git.bb

diff --git a/meta/recipes-devtools/fdisk/gptfdisk_git.bb b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
new file mode 100644
index 0000000..477c1d9
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk_git.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "GPT fdisk is a disk partitioning tool loosely modeled on Linux fdisk, but used for modifying GUID Partition Table (GPT) disks. The related FixParts utility fixes some common problems on Master Boot Record (MBR) disks."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "util-linux popt ncurses"
+
+PV = "0.8.10+git${SRCPV}"
+SRCREV = "a920398fa393f9d6301b32b191bc01e086ab8bc8"
+SRC_URI = "git://git.code.sf.net/p/gptfdisk/code"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${sbindir}
+    install -m 0755 cgdisk ${D}${sbindir}
+    install -m 0755 gdisk ${D}${sbindir}
+    install -m 0755 sgdisk ${D}${sbindir}
+    install -m 0755 fixparts ${D}${sbindir}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.0


