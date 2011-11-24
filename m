Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RTPls-0004uJ-J5
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 04:14:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAO38B7V024751
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 19:08:11 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 23 Nov 2011 19:08:11 -0800
Message-ID: <01bf635c1edc3d89feaf70b38aad5979e3fef578.1322102636.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322102636.git.xiaofeng.yan@windriver.com>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:24:25 +0800
Date: Thu, 24 Nov 2011 11:06:09 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/9] qemu-config: Disable dbus-x11 when no x11 in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 24 Nov 2011 03:14:45 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

dbus-x11 could be not needed by an image without x11.
So I modified this bb file to enable dbus-x11 when x11 is in DISTRO_FEATURES and disable \
dbus-x11 without x11 feature.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-bsp/qemu-config/qemu-config.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/qemu-config/qemu-config.bb b/meta/recipes-bsp/qemu-config/qemu-config.bb
index ebf957a..deaf3a5 100644
--- a/meta/recipes-bsp/qemu-config/qemu-config.bb
+++ b/meta/recipes-bsp/qemu-config/qemu-config.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemumips|qemuppc)"
 
-PR = "r22"
+PR = "r23"
 
 SRC_URI = "file://distcc.sh \
            file://anjuta-remote-run \
@@ -37,7 +37,7 @@ pkg_postinst_${PN} () {
         sed -i $D${datadir}/applications/shutdown.desktop -e 's/^Exec=halt/Exec=reboot/'
 }
 
-RDEPENDS_${PN} = "distcc dbus-x11 task-core-nfs-server oprofileui-server rsync bash"
+RDEPENDS_${PN} = "distcc ${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}  task-core-nfs-server oprofileui-server rsync bash"
 
 inherit update-rc.d allarch
 
-- 
1.7.0.4



