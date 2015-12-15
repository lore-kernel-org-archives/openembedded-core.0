Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 87B077316E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 00:26:06 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	tBF0Q7bK028883 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:26:07 -0600
Received: from harisdt.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015121418260745-1131290 ;
	Mon, 14 Dec 2015 18:26:07 -0600 
From: Haris Okanovic <haris.okanovic@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 18:25:52 -0600
Message-Id: <1450139152-19802-2-git-send-email-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1450139152-19802-1-git-send-email-haris.okanovic@ni.com>
References: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
	<1450139152-19802-1-git-send-email-haris.okanovic@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 12/14/2015 06:26:07 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 12/14/2015 06:26:07 PM,
	Serialize complete at 12/14/2015 06:26:07 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-12-15_01:, , signatures=0
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: [PATCH 2/2] bitbake.conf: Define source package, disabled by default
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
X-List-Received-Date: Tue, 15 Dec 2015 00:26:08 -0000

Add ${PN}-src to PACKAGES with a default set of FILES_{PV}-src
per FHS:
https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html#usrsrcSourceCode

Define a staging directory SRC_D under ${D}.

Define ENABLE_SRC_INSTALL to enable source staging via package.bbclass's
do_install_source() task. It's disabled by default, but may be
overridden by distro configs or individual recipes as needed.

This is change is part of a series which add source packages to OE.
See the following thread for more information:
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72660

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta/conf/bitbake.conf | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 06971da..4674288 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -36,6 +36,7 @@ export systemd_unitdir = "${nonarch_base_libdir}/systemd"
 export systemd_system_unitdir = "${nonarch_base_libdir}/systemd/system"
 export nonarch_libdir = "${exec_prefix}/lib"
 export systemd_user_unitdir = "${nonarch_libdir}/systemd/user"
+srcdir = "${prefix}/src"
 
 # Architecture dependent paths
 export bindir = "${exec_prefix}/bin"
@@ -267,7 +268,7 @@ SOLIBSDEV = ".so"
 SOLIBSDEV_darwin = ".dylibbroken"
 
 PACKAGE_BEFORE_PN ?= ""
-PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
+PACKAGES = "${PN}-src ${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
 FILES = ""
 
@@ -313,6 +314,12 @@ ALLOW_EMPTY_${PN}-dbg = "1"
 
 FILES_${PN}-locale = "${datadir}/locale"
 
+FILES_${PN}-src = "${srcdir}/${PN}"
+SRC_D = "${D}${srcdir}/${PN}"
+
+ENABLE_SRC_INSTALL = "0"
+ENABLE_SRC_INSTALL_${PN} = "${ENABLE_SRC_INSTALL}"
+
 # File manifest
 
 FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE', False))}"
-- 
2.6.2


