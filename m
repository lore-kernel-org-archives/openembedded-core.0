Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwC-000468-UZ
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:54:57 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3401893dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=qveCwc9ufP8TkF1/iYeO2nfTvyh1CvnZE+FGWdwT/s0=;
	b=iHjzouGJ84osUt2bVo5cpL2sSlfmknWLv653/Q2flgTbmQnsMiptcWUn7P7ARN9/hL
	GQ12JzeF/f6a4a7yVsXPjEFFUjRxgIk4qRimZ2a6jeSx9LJTZ5ySOLBgACElcFxhuM/5
	6gfU+fHB+PH7LJ2XoueU3D7C+or2IbAKwY0oa7DNzYtluEE6Vy1qc5ZlNYdXzNPncPrD
	95XaQb4pMfaIPsEmNEDN+3swaqZczl3s8HsHbtGgMbJ1J1TiYvO6vnfvFTw0bk/+su1J
	9S/Ypfq8YLCsCO/vDyleMajN0rn2zpEttRXLhdkpD+9OPkwJ1XYH65f249/gSFM0gLqJ
	9irw==
Received: by 10.68.227.69 with SMTP id ry5mr8289147pbc.16.1339260267743;
	Sat, 09 Jun 2012 09:44:27 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:08 -0700
Message-Id: <a9beecfdd7dc9928ccd4099d65727cbf93bfd442.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 10/16] zypper: Fix build on uclibc
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
X-List-Received-Date: Sat, 09 Jun 2012 16:54:57 -0000

uclibc does not have rpmatch() so we define
it if zypper is being compiled for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/zypper/zypper/rpmatch.patch |   23 +++++++++++++++++++++
 meta/recipes-extended/zypper/zypper_git.bb        |    4 ++-
 2 files changed, 26 insertions(+), 1 deletions(-)
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
index 56ccc86..c5d7c61 100644
--- a/meta/recipes-extended/zypper/zypper_git.bb
+++ b/meta/recipes-extended/zypper/zypper_git.bb
@@ -5,7 +5,7 @@ LICENSE  = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3201406e350b39e05a82e28b5020f413"
 
 DEPENDS  = "libzypp augeas"
-PR = "r2"
+PR = "r3"
 SRCREV = "2c5bb6ceb99ecd950ef993e43d77bf0569ea0582"
 
 inherit cmake
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



