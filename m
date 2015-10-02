Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2E16B770D4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 20:27:33 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so48956792wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Oct 2015 13:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=vhXpWUJtrgSA+Kd5eHdHLo0wgVjCUpVgwKVd/SxG5zA=;
	b=v1n12FUsOMb7uN8qMWDl+shrouEkkZMq6YTDky74KlhSI4SCsjKXjxJ0zxfODCMdtm
	ThVJ69oZLNYX95UO3d/wv5jta0JUFLbEzQ3lLELqi5OxV+9EoIMQzNcHQ/6ec0XTmS+5
	nElh+O3hPnkw8uzQKYkJ8cXBF8wM2BZ8ORZECALTk8bSwFwx0QXcUO5k1Aakag2Vnxav
	dMj7aHZgUwmi9oZPXnUuZfE8trHU52yewszSOsJOMEynxWwSMYDChCQwXYXxrYnfzYmU
	+vZjzhKPWT0Wl1hHXErOCKqJHLxGgBCjbQ6pyd2yzsqnc6m0YBLl4k2yF6JC67I7lLbz
	W+CA==
X-Received: by 10.194.172.233 with SMTP id bf9mr18288599wjc.107.1443817653513; 
	Fri, 02 Oct 2015 13:27:33 -0700 (PDT)
Received: from localhost.localdomain (p54AA5A10.dip0.t-ipconnect.de.
	[84.170.90.16]) by smtp.googlemail.com with ESMTPSA id
	jj8sm715718wid.2.2015.10.02.13.27.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Oct 2015 13:27:32 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 22:27:21 +0200
Message-Id: <1443817641-7847-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] udev: add PROVIDES = "libgudev"
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
X-List-Received-Date: Fri, 02 Oct 2015 20:27:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the last update of systemd libgudev was splitted out of systemd. To make
packages depending on libgudev happy, a recipe building libgudev was created in
meta-oe and the dependencies were modified from udev to libgudev.

This works fine for distros using systemd as init system, but distros not using
build udev which provides libgudev.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/udev/udev.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index a00dad5..c378ae3 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -15,6 +15,8 @@ LDFLAGS += "-lrt"
 DEPENDS = "glib-2.0 libusb usbutils pciutils glib-2.0-native gperf-native libxslt-native util-linux"
 RPROVIDES_${PN} = "hotplug"
 
+PROVIDES = "libgudev"
+
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
            file://avoid-mouse-autosuspend.patch \
-- 
2.1.0


