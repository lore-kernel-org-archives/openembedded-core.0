Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id D1BA57A4B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Oct 2018 11:12:32 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u12-v6so13430280wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2018 04:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=foF07gXJ/ueVlxtibfu+om/wk8R8MNEAwNSo993PtJQ=;
	b=EHsN8MpMAn9VCOvqcJ6dijqsPa/xfPK1C8S+Wpvx4hjpWXfG+YgT6BD6wrT2LDYQ8s
	x08HhIZ5w/2ALqeLJXLJun9S/dm/BY8UsPJemne8ge5We74X9Td7fBMuKRaVchq17+he
	obCGZD2eIl7w26xKEw+HNGSblHzVC4eFYszTi2QNvA2HJ2bZH9x9BkkatBBW6ZbZ3lyL
	+ZIIQPNqQZoT/qscDKVnZ9ocUbLIlmRTZi6Cymg8/VLh++eeXopWsDd8ODGjpz4JlYTY
	E46p66eQoSN00NuMID9KuGGfHRnstKX7qAq6srk8rz+d4stDfOo9I20aAm81sO2br22+
	ylug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=foF07gXJ/ueVlxtibfu+om/wk8R8MNEAwNSo993PtJQ=;
	b=tsY1fSCbNs8bKqeH3g1a8EFOLvWNuGqc3xAylMR/F3Msn1SvdYGfyQdViEB+tCcasC
	YLxnaNkOXt4IYYXwna+CvfWRSco5Zyjo4tnN8dUJkDw+QQSL+eYujaq6K9ZzcZy/E1B1
	AwB8FzZsK1/au1UpcyMhLUqqZ4G19NsgaF8k+E7EciuUrvCyCjHIjtT5f//7r1/WTwTg
	UmMksinNxVSTIAYQBR8DYerBqqNg6uxz51bzylyPZc+TwCsVsCoHqfSqL22Ne2dSuOPu
	fbq2+TW23RVjZLDp3ZGbgKZv1jOmO0bqEzqh4J+s0sbRCmr26kH0MuDKN8yfxtoTl9Kl
	D1lQ==
X-Gm-Message-State: ABuFfogAJO3RWYp2EMuuRWGB1nX+H1dXGKlBYDwEycmU0jk2zEhZ8G7Y
	GW6wUm9AOGPW54KjgbuqSJTwY75W
X-Google-Smtp-Source: ACcGV62bY5OHsT2WMVX9WfCH4AYLRD6/5IMb2Kd+yZJhbJYdvxylntJtQSwmZ5BJtaFjeXHU/ov9DA==
X-Received: by 2002:adf:9e8f:: with SMTP id
	a15-v6mr6370003wrf.70.1538392353329; 
	Mon, 01 Oct 2018 04:12:33 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u127-v6sm8101220wmf.48.2018.10.01.04.12.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Oct 2018 04:12:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2018 11:12:33 +0000
Message-Id: <20181001111233.29181-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] bitbake.conf: move IMAGE_NAME_SUFFIX variable from image_types.bbclass
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
X-List-Received-Date: Mon, 01 Oct 2018 11:12:33 -0000

* currently it's used only by image.bbclass, image_types.bbclass and
  meta/recipes-core/images/build-appliance-image_15.0.0.bb
  but if it's needed by some recipe which isn't itself an image, then
  it's useful in bitbake.conf, e.g. we have a recipe for creating
  VirtualBox appliances which combines .wic.vmdk with .ovf file to
  create .zip with appliance, but for that we need the filename of
  .wic.vmdk which now contains IMAGE_NAME_SUFFIX
  https://github.com/webOS-ports/meta-webos-ports/blob/4980ce52a43ac6897657602810313af359f0b839/meta-luneos/recipes-core/images/luneos-emulator-appliance.inc#L24

* we were hardcoding .rootfs suffix where needed, but for quite long
  time it's configurable with IMAGE_NAME_SUFFIX and might not match:

  commit 380ee36811939d947024bf78de907e3c071b834f
  Author: Patrick Ohly <patrick.ohly@intel.com>
  Date:   Mon Mar 7 18:07:52 2016 +0100

    image creation: allow overriding .rootfs suffix

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/image_types.bbclass | 6 ------
 meta/conf/bitbake.conf           | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 00a00d318f..6e301cbeb9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,9 +1,3 @@
-# IMAGE_NAME is the base name for everything produced when building images.
-# The actual image that contains the rootfs has an additional suffix (.rootfs
-# by default) followed by additional suffices which describe the format (.ext4,
-# .ext4.xz, etc.).
-IMAGE_NAME_SUFFIX ??= ".rootfs"
-
 # The default aligment of the size of the rootfs is set to 1KiB. In case
 # you're using the SD card emulation of a QEMU system simulator you may
 # set this value to 2048 (2MiB alignment).
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 017cb163ba..62362eac48 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -450,6 +450,12 @@ IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
 IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 IMAGE_LINK_NAME = "${IMAGE_NAME}${IMAGE_VERSION_SUFFIX}"
 
+# IMAGE_NAME is the base name for everything produced when building images.
+# The actual image that contains the rootfs has an additional suffix (.rootfs
+# by default) followed by additional suffices which describe the format (.ext4,
+# .ext4.xz, etc.).
+IMAGE_NAME_SUFFIX ??= ".rootfs"
+
 # This option allows for a percentage overage of the actual image size rather than a
 # fixed extra space, this is space needed for initial startup and basic operations.
 IMAGE_OVERHEAD_FACTOR ?= "1.3"
-- 
2.17.1


