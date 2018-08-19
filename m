Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8501C79216
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 22:16:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n11-v6so12001763wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 15:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Z36y8+X0gargIU+88IWoW7wPenF6ZezZJzsqCCY8uc=;
	b=d+tl8JtK3SChVKsUJJz8haRjjWv+qu0ATMnkfHtXHUTEmlGE8K8/mnDMJkJ8YzBOT+
	ANc3Rocj1WsbLGBQ+Kno6ICR1UbOePJp/l86ZijBnDAqzNmk4UlheGr1VHdYY6j5XK+H
	jJcf2JTQGXrzDSfDUL0kcaCWm+nr/xW2Hg9/fikEoSbNF4qfG/iGuFryO8/eGN42aI1n
	45Nlku6no2m6Ta29KRWzghKbZEri2Pj2OYjcG6TlqNjCSAyUulVwjPFyREJWg+TkI8SR
	vlItt4tDLfySZqUErBngkTNMsglzVurmifLbCyGDATI5HdxTskVnVLCH5AuZOLlz6Qf8
	ukGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Z36y8+X0gargIU+88IWoW7wPenF6ZezZJzsqCCY8uc=;
	b=BoaLwMAnO0kD57pAdPbtMUb+qiMmEU/ejdlzEo1ivmwhjd7zdAOONnrXb8RwvJXCTC
	bHSV8RhhP6EA2ifi71LFAPKF1zkoxY14FOO5UjMcGhUCAq4JDeFdQpY2xQuwvR+W6bCu
	YrpH37BKctr6prFilyIJ3paVgf11J6hsAviurRoBQHM/FnLkJRF1jFf10QnfOAW67+RZ
	T27fnEfMxwKCbQo1A0n3+LfbHoE9NBN5AJlBLtmHHwiiCjT98fjgHQQE564Dpb+WXsZ2
	5QdYhzlDNiD6/VvuO/SKIkouXvmluruLAfnki3VBrsWSTtPc7mESRZb+6p8yDBoYwBdM
	YROA==
X-Gm-Message-State: AOUpUlECqPSR/m0vUlpVi0xzGFXMS0aYFArj1Qdkn1X1PXSJBn/cn9C+
	Pyx6146kde2ZAc8s3OMbGcQ0D4V7
X-Google-Smtp-Source: AA+uWPwbRgPSTbk+ituK0SBKzGeMteLxuFfkK19oDM3//bXUE3Co+g2JyA6yGscVlvWIHb8pPX2SOA==
X-Received: by 2002:a1c:c147:: with SMTP id
	r68-v6mr24444741wmf.161.1534716998210; 
	Sun, 19 Aug 2018 15:16:38 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u40-v6sm6266258wrc.43.2018.08.19.15.16.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 19 Aug 2018 15:16:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 22:16:01 +0000
Message-Id: <ee71c4069c70a0aad6f4c7a404726b84ba3c335c.1534716156.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1534716156.git.Martin.Jansa@gmail.com>
References: <cover.1534716156.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/6] kernel-artifact-names.bbclass, kernel.bbclass: remove prefix and extension from MODULE_TARBALL_* variables
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
X-List-Received-Date: Sun, 19 Aug 2018 22:16:38 -0000

* for consistency with other artifacts variables, include only the version string, not the actual name or extension
* changing .tgz to something else in the MODULE_TARBALL_NAME variable only wouldn't make much sense
  because then kernel.bbclass still calls "tar -cvzf" to create it

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-artifact-names.bbclass | 6 ++----
 meta/classes/kernel.bbclass                | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index 56352d73b3..d21450c914 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -7,10 +7,8 @@ KERNEL_DTB_LINK_NAME ?= "${MACHINE}"
 KERNEL_FIT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 KERNEL_FIT_LINK_NAME ?= "${MACHINE}"
 
-MODULE_IMAGE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-
-MODULE_TARBALL_NAME ?= "${MODULE_IMAGE_NAME}.tgz"
-MODULE_TARBALL_LINK_NAME ?= "modules-${MACHINE}.tgz"
+MODULE_TARBALL_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+MODULE_TARBALL_LINK_NAME ?= "${MACHINE}"
 MODULE_TARBALL_DEPLOY ?= "1"
 
 INITRAMFS_NAME ?= "initramfs-${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e47c063f5a..3c8aa5911f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -672,8 +672,8 @@ kernel_do_deploy() {
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
-		tar -cvzf $deployDir/${MODULE_TARBALL_NAME} -C ${D} lib
-		ln -sf ${MODULE_TARBALL_NAME} $deployDir/${MODULE_TARBALL_LINK_NAME}
+		tar -cvzf $deployDir/modules-${MODULE_TARBALL_NAME}.tgz -C ${D} lib
+		ln -sf modules-${MODULE_TARBALL_NAME}.tgz $deployDir/modules-${MODULE_TARBALL_LINK_NAME}.tgz
 	fi
 
 	for type in ${KERNEL_IMAGETYPES} ; do
-- 
2.17.1


