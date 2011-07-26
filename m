Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QlejQ-0000YP-Ez
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 12:19:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QAF61N003076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 03:15:06 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 03:15:06 -0700
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 18:08:09 +0800
Message-ID: <80d928168da0299329e10eb36f3822892371466e.1311671726.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311671726.git.xiaofeng.yan@windriver.com>
References: <cover.1311671726.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] polkit: Support pam
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
X-List-Received-Date: Tue, 26 Jul 2011 10:19:21 -0000
Content-Type: text/plain

Modify configuration "polkit-1" in /etc/pam.d/ for supporting pam.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../polkit/polkit-0.101/polkit-1_pam.patch         |   23 ++++++++++++++++++++
 meta/recipes-extended/polkit/polkit_0.101.bb       |    7 ++++-
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch

diff --git a/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
new file mode 100644
index 0000000..74647ef
--- /dev/null
+++ b/meta/recipes-extended/polkit/polkit-0.101/polkit-1_pam.patch
@@ -0,0 +1,23 @@
+polkit: No system-auth in OE-Core, we can use common-* in place of it.
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
index 6769914..56ceca4 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -7,8 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://docs/polkit/html/license.html;md5=07ddbf5f29e44c80c99be19c1690ec1f"
 
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
-           file://introspection.patch"
-PR = "r0"
+           file://introspection.patch \
+           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
+PAM_SRC_URI = "file://polkit-1_pam.patch"
+PR = "r1"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
-- 
1.7.0.4



