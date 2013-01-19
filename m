Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TwhT3-0007ea-8Q
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jan 2013 00:04:53 +0100
Received: from mail-la0-f69.google.com ([209.85.215.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 19 Jan 2013 14:49:27 -0800
Received: by mail-la0-f69.google.com with SMTP id fk20so695169lab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2013 14:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=R2yMeNJsUMAsDPM11wc8mNW3jFQNgK5d3UYrIRYHK7Q=;
	b=bO/b7zN/+TMd2VCmkldRGQEpLlucyEAPXTe8CrspomvJJCzaHGGfxaxz+kbxKKVngS
	mJARy9GN3rIWZV/NoXY8yNYPv8jEFyYQXHbknY5s/vN+QPIFCzHAvKitk2Bkt3QPvlEX
	ng3NJ7jPK2GKqxtstY3pBgc/kf2JTiBHN120P7RWAw2/owj6te5RNFqf8VVS7jjucgNx
	GsP91yQOw98Q43AsUxLexcNu+cZO5ar67JSlXrioFBn97Oek338gX2V8bCdoGgE11QhO
	3o4wB9FgPNss+2Z/LO86RALQ2q9vKaAppOrlOr3b1Bj5xQUojeragCy0KLK9zm2+MLT4
	M9/w==
X-Received: by 10.180.8.130 with SMTP id r2mr9344520wia.28.1358635765200;
	Sat, 19 Jan 2013 14:49:25 -0800 (PST)
X-Received: by 10.180.8.130 with SMTP id r2mr9344519wia.28.1358635765149;
	Sat, 19 Jan 2013 14:49:25 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id p2sm10967931wic.7.2013.01.19.14.49.23
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 14:49:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Jan 2013 22:47:12 +0000
Message-Id: <f2c8ee8bb2e7406a46ee9c63cddc2553931553bb.1358635193.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
In-Reply-To: <cover.1358635193.git.ross.burton@intel.com>
References: <cover.1358635193.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQk5TeHe28YhUIWqpCPdPlBhpSPkJdnaQ//46RnZuqnq/MzOo/abQqB/CnIA+SxaUB5QmCCxscEltBq7mih+rDJJK+KnHSPvbLUA+NTb1Frrj30aEsCy36hPW+mztsDJAeW+PCZHzbZitCsCpp2aqE76oAv6xFoAGruKpxyT6S0Vnzw1/HvDsp3gjAAmJW6KxOfileDP
Subject: [PATCH 09/10] packagegroup-core-boot: only install initscripts if we're using sysvinit
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
X-List-Received-Date: Sat, 19 Jan 2013 23:04:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-boot.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index fbc50c7..edb9e74 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -27,7 +27,7 @@ RCONFLICTS_${PN} = "task-core-boot"
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
 VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
 VIRTUAL-RUNTIME_init_manager ?= "${DISTRO_FEATURES_INITMAN}"
-VIRTUAL-RUNTIME_initscripts ?= "initscripts"
+VIRTUAL-RUNTIME_initscripts ?= "${@base_contains('DISTRO_FEATURES', 'sysvinit', 'initscripts', '',d)}"
 VIRTUAL-RUNTIME_keymaps ?= "keymaps"
 
 RDEPENDS_${PN} = "\
@@ -35,12 +35,12 @@ RDEPENDS_${PN} = "\
     base-passwd \
     busybox \
     ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d)} \
-    ${VIRTUAL-RUNTIME_initscripts} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     modutils-initscripts \
     netbase \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
+    ${VIRTUAL-RUNTIME_initscripts} \
     ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd-compat-units', '',d)} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
-- 
1.7.10.4



