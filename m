Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXOF-00078Y-5U
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:10:29 +0100
Received: by mail-we0-f172.google.com with SMTP id r3so2762781wey.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 09:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=eY0pbkHnjMZzbHtCPnKtwDzBnSRZ3cdy2Lw7hsa9iCw=;
	b=KlaNp6qQZwB/c4hYuKoI21n4HaDLfJCDWngFcLM08vrPR36dxR4eu9LKd7RmJiyGBb
	LZZFwjCYPmGqLT2DSGbR9Du66g8ZpkM26p4nTBG+L7/zznZJqMxr4iyjueA2MUEfnxM6
	M4SCpImvarUpMM8/rXVicVXCinojANe7+02fsup+F00CoooofNAlcEfwU2CtO3Zzz1JZ
	pAol6C741en1+0M5txqtalaNc7m7S+zWGUcyLEb0+6lnJl6KaEHFq9XrDg5YrFUBifAL
	AtIzmmiVhhW2CxdrZ0X72VfX03t5xtnSqaOD1D9X8awq6UlM64/nLGH9thzMeKS7DQWM
	Acfg==
X-Received: by 10.180.36.48 with SMTP id n16mr4501204wij.30.1364316807111;
	Tue, 26 Mar 2013 09:53:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id bk1sm4522670wib.2.2013.03.26.09.53.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 09:53:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 16:50:16 +0000
Message-Id: <e9e10ffe9040875b2e17eb6b3e823de0b17d82d2.1364316412.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
In-Reply-To: <cover.1364316411.git.ross.burton@intel.com>
References: <cover.1364316411.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlgOeHODTn+wx+o4Gs38/ip8FqHDZKkBF9vTulp/zY8qNW1IlP3zL/o7A5pnRBZj/R/eqih
Subject: [PATCH 18/24] packagegroup-core-boot: revert to specifying sysvinit as default init manager
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
X-List-Received-Date: Tue, 26 Mar 2013 17:10:35 -0000

Don't follow DISTRO_FEATURES_INITMAN as that makes the packagegroups rebuild if
you switch init manager.

As in hybrid situations there's generally a clear primary and minimal init
manager choice, so change VIRTUAL-RUNTIME_init_manager to set the primary init
manager, and roll your own groups/images for the secondary.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index b9183a8..9306a34 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -26,8 +26,8 @@ RCONFLICTS_${PN} = "task-core-boot"
 # Distro can override the following VIRTUAL-RUNTIME providers:
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
-VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
-VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'initscripts', '',d)}"
+VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
+VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 RDEPENDS_${PN} = "\
@@ -42,7 +42,6 @@ RDEPENDS_${PN} = "\
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_initscripts} \
-    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-compat-units', '',d)} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-- 
1.7.10.4



