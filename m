Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BC9456CB7C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 16:40:11 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l18so7125252wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 08:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=py55fxB4lDiZ2ugAVvvGy/kgT3vNMBmNXXg9ZTI3kzE=;
	b=ZTWHtGT0vMNuCt6U1k+zid90+eZHLJV72VlZubT7MZb4oYfpJFixM3+GxOrutVGYwh
	mtfRuIOcGV3R3Dh1VbZ+rHMU1wl++uDz5LceQKE+P2sNjdIb3eXLjmt0pINNOiD4YrzL
	3d91f56oDejGgohRLLrU8GN8PxWEMlLnc/IrOZPGTvkyzh7/EASKdNkMmAmo8XRNdnhi
	cFRVf1F1B23qBRfrOyQ4M2lJdQsAW6arRPMSR6ccNc7PURwbz2M4lDZ61yTkbbkzuZ6Y
	Pybw9daamfptzh64xfcCZIWZx9iP1h05IoyRDspjR/nreKR5WBtc9T1GqIA+aWicgBEr
	yUCQ==
X-Gm-Message-State: ALoCoQkYGSR/DLoicrbIDxiIy+vdfplMsj4q2s5UU4Yce8Yyu6q5Kgrjfnw1SuiiXl3AwcUV7AKL
X-Received: by 10.194.23.201 with SMTP id o9mr2314301wjf.67.1390236012096;
	Mon, 20 Jan 2014 08:40:12 -0800 (PST)
Received: from localhost ([2001:610:612:0:21f:c6ff:feaa:c5fb])
	by mx.google.com with ESMTPSA id ay6sm2279461wjb.23.2014.01.20.08.40.10
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 08:40:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2014 17:40:04 +0100
Message-Id: <1390236004-18570-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH] kdbus: add git version
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
X-List-Received-Date: Mon, 20 Jan 2014 16:40:12 -0000

This builds the kernel portion of the kdbus implementation. Userspace support needs systemd git and/or a special glib-2.0 branch.

Due to the use of task_cgroup_path() a 3.11.x or newer kernel is needed.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/dbus/kdbus_git.bb |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/dbus/kdbus_git.bb

diff --git a/meta/recipes-core/dbus/kdbus_git.bb b/meta/recipes-core/dbus/kdbus_git.bb
new file mode 100644
index 0000000..327901d
--- /dev/null
+++ b/meta/recipes-core/dbus/kdbus_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Kernel 'dbus-like' code for the Linux kernel"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://bus.c;beginline=7;endline=10;md5=7d4e724c14885945ad54d05f469f6d0b"
+
+inherit module
+
+PV = "0.0"
+
+SRCREV = "cc55ddf6e5ab685a991fa587c0c7539cc2b95cdf"
+SRC_URI = "git://github.com/gregkh/kdbus.git;protocol=https"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "KERNELDIR=${STAGING_KERNEL_DIR}"
+
+# there's no modules_install target and the install target uses 'uname -r', so install the module manually
+# '/lib/modules/${KERNEL_VERSION}' is lifted straight from module-strip.bbclass
+do_install() {
+	install -d ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/kdbus
+	install -m0644 kdbus.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/kdbus
+}
-- 
1.7.10


