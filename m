Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFtqT-0005iB-OC
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:03:53 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr12so1465444wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 13:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=+em3a3jSUDiA7xizApkDzOAHVq8RDlLTanilysZCRnM=;
	b=bme3/p98NP+LI46fXaQ8hSTY64Yt+3rkmgS6bEIV+aiTVFuSjAOqEvMOIz4ZqKK0MF
	gkiHA9XwtjNMoPd/Xs60uFw2c6Pwl2bEDYeB8ZvlkeBOsqwiDsq5Rojj15yIoeDRw91B
	uUfYns9vVxkeVCC66ES9sgTjetLVJ2e1VLgkWcTK4ajkmDR01nyL2H3Zjd0DPhs1ufPH
	WTrfYxwuvtKvk1WAikFEhycS9RvhDdY7be9gWyAYApbiSx9jZ428+MRCk+jH+gdFJ5za
	GIDlwq96o19sliWyXteeCabiy5jilHFiQcRd4zeIAvKKNTF46+n6SFodE1JpiXvP0hoI
	6U0A==
Received: by 10.216.135.225 with SMTP id u75mr2312719wei.97.1333659283971;
	Thu, 05 Apr 2012 13:54:43 -0700 (PDT)
Received: from localhost.localdomain ([79.115.103.32])
	by mx.google.com with ESMTPS id j3sm606151wiw.1.2012.04.05.13.54.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 13:54:43 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:54:25 +0300
Message-Id: <fb907fe6fe1fc1b164e09bfa6706b38b26614811.1333659001.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
References: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
In-Reply-To: <cover.1333659001.git.andrei@gherzan.ro>
References: <cover.1333659001.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlAwxskD5e9e5lAjfHnw447Uo2n1SjQVBa2HBcjDtvWFeNYdMyaWrQ3jymM77yD32aZCky8
Subject: [PATCH 6/6] python: Add patch to avoid warning about sunaudiodev module
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
X-List-Received-Date: Thu, 05 Apr 2012 21:03:53 -0000

sunaudiodev module is sunos specific so we avoid a warning by not.
adding this module to missing variable.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../avoid_warning_for_sunos_specific_module.patch  |   23 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch

diff --git a/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch b/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch
new file mode 100644
index 0000000..337e0e3
--- /dev/null
+++ b/meta/recipes-devtools/python/python/avoid_warning_for_sunos_specific_module.patch
@@ -0,0 +1,23 @@
+sunaudiodev module is sunos specific so we avoid a warning by not 
+adding this module to missing variable.
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-05 22:29:18.049196608 +0300
++++ Python-2.7.2/setup.py	2012-04-05 22:29:57.505195453 +0300
+@@ -1522,8 +1522,9 @@
+         if platform == 'sunos5':
+             # SunOS specific modules
+             exts.append( Extension('sunaudiodev', ['sunaudiodev.c']) )
+-        else:
+-            missing.append('sunaudiodev')
++        # If platform is not sunos warning is useless
++        #else:
++        #    missing.append('sunaudiodev')
+ 
+         if platform == 'darwin':
+             # _scproxy
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index 5ae61f5..9cecbed 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.13"
+PR = "${INC_PR}.14"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -25,6 +25,7 @@ SRC_URI += "\
   file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
   file://avoid_warning_about_bsddb.patch \
   file://avoid_warning_about_tkinter.patch \
+  file://avoid_warning_for_sunos_specific_module.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



