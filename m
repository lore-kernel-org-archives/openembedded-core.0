Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CAE1260097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:45:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9M8jRMS023088
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:45:27 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 22 Oct 2014 01:45:27 -0700
Message-ID: <54476E36.1090201@windriver.com>
Date: Wed, 22 Oct 2014 16:43:34 +0800
From: Liu Jian <jian.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: OE Core <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2 1/1] opkg: update-alternatives fails for "[" and "[[" in busybox
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
X-List-Received-Date: Wed, 22 Oct 2014 08:45:30 -0000
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit

Building a small filesystem with busybox gives the following error lines:
(see log.do_rootfs under bitbake_build/tmp/work/)
sed: -e expression #1, char 41: unterminated address regex
sed: -e expression #1, char 42: unterminated address regex
This is caused by the script
bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/update-alternatives.
"[" can not be used directly in sed expression.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
...andle-leftbracket-for-update-alternatives.patch | 23
++++++++++++++++++++++
meta/recipes-devtools/opkg/opkg_0.2.2.bb | 1 +
2 files changed, 24 insertions(+)
create mode 100644
meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch

diff --git
a/meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch
b/meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch
new file mode 100644
index 0000000..7c9eac7
--- /dev/null
+++
b/meta/recipes-devtools/opkg/opkg/handle-leftbracket-for-update-alternatives.patch
@@ -0,0 +1,23 @@
+diff -Nur trunk.orig/utils/update-alternatives.in
trunk/utils/update-alternatives.in
+--- trunk.orig/utils/update-alternatives.in 2013-08-16
04:22:29.000000000 +0800
++++ trunk/utils/update-alternatives.in 2014-09-19 10:55:22.238159317 +0800
+@@ -68,6 +68,10 @@
+ sed -e 's/\//\\\//g'
+ }
+
++protect_special_character() {
++ sed -e 's/\[/\\\[/g'
++}
++
+ remove_alt() {
+ [ $# -lt 2 ] && return 1
+ local name="$1"
+@@ -75,7 +79,7 @@
+
+ [ ! -f $ad/$name ] && return 0
+
+- path=`echo $path | protect_slashes`
++ path=`echo $path | protect_slashes | protect_special_character`
+ sed -ne "/^$path\>.*/!p" $ad/$name > $ad/$name.new
+ mv $ad/$name.new $ad/$name
+ }
diff --git a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
index 867ff7a..9d09194 100644
--- a/meta/recipes-devtools/opkg/opkg_0.2.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.2.2.bb
@@ -5,6 +5,7 @@ SRC_URI =
"http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
file://add-exclude.patch \
file://opkg-configure.service \
file://libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch \
+ file://handle-leftbracket-for-update-alternatives.patch \
"

S = "${WORKDIR}/${BPN}-${PV}"
-- 
1.8.5.2.233.g932f7e4

-- 
Jian Liu
Email: jian.liu@windriver.com
Office Phone: 86-10-84778539


