Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Cwu-0006ve-QB
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 16:29:56 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so707788fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=axyeTjV0Oo2mQGG0JtRBto2TbzhSesq169TR/qAFX0A=;
	b=dn+ZtRT3nk1p/T9YMDWtQkEPCR38VotvuFW9qUY/8Jsd97Me+zFFhxMfHWDEFeK1NZ
	F67cMBNpxQB884VqPEqdX4/bO94s84UxXv1SQL/A58LD9Yl5ZwiQLSRL8smhAS+i9lga
	8bafEfGf+fsvrpLhVinABHshj9lxWDjcTg9rg=
Received: by 10.223.14.2 with SMTP id e2mr688126faa.107.1316096687141;
	Thu, 15 Sep 2011 07:24:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n12sm3756309fan.9.2011.09.15.07.24.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 07:24:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 16:24:25 +0200
Message-Id: <e4d19d36877b6f608cef9e395504cd5b424e1920.1316096375.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
References: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316096375.git.Martin.Jansa@gmail.com>
References: <cover.1316096375.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] task-core-boot: allow distributions to define login and init manager
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
X-List-Received-Date: Thu, 15 Sep 2011 14:29:56 -0000

* for example someone prefers shadow instead of tinylogin and upstart instead of sysvinit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/tasks/task-core-boot.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-core-boot.bb b/meta/recipes-core/tasks/task-core-boot.bb
index 9116c38..9e63ebb 100644
--- a/meta/recipes-core/tasks/task-core-boot.bb
+++ b/meta/recipes-core/tasks/task-core-boot.bb
@@ -19,6 +19,10 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 
 # Distro can override dev_manager provider
 VIRTUAL-RUNTIME_dev_manager ?= "udev"
+# Distro can override login_manager provider
+VIRTUAL-RUNTIME_login_manager ?= "tinylogin"
+# Distro can override init_manager provider
+VIRTUAL-RUNTIME_init_manager ?= "sysvinit"
 
 PACKAGES = "\
     task-core-boot \
@@ -34,8 +38,8 @@ RDEPENDS_task-core-boot = "\
     ${@base_contains("MACHINE_FEATURES", "keyboard", "keymaps", "", d)} \
     modutils-initscripts \
     netbase \
-    sysvinit \
-    tinylogin \
+    ${VIRTUAL-RUNTIME_login_manager} \
+    ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_dev_manager} \
     ${VIRTUAL-RUNTIME_update-alternatives} \
     ${MACHINE_ESSENTIAL_EXTRA_RDEPENDS}"
-- 
1.7.6.1



