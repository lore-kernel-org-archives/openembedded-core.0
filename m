Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U83D7-0000sf-4s
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:31:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1K6FBW5028077
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 22:15:11 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 22:15:09 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 14:16:36 +0800
Message-ID: <374a69f7c77f05add8c0f09704923aaa948d08f9.1361265275.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361265275.git.kai.kang@windriver.com>
References: <cover.1361265275.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/3] opkg: save output of postinst scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2013 06:31:34 -0000
Content-Type: text/plain

When has distro feature "debug-tweak", redirect output of postinstall
scripts to log file /var/log/postinstall.log. And the log file can be
configured.

[Yocto 3223]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../opkg/opkg/redirect-output.patch                |   29 ++++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    6 +++-
 2 files changed, 34 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/redirect-output.patch

diff --git a/meta/recipes-devtools/opkg/opkg/redirect-output.patch b/meta/recipes-devtools/opkg/opkg/redirect-output.patch
new file mode 100644
index 0000000..6710372
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/redirect-output.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Inappropriate [other]
+
+This patch redirect output of post install script to a log file when
+distro feature "debug-tweak" enabled.
+
+[Yocto 3223]
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+--- trunk/libopkg/opkg_configure.c.orig	2013-02-18 15:00:42.715289097 +0800
++++ trunk/libopkg/opkg_configure.c	2013-02-18 15:01:43.971291259 +0800
+@@ -26,6 +26,7 @@ int
+ opkg_configure(pkg_t *pkg)
+ {
+     int err;
++    char buf[256];
+ 
+     /* DPKG_INCOMPATIBILITY:
+        dpkg actually does some conffile handling here, rather than at the
+@@ -33,7 +34,8 @@ opkg_configure(pkg_t *pkg)
+     /* DPKG_INCOMPATIBILITY:
+        dpkg actually includes a version number to this script call */
+ 
+-    err = pkg_run_script(pkg, "postinst", "configure");
++    sprintf(buf, "configure | tee %s", LOGFILE);
++    err = pkg_run_script(pkg, "postinst", buf);
+     if (err) {
+         if (!conf->offline_root)
+ 	     opkg_msg(ERROR, "%s.postinst returned %d.\n", pkg->name, err);
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 382bfdd..164af88 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -3,10 +3,14 @@ require opkg.inc
 SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;protocol=http \
            file://obsolete_automake_macros.patch \
 "
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'debug-tweak', 'file://redirect-output.patch', '', d)}"
 
 S = "${WORKDIR}/trunk"
 
 SRCREV = "649"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+POSTLOG ?= "/var/log/postinstall.log"
+CFLAGS_append += "${@base_contains('DISTRO_FEATURES', 'debug-tweak', ' -DLOGFILE=\'\"${POSTLOG}\"\'', '', d)}"
-- 
1.7.5.4



