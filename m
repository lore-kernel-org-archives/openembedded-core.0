Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 04CB66BFDF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:06:52 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id cb5so1896604wib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 04:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=scl++nogY1XPVzYwW/UzphCW5hqZTLLyhro7Wzbn3UY=;
	b=nHcPQwNdHS6+RMIICEWXwYvXfpoqENaXZ6oQKa9MrpgIl1Ou4ZvepE7gNgJgZ96bLX
	bI7fknR4ut9YK1iIwuZkrIkfANE7gSQu8VGMqWUmyrnh4j3U4gPWtKCDp/V/48p2/VlP
	ReGGQViKx7ZUVnSB+6Tpy3fVWcjIjf8uSrFZqBP5jPOxg2oRxuwSYVGDOF3zxW3Tqhux
	S323iwpNfV+gWg/W5w0WnYdBluel8pr/m3js/IXTbiCAc4KiXPGcgsk+FPy3l/HofuCv
	6SQtndrB6bgoUvwP/31uoWshCEb1Mw2J5yZ6q7B7DqUBEBwHoU+6DlWqHFbUpy/rrFw1
	oijw==
X-Gm-Message-State: ALoCoQl9c/Vx4PeSkfTboC+RSLr04VZC6Dq6z6D81KuMHWss9jSqVm1bDYn0KyyvHOrhv22LNvdl
X-Received: by 10.180.90.19 with SMTP id bs19mr883434wib.15.1378897613888;
	Wed, 11 Sep 2013 04:06:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id dq11sm9814805wid.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 04:06:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 12:06:48 +0100
Message-Id: <1378897608-22588-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] ia32-base: only depend on mesa-driver-i9xx if opengl is enabled
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
X-List-Received-Date: Wed, 11 Sep 2013 11:06:54 -0000

As Mesa refuses to compile if the "opengl" DISTRO_FEATURE isn't enabled,
mesa-driver-i9xx has to be conditional in the ia32 machine defintion too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/ia32-base.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index cb542a5..203776c 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -38,11 +38,11 @@ XSERVER_IA32_EXT = " \
            "
 
 XSERVER_IA32_I915 = "xf86-video-intel \
-           mesa-driver-i915 \
+           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i915', '', d)} \
            "
 
 XSERVER_IA32_I965 = "xf86-video-intel \
-           mesa-driver-i965 \
+           ${@base_contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-i965', '', d)} \
            "
 
 XSERVER_IA32_VESA = "xf86-video-vesa"
-- 
1.7.10.4


