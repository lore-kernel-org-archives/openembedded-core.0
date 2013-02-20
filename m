Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U83D5-0000sa-Vx
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:31:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K6F99S023982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 22:15:09 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 22:15:08 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 14:16:35 +0800
Message-ID: <6c109ede750ce950f8d988ffdd75b7a3b9dbabd0.1361265275.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361265275.git.kai.kang@windriver.com>
References: <cover.1361265275.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/3] dpkg: redirect output of postinstall script
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
X-List-Received-Date: Wed, 20 Feb 2013 06:31:34 -0000
Content-Type: text/plain

When distro feature "debug-tweak" enabled, redirect output of
postinstall script to log file /var/log/postinstall.log which
can be configured.

[Yocto 3223]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../dpkg/dpkg/redirect-output.patch                |   37 ++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.16.9.bb          |    8 +++-
 2 files changed, 43 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/redirect-output.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/redirect-output.patch b/meta/recipes-devtools/dpkg/dpkg/redirect-output.patch
new file mode 100644
index 0000000..584d6ff
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/redirect-output.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Inappropriate [other]
+
+This patch redirect output of post install script to a log file when
+distro feature "debug-tweak" enabled.
+
+[Yocto 3223]
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+--- dpkg-1.16.9/src/script.c.orig	2013-02-19 16:05:33.154474040 +0800
++++ dpkg-1.16.9/src/script.c	2013-02-19 16:11:20.438486290 +0800
+@@ -30,6 +30,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <stdlib.h>
++#include <fcntl.h>
+ 
+ #include <dpkg/i18n.h>
+ #include <dpkg/dpkg.h>
+@@ -193,8 +166,17 @@ vmaintainer_script_installed(struct pkgi
+ 		}
+ 		ohshite(_("unable to stat %s `%.250s'"), buf, scriptpath);
+ 	}
++
++	int fd = open(LOGFILE, O_RDWR|O_CREAT|O_APPEND, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);
++	if (strcmp(desc, "post-installation") == 0 && fd != -1) {
++		dup2(fd, STDERR_FILENO);
++		dup2(fd, STDOUT_FILENO);
++	}
+ 	do_script(pkg, &pkg->installed, &cmd, &stab, 0);
+ 
++	if (fd)
++		close(fd);
++
+ 	command_destroy(&cmd);
+ 
+ 	return 1;
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb b/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb
index 9ae4042..c1b23fc 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.16.9.bb
@@ -6,9 +6,13 @@ SRC_URI += "file://noman.patch \
             file://check_version.patch \
             file://preinst.patch \
             file://fix-timestamps.patch \
-            file://remove-tar-no-timestamp.patch"
+            file://remove-tar-no-timestamp.patch \
+            ${@base_contains('DISTRO_FEATURES', 'debug-tweak', 'file://redirect-output.patch', '', d)}"
+
+POSTLOG ?= "/var/log/postinstall.log"
+CFLAGS_append += "${@base_contains('DISTRO_FEATURES', 'debug-tweak', ' -DLOGFILE=\'\"${POSTLOG}\"\'', '', d)}"
 
 SRC_URI[md5sum] = "4df9319b2d17e19cdb6fe94dacee44da"
 SRC_URI[sha256sum] = "73cd7fba4e54acddd645346b4bc517030b9c35938e82215d3eeb8b4e7af26b7a"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
-- 
1.7.5.4



