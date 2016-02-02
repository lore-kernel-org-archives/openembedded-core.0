Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 86A0D77145
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12DrFQo003556 for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 13:53:15 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NJEcYQ3ULsGr
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 13:53:15 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u12DrDVr003553
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 13:53:14 GMT
Message-ID: <1454421193.27087.60.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Feb 2016 13:53:13 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] sstate: Fix SSTATE_SWSPEC only used by populate_lic tasks
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
X-List-Received-Date: Tue, 02 Feb 2016 13:53:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This variable is only used by populate_lic tasks (gcc-source overrides it)
and refers to BPN. In recipes like gcc, where there are multiple variants,
it is resulting in sstate objects which encode PN (they install into a PN subdir)
but the sstate object reflects BPN. This leads to corruption between then and
eventually, warnings from image builds like:

WARNING: The license listed GPLv3 was not in the licenses collected for recipe gcc
WARNING: The license listed GPL-3.0-with-GCC-exception was not in the licenses collected for recipe gcc
WARNING: The license listed GPLv3 was not in the licenses collected for recipe gcc
WARNING: The license listed NCSA was not in the licenses collected for recipe gcc-sanitizers
WARNING: The license listed MIT was not in the licenses collected for recipe gcc-sanitizers
WARNING: The license listed GPL-3.0-with-GCC-exception was not in the licenses collected for recipe gcc
WARNING: The license listed GPLv3 was not in the licenses collected for recipe gcc
WARNING: The license listed NCSA was not in the licenses collected for recipe gcc-sanitizers

By referring to PN, as used by license.bbclass, this issue is resolved.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3ee91cb..d606c02 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -10,7 +10,7 @@ def generate_sstatefn(spec, hash, d):
 
 SSTATE_PKGARCH    = "${PACKAGE_ARCH}"
 SSTATE_PKGSPEC    = "sstate:${PN}:${PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}:${PV}:${PR}:${SSTATE_PKGARCH}:${SSTATE_VERSION}:"
-SSTATE_SWSPEC     = "sstate:${BPN}::${PV}:${PR}::${SSTATE_VERSION}:"
+SSTATE_SWSPEC     = "sstate:${PN}::${PV}:${PR}::${SSTATE_VERSION}:"
 SSTATE_PKGNAME    = "${SSTATE_EXTRAPATH}${@generate_sstatefn(d.getVar('SSTATE_PKGSPEC', True), d.getVar('BB_TASKHASH', True), d)}"
 SSTATE_PKG        = "${SSTATE_DIR}/${SSTATE_PKGNAME}"
 SSTATE_EXTRAPATH   = ""



