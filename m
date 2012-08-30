Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T78Ps-0004g4-2x
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:20:28 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 10:08:10 -0700
Received: by wibhq4 with SMTP id hq4so516908wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=qkmKKZcK3Yh1MticfT/nl+50oln5PQwIZbkaqOry6xY=;
	b=JozQLSbqpXqCHUEJ4rb6aPU0/uCMoJEF5BjWHW6l5gYQLWGYVnqzpYagT+M6/XSm4F
	qgSLBVi0JcbwAKZWb2dEmIiYHlGkxxc/ZE/86XCEVSJ/NHO1pyEDjeNplPJ4dKhEzusV
	YKiZVbuLwLtW2venN3bEdzNy6xzflTrzQGF96uOCG/mHU6o0up762qmNezrSZ5Zj3aX/
	GMiJJqCiwRRmauEwJO/9/SGZwNFdgHXrAX3O98+D2xpLiMe+dRsTcBTblcAenGDLtceu
	JtYhqIbvM/rlv6LhsH8wVFcp6Qd8PskxmilrDyEXqo4bc7QuHmI2QxFay2wN9AVC7EfD
	Y5XQ==
Received: by 10.216.133.148 with SMTP id q20mr2985731wei.201.1346346489060;
	Thu, 30 Aug 2012 10:08:09 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm1707554wib.0.2012.08.30.10.08.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:08:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 18:07:20 +0100
Message-Id: <2a99c8c32800732abc08292ee5e0352661b30ffa.1346346320.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmnPlwV8xXQR1j3k0pHfUbBMxAdMKyRLhaVyez4aXNj8RMd6YYr2tGiGK+AOtobnqky1D+1
Subject: [PATCH 1/6] bsp: set default XSERVER for PowerPC and MIPS machines to Xorg
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 17:20:28 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../substrate/target/arch/mips/conf/machine/{{=machine}}.conf   |    7 +++++--
 .../target/arch/powerpc/conf/machine/{{=machine}}.conf          |    7 +++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/{{=machine}}.conf
index ae27fe6..b7c86e8 100644
--- a/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/mips/conf/machine/{{=machine}}.conf
@@ -17,8 +17,11 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 
 {{ input type:"boolean" name:"xserver" prio:"50" msg:"Do you need support for X? (y/n)" default:"y" }}
 {{ if xserver == "y": }}
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-XSERVER = "xserver-kdrive-fbdev"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xserver-xorg-extension-extmod \
+           xf86-input-evdev \
+           xf86-video-fbdev"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf
index 18f5247..cbf3c32 100644
--- a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=machine}}.conf
@@ -41,8 +41,11 @@ PREFERRED_VERSION_{{=preferred_kernel}} ?= "{{=preferred_kernel_version}}%"
 
 {{ input type:"boolean" name:"xserver" prio:"50" msg:"Do you need support for X? (y/n)" default:"y" }}
 {{ if xserver == "y": }}
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-XSERVER = "xserver-kdrive-fbdev"
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+XSERVER = "xserver-xorg \
+           xserver-xorg-extension-extmod \
+           xf86-input-evdev \
+           xf86-video-fbdev"
 
 {{ input type:"edit" name:"uboot_entrypoint" prio:"40" msg:"Please specify a value for UBOOT_ENTRYPOINT:" default:"0x00000000" }}
 UBOOT_ENTRYPOINT = "{{=uboot_entrypoint}}"
-- 
1.7.10



