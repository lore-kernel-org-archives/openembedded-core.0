Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U83D4-0000sV-6E
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:31:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1K6F87j028074
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 22:15:08 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 22:15:06 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 14:16:34 +0800
Message-ID: <97d24123c74069eea42442dca543d77c6fd6647a.1361265275.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1361265275.git.kai.kang@windriver.com>
References: <cover.1361265275.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/3] rpm: redirect output of post install script
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

When distro feature "debug-tweak" enabled, redirect output of post
install script to log file which can be configured.

[Yocto 3223]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../recipes-devtools/rpm/rpm/redirect-output.patch |   38 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    6 +++-
 2 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/redirect-output.patch

diff --git a/meta/recipes-devtools/rpm/rpm/redirect-output.patch b/meta/recipes-devtools/rpm/rpm/redirect-output.patch
new file mode 100644
index 0000000..1bc53dc
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/redirect-output.patch
@@ -0,0 +1,38 @@
+Upstream-Status: Inappropriate [other]
+
+This patch redirect output of post install script to a log file when
+distro feature "debug-tweak" enabled.
+
+[Yocto 3223]
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+
+--- rpm-5.4.9/lib/psm.c.orig	2013-02-18 11:34:19.646852294 +0800
++++ rpm-5.4.9/lib/psm.c	2013-02-18 13:18:00.291071721 +0800
+@@ -1111,6 +1111,14 @@ assert(he->p.str != NULL);
+ 	    if (ssp != NULL)
+ 		*ssp |= RPMSCRIPT_STATE_EXEC;
+ 
++#ifdef RPM_VENDOR_POKY
++	    int fd = open(LOGFILE, O_RDWR|O_CREAT|O_APPEND, S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH);
++	    if (psm->scriptTag == RPMTAG_POSTIN && fd != -1) {
++		dup2(fd, STDERR_FILENO);
++		dup2(fd, STDOUT_FILENO);
++	    }
++#endif
++
+ 	    /* Permit libselinux to do the scriptlet exec. */
+ 	    if (rpmtsSELinuxEnabled(ts) == 1) {	
+ 		if (ssp != NULL)
+@@ -1121,6 +1129,11 @@ assert(he->p.str != NULL);
+ 		xx = execv(argv[0], (char *const *)argv);
+ /*@=nullstate@*/
+ 	    }
++
++#ifdef RPM_VENDOR_POKY
++	    if (fd)
++	        close(fd);
++#endif
+ 	}
+ 
+ 	if (ssp != NULL)
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 39b0481..dc43678 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r61"
+PR = "r62"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -85,6 +85,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://rpm-reloc-macros.patch \
 	   file://rpm-platform2.patch \
      file://rpm-remove-sykcparse-decl.patch \
+	   ${@base_contains('DISTRO_FEATURES', 'debug-tweak', 'file://redirect-output.patch', '', d)} \
 	  "
 
 # Uncomment the following line to enable platform score debugging
@@ -197,6 +198,9 @@ EXTRA_OECONF += "--verbose \
 
 CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
+POSTLOG ?= "/var/log/postinstall.log"
+CFLAGS_append += "${@base_contains('DISTRO_FEATURES', 'debug-tweak', ' -DLOGFILE=\'\"${POSTLOG}\"\'', '', d)}"
+
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
 PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
-- 
1.7.5.4



