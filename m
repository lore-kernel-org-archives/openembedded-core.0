Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UHqeH-0005Nu-FA
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 08:07:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2J6p3c2018933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 23:51:03 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 18 Mar 2013 23:51:02 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 14:51:05 +0800
Message-ID: <face120c816e78dffad876f43218920c1a7da423.1363673104.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363673104.git.Qi.Chen@windriver.com>
References: <cover.1363673104.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/1] util-linux: better co-operate with systemd
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
X-List-Received-Date: Tue, 19 Mar 2013 07:07:56 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

util-linux upstream is now supporting systemd.

So in case of a systemd based image, we add to EXTRA_OECONF
'--with-systemdsystemunitdir' to specify the location of systemd unit
files, and '--enable-socket-activation' to build uuidd with socket
activation.

Also, package systemd unit files into util-linux if systemd is in
DISTRO_FEATURES.

[YOCTO #4038]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |    8 ++++++++
 meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 41a5471..b62390a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -46,8 +46,16 @@ EXTRA_OECONF = "--libdir=${base_libdir} --disable-use-tty-group \
 		usrsbin_execdir='${sbindir}' \
 "
 
+# Build uuidd with socket activation for systemd based images
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-socket-activation', '', d)}"
+# Specify systemdsystemunitdir for systemd based images
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '', d)}"
+
 EXTRA_OECONF_append_class-native = " --disable-login --disable-su"
 
+# Package systemd unit files
+FILES_${PN} += "${@base_contains('DISTRO_FEATURES', 'systemd', '${systemd_unitdir}/system/', '', d)}"
+
 FILES_${PN}-doc += "${datadir}/getopt/getopt-*.*"
 
 FILES_util-linux-agetty = "${base_sbindir}/agetty"
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
index 9b94a47..43a55a6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r2"
+PR = "r3"
 require util-linux.inc
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
-- 
1.7.9.5



