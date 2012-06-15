Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfPxU-0001O3-69
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 08:24:36 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so4635855pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 23:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=3D9svzGz9BIKXmGTO2/HyMkiOBaPtXHiWM6t0Ic3HIg=;
	b=Q5vsNmItkcCchSdQCqyCslOcM6vZkLTVJ0OhN5Hh7KOCuL+F8WmU+CQz3ImzawKlEw
	lpuT5asfzG+yFKq8aCFHE+r1zFg9dENqmz6/3MKeUdD7DGegLjZVF7hoxssl8CbjEPaL
	XaOMVCBg7eqW2a8Z009rsQ9b4Ukk3adm9PMsUqnoWAWe1YgfEzUvm1g/TnH9JjaP5VxY
	2N5PxnbNL5PXUFhNX2HbUds1ruld7OxJj704a7BnoMza0Q5DlhdTefFpz7Nckr3gCTEG
	lxVPZwPG5sgBndHmiKhECU6/OQqthnvPUb0vt9oyc7atIyW1eDlf8DG6mlWttDbww7zV
	NkQA==
Received: by 10.68.228.130 with SMTP id si2mr1285715pbc.59.1339740840092;
	Thu, 14 Jun 2012 23:14:00 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id tm2sm12117280pbc.69.2012.06.14.23.13.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Jun 2012 23:13:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jun 2012 23:12:35 -0700
Message-Id: <3d589d4f2d7ce4f36fd34d555ffe1608e1c7690e.1339740433.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
References: <1366d81a5719e42af8bf24d46b86352491fc0e67.1339740433.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339740433.git.raj.khem@gmail.com>
References: <cover.1339740433.git.raj.khem@gmail.com>
Subject: [PATCH 8/9] zypper: Fix build on uclibc
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
X-List-Received-Date: Fri, 15 Jun 2012 06:24:36 -0000

uclibc does not have rpmatch() so we define
it if zypper is being compiled for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/zypper/zypper/rpmatch.patch |   23 +++++++++++++++++++++
 meta/recipes-extended/zypper/zypper_git.bb        |    2 +
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/zypper/zypper/rpmatch.patch

diff --git a/meta/recipes-extended/zypper/zypper/rpmatch.patch b/meta/recipes-extended/zypper/zypper/rpmatch.patch
new file mode 100644
index 0000000..a750a3b
--- /dev/null
+++ b/meta/recipes-extended/zypper/zypper/rpmatch.patch
@@ -0,0 +1,23 @@
+rpmatch() is missing in uclibc so we provide a local definition
+in form of a macro
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: git/src/utils/prompt.h
+===================================================================
+--- git.orig/src/utils/prompt.h	2012-06-06 15:51:00.899112775 -0700
++++ git/src/utils/prompt.h	2012-06-06 15:52:17.003116762 -0700
+@@ -172,4 +172,12 @@
+   return errstr;
+ }
+ 
++#ifdef __UCLIBC__
++#define rpmatch(line) \
++       ( (line == NULL)? -1 : \
++         (*line == 'y' || *line == 'Y')? 1 : \
++         (*line == 'n' || *line == 'N')? 0 : \
++         -1 )
++#endif /* __UCLIBC__ */
++
+ #endif /*ZYPPERPROMPT_H_*/
diff --git a/meta/recipes-extended/zypper/zypper_git.bb b/meta/recipes-extended/zypper/zypper_git.bb
index 0a1df5d..c5d7c61 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/openSUSE/zypper.git;protocol=git \
            file://dso_linking_change_build_fix.patch \
            file://rpm5-flag.patch \
            file://gcc-scope.patch \
+           file://rpmatch.patch \
           "
 S = "${WORKDIR}/git"
 
@@ -25,3 +26,4 @@ RDEPENDS_${PN} = "rpm-libs"
 RRECOMMENDS_${PN} = "procps util-linux-uuidgen"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
+OECMAKE_CXX_LINK_FLAGS_libc-uclibc += "-lintl"
-- 
1.7.5.4



