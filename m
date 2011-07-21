Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QjoFW-0002FJ-1I
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 10:04:50 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6L80f8v017538
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Jul 2011 01:00:41 -0700 (PDT)
Received: from localhost (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 21 Jul 2011 01:00:41 -0700
Message-ID: <4d93a2118d3276350a043f007bdc698dd7d368b9.1311234759.git.kai.kang@windriver.com>
In-Reply-To: <cover.1311234759.git.kai.kang@windriver.com>
References: <cover.1311234759.git.kai.kang@windriver.com>
Old-Date: Wed, 20 Jul 2011 02:42:28 +0000
Date: Thu, 21 Jul 2011 16:00:49 +0800
To: <scott.a.garman@intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.154]
Cc: Wenzong, openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] cronie: enable PAM support for cronie
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
X-List-Received-Date: Thu, 21 Jul 2011 08:04:50 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Enable PAM support for cronie and update its pam config file 'crond'.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../cronie/cronie/crond_pam_config.patch           |   13 +++++++++++++
 meta/recipes-extended/cronie/cronie_1.4.7.bb       |    9 +++++++--
 2 files changed, 20 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/cronie/cronie/crond_pam_config.patch

diff --git a/meta/recipes-extended/cronie/cronie/crond_pam_config.patch b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
new file mode 100644
index 0000000..01884ce
--- /dev/null
+++ b/meta/recipes-extended/cronie/cronie/crond_pam_config.patch
@@ -0,0 +1,13 @@
+--- cronie-1.4.7/pam/crond.orig	2010-12-16 16:59:02.000000000 +0800
++++ cronie-1.4.7/pam/crond	2011-07-20 09:47:16.080819203 +0800
+@@ -4,7 +4,7 @@
+ #
+ # No PAM authentication called, auth modules not needed
+ account    required   pam_access.so
+-account    include    password-auth
++account    include    common-account
+ session    required   pam_loginuid.so
+-session    include    password-auth
+-auth       include    password-auth
++session    include    common-session-noninteractive
++auth       include    common-auth
diff --git a/meta/recipes-extended/cronie/cronie_1.4.7.bb b/meta/recipes-extended/cronie/cronie_1.4.7.bb
index 992b610..5107b8a 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.7.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.7.bb
@@ -14,17 +14,22 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=963ea0772a2adbdcd607a9b2ec320c11 \
 
 SECTION = "utils"
 
-PR = "r2"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+PR = "r3"
 
 SRC_URI = "https://fedorahosted.org/releases/c/r/cronie/cronie-${PV}.tar.gz \
            file://crond.init \
-           file://crontab"
+           file://crontab \
+           file://crond_pam_config.patch"
 
 SRC_URI[md5sum] = "dfc26c47756d0c40ee27ae3c7ee98e0d"
 SRC_URI[sha256sum] = "83bae15ae5504454ba74f4142f5db3aa22be594327fea19d2534f65803137fbd"
 
 inherit autotools update-rc.d
 
+EXTRA_OECONF += "\
+				${@base_contains('DISTRO_FEATURES', 'pam', '--with-libpam', '--without-libpam', d)}"
+
 INITSCRIPT_NAME = "crond"
 INITSCRIPT_PARAMS = "start 90 2 3 4 5 . stop 60 0 1 6 ."
 
-- 
1.7.5.1.300.gc565c



