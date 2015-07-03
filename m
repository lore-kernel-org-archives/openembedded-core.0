Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC6375D25
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 06:32:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t636WRu2027576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Jul 2015 23:32:28 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 2 Jul 2015 23:32:27 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 14:32:58 +0800
Message-ID: <813b3517b05e0cedc5c6150a4530eb1dc142bc43.1435905135.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1435905135.git.Qi.Chen@windriver.com>
References: <cover.1435905135.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lsbinitscripts: avoid exit 1 in functions script
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
X-List-Received-Date: Fri, 03 Jul 2015 06:32:30 -0000
Content-Type: text/plain

If 'rc.debug' is not in kernel parameters, the functions script would
exit 1 which causes other init scripts that source it exit 1. This is
not what we want.

[YOCTO #7948]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...void-exit-1-which-causes-init-scripts-to-.patch | 23 ++++++++++++++++++++++
 meta/recipes-extended/lsb/lsbinitscripts_9.63.bb   |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch b/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
new file mode 100644
index 0000000..0809c9b
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Pending
+
+Subject: functions: avoid exit 1 which causes init scripts to fail
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ rc.d/init.d/functions | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
+index 6850046..11223f7 100644
+--- a/rc.d/init.d/functions
++++ b/rc.d/init.d/functions
+@@ -597,5 +597,5 @@ if [ "$_use_systemctl" = "1" ]; then
+ 	fi
+ fi
+ 
+-strstr "$(cat /proc/cmdline)" "rc.debug" && set -x
++strstr "$(cat /proc/cmdline)" "rc.debug" && set -x || true
+ 
+-- 
+2.1.0
+
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.63.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.63.bb
index b955464..b937c15 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.63.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.63.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 S="${WORKDIR}/initscripts-${PV}"
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-9.63.tar.bz2/1ae0f15e54a904ac30185548d43daa1c/initscripts-9.63.tar.bz2 \
            file://functions.patch \
+           file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
           " 
 
 SRC_URI[md5sum] = "1ae0f15e54a904ac30185548d43daa1c"
-- 
1.9.1


