Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RLWkZ-0003j4-IO
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 10:04:47 +0100
Received: by faas16 with SMTP id s16so187040faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2011 01:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=CmiooX5ypd/AZqLWCMggpz0Bltd3hZ1rMW4MMTSkwLM=;
	b=iQgAuEkNHowsr4jxubz0jx+MP9ihlxWatyax3NUIMmfXE+/S/VQwfZJMlValmOLP3u
	gSs4QF8KAUjKYH1Vxr+KtJcSniX72C28jEhcOFeY6Yp1yzAUs6lBoL7+zL/Hv1atyKvs
	D/juSYxk1MZka8IVHfp5U2h0CYJICryKoc0b8=
Received: by 10.223.7.20 with SMTP id b20mr7053925fab.21.1320224320833;
	Wed, 02 Nov 2011 01:58:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a21sm4180312fao.18.2011.11.02.01.58.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Nov 2011 01:58:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2011 09:58:24 +0100
Message-Id: <1320224305-6747-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <1320224305-6747-1-git-send-email-Martin.Jansa@gmail.com>
References: <1320224305-6747-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/3] keymaps: use VIRTUAL-RUNTIME_kbd instead of console-tools directly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Nov 2011 09:04:47 -0000

* nowadays kbd seems more active and it's available ie in meta-openembedded
* other option is to move kbd from meta-openembedded to
  openembedded-core and changed DEPENDS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 4fe7987..754bec6 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -5,11 +5,14 @@ SECTION = "base"
 # Distro can override initscripts provider
 VIRTUAL-RUNTIME_initscripts ?= "initscripts"
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} console-tools"
+# Distro can override kbd provider
+VIRTUAL-RUNTIME_kbd ?= "console-tools"
+
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_initscripts} ${VIRTUAL-RUNTIME_kbd}"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PR = "r19"
+PR = "r20"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.7.1



