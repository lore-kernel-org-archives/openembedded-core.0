Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoFE-0002A8-Iu
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:04:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L80Oij017470
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:00:24 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:00:24 -0700
Message-ID: <c8db967984b6d29fcf5587ed083c2d6ad4445b1f.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
Old-Date: Mon, 18 Jul 2011 14:48:01 +0800
Date: Thu, 21 Jul 2011 16:00:31 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Wenzong, openembedded-core@lists.openembedded.org
Subject: [PATCH 04/10] polkit: Support PAM
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
X-List-Received-Date: Thu, 21 Jul 2011 08:04:33 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Modify configuration "polkit-1" in /etc/pam.d/ for supporting pam.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++++++++++++++++
 meta/recipes-extended/polkit/polkit_0.101.bb       |    6 +++-
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch

diff --git a/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
new file mode 100644
index 0000000..fa145ac
--- /dev/null
+++ b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
@@ -0,0 +1,23 @@
+polkit: No system-auth in poky, we can use common-* in place of it.
+
+Upstream-Status:Inappropriate [configuration]
+
+Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
+
+--- a/configure.ac	2011-03-04 02:26:20.000000000 +0800
++++ b/configure.ac.new	2011-07-18 10:14:12.516818852 +0800
+@@ -350,10 +350,10 @@
+     PAM_FILE_INCLUDE_PASSWORD=system
+     PAM_FILE_INCLUDE_SESSION=system
+ else
+-   PAM_FILE_INCLUDE_AUTH=system-auth
+-   PAM_FILE_INCLUDE_ACCOUNT=system-auth
+-   PAM_FILE_INCLUDE_PASSWORD=system-auth
+-   PAM_FILE_INCLUDE_SESSION=system-auth
++   PAM_FILE_INCLUDE_AUTH=common-auth
++   PAM_FILE_INCLUDE_ACCOUNT=common-account
++   PAM_FILE_INCLUDE_PASSWORD=common-password
++   PAM_FILE_INCLUDE_SESSION=common-session
+ fi
+ 
+ AC_SUBST(PAM_FILE_INCLUDE_AUTH)
diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
index 6769914..da1d581 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://docs/polkit/html/license.html;md5=07ddbf5f29e44c80c99be19c1690ec1f"
 
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
-           file://introspection.patch"
-PR = "r0"
+           file://introspection.patch \
+           file://polkit-1_pam.patch"
+
+PR = "r1"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
-- 
1.7.5.1.300.gc565c



