Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
	helo=VA3EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1Rhq7p-0002oS-6O
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 23:13:01 +0100
Received: from mail168-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Mon, 2 Jan 2012 22:05:20 +0000
Received: from mail168-va3 (localhost [127.0.0.1])	by
	mail168-va3-R.bigfish.com (Postfix) with ESMTP id 0BC9C1E0278	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  2 Jan 2012 22:05:20 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail168-va3 (localhost.localdomain [127.0.0.1]) by mail168-va3
	(MessageSwitch) id 1325541919763042_20594;
	Mon,  2 Jan 2012 22:05:19 +0000 (UTC)
Received: from VA3EHSMHS029.bigfish.com (unknown [10.7.14.236])	by
	mail168-va3.bigfish.com (Postfix) with ESMTP id B3AE5140044	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  2 Jan 2012 22:05:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS029.bigfish.com
	(10.7.99.39) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 2 Jan 2012 22:05:19 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 2 Jan 2012 16:05:18 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	q02M5Hxq016918	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jan 2012 16:05:18 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jan 2012 16:05:16 -0600
Message-ID: <1325541916-22423-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] libxml2: add shared library version info to libxml shared libraries
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
X-List-Received-Date: Mon, 02 Jan 2012 22:13:01 -0000
Content-Type: text/plain

This fixes an issue with RPM where it checks version imformation for
binaries linked against libxml and fails because it's missing info

| error: Failed dependencies:
|              libxml2.so.2(LIBXML2_2.6.0) is needed by fmc-0.9.7+2-r2.1.ppce500mc
|              libxml2.so.2(LIBXML2_2.4.30) is needed by fmc-0.9.7+2-r2.1.ppce500mc
| ERROR: Function 'do_rootfs' failed (see

Note: fmc is just an example recipe/name

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../libxml/libxml2/fix_version_info.patch          |   23 ++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    4 ++-
 2 files changed, 26 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/fix_version_info.patch

diff --git a/meta/recipes-core/libxml/libxml2/fix_version_info.patch b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
new file mode 100644
index 0000000..77113ef
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/fix_version_info.patch
@@ -0,0 +1,23 @@
+Upstream-Status: Already upstream
+
+From 00819877651b87842ed878898ba17dba489820f0 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 04 Nov 2010 20:53:14 +0000
+Subject: Reactivate the shared library versionning script
+
+---
+diff --git a/configure.in b/configure.in
+index 59d0629..a1d2c89 100644
+--- a/configure.in
++++ b/configure.in
+@@ -84,7 +84,7 @@ else
+   esac
+ fi
+ AC_SUBST(VERSION_SCRIPT_FLAGS)
+-AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -z "$VERSION_SCRIPT_FLAGS"])
++AM_CONDITIONAL([USE_VERSION_SCRIPT], [test -n "$VERSION_SCRIPT_FLAGS"])
+ 
+ dnl
+ dnl We process the AC_ARG_WITH first so that later we can modify
+--
+cgit v0.9.0.2
diff --git a/meta/recipes-core/libxml/libxml2_2.7.8.bb b/meta/recipes-core/libxml/libxml2_2.7.8.bb
index 2fa246e..0b6ce02 100644
--- a/meta/recipes-core/libxml/libxml2_2.7.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.7.8.bb
@@ -1,6 +1,8 @@
 require libxml2.inc
 
-PR = "r4"
+PR = "r5"
+
+SRC_URI += "file://fix_version_info.patch"
 
 SRC_URI[md5sum] = "8127a65e8c3b08856093099b52599c86"
 SRC_URI[sha256sum] = "cda23bc9ebd26474ca8f3d67e7d1c4a1f1e7106364b690d822e009fdc3c417ec"
-- 
1.7.6.1




