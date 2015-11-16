Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 40419762B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 10:54:45 +0000 (UTC)
Received: by wmec201 with SMTP id c201so169705824wme.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 02:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gjdkOhrA2P0mhfL+rcvNz7Nz0dBvGmUI/6hAENmZc+w=;
	b=Zd+K2gBoT0Bc+RAL/jptHBMwa2g0/NKQ5qiqojSDpIlp08Xkr7+1ER9xIrzIL7CN2f
	auOM6mWjPkOs3l3P4DbUEPpwE4cliQ44B8njwpF9+Q4xDd5oADP+MCwMv879eOT5s5pz
	vg1zuODG8uYC818Ta7CA7n5EYqIPSKV3HP87TKtKc5Z96GA+9WG991UoMWnn1CRoimm3
	E5kRtYVAyj+d2s/+uJyqf1v8JAzoidwXkm2PYKaskI8sYAqM7uuBlWuBR32yXh0bejrV
	PbYkO6wqqV3HlzdmEdufVqt8P1NqiRgiB+ldXs133SKYtHSIaGVk/OSGIq6laHhxgiCz
	7MLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gjdkOhrA2P0mhfL+rcvNz7Nz0dBvGmUI/6hAENmZc+w=;
	b=Sdn5m9Obj8TPabW2/Xl0mYtcmjHVl865lKoNot9FCJ3fO2/CuGjQqqGHJ9Iy/JBHwj
	JoJ+rs++f1gNPaNsbcL7klJaHE/2OJlbkHW/TH+OIrfKecy2+culXAmkpwv5qcvrdund
	vc0rBryMzYefkenK1z1hPVjrCj0O+HtQ59CGqrROwVEnYnYITcrkJSnFsWWjro+A7S2j
	X8XaLMXGel01QJH4WnCXXz1u2jQ2PPFs2UzaQxnYzl0wUGNhYn9F6g9Bc3vsiiI5a7+u
	NcfF39HlBz8LlV22GNM9f0ZSXkhckqF760rp7014cujwzPIUIFwbm6Fh+4b4XdsQFVk5
	PPTQ==
X-Gm-Message-State: ALoCoQk+NmtjXYzAhmTNXT4BO5gHQju9HnVtUkKpmExqHAqYP+uxEX8tgN/9Y/JP84syE79FWgGr
X-Received: by 10.28.210.74 with SMTP id j71mr6122352wmg.96.1447671285529;
	Mon, 16 Nov 2015 02:54:45 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	s2sm17958142wmd.13.2015.11.16.02.54.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Nov 2015 02:54:44 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Nov 2015 10:46:21 +0000
Message-Id: <1447670781-13736-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libusb1: fix make install race
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
X-List-Received-Date: Mon, 16 Nov 2015 10:54:47 -0000

There's an install race in when building in parallel, remove a redundant rule to
stop it happening.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libusb/libusb1/no-dll.patch | 19 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.20.bb    |  1 +
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/no-dll.patch

diff --git a/meta/recipes-support/libusb/libusb1/no-dll.patch b/meta/recipes-support/libusb/libusb1/no-dll.patch
new file mode 100644
index 0000000..6e6bb83
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/no-dll.patch
@@ -0,0 +1,19 @@
+As all invokes all-recursive which uses sub-makes to invoke all-am, the
+resulting makefile wants to build libusb-1.0.la twice. In non-parallel builds
+the second attempt is skipped as the target already exists, but in highly
+parallel builds it's likely that two makes will be building libusb-1.0.la at the
+same time.
+
+Solve this by removing the explicit all target, which as libusb-1.0.dll isn't
+built under Linux is redundant anyway.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/libusb/Makefile.am b/libusb/Makefile.am
+index 0cab0a0..c880213 100644
+--- a/libusb/Makefile.am
++++ b/libusb/Makefile.am
+@@ -1,2 +0,0 @@
+-all: libusb-1.0.la libusb-1.0.dll
+-
diff --git a/meta/recipes-support/libusb/libusb1_1.0.20.bb b/meta/recipes-support/libusb/libusb1_1.0.20.bb
index 21b8b45..4cad2d4 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.20.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.20.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
+           file://no-dll.patch \
           "
 
 SRC_URI[md5sum] = "1d4eb194eaaa2bcfbba28102768c7dbf"
-- 
2.1.4


