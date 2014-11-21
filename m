Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1597C6AC82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 08:50:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAL8oF9S006351
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 00:50:18 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 00:50:15 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 16:50:19 +0800
Message-ID: <9961c270f19bef3da7ca624737d7526bebbc7f0d.1416559751.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416559751.git.Qi.Chen@windriver.com>
References: <cover.1416559751.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] opkg-utils: fix double slash problem in update-alternatives
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
X-List-Received-Date: Fri, 21 Nov 2014 08:50:19 -0000
Content-Type: text/plain

When using update-alternatives, we would get output like the following:
update-alternatives: Linking //usr/bin/sh to /usr/bin/bash

What we really want is:
update-alternatives: Linking /usr/bin/sh to /usr/bin/bash

This patch fixes the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-update-alternatives-avoid-double-slashes.patch | 25 ++++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-avoid-double-slashes.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-avoid-double-slashes.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-avoid-double-slashes.patch
new file mode 100644
index 0000000..a63b26b
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-avoid-double-slashes.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+Subject: update-alternatives: avoid double slashes
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ update-alternatives |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/update-alternatives b/update-alternatives
+index 8916cbd..ca01d5d 100644
+--- a/update-alternatives
++++ b/update-alternatives
+@@ -97,7 +97,7 @@ find_best_alt() {
+ 	[ $# -lt 1 ] && return 1
+ 	[ ! -f $ad/$name ] && return 0
+ 
+-	link=$OPKG_OFFLINE_ROOT/`head -n 1 $ad/$name`
++	link=$OPKG_OFFLINE_ROOT`head -n 1 $ad/$name`
+ 
+ 	prio=`sed -ne "1!p" $ad/$name | sed -e "s/\(.*\) \(.*\)/\2 \1/g" | sort -nr | head -n 1 | sed 's/ [^ ]*$//'`
+ 	if [ -z "$prio" ]; then
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 72dc98e..1c9a3b5 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -10,7 +10,8 @@ PROVIDES += "virtual/update-alternatives"
 SRCREV = "762d9dadce548108d4204c2113461a7dd6f57e60"
 PV = "0.1.8+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils"
+SRC_URI = "git://git.yoctoproject.org/opkg-utils \
+           file://0001-update-alternatives-avoid-double-slashes.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


