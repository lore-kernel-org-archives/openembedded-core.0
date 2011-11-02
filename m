Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLZHx-0002rb-16 for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 12:47:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA2BfE6J014490;
	Wed, 2 Nov 2011 11:41:14 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12716-10; Wed,  2 Nov 2011 11:41:10 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA2Bf6FY014484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 2 Nov 2011 11:41:07 GMT
Message-ID: <1320234065.20107.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 02 Nov 2011 11:41:05 +0000
In-Reply-To: <1320230106.20107.23.camel@ted>
References: <cover.1320134607.git.dexuan.cui@intel.com>
	<ac7b821f266e932e267a4d62af83586ba3261a98.1320134607.git.dexuan.cui@intel.com>
	<1320142868.13918.0.camel@ted>
	<1865303E0DED764181A9D882DEF65FB6D836780D9E@shsmsx502.ccr.corp.intel.com>
	<1320230106.20107.23.camel@ted>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bash: Ensure we fully reautoconf the recipes so site data is used
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
X-List-Received-Date: Wed, 02 Nov 2011 11:47:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This ensures bug 487 (missing job control functionality) really gets fixed.

[YOCTO #487]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index d55e517..876be1e 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -22,9 +22,12 @@ ALTERNATIVE_PATH = "${base_bindir}/bash"
 ALTERNATIVE_LINK = "${base_bindir}/sh"
 ALTERNATIVE_PRIORITY = "100"
 
-do_configure () {
-	gnu-configize
-	oe_runconf
+export AUTOHEADER = "true"
+
+do_configure_prepend () {
+	if [ ! -e acinclude.m4 ]; then
+		cat aclocal.m4 > acinclude.m4
+	fi
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
index 1520c4e..f2ba572 100644
--- a/meta/recipes-extended/bash/bash_3.2.48.bb
+++ b/meta/recipes-extended/bash/bash_3.2.48.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fd5d9bcabd8ed5a54a01ce8d183d592a"
 DEPENDS = "ncurses"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz \
            ${GNU_MIRROR}/bash/bash-3.2-patches/bash32-049;apply=yes;striplevel=0 \
@@ -23,9 +23,12 @@ sbindir = "/sbin"
 EXTRA_OECONF = "--with-ncurses"
 export CC_FOR_BUILD = "${BUILD_CC}"
 
-do_configure () {
-	gnu-configize
-	oe_runconf
+export AUTOHEADER = "true"
+
+do_configure_prepend () {
+	if [ ! -e acinclude.m4 ]; then
+		cat aclocal.m4 > acinclude.m4
+	fi
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extended/bash/bash_4.2.bb
index a0f5e4e..8070918 100644
--- a/meta/recipes-extended/bash/bash_4.2.bb
+++ b/meta/recipes-extended/bash/bash_4.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/bash/${BPN}-${PV}.tar.gz;name=tarball \
            ${GNU_MIRROR}/bash/bash-4.2-patches/bash42-001;apply=yes;striplevel=0;name=patch001 \




