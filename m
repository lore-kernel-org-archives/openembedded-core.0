Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B442B7998B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 06:25:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8T6PanD027428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 23:25:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Fri, 28 Sep 2018 23:25:35 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2018 13:43:53 +0800
Message-ID: <a4a18433e51ef85e3beae67625eb477d078e5639.1538199671.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538199671.git.kai.kang@windriver.com>
References: <cover.1538199671.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/10] opkg-utils/update-alternatives: not warn same priorities for multilib
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
X-List-Received-Date: Sat, 29 Sep 2018 06:25:35 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

update-alternatives is used to handle install file conflicts of multilib
packages in multilib_script.bbclass. And the default priority is used
for the alternatives which causes QA warning:

| WARNING: core-image-minimal-1.0-r0 do_rootfs: [log_check] core-image-minimal: found 1 warning message in the logfile
| [log_check] Warn: update-alternatives: libtool has multiple providers with the same priority, please check
| .../core-image-minimal/1.0-r0/rootfs/usr/lib/opkg/alternatives/libtool for details

The same priorities of alternatives are by design, so eliminate the
warning for alternatives from multilib packages.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...ot-warn-same-priorities-for-multilib.patch | 36 +++++++++++++++++++
 .../opkg-utils/opkg-utils_0.3.6.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-not-warn-same-priorities-for-multilib.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-not-warn-same-priorities-for-multilib.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-not-warn-same-priorities-for-multilib.patch
new file mode 100644
index 0000000000..c187119b80
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/update-alternatives-not-warn-same-priorities-for-multilib.patch
@@ -0,0 +1,36 @@
+From 5d9ab3a3575267517c3c8fd9847b68f5987a4820 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 18 Sep 2018 04:35:54 -0400
+Subject: [PATCH] update-alternatives: not warn same priorities for multilib
+
+The same priorities of alternatives used in multilib_script.bbclass are
+by design, so eliminate the warning of same priorities for alternatives
+from multilib packages.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ update-alternatives | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/update-alternatives b/update-alternatives
+index 89a440b..61b7ef5 100644
+--- a/update-alternatives
++++ b/update-alternatives
+@@ -94,7 +94,11 @@ add_alt() {
+ 	local priority="$3"
+ 	remove_alt $name $path
+ 	if grep -qw "$priority" $ad/$name; then
+-		echo "Warn: update-alternatives: $name has multiple providers with the same priority, please check $ad/$name for details"
++		target=`head -1 $ad/$name`
++		# not warn same priorities from multilib packages
++		if grep -w "$priority" $ad/$name | grep -qv "^$target"; then
++			echo "Warn: update-alternatives: $name has multiple providers with the same priority, please check $ad/$name for details"
++		fi
+ 	fi
+ 	echo "$path $priority" >> $ad/$name
+ }
+-- 
+2.19.0.rc2
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
index 0487c5f305..ee002845a5 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.3.6.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/${BPN}/snapshot/${BPN}-${PV
            file://0001-Only-use-sort-name-on-versions-of-tar-which-support-.patch \
            file://0002-opkg-build-Use-local-time-for-build_date-since-opkg-.patch \
            file://threaded-xz.patch \
+           file://update-alternatives-not-warn-same-priorities-for-multilib.patch \
 "
 SRC_URI_append_class-native = " file://tar_ignore_error.patch"
 UPSTREAM_CHECK_URI = "http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/refs/"
-- 
2.18.0


