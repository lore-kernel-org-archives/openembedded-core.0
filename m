Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id E1EAE76FDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:49:13 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so12132868ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 23:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fHM/nq+V+cTxkEQEduf6I1EYAasueKVFOpi666Kikr4=;
	b=ld8i20dKzHZ6t1LRJXEbyKssddQcaKdeD1krk1w538LQ1wTsweu9BrsKH8qGFVdQKQ
	aWLHT+hQXMe0vEhejCAdBUCWJWhm9vV6+OQEZKtS+XAWzded3dsFHjhcgtvx6uEwaOj9
	428sMRhT8xlfo86kc+dpXpzIzrR+IbJaImWmmySzbT4Vn8yigvaKs27ds54INaJQhKsi
	dI9WJ9xpjebsOxzCtzWj6aDJmtn/TwuHCJqRHl/oBMlzcHb2cwuw7AORXdrIxm6Fy0bl
	8b4Bo3T7mWtfzQC6lSekZIjv+gts0Z+IMDg79Ug3DQuuNN5Iv0vu1rhZbub5iknWzRCc
	JIwQ==
X-Gm-Message-State: ALoCoQlAR9Of502sVZkhJrWspWoOywHxZzQLRuhN2GqkXp8dI9zT19b0dzLQuUhKi7HnET+tj8Wn
X-Received: by 10.107.5.74 with SMTP id 71mr3337587iof.161.1442472553607;
	Wed, 16 Sep 2015 23:49:13 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E7DB.dip0.t-ipconnect.de.
	[93.232.231.219])
	by smtp.gmail.com with ESMTPSA id 67sm746553iog.34.2015.09.16.23.49.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Sep 2015 23:49:13 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 08:49:36 +0200
Message-Id: <1442472576-2334-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442472281.27156.24.camel@intel.com>
References: <1442472281.27156.24.camel@intel.com>
Subject: [PATCH] systemd: apply persistent storage udev rules also for /dev/hd*
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
X-List-Received-Date: Thu, 17 Sep 2015 06:49:14 -0000

This fixes booting with initramfs and root=UUID on machines with IDE
disks, like "runqemu hdddirect", and kernels which still use the
deprecated CONFIG_IDE.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../systemd/rules-whitelist-hd-devices.patch       | 32 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_225.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/rules-whitelist-hd-devices.patch

diff --git a/meta/recipes-core/systemd/systemd/rules-whitelist-hd-devices.patch b/meta/recipes-core/systemd/systemd/rules-whitelist-hd-devices.patch
new file mode 100644
index 0000000..8975b05
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/rules-whitelist-hd-devices.patch
@@ -0,0 +1,32 @@
+From f77b7e5626e70c3a775e993816a33af5a61dea42 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Wed, 16 Sep 2015 13:55:58 +0200
+Subject: [PATCH] rules: whitelist hd* devices
+
+qemu by default emulates IDE and the linux-yocto kernel(s) use
+CONFIG_IDE instead of the more modern libsata, so disks appear as
+/dev/hd*. Patch rejected upstream because CONFIG_IDE is deprecated.
+
+Upstream-Status: Denied [https://github.com/systemd/systemd/pull/1276]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ rules/60-persistent-storage.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rules/60-persistent-storage.rules b/rules/60-persistent-storage.rules
+index 0b14bb4..1c4d97a 100644
+--- a/rules/60-persistent-storage.rules
++++ b/rules/60-persistent-storage.rules
+@@ -6,7 +6,7 @@
+ ACTION=="remove", GOTO="persistent_storage_end"
+ 
+ SUBSYSTEM!="block", GOTO="persistent_storage_end"
+-KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*", GOTO="persistent_storage_end"
++KERNEL!="loop*|mmcblk*[0-9]|msblk*[0-9]|mspblk*[0-9]|nvme*|hd*|sd*|sr*|vd*|xvd*|bcache*|cciss*|dasd*|ubd*", GOTO="persistent_storage_end"
+ 
+ # ignore partitions that span the entire disk
+ TEST=="whole_disk", GOTO="persistent_storage_end"
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 6ac99cd..b1a1818 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
+           file://rules-whitelist-hd-devices.patch \
           "
 SRC_URI_append_qemuall = "file://qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.1.4


