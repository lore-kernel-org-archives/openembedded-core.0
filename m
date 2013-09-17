Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7C960F86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:38:28 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id f12so5009636wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 04:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gChXpGTk2Axj45JW/V5S+WTp+hz7OtqccK/3x5OjUro=;
	b=IRAnPW3v9LuxPu29esU+e88IoMXj/0UERDEBpDABUhoASuwaF2Fbadz7BjiZLZY2uJ
	3yyTU9z6p7HdnZhvZT1OzAA27KR2sLRMA66or0yxOH1/fLVo4qa4DkeYl6ViZpqKHmWz
	nNIQohD4XhMGZWAspXLEsiWS4a16QmV3Xo9bTP3KJexRv3qrpCoZRiZuzXtqromKJAIc
	UAmp9t/rHt/U3wqrOsimEXODDMvHpq11HcQI50TqHq7+nBsRzQjlu4iFcotwmqNY17bY
	imcglTD0+3509DRsH5bXkEtMPxgtui57MZqZgxtpnr788ytpkEe7D0WJ6LgpEwimPIbA
	P76A==
X-Gm-Message-State: ALoCoQnogHBC8pcUVG5NNO6v0+kfXRU2CQPjoEP5sXqZvuiWksd2K8TXi7w3E3ym3wvqrZFhH+4u
X-Received: by 10.180.81.129 with SMTP id a1mr2178880wiy.2.1379417908898;
	Tue, 17 Sep 2013 04:38:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id z13sm3835743wib.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 17 Sep 2013 04:38:28 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2013 12:38:24 +0100
Message-Id: <1379417904-8251-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] avahi: fix and enable out-of-tree builds
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
X-List-Received-Date: Tue, 17 Sep 2013 11:38:29 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/seperatebuilddir.inc      |    5 ++-
 meta/recipes-connectivity/avahi/avahi.inc          |    1 +
 .../avahi/files/out-of-tree.patch                  |   32 ++++++++++++++++++++
 3 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/out-of-tree.patch

diff --git a/meta/conf/distro/include/seperatebuilddir.inc b/meta/conf/distro/include/seperatebuilddir.inc
index 5bd0ab4..309fb57 100644
--- a/meta/conf/distro/include/seperatebuilddir.inc
+++ b/meta/conf/distro/include/seperatebuilddir.inc
@@ -34,9 +34,8 @@ B_pn-autoconf-native = "${SEPB}"
 B_pn-autogen-native = "${SEPB}"
 B_pn-automake = "${SEPB}"
 B_pn-automake-native = "${SEPB}"
-#configure: error: *** xmltoman was not found or was disabled, it is required to build the manpages as they have not been pre-built, install xmltoman, pass --disable-manpages or dont pass --disable-xmltoman
-#B_pn-avahi = "${SEPB}"
-#B_pn-avahi-ui = "${SEPB}"
+B_pn-avahi = "${SEPB}"
+B_pn-avahi-ui = "${SEPB}"
 B_pn-babeltrace = "${SEPB}"
 B_pn-base-passwd = "${SEPB}"
 #B_pn-bash = "${SEPB}"
diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 7bb5381..6495ee9 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -24,6 +24,7 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://initscript.patch \
           file://avahi_fix_install_issue.patch \
           file://fix_for_automake_1.12.x.patch \
+          file://out-of-tree.patch \
           "
 
 USERADD_PACKAGES = "avahi-daemon avahi-autoipd"
diff --git a/meta/recipes-connectivity/avahi/files/out-of-tree.patch b/meta/recipes-connectivity/avahi/files/out-of-tree.patch
new file mode 100644
index 0000000..43476cd
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/out-of-tree.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From a62dc95d75691ea4aefa86d8bbe54c62afd78ff6 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 17 Sep 2013 12:27:36 +0100
+Subject: [PATCH] build-sys: fix out-of-tree builds without xmltoman
+
+If manpages are enabled but xmltoman isn't present, out-of-tree builds fail
+because it checks inside the build directory for the pre-generated manpages.
+
+Fix this by using $srcdir when looking for files inside the source directory.
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9debce2..047c7ae 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1021,7 +1021,7 @@ if test x$manpages = xyes ; then
+     fi
+ 
+     if test x$have_xmltoman = xno -o x$xmltoman = xno; then
+-        if ! test -e man/avahi-daemon.8 ; then
++        if ! test -e $srcdir/man/avahi-daemon.8 ; then
+             AC_MSG_ERROR([*** xmltoman was not found or was disabled, it is required to build the manpages as they have not been pre-built, install xmltoman, pass --disable-manpages or dont pass --disable-xmltoman])
+             exit 1
+         fi
+-- 
+1.7.10.4
+
-- 
1.7.10.4


