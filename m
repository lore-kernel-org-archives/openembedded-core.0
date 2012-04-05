Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFtqT-0005iI-14
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 23:03:53 +0200
Received: by mail-we0-f175.google.com with SMTP id a1so1110921wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 13:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=FVlXeuozwhOjxVjBJxSOIMOo3B0/qHuPlj0aaIBjYRY=;
	b=SYter9/igCcqJnz/htjunp3zJO8Text2Dm7QfcXDc84BLgqXmJomhUhyh3u2XIIC2A
	Wex7FBVWVBhFcyiOhci8xXq3dFkmTlPF4Hq/JGgWM/P90wKDyYd9jM1m6Sp6W21xMXpg
	02iVqPtFkA9/SEubiAGhX96d1eGc7vFAhhDzRNRv69M6d7zHCARG+3WSxPXnUie1rbHK
	z0cJ3lsnRYqOtFXO2DvnuYxjKDxmy93xV5nxJPbYMTs1xKlOwKnrkgR50GcVDoankxYS
	VuTmq+Dr5YyNxRrPFX+c2T1qJXHLvtl/Iz2OJk6vubVb1uXKpoIBMsa3NPGatoMDY+u4
	I3lg==
Received: by 10.216.134.155 with SMTP id s27mr2775709wei.80.1333659283161;
	Thu, 05 Apr 2012 13:54:43 -0700 (PDT)
Received: from localhost.localdomain ([79.115.103.32])
	by mx.google.com with ESMTPS id j3sm606151wiw.1.2012.04.05.13.54.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 13:54:42 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:54:24 +0300
Message-Id: <9432bad42880f06e5062140d8ec3697a295208e1.1333659001.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
References: <26438581812a6aaeff7be095554ad6f356fb0a50.1333659001.git.andrei@gherzan.ro>
In-Reply-To: <cover.1333659001.git.andrei@gherzan.ro>
References: <cover.1333659001.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlDwqT+T9Co4lKRGCDCVB/43pXq36vwWV3KIdXY6T6h+srKAo+s5NB5394XnOk8EHRNBmBv
Subject: [PATCH 5/6] python: Add patch to avoid warning about _tkinter
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

_tkinter module needs tk module along with tcl. tk is not yet integrated
in yocto so we skip the check for this module.
Avoid a warning by not adding this module to missing variable.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 .../python/avoid_warning_about_tkinter.patch       |   25 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 2 files changed, 27 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch

diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
new file mode 100644
index 0000000..208c57c
--- /dev/null
+++ b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
@@ -0,0 +1,25 @@
+_tkinter module needs tk module along with tcl. tk is not yet integrated
+in yocto so we skip the check for this module.
+Avoid a warning by not adding this module to missing variable.
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-05 23:18:38.500136647 +0300
++++ Python-2.7.2/setup.py	2012-04-05 23:19:35.888134969 +0300
+@@ -1634,8 +1634,10 @@
+         # Call the method for detecting whether _tkinter can be compiled
+         self.detect_tkinter(inc_dirs, lib_dirs)
+ 
+-        if '_tkinter' not in [e.name for e in self.extensions]:
+-            missing.append('_tkinter')
++        # tkinter module will not be avalaible as yocto
++        # doesn't have tk integrated (yet)
++        #if '_tkinter' not in [e.name for e in self.extensions]:
++        #    missing.append('_tkinter')
+ 
+         return missing
+ 
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index f1b192a..5ae61f5 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.12"
+PR = "${INC_PR}.13"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
@@ -24,6 +24,7 @@ SRC_URI += "\
   file://check-if-target-is-64b-not-host.patch \
   file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
   file://avoid_warning_about_bsddb.patch \
+  file://avoid_warning_about_tkinter.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.7.5.4



