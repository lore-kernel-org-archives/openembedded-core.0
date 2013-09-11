Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id C6E3C6B05F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 09:27:25 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id c10so1882801wiw.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 02:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=I8Gjj7uuxxZNEQCgfJRouDUPMD+6wO2LaL9YnjpAHr8=;
	b=aqBA+DmNWjOV+/YN8nythOCiERA/3M80VcmJu9ykBT7pJgKfdSVrzjLG8MRfDPNee1
	xPjW2w8Z1Xm7zgVXigPGHhUiyFIAfaWCDhAjUT2Fo3eRDqYCuSe+07a5I7P2+D5uX4wn
	8nVPRBkwizl3OQ07QQIRq8NQsNGgGIV6zPnnCrTEJ9GF8tjQqD05IshGBXZCrpQAsKg4
	nI7KgXOaVvq6ILWuY3bmZ9Bi4IsrBSRZTDQJnji+r2b9p2b4/MkiqC7cZeVvStuPJ0we
	iItS7HUXqMevh59ncit04dPRaexIHGJMmxtq24zrKCcKCnrXAu7incvbPYJBvuEeHEHt
	WJ9Q==
X-Gm-Message-State: ALoCoQmJspunvYjyBZUlgQONDPZR3UIKcdfMi4DTFeSHIav5KQQidokQEZ2T5Xq9qiFTv+LdoE2z
X-Received: by 10.180.85.65 with SMTP id f1mr16267814wiz.33.1378891646698;
	Wed, 11 Sep 2013 02:27:26 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b13sm8543135wiv.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 02:27:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 10:27:22 +0100
Message-Id: <1378891642-20906-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] qemu: only depend on mesa-driver-swrast if opengl is enabled
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
X-List-Received-Date: Wed, 11 Sep 2013 09:27:27 -0000

As Mesa refuses to compile if the "opengl" DISTRO_FEATURE isn't enabled,
mesa-driver-swrast has to be conditional in the QEMU machine defintions too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/qemu.inc |    2 +-
 meta/conf/machine/qemux86-64.conf  |    2 +-
 meta/conf/machine/qemux86.conf     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index 95d7e66..a78622d 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 XSERVER ?= "xserver-xorg \
-            mesa-driver-swrast \
+            ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
             xf86-input-evdev \
             xf86-input-mouse \
             xf86-video-fbdev \
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index ff666af..c572225 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER = "xserver-xorg \
-           mesa-driver-swrast \
+           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 5f107be..94ee573 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLE = "115200 ttyS0"
 
 XSERVER = "xserver-xorg \
-           mesa-driver-swrast \
+           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
-- 
1.7.10.4


