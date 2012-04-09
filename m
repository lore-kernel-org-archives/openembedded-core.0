Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SH9QI-000617-EG
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Apr 2012 09:54:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q397ijD2000355
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2012 00:44:45 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 9 Apr 2012 00:44:44 -0700
Message-ID: <b23d2ada953e13001fa9b38535f5a32636f7c91e.1333957247.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1333957247.git.xiaofeng.yan@windriver.com>
References: <cover.1333957247.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 9 Apr 2012 15:16:32 +0800
Date: Mon, 9 Apr 2012 15:48:19 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] opkg: Add the condition for the content of arch.conf when enable multilib
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
X-List-Received-Date: Mon, 09 Apr 2012 07:54:03 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

After successfully installed some lib32 multilib packages into the
x86-64 image, we just found that the file content of /var/lib/opkg/status in
rootfs changed after the very 1st boot, many lib32 related packages information
are missing in that file.

The missing arch "x86" in arch.conf cause the above problem. Adding the
condition for the content of arch.conf when enable multilib. If build
multilib image, "ALL_MULTILIB_PACKAGE_ARCHS" will be used instead of
"PACKAGE_ARCHS".

[YOCTO #1522]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-devtools/opkg/opkg-config-base_1.0.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
index 3a559cb..f37b2db 100644
--- a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
+++ b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
@@ -9,7 +9,12 @@ do_compile() {
 	archconf=${S}/${sysconfdir}/opkg/arch.conf
 
 	rm -f $archconf
-	ipkgarchs="${PACKAGE_ARCHS}"
+	multilibs="${@d.getVar('MULTILIBS',True)}"
+	if [ "X${multilibs}"  == "XNone" ]; then
+		ipkgarchs="${PACKAGE_ARCHS}"
+	else
+		ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
+	fi
 	priority=1
 	for arch in $ipkgarchs; do 
 		echo "arch $arch $priority" >> $archconf
-- 
1.7.0.4



