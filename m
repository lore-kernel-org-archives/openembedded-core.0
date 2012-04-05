Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFtqR-0005iI-6J
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:03:51 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1110921wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 13:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=aCIYPvRz3JZ0dX1Ghev+ataGVviu1CfhlSBTMrhQh9s=;
	b=R691GuvU0HgpUYeYbl/TmJpZ6ScdP7Oe8qiBqWZrQOP1qEDf5eOxpT2QCj7Iou4rG4
	mq/Dm81MOZZqpsu695fGUHdgBaTevjVJSMIKUwE0dYYbnK4gwFpTI6NH7+/smV1Vq0rS
	tpQctDyQYdZHr+J8IAZ4be3hnBsdqKgiok7ETYcPBZEg8qieG2MCylO4QcUR1zVjwEpq
	gEqslyibY8e2q7XJ3vOhZ9FHZ4NSPf9IdJ906ZfVuro3UD90bEZTB3flDhYDaig+XCIp
	Ul306cls48j3EAEBzQtVZX+T4Zb2srE8jNpHfNql7b3lil1HLyVlN0r0tCDgaossHgnl
	st3Q==
Received: by 10.216.139.204 with SMTP id c54mr2456644wej.103.1333659281396;
	Thu, 05 Apr 2012 13:54:41 -0700 (PDT)
Received: from localhost.localdomain ([79.115.103.32])
	by mx.google.com with ESMTPS id j3sm606151wiw.1.2012.04.05.13.54.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 13:54:41 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:54:23 +0300
Message-Id: <8f0ba2f413f01d47903a728a030c62d34e030b7a.1333659001.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
References: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
In-Reply-To: <cover.1333659001.git.andrei@gherzan.ro>
References: <cover.1333659001.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQneHfj8dvv58lWriY1868+FRMRx/fTRO+Upmeshn3mofAgKSbJEAwFgwSgbCIfaiF3imtaa
Subject: [PATCH 4/6] python: Add patch to avoid warning about bsddb module
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
X-List-Received-Date: Thu, 05 Apr 2012 21:03:51 -0000

_bsddb module can be built only with db version between 4.1 and 4.7.
Avoid a warning by not adding this module to missing variable.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../python/python/avoid_warning_about_bsddb.patch  |   23 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_bsddb.patch

diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_bsddb.patch b/meta/recipes-devtools/python/python/avoid_warning_about_bsddb.patch
new file mode 100644
index 0000000..4968744
--- /dev/null
+++ b/meta/recipes-devtools/python/python/avoid_warning_about_bsddb.patch
@@ -0,0 +1,23 @@
+_bsddb module can be built only with db version between 4.1 and 4.7.
+Avoid a warning by not adding this module to missing variable.
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-05 23:16:49.268139840 +0300
++++ Python-2.7.2/setup.py	2012-04-05 23:17:30.912138622 +0300
+@@ -1024,7 +1024,9 @@
+             db_incs = None
+             dblibs = []
+             dblib_dir = None
+-            missing.append('_bsddb')
++            # We need db version between 4.1 and 4.7
++            # Avoid this warning
++            #missing.append('_bsddb')
+ 
+         # The sqlite interface
+         sqlite_setup_debug = False   # verbose debug prints from this script?
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index ab6c91f..f1b192a 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.11"
+PR = "${INC_PR}.12"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -23,6 +23,7 @@ SRC_URI += "\
   file://fix_for_using_different_libdir.patch \
   file://check-if-target-is-64b-not-host.patch \
   file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
+  file://avoid_warning_about_bsddb.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



