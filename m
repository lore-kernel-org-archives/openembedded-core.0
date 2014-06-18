Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 988FA6FDF7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 02:37:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5I2b2xr005839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 19:37:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 17 Jun 2014 19:37:02 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 10:38:14 +0800
Message-ID: <0aebf56af290030b4d763dc248d9a3208cf11c1a.1403059033.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1403059033.git.Qi.Chen@windriver.com>
References: <cover.1403059033.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] systemd: remove udev-utils, move 'udevadm' to udev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jun 2014 02:37:06 -0000
Content-Type: text/plain

The udev package RDEPENDS on the udev-utils package, and the actually
udev-utils package relies on the udev package because if there's no
udev daemon, 'udevadm' command doesn't make much sense.

Now that we have removed udev-utils package and moved 'udevadm' to
the udev package in the older udev recipe, we should do the same
for systemd.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_213.bb |    9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_213.bb b/meta/recipes-core/systemd/systemd_213.bb
index 279cf23..28cc4cb 100644
--- a/meta/recipes-core/systemd/systemd_213.bb
+++ b/meta/recipes-core/systemd/systemd_213.bb
@@ -250,16 +250,13 @@ RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       kernel-module-autofs4 kernel-module-unix kernel-module-ipv6 \
 "
 
-PACKAGES =+ "udev-dbg udev udev-utils udev-hwdb"
+PACKAGES =+ "udev-dbg udev udev-hwdb"
 
 FILES_udev-dbg += "/lib/udev/.debug"
 
-RDEPENDS_udev += "udev-utils"
 RPROVIDES_udev = "hotplug"
 RRECOMMENDS_udev += "udev-hwdb"
 
-RDEPENDS_udev-hwdb += "udev-utils"
-
 FILES_udev += "${base_sbindir}/udevd \
                ${rootlibexecdir}/systemd/systemd-udevd \
                ${rootlibexecdir}/udev/accelerometer \
@@ -285,10 +282,10 @@ FILES_udev += "${base_sbindir}/udevd \
                ${sysconfdir}/init.d/systemd-udevd \
                ${systemd_unitdir}/system/*udev* \
                ${systemd_unitdir}/system/*.wants/*udev* \
+               ${base_bindir}/udevadm \
+               ${datadir}/bash-completion/completions/udevadm \
               "
 
-FILES_udev-utils = "${base_bindir}/udevadm ${datadir}/bash-completion/completions/udevadm"
-
 FILES_udev-hwdb = "${rootlibexecdir}/udev/hwdb.d"
 
 INITSCRIPT_PACKAGES = "udev"
-- 
1.7.9.5


