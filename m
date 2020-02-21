Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7A08061572
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 03:29:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2020 19:29:41 -0800
X-IronPort-AV: E=Sophos;i="5.70,466,1574150400"; d="scan'208";a="225088183"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/AES256-SHA256;
	20 Feb 2020 19:29:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 11:29:27 +0800
Message-Id: <1582255767-74523-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [zeus][PATCH] openssh: backport patch to fix "cert not yet valid" test
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
X-List-Received-Date: Fri, 21 Feb 2020 03:29:41 -0000

Fixes [YOCTO #13796]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...at-bozo-decided-to-use-2020-as-a-future-d.patch | 46 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_8.0p1.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch b/meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch
new file mode 100644
index 0000000..e2930c3
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch
@@ -0,0 +1,46 @@
+From 3cccc0a2ab597b8273bddf08e9a3cc5551d7e530 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 3 Jan 2020 03:02:26 +0000
+Subject: [PATCH] upstream: what bozo decided to use 2020 as a future date in a
+ regress
+
+test?
+
+OpenBSD-Regress-ID: 3b953df5a7e14081ff6cf495d4e8d40e153cbc3a
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/ff31f15773ee173502eec4d7861ec56f26bba381]
+
+[Dropped the script version and copyright year change at the top]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ regress/cert-hostkey.sh | 2 +-
+ regress/cert-userkey.sh | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/regress/cert-hostkey.sh b/regress/cert-hostkey.sh
+index 3ce7779..74d5a53 100644
+--- a/regress/cert-hostkey.sh
++++ b/regress/cert-hostkey.sh
+@@ -248,7 +248,7 @@ test_one() {
+ test_one "user-certificate"	failure "-n $HOSTS"
+ test_one "empty principals"	success "-h"
+ test_one "wrong principals"	failure "-h -n foo"
+-test_one "cert not yet valid"	failure "-h -V20200101:20300101"
++test_one "cert not yet valid"	failure "-h -V20300101:20320101"
+ test_one "cert expired"		failure "-h -V19800101:19900101"
+ test_one "cert valid interval"	success "-h -V-1w:+2w"
+ test_one "cert has constraints"	failure "-h -Oforce-command=false"
+diff --git a/regress/cert-userkey.sh b/regress/cert-userkey.sh
+index 6849e99..de455b8 100644
+--- a/regress/cert-userkey.sh
++++ b/regress/cert-userkey.sh
+@@ -327,7 +327,7 @@ test_one() {
+ test_one "correct principal"	success "-n ${USER}"
+ test_one "host-certificate"	failure "-n ${USER} -h"
+ test_one "wrong principals"	failure "-n foo"
+-test_one "cert not yet valid"	failure "-n ${USER} -V20200101:20300101"
++test_one "cert not yet valid"	failure "-n ${USER} -V20300101:20320101"
+ test_one "cert expired"		failure "-n ${USER} -V19800101:19900101"
+ test_one "cert valid interval"	success "-n ${USER} -V-1w:+2w"
+ test_one "wrong source-address"	failure "-n ${USER} -Osource-address=10.0.0.0/8"
diff --git a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
index 2ffbc9a..3d16f9d 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.0p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
            file://0001-upstream-fix-integer-overflow-in-XMSS-private-key-pa.patch \
+           file://0001-upstream-what-bozo-decided-to-use-2020-as-a-future-d.patch \
            "
 SRC_URI[md5sum] = "bf050f002fe510e1daecd39044e1122d"
 SRC_URI[sha256sum] = "bd943879e69498e8031eb6b7f44d08cdc37d59a7ab689aa0b437320c3481fd68"
-- 
2.7.4


