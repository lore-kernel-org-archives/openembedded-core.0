Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Cx1-0006ve-W4
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 16:30:04 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so707788fxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 07:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=b3/Eosoz4L3bRb43rs+NtLDfp0qknBW8QmB7ZH7vbBo=;
	b=DKllCyHaTmCLQ6llvGfr01pXwHzuiHwOeqMn22yVA6uTzuEMaxTqdP/kLOmmtQNbep
	PCjylZcsJnT0eNzXdjtGvZGRV8S7UA14SXin50YrnrgJofPJtWpZxgn8t4N/zByU7uJb
	v41Pmj5J2G/gTSHTiHkWTm+g/aSpyhzwqL+OA=
Received: by 10.223.61.66 with SMTP id s2mr489340fah.27.1316096694709;
	Thu, 15 Sep 2011 07:24:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s13sm7186629fad.18.2011.09.15.07.24.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 07:24:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 16:24:26 +0200
Message-Id: <6466de31048260089b8988280f77efdb14ac2f21.1316096375.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
References: <998e3acf0d38007fde10f47f98b71192685e19b9.1316096375.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1316096375.git.Martin.Jansa@gmail.com>
References: <cover.1316096375.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] subversion: remove neon-detection.patch and --with-neon option
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
X-List-Received-Date: Thu, 15 Sep 2011 14:30:04 -0000

* upstream detection seems to be doing its job right now
* I don't see how this is supposed to work
  --      neon_config="$withval/bin/neon-config"
  -+      neon_config="env env PKG_CONFIG_PATH=${withval}:${PKG_CONFIG_PATH} pkg-config neon"
  when neon_config should be sysroots/nokia900/usr/bin/crossscripts/neon-config
"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../subversion/subversion/neon-detection.patch     |   15 ---------------
 .../subversion/subversion_1.6.15.bb                |    5 ++---
 2 files changed, 2 insertions(+), 18 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/neon-detection.patch

diff --git a/meta/recipes-devtools/subversion/subversion/neon-detection.patch b/meta/recipes-devtools/subversion/subversion/neon-detection.patch
deleted file mode 100644
index 2a9cf1f..0000000
--- a/meta/recipes-devtools/subversion/subversion/neon-detection.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: subversion-1.6.13/build/ac-macros/neon.m4
-===================================================================
---- subversion-1.6.13.orig/build/ac-macros/neon.m4
-+++ subversion-1.6.13/build/ac-macros/neon.m4
-@@ -42,7 +42,7 @@ AC_DEFUN(SVN_LIB_NEON,
-         AC_MSG_ERROR([--with-neon requires an argument.])
-       fi
-     else
--      neon_config="$withval/bin/neon-config"
-+      neon_config="env env PKG_CONFIG_PATH=${withval}:${PKG_CONFIG_PATH} pkg-config neon"
-     fi
- 
-     SVN_NEON_CONFIG()
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 4e77e2e..9a9484f 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -5,11 +5,10 @@ RDEPENDS_${PN} = "neon"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://disable-revision-install.patch \
-	   file://neon-detection.patch \
 	   file://libtool2.patch"
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
@@ -17,7 +16,7 @@ SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a69fef414e2cb907b4544298569300b"
 
-EXTRA_OECONF = "--with-neon=${STAGING_EXECPREFIXDIR} \
+EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs --without-apache \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
                 --with-apr-util=${STAGING_BINDIR_CROSS}"
-- 
1.7.6.1



