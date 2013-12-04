Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id AC3D96D2A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 16:10:05 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id ca18so8480657wib.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 08:10:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BQ8yMuHic1SlhXdAJamHHAScfXrdwp+/rCw5FBOuY1s=;
	b=V4LfWlYAC+Zk6T0c2Ic0ThH6/FihlC1c6Mri+lj8P1Za15FEp634/Ip0kPXHCysCGc
	y8qcD2muEGx+aLIMGI1UjYJyL31cgWu7xgzF5w723OdsJjX4C0Q9yHRiLD/IoiCDBUtX
	ojE/kMij9NMWn4+CHnJoN6A1rDbkN66KPWlSwdNhfJS2vxi5jpnfVu0G//UH5A+1O7mO
	1PpndHbiUqb/1VPExRzsxtJuiSccmfBJWpRWpTytSKGKGZNQDF2LS4wfqKICg9/4ZKjL
	JCjfJDRM3r0TvnxiwxDkVmhAWt2dtgE11p3CVY7d/zJZrygiceuRrn3bvGff9nmCBoor
	5kHw==
X-Gm-Message-State: ALoCoQl9UE92k7JFmXRRQjlb/6aX6uwB/j1vUTB80vQKXvqGaxdPIUYeGEM4S+5xizimThwK2PDk
X-Received: by 10.180.126.9 with SMTP id mu9mr8037733wib.14.1386173404042;
	Wed, 04 Dec 2013 08:10:04 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id ll10sm8182722wic.9.2013.12.04.08.10.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 08:10:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 16:09:56 +0000
Message-Id: <1386173396-8482-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] gmae: remove GMAE toolchain and packagegroups
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
X-List-Received-Date: Wed, 04 Dec 2013 16:10:06 -0000

GMAE (GNOME Mobile And Embedded) doesn't really exist anymore and these packages
were a subset of it anyway.  Remove as they don't give the user anything useful
now that you can generate a SDK from an arbitrary image.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/meta-toolchain-gmae.bb      |    7 -----
 .../packagegroups/packagegroup-core-sdk-gmae.bb    |   24 -----------------
 ...packagegroup-core-standalone-gmae-sdk-target.bb |   22 ---------------
 .../packagegroups/packagegroup-sdk-gmae.inc        |   28 --------------------
 4 files changed, 81 deletions(-)
 delete mode 100644 meta/recipes-core/meta/meta-toolchain-gmae.bb
 delete mode 100644 meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
 delete mode 100644 meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
 delete mode 100644 meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc

diff --git a/meta/recipes-core/meta/meta-toolchain-gmae.bb b/meta/recipes-core/meta/meta-toolchain-gmae.bb
deleted file mode 100644
index 5d80574..0000000
--- a/meta/recipes-core/meta/meta-toolchain-gmae.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-TOOLCHAIN_TARGET_GMAETASK ?= "packagegroup-core-standalone-gmae-sdk-target packagegroup-core-standalone-gmae-sdk-target-dbg"
-TOOLCHAIN_TARGET_TASK = "${TOOLCHAIN_TARGET_GMAETASK}"
-TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-toolchain-gmae-${DISTRO_VERSION}"
-PROVIDES = "meta-toolchain-sdk"
-require meta-toolchain.bb
-
-TOOLCHAIN_NEED_CONFIGSITE_CACHE += "zlib"
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
deleted file mode 100644
index d42ea7e..0000000
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-sdk-gmae.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
-
-SUMMARY = "GNOME Mobile And Embedded SDK (host tools)"
-LICENSE = "MIT"
-PR = "r13"
-
-inherit packagegroup
-
-require packagegroup-sdk-gmae.inc
-
-PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
-
-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-sdk-gmae"
-RREPLACES_${PN} = "task-core-sdk-gmae"
-RCONFLICTS_${PN} = "task-core-sdk-gmae"
-
-RDEPENDS_${PN} = "\
-    packagegroup-core-sdk \
-    libglade-dev \
-    ${SDK-GMAE} \
-    ${SDK-EXTRAS}"
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
deleted file mode 100644
index e3b8484..0000000
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-#
-# Copyright (C) 2007 OpenedHand Ltd.
-#
-
-SUMMARY = "GNOME Mobile And Embedded SDK (target tools)"
-LICENSE = "MIT"
-PR = "r16"
-
-inherit packagegroup
-
-require packagegroup-sdk-gmae.inc
-
-# For backwards compatibility after rename
-RPROVIDES_${PN} = "task-core-standalone-gmae-sdk-target"
-RREPLACES_${PN} = "task-core-standalone-gmae-sdk-target"
-RCONFLICTS_${PN} = "task-core-standalone-gmae-sdk-target"
-
-RDEPENDS_${PN} = "\
-    packagegroup-core-standalone-sdk-target \
-    libglade-dev \
-    ${SDK-GMAE} \
-    ${SDK-EXTRAS}"
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
deleted file mode 100644
index 416e05d..0000000
--- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
+++ /dev/null
@@ -1,28 +0,0 @@
-SDK-GMAE = " \
-    dbus-dev \
-    dbus-glib-dev \
-    gtk+-dev \
-    gstreamer-dev \
-    bluez4-dev \
-    gconf-dev \
-    avahi-dev \
-    telepathy-glib-dev \
-    libxi-dev \
-    libsqlite3-dev \
-    gnome-desktop \
-    libart-lgpl \
-    libtelepathy \
-    pulseaudio \
-    telepathy-glib \
-    telepathy-idle \
-    telepathy-mission-control \
-    telepathy-python \
-    "
-
-# TODO: gvfs-dev, mission-control
-
-SDK-EXTRAS ?= ""
-SDK-EXTRAS_qemux86 ?= " valgrind lttng-ust-dev"
-SDK-EXTRAS_qemux86-64 ?= " lttng-ust-dev"
-SDK-EXTRAS_qemuppc ?= " lttng-ust-dev"
-SDK-EXTRAS_qemuarm ?= " lttng-ust-dev"
-- 
1.7.10.4


