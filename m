Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 683606F4E8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 14:21:45 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so6232198wes.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Apr 2014 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=k0bl6f2ePCuUViNsIlvSfk4A68DPa1XgtcQrk5ua5A0=;
	b=oFfVTPJBV3/yCCmTNQVqzvrGCLOHvSGnJKyo0rKyfO4xs0MckAZ6CCWHFYIIDGHcWV
	esjirD+UHT06rl/BvRw1zn09fBGW8cwq6OPX64ULeq5D30oGfWgpjZQzAJKBt2ufddle
	wy0VIlQGpc5CfQHi5HyV/0+oHhCPjRvKp9Jb4CwUoPVPFDylCp8VGK62RQu3xZga4k/Y
	eKgUefJhQV3cTrs6bw/AXMsFE9J4InSBk5WsZgUbr8ka9w/ZaKT3zNAih7O7LqYVBIkE
	V7CIlMG9uFl/7Sm9BxPpQrb5mEIF/UBf4mBbyNElsRqKyW2rT/WlZ666eDDtRfxWwFrM
	p0Tw==
X-Received: by 10.180.100.169 with SMTP id ez9mr20522800wib.15.1396362105962; 
	Tue, 01 Apr 2014 07:21:45 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id m8sm40906006eeg.11.2014.04.01.07.21.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 07:21:45 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Apr 2014 16:21:38 +0200
Message-Id: <1396362098-14134-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] image.bbclass: make x11-base a valid image feature
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
X-List-Received-Date: Tue, 01 Apr 2014 14:21:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

make

commit 049f89155b1e80875aad6e53b21808b827c06915
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Fri Dec 20 10:45:52 2013 +0800

    image.bbclass: add ability to set systemd default target

    Add ability to set the default target for systemd images.

    The default target for system is controlled by SYSTEMD_DEFAULT_TARGET.
    The default value for this variable is derived from checking whether
    IMAGE_FEATURES contains 'x11-base' or not. Each image could override
    this value in its own recipe. For now, we don't need to do any change,
    because all images that support graphical environment has 'x11-base'
    in its IMAGE_FEATURES.

    [YOCTO #3816]

    Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
    Signed-off-by: Saul Wold <sgw@linux.intel.com>

work for users wanting graphical target. Fixes

ERROR: 'x11-base' in IMAGE_FEATURES is not a valid image feature. Valid features: dbg-pkgs debug-tweaks dev-pkgs doc doc-pkgs package-management ptest-pkgs qtcreator-debug read-only-rootfs splash staticdev-pkgs

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 29309f5..35e8d3b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -22,7 +22,7 @@ inherit ${TESTIMAGECLASS}
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?= ""
 IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs"
+IMAGE_FEATURES[validitems] += "debug-tweaks read-only-rootfs x11-base"
 
 # rootfs bootstrap install
 ROOTFS_BOOTSTRAP_INSTALL = "${@base_contains("IMAGE_FEATURES", "package-management", "", "${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)}"
-- 
1.8.3.1


