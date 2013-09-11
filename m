Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1A05360F1F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 20:30:30 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cb5so2667117wib.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8idaqku9wIbwaYdEmhgzITV/WiUZcTfdP5o6SlL1YM8=;
	b=lk1QZZ9D4hZukSATVmYQWRvFdxRqWtUFxM+E9NJnEeVtvhFV1Fi0eGYvV3Wb/GM1Ke
	jKbYJPA/yoN4/7bjog9eOEOYid2DKlDJKZz2282woSjCKq7SKeJRiIZZlhdYy/rP4PLZ
	EMjhS+FxLESclEBxFC3qNPhwEjqLOVDPiXuJT4BDaeIfO57yR0kba1/whaZ0oYvDef7y
	Aj28a+9O+cqeJciM++crBVgx00i5Lr86Xiwo0bZIpNiUN6yNv+L7+idqdYmeMIIcjrD7
	vZWQod7+0BP1+zI3BgG8OftISvThWApDCbHBcZTAoyLeveN0O7lyDDK/Urr3k/NzfUlk
	4DEg==
X-Gm-Message-State: ALoCoQkLjrPSG2K+ZsSzgmFapiXwDnbnVSGL9WktLOmgMprkSfyEYt3DRf20wKqXrW3hNHNNuyWL
X-Received: by 10.180.189.49 with SMTP id gf17mr18598516wic.23.1378931432474; 
	Wed, 11 Sep 2013 13:30:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e1sm8305776wij.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 13:30:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 21:30:25 +0100
Message-Id: <1378931427-3479-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/3] ia32-base: only depend on GL if opengl DISTRO_FEATURE enabled
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
X-List-Received-Date: Wed, 11 Sep 2013 20:30:32 -0000

As Mesa refuses to compile if the "opengl" DISTRO_FEATURE isn't enabled,
mesa-driver-i9xx and the GLX X module have to be conditional in the ia32 machine
defintion too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/machine/include/ia32-base.inc |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/include/ia32-base.inc
index cb542a5..e58a314 100644
--- a/meta/conf/machine/include/ia32-base.inc
+++ b/meta/conf/machine/include/ia32-base.inc
@@ -33,16 +33,16 @@ XSERVER_IA32_BASE = "xserver-xorg \
            "
 
 XSERVER_IA32_EXT = " \
-           xserver-xorg-extension-glx \
+           ${@base_contains('DISTRO_FEATURES', 'opengl', 'xserver-xorg-extension-glx', '', d)} \
            xserver-xorg-module-libint10 \
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


