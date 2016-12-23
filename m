Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9DC71D4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 02:58:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBN2w6fD007202
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 18:58:06 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Dec 2016 18:58:05 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Dec 2016 10:59:22 +0800
Message-ID: <95643e3c862b04090093f9806cbd0486ace51013.1482461845.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1482461845.git.Qi.Chen@windriver.com>
References: <cover.1482461845.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] opkg-utils: warn if update-alternatives finds priority conflict
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
X-List-Received-Date: Fri, 23 Dec 2016 02:58:05 -0000
Content-Type: text/plain

If multiple providers for a utility have the same alternatives priority,
which one would be chosen is determined by which one is installed later.
Our alternatives system should be able to detect such problem and warn users
so that potential problems could be avoided.

Modify update-alternatives to warn users when detecting multiple providers
with the same priority.

[YOCTO #8314]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...rnatives-warn-when-multiple-providers-hav.patch | 26 ++++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
new file mode 100644
index 0000000..afce1e1
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch
@@ -0,0 +1,26 @@
+Subject: update-alternatives: warn when multiple providers have the same priority
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ update-alternatives | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/update-alternatives b/update-alternatives
+index ca01d5d..ffad853 100644
+--- a/update-alternatives
++++ b/update-alternatives
+@@ -90,6 +90,9 @@ add_alt() {
+ 	local path="$2"
+ 	local priority="$3"
+ 	remove_alt $name $path
++	if grep -qw "$priority" $ad/$name; then
++		echo "Warn: update-alternatives: $name has multiple providers with the same priority, please check $ad/$name for details"
++	fi
+ 	echo "$path $priority" >> $ad/$name
+ }
+ 
+-- 
+2.8.3
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 19a852e..7b01bfc 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -10,7 +10,8 @@ PROVIDES += "${@bb.utils.contains('PACKAGECONFIG', 'update-alternatives', 'virtu
 SRCREV = "3ffece9bf19a844edacc563aa092fd1fbfcffeee"
 PV = "0.3.2+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/opkg-utils"
+SRC_URI = "git://git.yoctoproject.org/opkg-utils \
+           file://0001-update-alternatives-warn-when-multiple-providers-hav.patch"
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


